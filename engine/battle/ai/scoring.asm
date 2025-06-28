AIScoring: ; used only for BANK(AIScoring)


AI_Basic:
; Don't do anything redundant:
;  -Using status-only moves if the player can't be statused
;  -Using moves that fail if they've already been used

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld c, a

; Dismiss moves with special effects if they are useless or not a good choice right now.
; For example, healing moves, weather moves, Dream Eater...
	push hl
	push de
	push bc
	farcall AI_Redundant
	pop bc
	pop de
	pop hl
	jr nz, .dismiss

; Dismiss status-only moves if the player can't be statused.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, StatusOnlyEffects
	call IsInByteArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	ld a, [wBattleMonStatus]
	and a
	jr nz, .dismiss

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .dismiss

	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr z, .checkmove

.dismiss
	call AIDismissMove
	jr .checkmove

INCLUDE "data/battle/ai/status_only_effects.asm"


AI_Status:
; Dismiss status moves that don't affect the player.
; Greatly encourage status moves if the player is storing energy with Bide.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	jr z, .checkbide

	inc hl
	ld a, [de]
	and a
	jr z, .checkbide

	inc de
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_TOXIC
	jr z, .poisonimmunity
	cp EFFECT_POISON
	jr z, .poisonimmunity
	cp EFFECT_LEECH_SEED
	jr z, .leechseedimmunity
	cp EFFECT_MEAN_LOOK
	jr z, .arenatrapimmunity
	cp EFFECT_PARALYZE
	jr z, .typeimmunity

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove
	jr .typeimmunity

.poisonimmunity
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .immune
	cp STEEL
	jr z, .immune
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .immune
	cp STEEL
	jr z, .immune
	jr .typeimmunity

.leechseedimmunity
	ld a, [wBattleMonType1]
	cp GRASS
	jr z, .immune
	ld a, [wBattleMonType2]
	cp GRASS
	jr z, .immune
	jr .typeimmunity

.arenatrapimmunity
	ld a, [wBattleMonType1]
	cp GHOST
	jr z, .immune
	ld a, [wBattleMonType2]
	cp GHOST
	jr z, .immune

.typeimmunity
	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	and a
	jr nz, .checkmove

.immune
	call AIDismissMove
	jr .checkmove

.checkbide
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_BIDE, a
	ret z
	; fallthrough

AI_Troll:
; Greatly encourage non-volatile status moves, Confusion moves, Leech Seed, Attract, Nightmare, and Spite.
; Run by AI_Status if the player is Biding. Also functions as its own layer.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, StatusBideEffects
	call IsInByteArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	dec [hl]
	dec [hl]
	jr .checkmove


AI_Setup:
; Dismiss stat-down moves if the player has Mist or a Substitute up.
; Greatly encourage stat-up moves if the player is flying or underground, and the enemy is faster.
; Greatly encourage stat-modifying moves if the player is storing energy with Bide (barring Mist or Substitute).
; Greatly discourage stat-up moves if the enemy is Perish Songed (barring Bide, Fly or Dig).
; If none of the above conditions meet...
; 50% chance to greatly encourage stat-up moves during the enemy Pokemon's first turn out.
; 50% chance to greatly encourage stat-down moves during the player's Pokemon's first turn out.
; 90% chance to greatly discourage stat-modifying moves otherwise.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]

	cp EFFECT_DEFENSE_CURL
	jr z, .statup
	cp EFFECT_FOCUS_ENERGY
	jr z, .statup

	cp EFFECT_ATTACK_UP
	jr c, .checkmove
	cp EFFECT_EVASION_UP + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN + 1
	jr c, .statdown

	cp EFFECT_ATTACK_UP_2
	jr c, .checkmove
	cp EFFECT_EVASION_UP_2 + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN_2 - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .statdown

	jr .checkmove

.statup
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_BIDE, a
	jr nz, .do_encourage

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jr z, .statup_continue

	call AICompareSpeed
	jr c, .do_encourage

.statup_continue
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr nz, .do_discourage

	ld a, [wEnemyTurnsTaken]
	and a
	jr nz, .discourage
	jr .encourage

.statdown
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_MIST, a
	jr nz, .dismiss

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .dismiss

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_BIDE, a
	jr nz, .do_encourage

	ld a, [wPlayerTurnsTaken]
	and a
	jr nz, .discourage

.encourage
	call AI_50_50
	jr c, .checkmove

.do_encourage
	dec [hl]
	dec [hl]
	jr .checkmove

.discourage
	call AI_90_10
	jr c, .checkmove

.do_discourage
	inc [hl]
	inc [hl]
	jp .checkmove

.dismiss
	call AIDismissMove
	jp .checkmove


AI_Cautious:
; 90% chance to discourage residual moves after the enemy Pokemon's first turn on the field.

	ld a, [wEnemyTurnsTaken]
	and a
	ret z

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.loop
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push hl
	push de
	push bc
	ld hl, ResidualMoves
	call IsInByteArray

	pop bc
	pop de
	pop hl
	jr nc, .loop

	call AI_90_10
	jr c, .loop

	inc [hl]
	jr .loop

INCLUDE "data/battle/ai/residual_moves.asm"


AI_Types:
; Encourage super-effective moves.
; Discourage not very effective moves unless all damaging moves are of the same type.
; Encourage moves based on the weather. Includes Solarbeam and Thunder, but not Blizzard.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	jr z, .checkrain

	inc hl
	ld a, [de]
	and a
	jr z, .checkrain

	inc de
	call AIGetMoveAttributes

	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr z, .checkmove
	jr c, .noteffective

; effective
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove
	dec [hl]
	jr .checkmove

.noteffective
; Discourage this move if there are any moves that do damage of a different type.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	ld d, a
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES + 1
	ld c, 0
.checkmove2
	dec b
	jr z, .movesdone

	ld a, [hli]
	and a
	jr z, .movesdone

	call AIGetMoveAttributes
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	and TYPE_MASK
	cp d
	jr z, .checkmove2
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .damaging
	jr .checkmove2

.damaging
	ld c, a
.movesdone
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .checkmove
	inc [hl]
	jr .checkmove

; Encourage moves in the Rain Dance list if it's raining.
.checkrain
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr nz, .checksun

	ld hl, RainDanceMoves
	call AI_EncourageIfInArray

; Encourage moves in the Sunny Day list if it's sunny.
.checksun
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz

	ld hl, SunnyDayMoves
	jp AI_EncourageIfInArray


AI_Immunities:
; Dismiss any move that the player is immune to.
; Broken off from AI_Types to use alongside AI_Aggressive, which generally replaces AI_Types.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetMoveAttributes

	push hl
	push bc
	push de
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop de
	pop bc
	pop hl

	ld a, [wTypeMatchup]
	and a
	jr z, .immune
	jr .checkmove

.immune
	call AIDismissMove
	jr .checkmove


AI_Offensive:
; Greatly discourage non-damaging moves.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .checkmove

	inc [hl]
	inc [hl]
	jr .checkmove


AI_Opportunist:
; Do nothing if player's HP is above 50%.
	call AICheckPlayerHalfHP
	ret c
	jr AI_Opportunist_Pragmatic

AI_Pragmatic:
; Do nothing if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	ret c
	; fallthrough

AI_Opportunist_Pragmatic:
; Discourage stall moves and encourage useful moves.
	call AI_Discourage_Stall
	; fallthrough

AI_Encourage_Useful:
; Encourage useful moves. Used by AI_Opportunist and AI_Pragmatic.
; Also functions as its own layer: AI_SIMPLE.

	ld hl, UsefulMoves
	jp AI_EncourageIfInArray

INCLUDE "data/battle/ai/useful_moves.asm"

AI_Discourage_Stall:
; Discourage stall moves. Used by by AI_Opportunist, AI_Pragmatic, and AI_Aggressive.
; Also functions as its own layer: AI_STUBBORN.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push hl
	push de
	push bc
	ld hl, StallMoves
	call IsInByteArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	inc [hl]
	jr .checkmove

INCLUDE "data/battle/ai/stall_moves.asm"


AI_Aggressive:
; Discourage all damaging moves but the one that does the most damage.
; If no damaging move deals damage to the player, no move will be discouraged.
; Run by both AI_AGGRESSIVE and AI_AGGRESSIVE_2. Using both will do all of this twice, with separate damage rolls.

; Discourage stall moves if the enemy has only one Pokemon [remaining].
	call AICheckLastEnemyMon
	call c, AI_Discourage_Stall

; Figure out which attack does the most damage and put it in c.
	ld hl, wEnemyMonMoves
	ld bc, 0
	ld de, 0
.checkmove
	inc b
	ld a, b
	cp NUM_MOVES + 1
	jr z, .gotstrongestmove

	ld a, [hli]
	and a
	jr z, .gotstrongestmove

	push hl
	push de
	push bc
	call AIGetMoveAttributes
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nodamage
	call AIDamageCalc
	pop bc
	pop de
	pop hl

; Update current move if damage is highest so far
	ld a, [wCurDamage + 1]
	cp e
	ld a, [wCurDamage]
	sbc d
	jr c, .checkmove

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld c, b
	jr .checkmove

.nodamage
	pop bc
	pop de
	pop hl
	jr .checkmove

.gotstrongestmove
; Nothing we can do if no attacks did damage.
	ld a, c
	and a
	ret z

; Discourage moves that do less damage, unless they're reckless too.
	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld b, 0
.checkmove2
	inc b
	ld a, b
	cp NUM_MOVES + 1
	ret z

; Ignore this move if it is the highest damaging one.
	cp c
	ld a, [de]
	inc de
	inc hl
	jr z, .checkmove2

	call AIGetMoveAttributes

; Ignore this move if its power is 0 or 1.
; Moves such as Seismic Toss, Counter and Fissure have a base power of 1.
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	cp 2
	jr c, .checkmove2

; 50% chance to ignore this move if it is reckless.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, RecklessMoves
	call IsInByteArray
	pop bc
	pop de
	pop hl
	jr nc, .discourage
	call AI_50_50
	jr c, .checkmove2

; If we made it this far, discourage this move.
.discourage
	inc [hl]
	jr .checkmove2

INCLUDE "data/battle/ai/reckless_moves.asm"


