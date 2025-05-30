BattleCommand_Pursuit:
; Double damage if the opponent is switching.
	ld hl, wEnemyIsSwitching
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerIsSwitching
.ok
	ld a, [hl]
	and a
	ret z

	jp DoubleDamage
