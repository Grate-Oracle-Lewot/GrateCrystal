AI_SwitchOrTryItem:
	and a

	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wLinkMode]
	and a
	ret nz

	farcall CheckEnemyLockedIn
	ret nz

	call CheckEnemyTrapped
	jp nz, AI_TryItem

	; always load the first trainer class in wTrainerClass for Battle Tower trainers
	ld hl, TrainerClassAttributes + TRNATTR_AI_ITEM_SWITCH
	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .ok

	ld a, [wTrainerClass]
	dec a
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes

.ok
	bit SWITCH_OFTEN_F, [hl]
	jr nz, SwitchOften
	bit SWITCH_SOMETIMES_F, [hl]
	jr nz, SwitchSometimes
	bit SWITCH_RARELY_F, [hl]
	jr nz, SwitchRarely
	jp AI_TryItem

SwitchSometimes:
	call _CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jp z, AI_TryItem

	cp $10
	jr nz, .not_10
	call AI_80_20
	jr c, SwitchMerge
	jp AI_TryItem
.not_10

	cp $20
	jr nz, .not_20
	call AI_50_50
	jr c, SwitchMerge
	jp AI_TryItem
.not_20

	; $30
	call AI_80_20
	jr c, AI_TryItem
	jr SwitchMerge

SwitchOften:
	call _CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jr z, AI_TryItem

	cp $10
	jr nz, .not_10
	call AI_50_50
	jr c, SwitchMerge
	jr AI_TryItem
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp 79 percent - 1
	jr c, SwitchMerge
	jr AI_TryItem
.not_20

	; $30
	call Random
	cp 4 percent
	jr c, AI_TryItem
	; fallthrough

SwitchMerge:
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	; In register 'a' is the number (1-6) of the mon to switch to
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch

SwitchRarely:
	call _CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jr z, AI_TryItem

	cp $10
	jr nz, .not_10
	call Random
	cp 8 percent
	jr c, SwitchMerge
	jr AI_TryItem
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp 12 percent
	jr c, SwitchMerge
	jr AI_TryItem
.not_20

	; $30
	call Random
	cp 79 percent - 1
	jr nc, SwitchMerge
	; fallthrough

AI_TryItem:
; items are not allowed in the Battle Tower
	ld a, [wInBattleTowerBattle]
	and a
	ret nz

; check if trainer class has items
	ld a, [wEnemyTrainerItem1]
	ld b, a
	ld a, [wEnemyTrainerItem2]
	or b
	ret z

; don't use items on Ditto before it Transforms
; Transform copies stat levels and thus erases prior X item boosts
	ld a, [wEnemyMonSpecies]
	cp DITTO
	jr nz, .not_ditto

; clear carry flag
	and a
	ret

.not_ditto
; if only one mon in party, use items on it
	ld a, [wOTPartyCount]
	cp 2
	jr c, .only_one_mon

; else, check if more than one mon is still alive
	ld d, a
	ld e, 0
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
	ld hl, wOTPartyMon1HP

.loop_alive
	ld a, [wCurOTMon]
	cp e
	jr z, .next_alive

	push bc
	ld b, [hl]
	inc hl
	ld a, [hld]
	or b
	pop bc
	jr z, .next_alive

	ld a, c
	or b
	ld c, a

.next_alive
	srl b
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc e
	dec d
	jr nz, .loop_alive

	ld a, c
	and a
	jr z, .only_one_mon
; if only one mon is alive, use items on it
; if more than one are alive, only use items on highest level mon
	call .IsHighestLevel
	ret nc

.only_one_mon
	ld a, [wTrainerClass]
	dec a
	ld hl, TrainerClassAttributes + TRNATTR_AI_ITEM_SWITCH
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, AI_Items
.loop
	ld de, wEnemyTrainerItem1
	ld a, [hl]
	and a
	inc a
	ret z

	ld a, [de]
	cp [hl]
	jr z, .has_item
	inc de
	ld a, [de]
	cp [hl]
	jr z, .has_item

	dec de
	inc hl
	inc hl
	inc hl
	jr .loop

.has_item
	inc hl

	push hl
	push de
	ld de, .callback
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.callback
	pop de
	pop hl

	inc hl
	inc hl
	jr c, .loop

