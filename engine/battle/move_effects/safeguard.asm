BattleCommand_Safeguard:
	ld hl, wPlayerScreens
	ld de, wPlayerSafeguardCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld de, wEnemySafeguardCount
.ok
	set SCREENS_SAFEGUARD, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, CoveredByVeilText
	jp StdBattleTextbox
