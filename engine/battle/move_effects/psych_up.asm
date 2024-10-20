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
	call AnimateCurrentMove
	ld hl, CopiedStatsText
	jp StdBattleTextbox
