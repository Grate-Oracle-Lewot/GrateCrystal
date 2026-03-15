BattleCommand_Metronome:
	call ClearLastMove
	call CheckUserIsCharging
	jr nz, .charging

	ld a, [wBattleAnimParam]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wBattleAnimParam], a

.charging
	call LoadMoveAnim

.GetMove:
; Get a random move ID.
	call BattleRandom

; Reroll if Struggle. Can't check for this in MetronomeExcepts because its ID = -1.
	cp STRUGGLE
	jr z, .GetMove

; Reroll if the move is in the MetronomeExcepts list. The list includes NO_MOVE.
	ld b, a ; back up 'a' to check wInBattleTowerBattle, otherwise we infinite loop
	push af ; back up 'a' in a whole second way
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .normal
	ld hl, MetronomeExcepts_BattleTower ; allow Thief
	jr .array
.normal
	ld hl, MetronomeExcepts ; disallow Thief
.array
	ld a, b ; restore 'a' for IsInByteArray
	call IsInByteArray
	pop bc ; b now contains the move ID
	jr c, .GetMove

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], b
	call UpdateMoveData
	jp ResetTurn

INCLUDE "data/moves/metronome_exception_moves.asm"
