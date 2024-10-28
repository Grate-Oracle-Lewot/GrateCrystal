BattleCommand_Spikes:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

	bit SCREENS_SPIKES, [hl]
	jr nz, .failed

	set SCREENS_SPIKES, [hl]

	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	call AnimateCurrentMove
	push bc
	ld a, EVASION
	call BattleCommand_StatDown
	call BattleCommand_StatDownMessage
	pop bc
	ld a, [wAttackMissed]
	and a
	ret z
	jp PrintNothingHappened