AI_Risky:
; Hugely encourage any move that will KO the player.
; Selfdestruct will often be an exception (see below).
; This will out-encourage status moves if the player is Biding.

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nextmove

; Don't use Selfdestruct at max HP.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_SELFDESTRUCT
	jr nz, .checkko

	call AICheckEnemyMaxHP
	jr c, .nextmove

; Else, 80% chance to exclude Selfdestruct.
	call AI_80_20
	jr nc, .nextmove

.checkko
	call AIDamageCalc

	ld a, [wCurDamage + 1]
	ld e, a
	ld a, [wCurDamage]
	ld d, a
	ld a, [wBattleMonHP + 1]
	cp e
	ld a, [wBattleMonHP]
	sbc d
	jr nc, .nextmove

	pop hl
rept 5
	dec [hl]
endr
	push hl

.nextmove
	pop hl
	pop bc
	pop de
	jr .checkmove


AI_Smart:
; Multiple subroutines for specific move effects.

	ld hl, wEnemyAIMoveScores
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.checkmove
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, AI_Smart_EffectHandlers
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .nextmove

	ld a, [hli]
	ld e, a
	ld d, [hl]

	pop hl
	push hl

	ld bc, .nextmove
	push bc

	push de
	ret

.nextmove
	pop hl
	pop bc
	pop de
	inc hl
	jr .checkmove

AI_Smart_EffectHandlers:
	dbw EFFECT_SLEEP,            AI_Smart_Sleep
	dbw EFFECT_POISON_HIT,       AI_Smart_Smog
	dbw EFFECT_LEECH_HIT,        AI_Smart_LeechHit
	dbw EFFECT_SELFDESTRUCT,     AI_Smart_Selfdestruct
	dbw EFFECT_DREAM_EATER,      AI_Smart_DreamEater
	dbw EFFECT_MIRROR_MOVE,      AI_Smart_MirrorMove
	dbw EFFECT_EVASION_UP,       AI_Smart_EvasionUp
	dbw EFFECT_ALWAYS_HIT,       AI_Smart_AlwaysHit
	dbw EFFECT_ATTACK_DOWN,      AI_Smart_AttackDown
	dbw EFFECT_DEFENSE_DOWN,     AI_Smart_DefenseDown
	dbw EFFECT_SPEED_DOWN,       AI_Smart_SpeedControl
	dbw EFFECT_SP_DEF_DOWN,      AI_Smart_SpDefDown
	dbw EFFECT_ACCURACY_DOWN,    AI_Smart_AccuracyDown
	dbw EFFECT_EVASION_DOWN,     AI_Smart_EvasionDown
	dbw EFFECT_RESET_STATS,      AI_Smart_ResetStats
	dbw EFFECT_BIDE,             AI_Smart_Bide_Screens
	dbw EFFECT_RAMPAGE,          AI_Smart_Rampage
	dbw EFFECT_FORCE_SWITCH,     AI_Smart_ForceSwitch
	dbw EFFECT_MULTI_HIT,        AI_Smart_Reckless
	dbw EFFECT_FLINCH_HIT,       AI_Smart_FlinchHit
	dbw EFFECT_HEAL,             AI_Smart_Heal
	dbw EFFECT_TOXIC,            AI_Smart_Poison
	dbw EFFECT_LIGHT_SCREEN,     AI_Smart_Bide_Screens
	dbw EFFECT_OHKO,             AI_Smart_OHKO
	dbw EFFECT_SUPER_FANG,       AI_Smart_SuperFang
	dbw EFFECT_TRAP_TARGET,      AI_Smart_TrapTarget
	dbw EFFECT_DOUBLE_HIT,       AI_Smart_Reckless
	dbw EFFECT_JUMP_KICK,        AI_Smart_Recoil_JumpKick
	dbw EFFECT_FOCUS_ENERGY,     AI_Smart_Focus_Energy
	dbw EFFECT_RECOIL_HIT,       AI_Smart_Recoil_JumpKick
	dbw EFFECT_CONFUSE,          AI_Smart_Confuse
	dbw EFFECT_SPEED_UP_2,       AI_Smart_SpeedControl
	dbw EFFECT_SP_DEF_UP_2,      AI_Smart_SpDefenseUp2
	dbw EFFECT_TRANSFORM,        AI_Smart_Transform
	dbw EFFECT_ATTACK_DOWN_2,    AI_Smart_AttackDown
	dbw EFFECT_DEFENSE_DOWN_2,   AI_Smart_DefenseDown
	dbw EFFECT_SPEED_DOWN_2,     AI_Smart_SpeedControl
	dbw EFFECT_SP_ATK_DOWN_2,    AI_Smart_SpAtkDown
	dbw EFFECT_SP_DEF_DOWN_2,    AI_Smart_SpDefDown
	dbw EFFECT_REFLECT,          AI_Smart_Bide_Screens
	dbw EFFECT_POISON,           AI_Smart_Poison
	dbw EFFECT_PARALYZE,         AI_Smart_Paralyze
	dbw EFFECT_SKY_ATTACK,       AI_Smart_Fly_SkyAttack_FutureSight
	dbw EFFECT_POISON_MULTI_HIT, AI_Smart_Reckless
	dbw EFFECT_SUBSTITUTE,       AI_Smart_Substitute
	dbw EFFECT_HYPER_BEAM,       AI_Smart_HyperBeam
	dbw EFFECT_RAGE,             AI_Smart_Rage
	dbw EFFECT_LEECH_SEED,       AI_Smart_LeechSeed
	dbw EFFECT_DISABLE,          AI_Smart_Disable
	dbw EFFECT_EARTH_POWER,      AI_Smart_Earthquake
	dbw EFFECT_COUNTER,          AI_Smart_Counter
	dbw EFFECT_ENCORE,           AI_Smart_Encore
	dbw EFFECT_SNORE,            AI_Smart_Snore_SleepTalk
	dbw EFFECT_LOCK_ON,          AI_Smart_LockOn
	dbw EFFECT_SLEEP_TALK,       AI_Smart_Snore_SleepTalk
	dbw EFFECT_DESTINY_BOND,     AI_Smart_Reversal_DestinyBond
	dbw EFFECT_REVERSAL,         AI_Smart_Reversal_DestinyBond
	dbw EFFECT_SPITE,            AI_Smart_Spite
	dbw EFFECT_FALSE_SWIPE,      AI_Smart_FalseSwipe
	dbw EFFECT_HEAL_BELL,        AI_Smart_HealBell
	dbw EFFECT_PRIORITY_HIT,     AI_Smart_PriorityHit
	dbw EFFECT_TRIPLE_KICK,      AI_Smart_Reckless
	dbw EFFECT_THIEF,            AI_Smart_Thief
	dbw EFFECT_MEAN_LOOK,        AI_Smart_MeanLook
	dbw EFFECT_NIGHTMARE,        AI_Smart_Nightmare
	dbw EFFECT_FLAME_WHEEL,      AI_Smart_FlameWheel
	dbw EFFECT_CURSE,            AI_Smart_Curse
	dbw EFFECT_PROTECT,          AI_Smart_Protect
	dbw EFFECT_SPIKES,           AI_Smart_Spikes
	dbw EFFECT_FORESIGHT,        AI_Smart_Foresight
	dbw EFFECT_PERISH_SONG,      AI_Smart_PerishSong
	dbw EFFECT_SANDSTORM,        AI_Smart_Sandstorm
	dbw EFFECT_ENDURE,           AI_Smart_Endure
	dbw EFFECT_ROLLOUT,          AI_Smart_Rollout
	dbw EFFECT_SWAGGER,          AI_Smart_Swagger
	dbw EFFECT_FURY_CUTTER,      AI_Smart_FuryCutter
	dbw EFFECT_ATTRACT,          AI_Smart_Attract
	dbw EFFECT_FISSURE,          AI_Smart_Fissure
	dbw EFFECT_SAFEGUARD,        AI_Smart_Safeguard
	dbw EFFECT_MAGNITUDE,        AI_Smart_Earthquake
	dbw EFFECT_BATON_PASS,       AI_Smart_BatonPass
	dbw EFFECT_PURSUIT,          AI_Smart_Pursuit
	dbw EFFECT_RAPID_SPIN,       AI_Smart_RapidSpin
	dbw EFFECT_U_TURN,           AI_Smart_UTurn
	dbw EFFECT_SYNTHESIS,        AI_Smart_Synthesis
	dbw EFFECT_HIDDEN_POWER,     AI_Smart_HiddenPower
	dbw EFFECT_RAIN_DANCE,       AI_Smart_RainDance
	dbw EFFECT_SUNNY_DAY,        AI_Smart_SunnyDay
	dbw EFFECT_ALL_UP_HIT,       AI_Smart_AllUpHit
	dbw EFFECT_BELLY_DRUM,       AI_Smart_BellyDrum
	dbw EFFECT_PSYCH_UP,         AI_Smart_PsychUp
	dbw EFFECT_MIRROR_COAT,      AI_Smart_MirrorCoat
	dbw EFFECT_SKULL_BASH,       AI_Smart_SkullBash
	dbw EFFECT_TWISTER,          AI_Smart_Twister
	dbw EFFECT_EARTHQUAKE,       AI_Smart_Earthquake
	dbw EFFECT_FUTURE_SIGHT,     AI_Smart_Fly_SkyAttack_FutureSight
	dbw EFFECT_GUST,             AI_Smart_Gust
	dbw EFFECT_STOMP,            AI_Smart_Stomp
	dbw EFFECT_SOLARBEAM,        AI_Smart_Solarbeam
	dbw EFFECT_THUNDER,          AI_Smart_Thunder
	dbw EFFECT_BEAT_UP,          AI_Smart_BeatUp
	dbw EFFECT_FLY,              AI_Smart_Fly_SkyAttack_FutureSight
	dbw EFFECT_DEFENSE_CURL,     AI_Smart_DefenseCurl
	dbw EFFECT_BLIZZARD,         AI_Smart_Blizzard
	dbw EFFECT_HAIL,             AI_Smart_Hail
	dbw EFFECT_DIG,              AI_Smart_Dig
	dbw EFFECT_AVALANCHE,        AI_Smart_Avalanche
	db -1 ; end

AI_Smart_Nightmare:
; The AI_Basic layer dismisses Nightmare if the player has a Substitute or already has a Nightmare.

