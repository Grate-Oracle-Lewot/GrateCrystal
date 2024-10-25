BattleCommand_PsychUp:
	ld hl, wEnemyStatLevels
	ld de, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .pointers_correct
; It's the enemy's turn, so swap the pointers.
	push hl
	ld h, d
	ld l, e
	pop de
.pointers_correct
	ld b, NUM_LEVEL_STATS
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ldh a, [hBattleTurn]
	and a
	jr nz, .calc_enemy_stats
	call CalcPlayerStats
	jr .merge

.calc_enemy_stats
	call CalcEnemyStats
.merge
; Copy Focus Energy's crit rate boost
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jr z, .res
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	jr .x_accuracy

.res
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_FOCUS_ENERGY, [hl]

.x_accuracy
; Copy the special X Accuracy status
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_X_ACCURACY, [hl]
	jr z, .res_x
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_X_ACCURACY, [hl]
	jr .done

.res_x
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_X_ACCURACY, [hl]

.done
	call AnimateCurrentMove
	ld hl, CopiedStatsText
	jp StdBattleTextbox
