BattleCommand_Avalanche:
	xor a
	ld [wBattleAnimParam], a
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

	ld a, $1
	ld [wBattleAnimParam], a
	jp DoubleDamage
