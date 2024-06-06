BattleCommand_Spite:
; spite

	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wBattleMonMoves
.got_moves
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jp z, PrintDidntAffect2
	cp STRUGGLE
	jp z, PrintDidntAffect2
	ld b, a
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld [wNamedObjectIndex], a
	dec hl
	ld b, 0
	push bc
	ld c, wBattleMonPP - wBattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and PP_MASK
	jp z, PrintDidntAffect2
	push bc
	call GetMoveName
	; lose 5 PP
	ld a, 5
	ld b, a
	ld a, [hl]
	and PP_MASK
	cp b
	jr nc, .deplete_pp
	ld b, a
.deplete_pp
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ldh a, [hBattleTurn]
	and a
	jr nz, .not_wildmon
	ld a, [wBattleMode]
	dec a
	jr nz, .not_wildmon
	ld hl, wWildMonPP
	add hl, bc
.not_wildmon
	ld [hl], e
.transformed
	push de
	call AnimateCurrentMove
	pop de
	ld a, d
	ld [wTextDecimalByte], a
	ld hl, SpiteEffectText
	jp StdBattleTextbox