; used item
	xor a
	ld [de], a
	inc a
	ld [wEnemyGoesFirst], a

	ld hl, wEnemySubStatus3
	res SUBSTATUS_BIDE, [hl]

	xor a
	ld [wEnemyFuryCutterCount], a
	ld [wEnemyProtectCount], a
	ld [wEnemyRageCounter], a

	ld hl, wEnemySubStatus4
	res SUBSTATUS_RAGE, [hl]

	xor a
	ld [wLastEnemyCounterMove], a

	scf
	ret

.IsHighestLevel:
; if current enemy mon is Perish Songed, don't use items on it
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr nz, .no

; set carry if current mon is highest-leveled one in party
	ld a, [wOTPartyCount]
	ld d, a
	ld e, 0
	ld hl, wOTPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
.next
	ld a, [hl]
	cp e
	jr c, .ok
	ld e, a
.ok
	add hl, bc
	dec d
	jr nz, .next

	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Level
	call AddNTimes
	ld a, [hl]
	cp e
	jr nc, .yes

.no
	and a
	ret

.yes
	scf
	ret

AI_Items:
	dbw FULL_RESTORE, .FullRestore
	dbw MAX_POTION,   .MaxPotion
	dbw HYPER_POTION, .HyperPotion
	dbw SUPER_POTION, .SuperPotion
	dbw SPRING_WATER, .SpringWater
	dbw X_ACCURACY,   .XAccuracy
	dbw FULL_HEAL,    .FullHeal
	dbw FRANKENBERRY, .Frankenberry
	dbw OLD_GATEAU,   .HealPowder
	dbw GUARD_SPEC,   .GuardSpec
	dbw DIRE_HIT,     .DireHit
	dbw X_ATTACK,     .XAttack
	dbw X_DEFEND,     .XDefend
	dbw X_SPEED,      .XSpeed
	dbw X_SPECIAL,    .XSpecial
	dbw X_SP_DEFEND,  .XSpDefend
	db -1 ; end

.FullHeal:
	call .Status
	jp c, .DontUse
	call EnemyUsedFullHeal
	jp .Use

.Frankenberry:
	call .Status
	jp c, .DontUse
	call EnemyUsedFrankenberry
	jp .Use

.HealPowder:
	call .Status
	jp c, .DontUse
	call EnemyUsedHealPowder
	jp .Use

.Status:
	ld a, [wEnemyMonStatus]
	and a
	jp z, .DontUse

	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp nz, .Use
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .StatusCheckContext
	call AI_80_20
	jp c, .Use
	jp .DontUse

.StatusCheckContext:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr z, .FailToxicCheck
	ld a, [wEnemyToxicCount]
	cp 4
	jr c, .FailToxicCheck
	call AI_50_50
	jp c, .Use

.FailToxicCheck:
	ld a, [wEnemyMonStatus]
	and 1 << FRZ | SLP
	jp z, .DontUse
	jp .Use

.FullRestore:
	call .HealItem
	jp nc, .UseFullRestore
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jp z, .DontUse
	call .Status
	jp c, .DontUse

.UseFullRestore:
	call EnemyUsedFullRestore
	jp .Use

.MaxPotion:
	call .HealItem
	jp c, .DontUse
	call EnemyUsedMaxPotion
	jp .Use

.HealItem:
	farcall AICheckEnemyHalfHP
	jp c, .DontUse
	farcall AICheckEnemyQuarterHP
	jp nc, .Use
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .20Not50
	call AI_50_50
	jp c, .Use
	jp .DontUse

.20Not50:
	call AI_80_20
	jp nc, .DontUse
	jp .Use

.HyperPotion:
	call .HealItem
	jp c, .DontUse
	call EnemyUsedHyperPotion
	jp .Use

.SuperPotion:
	call .HealItem
	jp c, .DontUse
	call EnemyUsedSuperPotion
	jp .Use

.SpringWater:
	call .HealItem
	jp c, .DontUse
	call EnemyUsedSpringWater
	jp .Use

.XAccuracy:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXAccuracy
	jr .Use

.GuardSpec:
	call .XItem
	jr c, .DontUse
	call EnemyUsedGuardSpec
	jr .Use

.DireHit:
	call .XItem
	jr c, .DontUse
	call EnemyUsedDireHit
	jr .Use

.XAttack:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXAttack
	jr .Use

.XDefend:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXDefend
	jr .Use

.XSpeed:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXSpeed
	jr .Use

.XSpecial:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXSpecial
	jr .Use

