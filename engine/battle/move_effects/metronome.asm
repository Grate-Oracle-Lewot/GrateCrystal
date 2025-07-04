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
	call BattleRandom

; No Struggle.
	cp STRUGGLE
	jr z, .GetMove

; None of the moves in MetronomeExcepts.
	push af
	ld hl, MetronomeExcepts
	call IsInByteArray
	pop bc
	jr c, .GetMove

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], b
	call UpdateMoveData
	jp ResetTurn

INCLUDE "data/moves/metronome_exception_moves.asm"
