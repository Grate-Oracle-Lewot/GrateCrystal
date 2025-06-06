BattleCommand_BatonPass:
	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	jp z, FailedBatonPass

	call UpdateBattleMonInParty
	call AnimateCurrentMove

	ld c, 42
	call DelayFrames

; Transition into switchmon menu
	call SwitchMoveTransitionIntoMenu

; Return to battle scene
	call SwitchMoveReturnToBattleScene
	call BatonPass_LinkPlayerSwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

	ld hl, PassedBattleMonEntrance
	call CallBattleCore
	jr ResetBatonPassStatus

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	jr z, FailedBatonPass

	call CheckAnyOtherAliveEnemyMons
	jr z, FailedBatonPass

	call UpdateEnemyMonInParty
	call AnimateCurrentMove
	call BatonPass_LinkEnemySwitch

; Mobile link battles handle entrances differently
	farcall CheckMobileBattleError
	jp c, EndMoveEffect

; Passed enemy PartyMon entrance
	xor a
	ld [wEnemySwitchMonIndex], a
	ld hl, EnemySwitch_SetMode
	call CallBattleCore
	ld hl, ResetBattleParticipants
	call CallBattleCore
	ld a, TRUE
	ld [wApplyStatLevelMultipliersToEnemy], a
	ld hl, ApplyStatLevelMultiplierOnAllStats
	call CallBattleCore

	ld hl, SpikesDamage
	call CallBattleCore
	; fallthrough

ResetBatonPassStatus:
; Reset status changes that aren't passed by Baton Pass.

	; Nightmare isn't passed.
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]

	; Disable isn't passed.
	call ResetActorDisable

	; Attraction isn't passed.
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wEnemySubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	ld hl, wPlayerSubStatus5

	; Transform and Encore aren't passed.
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TRANSFORMED, [hl]
	res SUBSTATUS_ENCORED, [hl]

	; New mon hasn't used a move yet.
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], 0

	; Player and enemy trapping moves aren't passed.
	xor a
	ld [wPlayerWrapCount], a
	ld [wEnemyWrapCount], a
	ret

FailedBatonPass:
; Teleport

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jr z, .failed
	cp BATTLETYPE_TRAP
	jr z, .failed
	cp BATTLETYPE_CELEBI
	jr z, .failed
	cp BATTLETYPE_SUICUNE
	jr z, .failed

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .failed

	; Can't teleport from a trainer battle
	ld a, [wBattleMode]
	dec a
	jr z, .run_away

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wBattleAnimParam], a
	call SetBattleDraw
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld c, 42
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextbox

BatonPass_LinkPlayerSwitch:
	ld a, [wLinkMode]
	and a
	ret z

	ld a, BATTLEPLAYERACTION_USEITEM
	ld [wBattlePlayerAction], a

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore
	call CloseWindow

	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

BatonPass_LinkEnemySwitch:
	ld a, [wLinkMode]
	and a
	ret z

	call LoadStandardMenuHeader
	ld hl, LinkBattleSendReceiveAction
	call CallBattleCore

	ld a, [wOTPartyCount]
	add BATTLEACTION_SWITCH1
	ld b, a
	ld a, [wBattleAction]
	cp BATTLEACTION_SWITCH1
	jr c, .baton_pass
	cp b
	jr c, .switch

.baton_pass
	ld a, [wCurOTMon]
	add BATTLEACTION_SWITCH1
	ld [wBattleAction], a
.switch
	jp CloseWindow

CheckAnyOtherAlivePartyMons:
	ld hl, wPartyMon1HP
	ld a, [wPartyCount]
	ld d, a
	ld a, [wCurBattleMon]
	ld e, a
	jr CheckAnyOtherAliveMons

CheckAnyOtherAliveEnemyMons:
	ld hl, wOTPartyMon1HP
	ld a, [wOTPartyCount]
	ld d, a
	ld a, [wCurOTMon]
	ld e, a
	; fallthrough

CheckAnyOtherAliveMons:
; Check for nonzero HP starting from partymon
; HP at hl for d partymons, besides current mon e.
; Return nz if any are alive.

	xor a
	ld b, a
	ld c, a
.loop
	ld a, c
	cp d
	jr z, .done
	cp e
	jr z, .next

	ld a, [hli]
	or b
	ld b, a
	ld a, [hld]
	or b
	ld b, a

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .loop

.done
	ld a, b
	and a
	ret

BattleCommand_UTurn:
; U-Turn doesn't switch in link battles
	ld a, [wLinkMode]
	and a
	ret nz

	ldh a, [hBattleTurn]
	and a
	jp nz, .Enemy

; Need something to switch to
	call CheckAnyOtherAlivePartyMons
	ret z

	call UpdateBattleMonInParty

	ld de, ANIM_RETURN_MON
	call FarPlayBattleAnimation

; Transition into switchmon menu
	call SwitchMoveTransitionIntoMenu

; Return to battle scene
	call SwitchMoveReturnToBattleScene

	ld hl, SwitchPlayerMon
	call CallBattleCore
	ld hl, SpikesDamage
	jp CallBattleCore

.Enemy:
; Wildmons don't have anything to switch to
	ld a, [wBattleMode]
	cp WILD_BATTLE
	ret z

	call CheckAnyOtherAliveEnemyMons
	ret z

	call UpdateEnemyMonInParty

; Passed enemy PartyMon entrance
	farcall EnemyUTurnSwitch
	ld hl, SpikesDamage
	jp CallBattleCore

SwitchMoveTransitionIntoMenu:
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu
	farcall ForcePickSwitchMonInBattle
	ret

SwitchMoveReturnToBattleScene:
	call ClearPalettes
	farcall LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	jp SetPalettes