.XSpDefend:
	call .XItem
	jr c, .DontUse
	call EnemyUsedXSpDefend
	jr .Use

.XItem:
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jr nz, .Use
	ld a, [wEnemyTurnsTaken]
	and a
	jr nz, .notfirstturnout
	call AI_50_50
	jr c, .DontUse
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .Use
	call AI_50_50
	jr c, .DontUse
	jr .Use

.notfirstturnout
	call AI_80_20
	jr c, .Use

.DontUse:
	scf
	ret

.Use:
	and a
	ret

AIUsedItemSound:
	push de
	ld de, SFX_FULL_HEAL
	call PlaySFX
	pop de
	ret

EnemyUsedXAccuracy:
	call AIUsedItemSound
	ld hl, wEnemySubStatus4
	set SUBSTATUS_X_ACCURACY, [hl]
	ld a, X_ACCURACY
	jr PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedGuardSpec:
	call AIUsedItemSound
	ld hl, wEnemySubStatus4
	set SUBSTATUS_MIST, [hl]
	ld a, GUARD_SPEC
	jr PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedDireHit:
	call AIUsedItemSound
	ld hl, wEnemySubStatus4
	set SUBSTATUS_DIRE_HIT, [hl]
	ld a, DIRE_HIT
	; fallthrough

; Parameter
; a = ITEM_CONSTANT
PrintText_UsedItemOn_AND_AIUpdateHUD:
	ld [wCurEnemyItem], a
	call PrintText_UsedItemOn
	; fallthrough

AIUpdateHUD:
	call UpdateEnemyMonInParty
	farcall UpdateEnemyHUD
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wEnemyItemState
	dec [hl]
	scf
	ret

EnemyUsedFullHeal:
	call StatusHealDoubleCall
	ld a, FULL_HEAL
	jr PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedFrankenberry:
	call StatusHealDoubleCall
	ld a, FRANKENBERRY
	jr PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedHealPowder:
	call StatusHealDoubleCall
	ld a, OLD_GATEAU
	jr PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedMaxPotion:
	ld a, MAX_POTION
	ld [wCurEnemyItem], a
	jr FullRestoreContinue

EnemyUsedFullRestore:
	call AI_HealStatus
	ld a, FULL_RESTORE
	ld [wCurEnemyItem], a
	; fallthrough

FullRestoreContinue:
	ld de, wCurHPAnimOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wCurHPAnimMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wCurHPAnimMaxHP + 1], a
	ld [wEnemyMonHP], a
	jr EnemyPotionFinish

EnemyUsedSpringWater:
	ld a, SPRING_WATER
	jr SpringWaterContinue

EnemyUsedSuperPotion:
	ld a, SUPER_POTION
	; fallthrough

SpringWaterContinue:
	ld b, 50
	jr EnemyPotionContinue

EnemyUsedHyperPotion:
	ld a, HYPER_POTION
	ld b, 200
	; fallthrough

EnemyPotionContinue:
	ld [wCurEnemyItem], a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wCurHPAnimOldHP], a
	add b
	ld [hld], a
	ld [wCurHPAnimNewHP], a
	ld a, [hl]
	ld [wCurHPAnimOldHP + 1], a
	ld [wCurHPAnimNewHP + 1], a
	jr nc, .ok
	inc a
	ld [hl], a
	ld [wCurHPAnimNewHP + 1], a
.ok
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wCurHPAnimMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wCurHPAnimMaxHP + 1], a
	sbc b
	jr nc, EnemyPotionFinish
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wCurHPAnimNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wCurHPAnimNewHP + 1], a
	; fallthrough

EnemyPotionFinish:
	call PrintText_UsedItemOn
	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	call AIUsedItemSound
	predef AnimateHPBar
	jp AIUpdateHUD

StatusHealDoubleCall:
	call AIUsedItemSound
	; fallthrough

AI_HealStatus:
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hl], a
	ld [wEnemyMonStatus], a
	ld [wEnemyConfuseCount], a
	ld hl, wEnemySubStatus1
	res SUBSTATUS_NIGHTMARE, [hl]
	ld hl, wEnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, wEnemySubStatus5
	res SUBSTATUS_TOXIC, [hl]
	farcall CalcEnemyStats
	ret

EnemyUsedXAttack:
	ld b, ATTACK
	ld a, X_ATTACK
	jr EnemyUsedXItem

EnemyUsedXDefend:
	ld b, DEFENSE
	ld a, X_DEFEND
	jr EnemyUsedXItem