; Dismiss this move if the player has any status other than sleep.
	ld a, [wBattleMonStatus]
	and a
	jr z, .no_status
	and SLP
	jp z, AIDismissMove

; 90% chance to greatly encourage this move if the player is asleep.
	jr AI_Smart_DreamEater

; If the player has no status...
.no_status
; ...dismiss this move if the player is Safeguarded...
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jp nz, AIDismissMove
; ...otherwise, fall through to AI_Smart_Sleep.

AI_Smart_Sleep:
; 50% chance to dismiss sleep inducing moves if the player's held item immunizes against them.
; 90% chance to greatly encourage sleep inducing moves if the enemy has either Dream Eater or Nightmare.
; 50% chance to greatly encourage sleep inducing moves otherwise.

	push hl
	ld hl, wBattleMonItem
	ld b, [hl]
	pop hl
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .skip_immune
	call AI_50_50
	jr c, .skip_immune
	jp AIDismissMove

.skip_immune
	ld b, EFFECT_DREAM_EATER
	call AIHasMoveEffect
	jr c, AI_Smart_DreamEater

	ld b, EFFECT_NIGHTMARE
	call AIHasMoveEffect
	jr c, AI_Smart_DreamEater

	call AI_50_50
	ret c
	; fallthrough

AI_Sleep_DreamEater_Encourage:
	dec [hl]
	dec [hl]
	ret

AI_Smart_DreamEater:
; 90% chance to greatly encourage this move.
; The AI_Basic layer dismisses Dream Eater if the player is not asleep or has a Substitute.
	call AI_90_10
	ret c
	jr AI_Sleep_DreamEater_Encourage

AI_Smart_LeechHit:
; The AI_Basic layer dismisses these moves if the player has a Substitute.

; Greatly discourage this move if the enemy will take Liquid Ooze damage.
	ld a, [wEnemyMonType1]
	cp POISON
	jr z, .dont_discourage
	ld a, [wEnemyMonType2]
	cp POISON
	jr z, .dont_discourage

	ld a, [wBattleMonType1]
	cp POISON
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp POISON
	jr nz, .dont_discourage

.discourage
	inc [hl]
	inc [hl]
.dont_discourage

; Do nothing if enemy's HP is full.
	call AICheckEnemyMaxHP
	ret c

; Check type matchups.
	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop hl

; Do nothing if this move is not very effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	ret c

; Encourage this move if it's at least neutrally effective.
; This would partially counter any previous discouragement.
	dec [hl]

; Encourage more if this move is super effective.
; This would fully counter any previous discouragement.
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
	ret c

	dec [hl]
	ret

AI_Smart_LockOn:
; Check if the player is already locked onto.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .player_locked_on

; Discourage this move if enemy's HP is below 25%.
	push hl
	call AICheckEnemyQuarterHP
	jr nc, .discourage

; If enemy's HP is above 50%, don't bother checking speed.
	call AICheckEnemyHalfHP
	jr c, .skip_speed_check

; Discourage this move if enemy is slower than player.
	call AICompareSpeed
	jr nc, .discourage

.skip_speed_check
; 50% chance to greatly encourage this move if player's Evasion level is high.
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 3
	jr nc, .maybe_encourage
; Do nothing if player's Evasion level is not raised.
	cp BASE_STAT_LEVEL + 1
	jr nc, .do_nothing
; 50% chance to greatly encourage this move if enemy's Accuracy level is low.
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .maybe_encourage
; Do nothing if enemy's Accuracy level is not lowered.
	cp BASE_STAT_LEVEL
	jr c, .do_nothing

; Discourage this move if the enemy has no other moves with 75% accuracy or less that are at least neutrally effective.
; Otherwise, do nothing.
	ld hl, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.checkmove
	dec c
	jr z, .discourage

	ld a, [hli]
	and a
	jr z, .discourage

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 76 percent - 1
	jr nc, .checkmove

	ld a, 1
	ldh [hBattleTurn], a

	push hl
	push bc
	farcall BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	pop bc
	pop hl
	jr c, .checkmove

.do_nothing
	pop hl
	ret

.discourage
	pop hl
	inc [hl]
	ret

.maybe_encourage
	pop hl
	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.player_locked_on
; If the enemy has any other moves with 75% accuracy or less, greatly encourage those moves.
; After checking that, dismiss this move.
; AI_Redundant does not dismiss Lock-On if it's already active in order to allow it to check other moves here.

	push hl
	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1

.checkmove2
	inc hl
	dec c
	jr z, .dismiss

	ld a, [de]
	and a
	jr z, .dismiss

	inc de
	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 76 percent - 1
	jr nc, .checkmove2

	dec [hl]
	dec [hl]
	jr .checkmove2

.dismiss
	pop hl
	jp AIDismissMove

AI_Smart_Selfdestruct:
; Unless this is the enemy's last Pokemon...
	call AICheckLastEnemyMon
	jr nc, .notlastmon

; ...highly discourage this move unless this is the player's last Pokemon too.
	call AICheckLastPlayerMon
	jr nz, .discourage

.notlastmon
; Highly discourage this move if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	jr c, .discourage

; Do nothing if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	ret nc

; If enemy's HP is between 25% and 50%, 90% chance to highly discourage this move.
	call AI_90_10
	ret c

.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AI_Smart_EvasionUp:
; The AI_Basic layer dismisses this move if enemy's evasion can't raise anymore.

; If enemy's HP is full...
	call AICheckEnemyMaxHP
	jr nc, .hp_mismatch_1

; ...greatly encourage this move if player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .greatly_encourage

; ...70% chance to greatly encourage this move if player is not badly poisoned.
	call AI_70_30
	jr c, .not_encouraged

.greatly_encourage
	dec [hl]
	dec [hl]
	ret

.hp_mismatch_1
; Greatly discourage this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	jr nc, .hp_mismatch_2

; If enemy's HP is between 25% and 50%,...
	call AICheckEnemyHalfHP
	jr nc, .hp_mismatch_3

; If enemy's HP is above 50% but not full, 20% chance to greatly encourage this move.
	call AI_80_20
	jr c, .greatly_encourage
	jr .not_encouraged

.hp_mismatch_3
; ...50% chance to greatly discourage this move.
	call AI_50_50
	jr c, .not_encouraged

.hp_mismatch_2
	inc [hl]
	inc [hl]

; We only end up here if the move has not been encouraged or dismissed.
.not_encouraged
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, AI_EvaAcc_MaybeGreatlyEncourage

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, AI_EvaAcc_MaybeEncourage

; Discourage this move if enemy's evasion level is higher than player's accuracy level.
	ld a, [wEnemyEvaLevel]
	ld b, a
	ld a, [wPlayerAccLevel]
	cp b
	jr c, .discourage

; Greatly encourage this move if the player is in the middle of Fury Cutter or Rollout.
	ld a, [wPlayerFuryCutterCount]
	and a
	jr nz, .greatly_encourage

	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jr nz, .greatly_encourage

.discourage
	inc [hl]
	ret

AI_EvaAcc_MaybeGreatlyEncourage:
; Player is badly poisoned.
; 70% chance to greatly encourage this move.
; This would counter any previous discouragement.
	call AI_70_30
	ret c

	dec [hl]
	dec [hl]
	ret

AI_EvaAcc_MaybeEncourage:
; Player is seeded.
; 50% chance to encourage this move.
; This would partly counter any previous discouragement.
	call AI_50_50
	ret c

	dec [hl]
	ret

AI_Smart_AccuracyDown:
; Dismiss this move if the player's accuracy is already minimized, and they can't switch out.
	call AI_Smart_AccuracyDown_Dismiss

; If player's HP is full...
	call AICheckPlayerMaxHP
	jr nc, .hp_mismatch_1

; ...and enemy's HP is above 50%...
	call AICheckEnemyHalfHP
	jr nc, .hp_mismatch_1

; ...greatly encourage this move if player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .greatly_encourage

; ...70% chance to greatly encourage this move if player is not badly poisoned.
	call AI_70_30
	jr nc, .not_encouraged

.greatly_encourage
	dec [hl]
	dec [hl]
	ret

.hp_mismatch_1
; Greatly discourage this move if player's HP is below 25%.
	call AICheckPlayerQuarterHP
	jr nc, .hp_mismatch_2

; If player's HP is between 25% and 50%,...
	call AICheckPlayerHalfHP
	jr nc, .hp_mismatch_3

; If player's HP is above 50% but not full, 20% chance to greatly encourage this move.
	call AI_80_20
	jr c, .greatly_encourage
	jr .not_encouraged

; ...50% chance to greatly discourage this move.
.hp_mismatch_3
	call AI_50_50
	jr c, .not_encouraged

.hp_mismatch_2
	inc [hl]
	inc [hl]

; We only end up here if the move has not been encouraged or dismissed.
.not_encouraged
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, AI_EvaAcc_MaybeGreatlyEncourage

	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, AI_EvaAcc_MaybeEncourage

; Discourage this move if enemy's evasion level is higher than player's accuracy level.
	ld a, [wEnemyEvaLevel]
	ld b, a
	ld a, [wPlayerAccLevel]
	cp b
	jr c, .discourage

; Greatly encourage this move if the player is in the middle of Fury Cutter or Rollout.
	ld a, [wPlayerFuryCutterCount]
	and a
	jr nz, .greatly_encourage

	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_ROLLOUT, a
	jr nz, .greatly_encourage

.discourage
	inc [hl]
	ret

AI_Smart_AlwaysHit:
; 80% chance to greatly encourage this move if either...

; ...enemy's accuracy level has been lowered three or more stages...
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .encourage

; ...or player's evasion level has been raised three or more stages.
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 3
	ret c

.encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_MirrorMove:
; If the player did not use any move last turn...
	ld a, [wLastPlayerCounterMove]
	and a
	jr nz, .usedmove

; ...do nothing if enemy is slower than player...
	call AICompareSpeed
	ret nc

; ...or dismiss this move if enemy is faster than player.
	jp AIDismissMove

; If the player did use a move last turn...
.usedmove
	push hl
	ld hl, UsefulMoves
	call IsInByteArray
	pop hl

; ...do nothing if they didn't use a useful move.
	ret nc

; If they did, 50% chance to encourage this move...
	call AI_50_50
	ret c

	dec [hl]

