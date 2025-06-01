BattleCommand_Avalanche:
	call CheckOpponentWentFirst
	ret z

	ld hl, wPlayerDamageTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyDamageTaken
.ok
	ld a, [hli]
	or [hl]
	ret z

	jp DoubleDamage