EnemyUsedXSpeed:
	ld b, SPEED
	ld a, X_SPEED
	jr EnemyUsedXItem

EnemyUsedXSpecial:
	ld b, SP_ATTACK
	ld a, X_SPECIAL
	jr EnemyUsedXItem

EnemyUsedXSpDefend:
	ld b, SP_DEFENSE
	ld a, X_SP_DEFEND
	; fallthrough

; Parameter
; a = ITEM_CONSTANT
; b = BATTLE_CONSTANT (ATTACK, DEFENSE, SPEED, SP_ATTACK, SP_DEFENSE, ACCURACY, EVASION)
EnemyUsedXItem:
	ld [wCurEnemyItem], a
	push bc
	call PrintText_UsedItemOn
	pop bc
	farcall RaiseStat
	jp AIUpdateHUD

PrintText_UsedItemOn:
	ld a, [wCurEnemyItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, EnemyUsedOnText
	jp PrintText

EnemyUsedOnText:
	text_far _EnemyUsedOnText
	text_end

AI_TrySwitch:
; Determine whether the AI can switch based on how many Pokemon are still alive.
; If it can switch, it will.
	ld a, [wOTPartyCount]
	ld c, a
	ld hl, wOTPartyMon1HP
	ld d, 0
.SwitchLoop:
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .fainted
	inc d
.fainted
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .SwitchLoop

	ld a, d
	cp 2
	jp c, AI_TryItem
	; fallthrough

AI_Switch:
; If enemy's Perish Count is 1, conditionally favor using U-Turn over switching.
; If trapped by Bind, Mean Look, etc., we never reach here, but AI_Basic still favors U-Turn.

	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .no_u_turn

	ld a, [wEnemyPerishCount]
	cp 1
	jr nz, .no_u_turn

; If enemy doesn't know U-Turn, go back to normal switching behavior.
; NOTE: Nothing here accounts for type immunities, e.g. Volt Switch.

	ld b, EFFECT_U_TURN
	call AIHasMoveEffect
	jr nc, .no_u_turn

; If enemy has X Accuracy status, skip checking accuracy and evasion.
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_X_ACCURACY, a
	jr nz, .no_miss

; If player is identified by Foresight, skip checking accuracy and evasion.
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .no_miss

; If enemy's accuracy is lowered or player's evasion is raised, switch instead of using U-Turn.
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL
	jr c, .no_u_turn
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 1
	jr nc, .no_u_turn

.no_miss
; Switch instead of using U-Turn if enemy is infatuated, confused, Encored, Destiny Bonded, Frozen, Paralyzed, or asleep.

	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	jr nz, .no_u_turn

	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .no_u_turn

	ld a, [wEnemySubStatus5]
	and 1 << SUBSTATUS_ENCORED | 1 << SUBSTATUS_DESTINY_BOND
	jr nz, .no_u_turn

	ld a, [wEnemyMonStatus]
	and 1 << FRZ | 1 << PAR | SLP
	jr nz, .no_u_turn

; Clear carry flag. Actual favoring of U-Turn handled in AI_Basic.
	and a
	ret

.no_u_turn
	ld a, $1
	ld [wEnemyIsSwitching], a
	ld [wEnemyGoesFirst], a
	ld hl, wEnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ldh [hBattleTurn], a
	farcall PursuitSwitch

	push af
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonStatus
	ld bc, MON_MAXHP - MON_STATUS
	call CopyBytes
	pop af

	jr c, .skiptext
	ld hl, EnemyWithdrewText
	call PrintText

.skiptext
	ld a, 1
	ld [wBattleHasJustStarted], a
	farcall NewEnemyMonStatusResetEnemyStatLevels
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	farcall EnemySwitchResetBattleParticipants
	xor a
	ld [wBattleHasJustStarted], a
	ld a, [wLinkMode]
	and a
	ret nz
	scf
	ret

EnemyWithdrewText:
	text_far _EnemyWithdrewText
	text_end

_CheckAbleToSwitch:
; Check if in the middle of a multi-turn move or suchlike.
; Can't U-Turn out of these.
	farcall CheckAbleToSwitch
	ret

CheckEnemyTrapped:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret nz

	ld a, [wEffectCarryover]
	bit PERISH_TRAP, a
	ret nz

	ld a, [wEnemyWrapCount]
	and a
	ret