; ...and 90% chance to encourage this move again if the enemy is faster.
	call AICompareSpeed
	ret nc

	call AI_90_10
	ret c

	dec [hl]
	ret

AI_Smart_ResetStats:
; 85% chance to encourage this move if any of enemy's stat levels is lower than -2.
	push hl
	ld hl, wEnemyAtkLevel
	ld c, NUM_LEVEL_STATS
.enemystatsloop
	dec c
	jr z, .enemystatsdone
	ld a, [hli]
	cp BASE_STAT_LEVEL - 2
	jr c, .encourage
	jr .enemystatsloop

; 85% chance to encourage this move if any of player's stat levels is higher than +2.
.enemystatsdone
	ld hl, wPlayerAtkLevel
	ld c, NUM_LEVEL_STATS
.playerstatsloop
	dec c
	jr z, .discourage
	ld a, [hli]
	cp BASE_STAT_LEVEL + 3
	jr c, .playerstatsloop

.encourage
	pop hl
	call AI_85_15
	ret c
	dec [hl]
	ret

; Discourage this move if neither:
; Any of enemy's stat levels is	lower than -2.
; Any of player's stat levels is higher than +2.
.discourage
	pop hl
	inc [hl]
	ret

AI_Smart_Bide_Screens:
; 90% chance to discourage this move unless enemy's HP is full.
	call AICheckEnemyMaxHP
	ret c
	call AI_90_10
	ret c
	inc [hl]
	ret

AI_Smart_UTurn:
; If the enemy has only one Pokemon [remaining], treat U-Turn as a simple damaging move.
	call AICheckLastEnemyMon
	ret c

; Greatly discourage this move if the enemy is X Accuracied, but continue further checks.
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_X_ACCURACY, a
	jr nz, .greatly_discourage

; Skip Evasion check if identified by Foresight.
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .identified

; Greatly discourage this move if the enemy's Evasion is boosted, but continue further checks.
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 1
	jr nz, .greatly_discourage

