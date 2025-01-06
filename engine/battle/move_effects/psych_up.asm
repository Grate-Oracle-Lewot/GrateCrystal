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
; Copy Defense Curl's boost to rolling moves
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	bit SUBSTATUS_CURLED, [hl]
	jr z, .res_curl
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	jr .focus_energy

.res_curl
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	res SUBSTATUS_CURLED, [hl]

.focus_energy
; Copy Focus Energy's crit rate boost
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jr z, .res_focus
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	jr .dire_hit

.res_focus
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_FOCUS_ENERGY, [hl]

.dire_hit
; Copy Dire Hit's crit rate boost
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_DIRE_HIT, [hl]
	jr z, .res_dire
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_DIRE_HIT, [hl]
	jr .x_accuracy

.res_dire
	call BattleCommand_SwitchTurn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_DIRE_HIT, [hl]

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
