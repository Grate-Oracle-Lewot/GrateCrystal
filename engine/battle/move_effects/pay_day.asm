BattleCommand_PayDay:
	xor a
	ld hl, wStringBuffer1
	ld [hli], a

	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonLevel]
	jr z, .ok
	ld a, [wEnemyMonLevel]
.ok

	ld b, a
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	add a ; twice move power
	jr c, .max
	add b ; plus level
	jr c, .max
.no_overflow
	ld hl, wPayDayMoney + 2
	add [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	dec hl
	jr nz, .done
	inc [hl]
.done
	ld hl, CoinsScatteredText
	jp StdBattleTextbox

.max
	ld a, $ff
	jr .no_overflow