.identified
; Greatly discourage this move if the enemy's Def, SpAtk, or SpDef is above +1, but continue further checks.
; Attack is excluded because U-Turn is physical.
	ld a, [wEnemyDefLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .greatly_discourage

	ld a, [wEnemySAtkLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .greatly_discourage

	ld a, [wEnemySDefLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .greatly_discourage

; Only one stage of discouragement if Speed is above +1.
	ld a, [wEnemySpdLevel]
	cp BASE_STAT_LEVEL + 2
	jr nc, .discourage
	jr .continue

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]

.continue
; Greatly encourage this move if the enemy is trapped (Bind effect).
	ld a, [wEnemyWrapCount]
	and a
	jr nz, .greatly_encourage

; Greatly encourage this move if the enemy has a volatile status condition.
	ld a, [wEnemySubStatus1]
	and 1 << SUBSTATUS_NIGHTMARE | 1 << SUBSTATUS_CURSE | 1 << SUBSTATUS_PERISH | 1 << SUBSTATUS_IN_LOVE
	jr nz, .greatly_encourage

	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .greatly_encourage

	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .greatly_encourage

; Only one stage of encouragement if badly poisoned or Mean Looked.
	ld a, [wEnemySubStatus5]
	and 1 << SUBSTATUS_TOXIC | 1 << SUBSTATUS_CANT_RUN
	jr nz, .encourage
	jr AI_Smart_BatonPass

.greatly_encourage
	dec [hl]
.encourage
	dec [hl]
	; fallthrough

AI_Smart_BatonPass:
; Teleport, Baton Pass.
; The AI_Basic layer dismisses these moves if the enemy has only one Pokemon [remaining].

; Discourage this move if the enemy has Spikes around them. Continue regardless.
	ld a, [wEnemyScreens]
	bit SCREENS_SPIKES, a
	jr z, .no_spikes
	inc [hl]

.no_spikes
; Discourage this move if the player hasn't shown super-effective moves against the enemy.
; Consider player's type(s) if its moves are unknown.
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE
	pop hl
	ret c
	inc [hl]
	ret

AI_Smart_ForceSwitch:
; Whirlwind, Roar.
; The AI_Basic layer dismisses these moves if the player has only one Pokemon [remaining].

; If the player doesn't have Spikes around them, merge into AI_Smart_BatonPass, skipping enemy Spikes check.
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	jr z, AI_Smart_BatonPass.no_spikes

; 80% chance to encourage this move if the player has Spikes around them.
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_Synthesis:
; Encourage this move in Harsh Sunlight.
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .encourage

; Discourage this move in Rain, Sandstorm, or Hail.
	and a
	jr z, AI_Smart_Heal
	inc [hl]
	jr AI_Smart_Heal

.encourage
	dec [hl]
	; fallthrough

AI_Smart_Heal:
; Recover, Softboiled, Milk Drink, Synthesis, and Rest.

; The AI_Basic layer dismisses healing moves if the enemy's HP is full.
; 90% chance to greatly encourage this move if enemy's HP is below 25%.
; Discourage this move if enemy's HP is higher than 50%.
; Do nothing otherwise.

	call AICheckEnemyQuarterHP
	jr nc, .encourage
	call AICheckEnemyHalfHP
	ret nc
	inc [hl]
	ret

.encourage
	call AI_90_10
	ret c
	; fallthrough

AI_Smart_Heal_OHKO_Encourage:
	dec [hl]
	dec [hl]
	ret

AI_OHKO_CheckLockOn:
; Greatly encourage this move if the player is locked onto.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, AI_Smart_Heal_OHKO_Encourage

; Else, 50% chance to discourage this move. Regardless, execute AI_DiscourageIfPlayerHPBelowHalf.
	call AI_50_50
	jr c, AI_DiscourageIfPlayerHPBelowHalf
	inc [hl]
	; fallthrough

AI_Smart_LeechSeed:
; The AI_Status layer will make sure Leech Seed is not used against Grass types.
AI_DiscourageIfPlayerHPBelowHalf:
; Discourage this move if player's HP is below 50%.
; Several smart AI routines jump to this to save space.
; Keep it within jr range.
	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret

AI_Smart_Poison:
; 50% chance to dismiss this move if the player's held item immunizes against poisoning.
; Else, discourage this move if player's HP is below 50%.
	push hl
	ld hl, wBattleMonItem
	ld b, [hl]
	pop hl
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_PREVENT_POISON
	jr nz, AI_DiscourageIfPlayerHPBelowHalf
	call AI_50_50
	jr c, AI_DiscourageIfPlayerHPBelowHalf
	jr AIDismissMove

AI_Smart_Fissure:
; Dismiss this move if the player is a floatmon.
	push hl
	ld a, [wBattleMonSpecies]
	ld hl, FloatMons
	call IsInByteArray
	pop hl
	jr c, AIDismissMove
	; fallthrough

AI_Smart_OHKO:
; Dismiss this move if player's level is higher than enemy's level.
; Else, greatly encourage this move if player is locked onto.
; Else, discourage this move if player's HP is below 50%.

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wEnemyMonLevel]
	cp b
	jr c, AIDismissMove
	jr AI_OHKO_CheckLockOn

AI_Smart_Confuse:
; 50% chance to dismiss this move if the player's held item immunizes against confusion.
; Else, discourage this move if player's HP is below 50%.
	push hl
	ld hl, wBattleMonItem
	ld b, [hl]
	pop hl
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_PREVENT_CONFUSE
	jr nz, AI_DiscourageIfPlayerHPBelowHalf
	call AI_50_50
	jr c, AI_DiscourageIfPlayerHPBelowHalf
	; fallthrough

AIDismissMove:
; This is jumped to from everywhere.
; It's wedged in here to change some jps to jrs.
	ld a, [hl]
	add 10
	ld [hl], a
AI_None: ; lol
	ret

AI_Smart_Float:
; Dismiss this move if the player is a floatmon.
; Used by AI_Smart_Dig and AI_Smart_Earthquake.
	push hl
	ld a, [wBattleMonSpecies]
	ld hl, FloatMons
	call IsInByteArray
	pop hl
	jr c, AIDismissMove
	ret

AI_Smart_Dig:
	call AI_Smart_Float
	; fallthrough

AI_Smart_Fly_SkyAttack_FutureSight:
; Fly, Sky Attack, Future Sight
; Highly encourage this move if the player is flying or underground, and slower than the enemy.

	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	call AICompareSpeed
	ret nc

	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Earthquake:
; Greatly encourage this move if the player is underground and the enemy is faster.
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_UNDERGROUND, a
	jr z, .checklastmove

	call AICompareSpeed
	jr nc, .checklastmove
	dec [hl]
	dec [hl]
	ret

.checklastmove
; If Dig was the player's last used move...
	ld a, [wLastPlayerCounterMove]
	cp DIG
	jr nz, AI_Smart_Float
; ...and the player is faster...
	call AICompareSpeed
	jr c, AI_Smart_Float
; ...try to predict if the player will use Dig again this turn.
	call AI_50_50
	jr c, AI_Smart_Float
	dec [hl]
	ret

AI_Smart_Paralyze:
; 50% chance to dismiss this move if the player's held item immunizes against Paralysis.
	push hl
	ld hl, wBattleMonItem
	ld b, [hl]
	pop hl
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_PREVENT_PARALYZE
	jr nz, .skip_immune
	call AI_50_50
	jr c, .skip_immune
	jr AIDismissMove

.skip_immune
; 50% chance to discourage this move if player's HP is below 25%.
	call AICheckPlayerQuarterHP
	jr nc, .discourage

; 80% chance to greatly encourage this move if enemy is slower than player and its HP is above 25%.
	call AICompareSpeed
	ret c
	call AICheckEnemyQuarterHP
	ret nc
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.discourage
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Recoil_JumpKick:
; Encourage this move if enemy's held item prevents recoil/crash damage.
	push hl
	ld hl, wEnemyMonItem
	ld b, [hl]
	pop hl
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_PREVENT_RECOIL
	jr nz, .checkhi
	dec [hl]
	ret

.checkhi
; If this move is Hi Jump Kick, jump to AI_Smart_Gust.
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp HI_JUMP_KICK
	jr z, AI_Smart_Gust
	ret

AI_Smart_AllUpHit:
; If this move is Silver Wind, fall through to AI_Smart_Gust. Else do nothing.
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp SILVER_WIND
	ret nz
	; fallthrough

AI_Smart_Gust:
; Greatly encourage this move if the player is flying and the enemy is faster.
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_FLYING, a
	jr z, .checklastmove

	call AICompareSpeed
	jr nc, .checklastmove

	dec [hl]
	dec [hl]
	ret

.checklastmove
; If Fly or Sky Attack was the player's last used move...
	ld a, [wLastPlayerCounterMove]
	cp FLY
	jr z, .couldFly
	cp SKY_ATTACK
	ret nz

.couldFly
; ...and the player is faster...
	call AICompareSpeed
	ret c
; ...try to predict if the player will use Fly or Sky Attack again this turn.
; fallthrough

AI_Smart_GustSpeedControl_MaybeEncourage:
	call AI_50_50
	ret c
	dec [hl]
	ret

AI_Smart_Twister:
; If enemy is faster than player, maybe fish for a flinch. Regardless, jump to AI_Smart_Gust.
	call AI_Smart_FlinchHit
	jr AI_Smart_Gust

AI_Smart_SpeedControl:
; NOTE: No move exists with EFFECT_SPEED_UP (only EFFECT_SPEED_UP_2), so it's excluded for space.

; Dismiss this move if the player's speed is already minimized, and they can't switch out.
	call AI_Smart_SpeedDown

; If player is faster than enemy, 50% chance to encourage this move (no chance to discourage).
; Else discourage this move.
	call AICompareSpeed
	jr nc, AI_Smart_GustSpeedControl_MaybeEncourage
	inc [hl]

; Discourage further if the player has only one Pokemon [remaining]. Redundant?
	call AICheckLastPlayerMon
	ret nz
	inc [hl]
	inc [hl]
	ret

AI_Smart_SuperFang:
; Discourage this move if player's HP is below 25%.
	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret

AI_Smart_TrapTarget:
; Bind, Wrap, Fire Spin, Clamp, Whirlpool

; 50% chance to discourage this move if the player is already trapped.
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .discourage

; 50% chance to greatly encourage this move if player is either badly poisoned, in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .encourage

	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .encourage

; Else, 50% chance to greatly encourage this move if it's the player's Pokemon's first turn.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .encourage

; 50% chance to discourage this move otherwise.
.discourage
	call AI_50_50
	ret c
	inc [hl]
	ret

.encourage
	call AICheckEnemyQuarterHP
	ret nc
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_SpDefenseUp2:
; Discourage this move if enemy's HP is lower than 50%.
	call AICheckEnemyHalfHP
	jr nc, .discourage

; Discourage this move if enemy's special defense level is higher than +3.
	ld a, [wEnemySDefLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .discourage

; 80% chance to greatly encourage this move if enemy's Special Defense level is lower than +2, and the player's Pokémon is Special-oriented.
	cp BASE_STAT_LEVEL + 2
	ret nc

	push hl
; Get the pointer for the player's Pokémon's base Attack
	ld a, [wBattleMonSpecies]
	ld hl, BaseData + BASE_ATK
	ld bc, BASE_DATA_SIZE
	call AddNTimes
; Get the Pokémon's base Attack
	ld a, BANK(BaseData)
	call GetFarByte
	ld d, a
; Get the pointer for the player's Pokémon's base Special Attack
	ld bc, BASE_SAT - BASE_ATK
	add hl, bc
; Get the Pokémon's base Special Attack
	ld a, BANK(BaseData)
	call GetFarByte
	pop hl
; If its base Attack is greater than its base Special Attack, don't encourage this move.
	cp d
	ret c

.encourage
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.discourage
	inc [hl]
	ret

AI_Smart_Avalanche:
; Encourage this move if the player's last used move was a damaging move. Continue regardless.
	ld a, [wLastPlayerCounterMove]
	and a
	jr z, .continue

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_OHKO
	jr z, .continue
	cp EFFECT_FISSURE
	jr z, .continue
	cp EFFECT_COUNTER
	jr z, .continue
	cp EFFECT_MIRROR_COAT
	jr z, .continue

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .continue
	dec [hl]

.continue
; Discourage this move if the enemy's HP is below half, and discourage again if below quarter.
	call AICheckEnemyHalfHP
	ret c
	inc [hl]
	call AICheckEnemyQuarterHP
	ret c
	inc [hl]
	ret

AI_Smart_HyperBeam:
	call AICheckEnemyHalfHP
	jr c, .discourage

; 50% chance to encourage this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	ret c
	call AI_50_50
	ret c
	dec [hl]
	ret

.discourage
; If enemy's HP is above 50%, discourage this move at random.
	call AI_85_15
	ret c
	inc [hl]
	call AI_50_50
	ret c
	inc [hl]
	ret

AI_Smart_Rage:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_RAGE, a
	jr z, .notbuilding

; If enemy's Rage is building, 50% chance to encourage this move.
	call AI_50_50
	jr c, .skipencourage

	dec [hl]

; Encourage this move based on Rage's counter.
.skipencourage
	ld a, [wEnemyRageCounter]
	cp 2
	ret c
	dec [hl]
	ld a, [wEnemyRageCounter]
	cp 3
	ret c
	dec [hl]
	ret

.notbuilding
; If enemy's Rage is not building, discourage this move if enemy's HP is below 50%.
	call AICheckEnemyHalfHP
	jr nc, .discourage

; 20% chance to encourage this move otherwise.
	call AI_80_20
	ret nc
	dec [hl]
	ret

.discourage
	inc [hl]
	ret

AI_Smart_SkullBash:
; If enemy is faster than player, maybe fish for a flinch. Regardless, fall through to AI_Smart_Substitute.
	call AI_Smart_FlinchHit
	; fallthrough

AI_Smart_Substitute:
; Check if enemy already has a Substitute.
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jr z, .no_sub

; If so, dismiss this move if both Defense and Special Defense stage modifiers are maxed out.
	ld a, [wEnemyDefLevel]
	cp MAX_STAT_LEVEL
	ret c
	ld a, [wEnemySDefLevel]
	cp MAX_STAT_LEVEL
	ret c
	jp AIDismissMove

.no_sub
; Encourage this move if enemy's HP is full.
; Dismiss this move if enemy's HP is 25% or below.

	call AICheckEnemyMaxHP
	jr c, .encourage

	call AICheckEnemyQuarterHP
	jr c, AI_Smart_Discourage
	jp AIDismissMove

.encourage
	dec [hl]
	ret

AI_Smart_Counter:
	push hl
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES
	ld b, 0

.playermoveloop
	ld a, [hli]
	and a
	jr z, .skipmove

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .skipmove

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr nc, .skipmove

	inc b

.skipmove
	dec c
	jr nz, .playermoveloop

	pop hl
	ld a, b
	and a
	jr z, AI_Smart_Discourage

	cp 3
	jr nc, AI_CounterMirrorCoat_Encourage

	ld a, [wLastPlayerCounterMove]
	and a
	ret z

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret z

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	ret nc
	; fallthrough

AI_CounterMirrorCoat_Encourage:
	call AI_60_40
	ret c
	dec [hl]
	ret

AI_Smart_Discourage:
; Another thing that multiple Smart AIs jump to.
	inc [hl]
	ret

AI_Smart_MirrorCoat:
	push hl
	ld hl, wPlayerUsedMoves
	ld c, NUM_MOVES
	ld b, 0

.playermoveloop
	ld a, [hli]
	and a
	jr z, .skipmove

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .skipmove

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr c, .skipmove

	inc b

.skipmove
	dec c
	jr nz, .playermoveloop

	pop hl
	ld a, b
	and a
	jr z, AI_Smart_Discourage

	cp 3
	jr nc, AI_CounterMirrorCoat_Encourage

	ld a, [wLastPlayerCounterMove]
	and a
	ret z

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret z

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	ret c
	jr AI_CounterMirrorCoat_Encourage

AI_Smart_Encore:
; Dismiss this move if the player did not use any move last turn.
	ld a, [wLastPlayerMove]
	and a
	jp z, AIDismissMove

; Highly discourage this move if the player is faster than the enemy.
	call AICompareSpeed
	jr nc, .discourage

; Greatly encourage this move if the player's last move is in the list of Encore moves.
	push hl
	ld a, [wLastPlayerCounterMove]
	ld hl, EncoreMoves
	call IsInByteArray
	pop hl

; If it isn't, consider type matchups.
	jr nc, .matchup

	dec [hl]
.encourage
	dec [hl]
	ret

; If the player only has not very effective moves against the enemy, encourage this move.
.matchup
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE + 1 ; not very effective
	pop hl
	jr nc, .encourage

; Else highly discourage this move.
.discourage
	inc [hl]
	inc [hl]
	inc [hl]
	ret

INCLUDE "data/battle/ai/encore_moves.asm"

AI_Smart_FlameWheel:
; 80% chance to greatly encourage this move if enemy is curled.
	ld a, [wEnemySubStatus2]
	bit SUBSTATUS_CURLED, a
	ret z

	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_Spite:
; Dismiss this move if the player hasn't used a move yet and the enemy is faster.
	ld a, [wLastPlayerCounterMove]
	and a
	jr nz, .usedmove

	call AICompareSpeed
	jp c, AIDismissMove

; 50% chance to discourage this move if the player hasn't used a move yet and the enemy is slower.
	call AI_50_50
	ret c
	jr .discourage

.usedmove
	push hl
	ld b, a
	ld c, NUM_MOVES
	ld hl, wBattleMonMoves
	ld de, wBattleMonPP

.moveloop
	ld a, [hli]
	cp b
	jr z, .foundmove

	inc de
	dec c
	jr nz, .moveloop

	pop hl
	ret

; Encourage this move if the player's last used move has low PP.
; Discourage this move if the player's last used move has high PP.
.foundmove
	pop hl
	ld a, [de]
	cp 6
	jr c, .encourage
	cp 15
	jr nc, .discourage

	call AI_60_40
	ret nc

.discourage
	inc [hl]
	ret

.encourage
	call AI_60_40
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_Reversal_DestinyBond:
; Discourage this move if enemy's HP is above 25%.
	call AICheckEnemyQuarterHP
	ret nc
	inc [hl]
	ret

AI_Smart_HealBell:
; Dismiss this move if none of the enemy's Pokemon are statused.
; Encourage this move if any of the enemy's Pokemon are statused.

	push hl
	ld a, [wOTPartyCount]
	ld b, a
	ld c, 0
	ld hl, wOTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	push hl
	ld a, [hli]
	or [hl]
	jr z, .next

	; status
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.next
	pop hl
	add hl, de
	dec b
	jr nz, .loop

	pop hl
	ld a, c
	and a
	jr nz, .encourage

	ld a, [wEnemyMonStatus]
	and a
	jp z, AIDismissMove
.encourage
	dec [hl]
	ret

AI_Smart_MeanLook:
; Mean Look, Spider Web

; The AI_Basic layer dismisses Mean Look if it's already in effect.
; The AI_Status layer dismisses Mean Look if the player is Ghost-type and therefore immune.

; Dismiss this move if the player has only one Pokemon [remaining].
	call AICheckLastPlayerMon
	jp z, AIDismissMove

; Discourage this move if the enemy's HP is below half. No chance to encourage.
	call AICheckEnemyHalfHP
	jr nc, .discourage

; 80% chance to highly encourage this move if the player is badly poisoned.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .encourage

; 80% chance to highly encourage this move if the player is either in love, identified, stuck in Rollout, or has a Nightmare.
	ld a, [wPlayerSubStatus1]
	and 1 << SUBSTATUS_IN_LOVE | 1 << SUBSTATUS_ROLLOUT | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_NIGHTMARE
	jr nz, .encourage

; Otherwise, discourage this move unless the player only has not very effective moves against the enemy.
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE + 1 ; not very effective
	pop hl
	ret nc

.discourage
	inc [hl]
	ret

.encourage
	call AI_80_20
	ret c
	jr AI_Smart_Highly_Encourage

AI_Smart_PriorityHit:
	call AICompareSpeed
	ret c

; Dismiss this move if the player is flying or underground.
	ld a, [wPlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, AIDismissMove

; Highly encourage this move if it will KO the player.
	ld a, 1
	ldh [hBattleTurn], a
	push hl
	callfar EnemyAttackDamage_DamageCalc_Stab
	pop hl
	ld a, [wCurDamage + 1]
	ld c, a
	ld a, [wCurDamage]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp c
	ld a, [wBattleMonHP]
	sbc b
	ret nc
	; fallthrough

AI_Smart_Highly_Encourage:
; Another space-saver. Keep in jr range.
	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Endure:
; Greatly discourage this move if the enemy already used Protect.
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .greatly_discourage

; Greatly discourage this move if the enemy's HP is full.
	call AICheckEnemyMaxHP
	jr c, .greatly_discourage

; Discourage this move if the enemy's HP is at least 25%.
	call AICheckEnemyQuarterHP
	jr c, .discourage

; If the enemy has Reversal or Flail...
	ld b, EFFECT_REVERSAL
	call AIHasMoveEffect
	jr nc, .no_reversal

; ...80% chance to highly encourage this move.
	call AI_80_20
	ret c
	jr AI_Smart_Highly_Encourage

.no_reversal
; 50% chance to greatly encourage this move if the enemy is locked onto.
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	ret z

	call AI_50_50
	ret c

	dec [hl]
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

AI_Smart_Disable:
; 90% chance to discourage this move if player is faster than enemy. (No chance to encourage.)
	call AICompareSpeed
	jr nc, .discourage

; Encourage this move if the player's last used move is in the list of useful moves.
	push hl
	ld a, [wLastPlayerCounterMove]
	ld hl, UsefulMoves
	call IsInByteArray
	pop hl
	jr nc, .notencourage
	dec [hl]
	ret

; If the player's last used move was not in the useful list, do nothing if it was a damaging move.
.notencourage
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret nz

; Else, 90% chance to discourage this move.
.discourage
	call AI_90_10
	ret c
	inc [hl]
	ret

AI_Smart_Curse:
	ld a, [wEnemyMonType1]
	cp GHOST
	jr z, .ghost_curse
	ld a, [wEnemyMonType2]
	cp GHOST
	jr z, .ghost_curse

; Discourage this move if enemy's HP is below 50%.
	call AICheckEnemyHalfHP
	jr nc, .discourage

; Discourage this move if enemy's stat levels have been raised four or more stages.
; Do nothing if enemy's stat levels have been raised two or more stages.
	ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 4
	jr nc, .discourage
	cp BASE_STAT_LEVEL + 2
	ret nc

; 80% chance to greatly encourage this move if enemy's stat levels are less than +2.
	call AI_80_20
	ret c

.greatly_encourage
	dec [hl]
	dec [hl]
	ret

.cancel
	inc [hl]
	inc [hl]
.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

.ghost_curse
; Dismiss this move if the player is already cursed.
; AI_Redundant doesn't cover this because then it would dismiss non-Ghost Curse too.
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jp nz, AIDismissMove

	call AICheckLastEnemyMon
	jr nc, .notlastmon

; Heavily discourage this move if the enemy has only one Pokemon [remaining].
	call AICheckLastPlayerMon
	jr nz, .cancel
	jr .ghost_continue

.notlastmon
; 50% chance to greatly encourage this move if the player has only one Pokemon [remaining].
	call AICheckLastPlayerMon
	jr z, .maybe_greatly_encourage

.ghost_continue
; Heavily discourage this move if enemy's HP is below 25%.
	call AICheckEnemyQuarterHP
	jr nc, .cancel

; Greatly discourage this move if enemy's HP is below 50%.
	call AICheckEnemyHalfHP
	jr nc, .greatly_discourage

; Do nothing if the enemy's HP is full.
	call AICheckEnemyMaxHP
	ret nc

; 50% chance to greatly encourage this move if it's the player's Pokemon's first turn.
	ld a, [wPlayerTurnsTaken]
	and a
	ret nz

.maybe_greatly_encourage
	call AI_50_50
	ret c
	jr .greatly_encourage

AI_Smart_Protect:
; Discourage this move if the enemy already used Protect. 90% chance to discourage further.
	ld a, [wEnemyProtectCount]
	and a
	jr nz, .greatly_discourage

; 90% chance to discourage this move if the player has been locked onto.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .discourage

; 80% chance to encourage this move if the player's Fury Cutter is boosted enough.
	ld a, [wPlayerFuryCutterCount]
	cp 3
	jr nc, .encourage

; 80% chance to encourage this move if the player has charged a two-turn move.
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CHARGED, a
	jr nz, .encourage

; 80% chance to encourage this move if the player is affected by Toxic, Leech Seed, or Curse.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .encourage
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .encourage
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jr nz, .encourage

; 90% chance to discourage this move if the player's Rollout count is not boosted enough.
	bit SUBSTATUS_ROLLOUT, a
	jr z, .discourage
	ld a, [wPlayerRolloutCount]
	cp 3
	jr c, .discourage

; 80% chance to encourage this move otherwise.
.encourage
	call AI_80_20
	ret c

	dec [hl]
	ret

.greatly_discourage
	inc [hl]

.discourage
	call AI_90_10
	ret c

	inc [hl]
	inc [hl]
	ret

AI_Smart_Foresight:
; 60% chance to encourage this move if the enemy's accuracy is sharply lowered.
	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL - 2
	jr c, .encourage

; 60% chance to encourage this move if the player's evasion is sharply raised.
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 3
	jr nc, .encourage

; 60% chance to encourage this move if the player is a Normal, Ghost, or Dark type.
	ld a, [wBattleMonType1]
	cp NORMAL
	jr z, .encourage
	cp GHOST
	jr z, .encourage
	cp DARK
	jr z, .encourage
	ld a, [wBattleMonType2]
	cp NORMAL
	jr z, .encourage
	cp GHOST
	jr z, .encourage
	cp DARK
	jr z, .encourage

; 90% chance to discourage this move otherwise.
	call AI_90_10
	ret c

	inc [hl]
	ret

.encourage
	call AI_60_40
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_PerishSong:
; Hugely discourage this move if the enemy has only one Pokemon [remaining].
	call AICheckLastEnemyMon
	jr c, .no

; Else, 50% chance to encourage this move if the player can't escape.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .yes

; Else, consider type matchups and possibly discourage this move.
	push hl
	callfar CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp BASE_AI_SWITCH_SCORE
	pop hl
	ret c

	call AI_50_50
	ret c

	inc [hl]
	ret

.yes
	call AI_50_50
	ret c

	dec [hl]
	ret

.no
	ld a, [hl]
	add 5
	ld [hl], a
	ret

INCLUDE "data/battle/ai/rain_dance_moves.asm"

INCLUDE "data/battle/ai/sunny_day_moves.asm"

AI_Smart_RainDance:
; Highly discourage this move if it would favour the player type-wise.
; Particularly, if the player is a Water-type.
	ld a, [wBattleMonType1]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	push hl
	ld hl, RainDanceMoves
	jr AI_Smart_WeatherMove

AI_Smart_SunnyDay:
; Highly discourage this move if it would favour the player type-wise.
; Particularly, if the player is a Fire-type.
	ld a, [wBattleMonType1]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	ld a, [wBattleMonType2]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	push hl
	ld hl, SunnyDayMoves
	; fallthrough

AI_Smart_WeatherMove:
; Rain Dance, Sunny Day

; Highly discourage this move if the enemy doesn't have one of the useful Rain Dance or Sunny Day moves.
	call AIHasMoveInArray
	pop hl
	jr nc, AIBadWeatherType

; Highly discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, AIBadWeatherType

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

AIBadWeatherType:
	inc [hl]
	inc [hl]
	inc [hl]
	ret

AIGoodWeatherType:
; Rain Dance, Sunny Day

; Greatly encourage this move if it would disfavour the player type-wise and player's HP is above 50%...
	call AICheckPlayerHalfHP
	ret nc

; ...as long as one of the following conditions meet:
; It's the first turn of the player's Pokemon.
	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .good

; Or it's the first turn of the enemy's Pokemon.
	ld a, [wEnemyTurnsTaken]
	and a
	ret nz

.good
	dec [hl]
	dec [hl]
	ret

AI_Smart_Snore_SleepTalk:
; Highly encourage this move if enemy is fast asleep.
; Highly discourage this move otherwise.

	ld a, [wEnemyMonStatus]
	and SLP
	cp 1
	jr z, AIBadWeatherType ; hijacking this for space

	dec [hl]
	dec [hl]
	dec [hl]
	ret

AI_Smart_Sandstorm:
; Greatly discourage this move if the player is immune to Sandstorm damage.
	ld a, [wBattleMonType1]
	push hl
	ld hl, .SandstormImmuneTypes
	call IsInByteArray
	pop hl
	jr c, .greatly_discourage

	ld a, [wBattleMonType2]
	push hl
	ld hl, .SandstormImmuneTypes
	call IsInByteArray
	pop hl
	jr c, .greatly_discourage

; Discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, .discourage

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c

	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

.SandstormImmuneTypes:
	db ROCK
	db GROUND
	db STEEL
	db -1 ; end

AI_Smart_Hail:
; Greatly discourage this move if the player is immune to Hail damage.
	ld a, [wBattleMonType1]
	cp ICE
	jr z, .greatly_discourage
	ld a, [wBattleMonType2]
	cp ICE
	jr z, .greatly_discourage

; Discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	jr nc, .discourage

; Encourage this move if AI has good Hail moves.
	push hl
	ld hl, .GoodHailMoves
	call AIHasMoveInArray
	pop hl
	jr c, .encourage

; 50% chance to encourage this move otherwise.
	call AI_50_50
	ret c

.encourage
	dec [hl]
	ret

.greatly_discourage
	inc [hl]
.discourage
	inc [hl]
	ret

.GoodHailMoves
	db BLIZZARD
	db -1 ; end

AI_Smart_Blizzard:
; Do nothing if the player is Fire- or Ice-type, and therefore immune to being frozen.
	ld a, [wBattleMonType1]
	cp FIRE
	ret z
	cp ICE
	ret z

	ld a, [wBattleMonType2]
	cp FIRE
	ret z
	cp ICE
	ret z

; Otherwise, greatly encourage this move in Hail.
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret nz

	dec [hl]
	dec [hl]
	ret

AI_Smart_Thunder:
; Maybe encourage this move if the player is flying...
	call AI_Smart_Gust

; ...and greatly encourage this move in the rain.
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret nz

	dec [hl]
	dec [hl]
	ret

AI_Smart_Solarbeam:
; 80% chance to greatly encourage this move when it's sunny.
; 90% chance to greatly discourage this move when it's raining or hailing.

	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .encourage

	cp WEATHER_RAIN
	ret nz

	cp WEATHER_HAIL
	ret nz

	call AI_90_10
	ret c

	inc [hl]
	inc [hl]
	ret

.encourage
	call AI_80_20
	ret c

	dec [hl]
	dec [hl]
	ret

AI_Smart_FuryCutter:
; Encourage this move based on Fury Cutter's count.
	ld a, [wEnemyFuryCutterCount]
	and a
	jr z, AI_Smart_Rollout
	dec [hl]

	cp 2
	jr c, AI_Smart_Rollout
	dec [hl]
	dec [hl]

	cp 3
	jr c, AI_Smart_Rollout
	dec [hl]
	dec [hl]
	dec [hl]
	; fallthrough

AI_Smart_Rollout:
; Rollout, Fury Cutter

; 80% chance to discourage this move if the enemy is in love, confused, or paralyzed.
	ld a, [wEnemySubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	jr nz, .maybe_discourage

	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .maybe_discourage

	ld a, [wEnemyMonStatus]
	bit PAR, a
	jr nz, .maybe_discourage

; 80% chance to discourage this move if the enemy's HP is below 25%, or if accuracy or evasion modifiers favour the player.
	call AICheckEnemyQuarterHP
	jr nc, .maybe_discourage

	ld a, [wEnemyAccLevel]
	cp BASE_STAT_LEVEL
	jr c, .maybe_discourage
	ld a, [wPlayerEvaLevel]
	cp BASE_STAT_LEVEL + 1
	jr nc, .maybe_discourage

; 80% chance to greatly encourage this move otherwise.
	call AI_80_20
	ret c
	dec [hl]
	dec [hl]
	ret

.maybe_discourage
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Swagger:
; 50% chance to dismiss this move if the player's held item immunizes against confusion.
; Else, discourage this move if player's HP is below 50%.
; Regardless, fall through to AI_Smart_Attract.
	call AI_Smart_Confuse
	; fallthrough

AI_Smart_Attract:
; 80% chance to encourage this move during the first turn of the player's Pokemon.
; 80% chance to discourage this move otherwise.

	ld a, [wPlayerTurnsTaken]
	and a
	jr z, .first_turn

	call AI_80_20
	ret c
	inc [hl]
	ret

.first_turn
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_Safeguard:
; 80% chance to discourage this move if player's HP is below 50%.
	call AICheckPlayerHalfHP
	ret c
	call AI_80_20
	ret c
	inc [hl]
	ret

AI_Smart_Pursuit:
; 80% chance to discourage this move if the player has only one Pokemon [remaining].
	call AICheckLastPlayerMon
	jr z, .discourage

; 50% chance to greatly encourage this move if player's HP is below 25%.
; 80% chance to discourage this move otherwise.

	call AICheckPlayerQuarterHP
	jr nc, .encourage

.discourage
	call AI_80_20
	ret c
	inc [hl]
	ret

.encourage
	call AI_50_50
	ret c
	dec [hl]
	dec [hl]
	ret

AI_Smart_RapidSpin:
; 80% chance to greatly encourage this move if the enemy is trapped (Bind effect), seeded, or surrounded by Spikes.
; Else, 80% chance to encourage this move if enemy is curled.

	call AI_80_20
	ret c

	ld a, [wEnemyWrapCount]
	and a
	jr nz, .greatly_encourage

	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .greatly_encourage

	ld a, [wEnemyScreens]
	bit SCREENS_SPIKES, a
	jr nz, .greatly_encourage

	ld a, [wEnemySubStatus2]
	bit SUBSTATUS_CURLED, a
	jr nz, .encourage
	ret

.greatly_encourage
	dec [hl]
.encourage
	dec [hl]
	ret

AI_Smart_HiddenPower:
; Calculate Hidden Power's type based on enemy's DVs.
	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar HiddenPowerDamage
	pop hl
	; fallthrough

AI_Smart_Reckless:
	push hl
	ld a, 1
	ldh [hBattleTurn], a
	callfar BattleCheckTypeMatchup
	pop hl

; Discourage this move if not very effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr c, .bad

; Encourage this move if super-effective.
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
	jr nc, .good

.bad
	inc [hl]
	ret

.good
	dec [hl]
	ret

AI_Smart_BellyDrum:
; Hugely discourage this move if enemy's attack is higher than +2.
	ld a, [wEnemyAtkLevel]
	cp BASE_STAT_LEVEL + 3
	jr nc, .discourage

; Else, encourage this move if enemy's HP is full.
	call AICheckEnemyMaxHP
	jr c, .encourage

; Else, do nothing if enemy's HP is above 50%.
	call AICheckEnemyHalfHP
	ret c

; Else hugely discourage this move.
.discourage
	ld a, [hl]
	add 5
	ld [hl], a
	ret

.encourage
	dec [hl]
	ret

AI_Smart_PsychUp:
	push hl
	ld hl, wEnemyAtkLevel
	ld b, NUM_LEVEL_STATS
	ld c, 100

; Calculate the sum of all enemy's stat level modifiers. Add 100 first to prevent underflow.
; Put the result in c. c will range between 58 and 142.
.enemy_loop
	ld a, [hli]
	sub BASE_STAT_LEVEL
	add c
	ld c, a
	dec b
	jr nz, .enemy_loop

; Calculate the sum of all player's stat level modifiers. Add 100 first to prevent underflow.
; Put the result in d. d will range between 58 and 142.
	ld hl, wPlayerAtkLevel
	ld b, NUM_LEVEL_STATS
	ld d, 100

.player_loop
	ld a, [hli]
	sub BASE_STAT_LEVEL
	add d
	ld d, a
	dec b
	jr nz, .player_loop

; Greatly discourage this move if enemy's stat levels are higher than player's (if c>=d).
	ld a, c
	sub d
	pop hl
	jr nc, .discourage

; Else, 80% chance to encourage this move unless player's accuracy level is lower than -1...
	ld a, [wPlayerAccLevel]
	cp BASE_STAT_LEVEL - 1
	ret c

; ...or enemy's evasion level is higher than +0.
	ld a, [wEnemyEvaLevel]
	cp BASE_STAT_LEVEL + 1
	ret nc

	call AI_80_20
	ret c

	dec [hl]
	ret

.discourage
	inc [hl]
	inc [hl]
	ret

AI_Smart_Stomp:
; If enemy is faster than player, maybe fish for a flinch. Continue regardless.
	call AI_Smart_FlinchHit

; 80% chance to encourage this move if the player has used Minimize.
	ld a, [wPlayerMinimized]
	and a
	ret z

	call AI_80_20
	ret c

	dec [hl]
	ret

AI_Smart_Rampage:
; Encourage this move if enemy's held item immunizes against Confusion.
	push hl
	ld hl, wEnemyMonItem
	ld b, [hl]
	pop hl
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_PREVENT_CONFUSE
	ret nz
	dec [hl]
	ret

AI_Smart_FlinchHit:
; NOTE: Called by Stomp, Twister, and Skull Bash. Does not cover Snore/Night Terror or King's Rock.
; Snore/Night Terror's only competition while asleep is Sleep Talk, so it's not really worth it.
; King's Rock is only ~10% and would require checking for which moves it affects, which I don't have room or patience for.

; If enemy is faster than player, % chance to encourage this move equal to the move's effect chance.
	call AICompareSpeed
	ret c
	ld a, [wEnemyMoveStruct + MOVE_CHANCE]
	ld b, a
	call Random
	cp b
	ret nc
	dec [hl]
	ret

AI_Smart_BeatUp:
; Greatly encourage this move on the first turn of battle.
	ld a, [wTotalBattleTurns]
	and a
	jr nz, .not_first_turn
	dec [hl]
	dec [hl]

.not_first_turn
; Greatly discourage this move if the enemy has only one Pokemon [remaining].
; This would counter any previous encouragement.
	call AICheckLastEnemyMon
	jr nc, .check_status
	inc [hl]
	inc [hl]

.check_status
; Discourage again if any of the enemy's Pokemon are statused.
	push hl
	ld a, [wOTPartyCount]
	ld b, a
	ld c, 0
	ld hl, wOTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	push hl
	ld a, [hli]
	or [hl]
	jr z, .next

	; status
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.next
	pop hl
	add hl, de
	dec b
	jr nz, .loop

	pop hl
	ld a, c
	and a
	jr nz, .discourage

	ld a, [wEnemyMonStatus]
	and a
	ret z
.discourage
	inc [hl]
	ret

AI_Smart_Thief:
; NOTE: Only opponents inside the Battle Tower have Thief.

; Encourage this move if the enemy has no held item, and it's the player mon's first turn.
	ld a, [wEnemyMonItem]
	and a
	ret nz

	ld a, [wPlayerTurnsTaken]
	and a
	ret nz

	dec [hl]
	ret

AI_Smart_Transform:
; Discourage this move if player's max HP is greater than enemy's.
	ld a, [wEnemyMonMaxHP + 1]
	ld e, a
	ld a, [wEnemyMonMaxHP]
	ld d, a
	ld a, [wBattleMonMaxHP + 1]
	cp e
	ld a, [wBattleMonMaxHP]
	sbc d
	ret c
	inc [hl]
	ret

AI_Smart_FalseSwipe:
; Dismiss this move if the player has only 1 HP remaining.
	ld de, 2
	ld a, [wBattleMonHP + 1]
	cp e
	ld a, [wBattleMonHP]
	sbc d
	ret c
	jp AIDismissMove

AI_Smart_Smog:
; Do nothing if this move is not Smog.
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp SMOG
	ret nz

; Discourage this move if the player is Poison-type and therefore immune to poisoning.
; The AI_Immunities layer will dismiss this move if the player is Steel-type.
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .discourage
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .discourage

; Discourage this move if the player already has a non-volatile status.
	ld a, [wBattleMonStatus]
	and a
	ret nz

.discourage
	inc [hl]
	ret

AI_Smart_DefenseCurl:
; The AI_Setup layer counts Defense Curl as a stat-up move.

; Do nothing if enemy is already curled.
	ld a, [wEnemySubStatus2]
	bit SUBSTATUS_CURLED, a
	ret nz

; Else, 80% chance to encourage this move if enemy has an effect that gets boosted by Defense Curl.
	ld b, EFFECT_FLAME_WHEEL
	call AIHasMoveEffect
	jr c, .encourage

	ld b, EFFECT_ROLLOUT
	call AIHasMoveEffect
	jr c, .encourage

	ld b, EFFECT_RAPID_SPIN
	call AIHasMoveEffect
	ret nc

.encourage
	call AI_80_20
	ret c
	dec [hl]
	ret

AI_Smart_Focus_Energy:
; The AI_Setup layer counts Focus Energy as a stat-up move.

; Dismiss this move if all of the following conditions meet:
;  -Enemy is already pumped
;  -Enemy's Attack stage is equal to MAX_STAT_LEVEL
;  -Enemy's SpAtk stage is equal to MAX_STAT_LEVEL
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret z
	ld a, [wEnemyAtkLevel]
	cp MAX_STAT_LEVEL
	ret c
	ld a, [wEnemySAtkLevel]
	cp MAX_STAT_LEVEL
	ret c
	jp AIDismissMove

AI_Smart_AttackDown:
	ld a, [wPlayerAtkLevel]
	jr AI_Smart_StatDown

AI_Smart_DefenseDown:
	ld a, [wPlayerDefLevel]
	jr AI_Smart_StatDown

AI_Smart_SpeedDown:
; Called by AI_Smart_SpeedControl.
	ld a, [wPlayerSpdLevel]
	jr AI_Smart_StatDown

AI_Smart_SpAtkDown:
; No move exists with EFFECT_SP_ATK_DOWN, only EFFECT_SP_ATK_DOWN_2.
	ld a, [wPlayerSAtkLevel]
	jr AI_Smart_StatDown

AI_Smart_SpDefDown:
	ld a, [wPlayerSDefLevel]
	; fallthrough

AI_Smart_StatDown:
; Do nothing unless the given stat's stage modifier is -6 (internally 1).
	cp 2
	ret nc

; Dismiss this move if the player is Mean Looked.
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .dismiss

; Dismiss this move if the player is Bound, Wrapped, etc.
	ld a, [wPlayerWrapCount]
	and a
	jr nz, .dismiss

; Dismiss this move if the player has only one Pokemon [remaining].
	call AICheckLastPlayerMon
	jr z, .dismiss

; Else 50% chance to dismiss this move.
	call AI_50_50
	ret c
.dismiss
	jp AIDismissMove

AI_Smart_AccuracyDown_Dismiss:
; Called by AI_Smart_AccuracyDown, hence the name deviation.
; No move exists with EFFECT_ACCURACY_DOWN_2, only EFFECT_ACCURACY_DOWN.
	ld a, [wPlayerAccLevel]
	jr AI_Smart_StatDown

AI_Smart_Spikes:
	call AICheckLastPlayerMon
	jr z, .only_one

; If the player has more than one Pokemon, greatly encourage this move on the first turn of battle.
; We can assume Spikes are not already set up on the first turn, so we don't need to check for them.
	ld a, [wTotalBattleTurns]
	and a
	jr nz, .not_first_turn
	dec [hl]
	dec [hl]
	ret

.not_first_turn
; If the player has more than one Pokemon, do nothing if Spikes aren't already set up.
; If Spikes are set up, dismiss this move if the player's Evasion is already minimized.
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	ret z
	jr AI_Smart_EvasionDown

.only_one
; If the player has only one Pokemon [remaining], dismiss this move if Spikes aren't already set up.
; If Spikes are set up, dismiss this move if the player's Evasion is already minimized.
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	jp z, AIDismissMove
	; fallthrough

AI_Smart_EvasionDown:
; No move exists with EFFECT_EVASION_DOWN_2, only EFFECT_EVASION_DOWN.
	ld a, [wPlayerEvaLevel]
	jr AI_Smart_StatDown


AIDamageCalc:
	ld a, 1
	ldh [hBattleTurn], a
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, ConstantDamageEffects
	call IsInByteArray
	jr nc, .notconstant
	callfar BattleCommand_ConstantDamage
	ret

.notconstant
	callfar EnemyAttackDamage_DamageCalc_Stab
	ret

INCLUDE "data/battle/ai/constant_damage_effects.asm"

AICompareSpeed:
; Return carry if enemy is faster than player.
	push bc
	ld a, [wEnemyMonSpeed + 1]
	ld b, a
	ld a, [wBattleMonSpeed + 1]
	cp b
	ld a, [wEnemyMonSpeed]
	ld b, a
	ld a, [wBattleMonSpeed]
	sbc b
	pop bc
	ret

AICheckLastPlayerMon:
; Return z if this is the player's last/only mon.
	push hl
	ld a, [wPartyCount]
	ld b, a
	ld c, 0
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH

.loop
	ld a, [wCurBattleMon]
	cp c
	jr z, .skip

	ld a, [hli]
	or [hl]
	jr nz, .done
	dec hl

.skip
	add hl, de
	inc c
	dec b
	jr nz, .loop

.done
	pop hl
	ret

AICheckLastEnemyMon:
; Return carry if this is the enemy's last/only mon.
	push hl
	farcall FindAliveEnemyMons
	pop hl
	ret

AICheckPlayerMaxHP:
	push hl
	push de
	push bc
	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	jr AICheckMaxHP

AICheckEnemyMaxHP:
	push hl
	push de
	push bc
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
	; fallthrough

AICheckMaxHP:
; Return carry if hp at de matches max hp at hl.

	ld a, [de]
	inc de
	cp [hl]
	jr nz, .not_max

	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .not_max

	pop bc
	pop de
	pop hl
	scf
	ret

.not_max
	pop bc
	pop de
	pop hl
	and a
	ret

AICheckPlayerHalfHP:
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	; fallthrough

AICheckPlayerHPMerge:
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret

AICheckPlayerQuarterHP:
	push hl
	ld hl, wBattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	jr AICheckPlayerHPMerge

AICheckEnemyHalfHP:
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	; fallthrough

AICheckEnemyHPMerge:
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret

AICheckEnemyQuarterHP:
	push hl
	push de
	push bc
	ld hl, wEnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	jr AICheckEnemyHPMerge

AIHasMoveEffect:
; Return carry if the enemy has move effect b.

	push hl
	ld hl, wEnemyMonMoves
	ld c, NUM_MOVES

.checkmove
	ld a, [hli]
	and a
	jr z, .no

	call AIGetMoveAttributes

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp b
	jr z, .yes

	dec c
	jr nz, .checkmove

.no
	pop hl
	and a
	ret

.yes
	pop hl
	scf
	ret

AIHasMoveInArray:
; Return carry if the enemy has a move in array hl.

	push hl
	push de
	push bc

.next
	ld a, [hli]
	cp -1
	jr z, .done

	ld b, a
	ld c, NUM_MOVES + 1
	ld de, wEnemyMonMoves

.check
	dec c
	jr z, .next

	ld a, [de]
	inc de
	cp b
	jr nz, .check

	scf

.done
	pop bc
	pop de
	pop hl
	ret

AIGetMoveAttributes:
; Load attributes of move a into enemy move struct.

	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes

	ld de, wEnemyMoveStruct
	ld a, BANK(Moves)
	call FarCopyBytes

	pop bc
	pop de
	pop hl
	ret

AI_EncourageIfInArray:
; input: address of array in hl
	ld a, l
	ld [wMoveCheckArrayAddr], a
	ld a, h
	ld [wMoveCheckArrayAddr + 1], a

	ld hl, wEnemyAIMoveScores - 1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES + 1
.loop
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push hl
	push de
	push bc
	ld de, wMoveCheckArrayAddr
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	call IsInByteArray

	pop bc
	pop de
	pop hl
	jr nc, .loop

	dec [hl]
	jr .loop

AI_50_50:
	call Random
	cp 50 percent + 1
	ret

AI_60_40:
	call Random
	cp 39 percent + 1
	ret

AI_70_30:
	call Random
	cp 30 percent + 1
	ret

AI_80_20:
	call Random
	cp 20 percent - 1
	ret

AI_85_15:
	call Random
	cp 16 percent
	ret

AI_90_10:
	call Random
	cp 10 percent
	ret
