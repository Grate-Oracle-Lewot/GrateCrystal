BattleCommand_FocusEnergy:
; focusenergy

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jr nz, .already_pumped
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	call AnimateCurrentMove
	ld hl, GettingPumpedText
	jp StdBattleTextbox

.already_pumped
	call AnimateCurrentMove
	push bc
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage
	pop bc
	ld a, [wAttackMissed]
	and a
	ret z
	jp PrintNothingHappened
