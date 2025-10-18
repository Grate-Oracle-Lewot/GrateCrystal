BattleCommand_Conversion:
; Combines Conversion and Conversion2. The idea is to result in type 1 STAB and type 2 resistance. How they combine is not really considered.
; CURSE_TYPE is excluded from Conversion1. CURSE_TYPE and BIRD are searched by Conversion2 but have no resistances, so should never be selected.
; Should work fine for inverse battles. Conversion2 specifically fails in typeless battles, but 1 can still work, as STAB still exists.

; Conversion1, changes both types. Second type may then be changed again by Conversion2.
; Only plays move animation if conversion is successeful.
	ld hl, wBattleMonMoves
	ld de, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonType1
.got_moves
	push de
	ld c, 0
	ld de, wStringBuffer1
.loop
	push hl
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .okay
	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	and TYPE_MASK
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .loop
.okay
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	pop de
	ld hl, wStringBuffer1
.loop2
	ld a, [hl]
	cp -1
	jp z, .Fail1
	cp CURSE_TYPE
	jr z, .next
	ld a, [de]
	cp [hl]
	jr z, .next
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .loop3
.next
	inc hl
	jr .loop2

.loop3
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	ld hl, wStringBuffer1
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .loop3
	cp CURSE_TYPE
	jr z, .loop3
	ld a, [de]
	cp [hl]
	jr z, .loop3
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .loop3
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	call AnimateCurrentMove
	call .Done

; Conversion2 after a successful Conversion1. Only changes second type.
; No animation since Conversion1 already played it.
	ld a, [wBattleType]
	cp BATTLETYPE_TYPELESS
	ret z

	ld hl, wBattleMonType2
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type_2
	ld hl, wEnemyMonType2
.got_type_2
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret z
	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	and TYPE_MASK
	ld d, a
	pop hl
	call BattleCommand_SwitchTurn

.loop4
	call BattleRandom
	maskbits TYPES_END
	cp UNUSED_TYPES
	jr c, .okay2
	cp UNUSED_TYPES_END
	jr c, .loop4
	cp TYPES_END
	jr nc, .loop4
.okay2
	ld [hl], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	push af
	push hl
	ld a, d
	ld [hl], a
	call ConversionCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop4

	call BattleCommand_SwitchTurn
	ld a, [hld]
	ld [wNamedObjectIndex], a
	predef GetTypeName

; Don't print text if we are currently a monotype. Prevents redundant messages if Conversion 1 and 2 both picked the same type.
	ld a, [hli]
	ld b, [hl]
	cp b
	ret z
	jr .Done

.Fail1:
; Conversion2 after a failed Conversion1. Only changes second type to retain potential preexisting Conversion1 (or natural STAB).
; Plays move animation since Conversion1 didn't, but doesn't play if Conversion2 also fails.
	ld a, [wBattleType]
	cp BATTLETYPE_TYPELESS
	jp z, FailMove

	ld hl, wBattleMonType2
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType2
.got_type
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jp z, FailMove
	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	call GetMoveAttr
	and TYPE_MASK
	ld d, a
	pop hl
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

.loop5
	call BattleRandom
	maskbits TYPES_END
	cp UNUSED_TYPES
	jr c, .okay3
	cp UNUSED_TYPES_END
	jr c, .loop5
	cp TYPES_END
	jr nc, .loop5
.okay3
	ld [hl], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	push af
	push hl
	ld a, d
	ld [hl], a
	call ConversionCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop5

	call BattleCommand_SwitchTurn
	ld a, [hl]
	ld [wNamedObjectIndex], a
	predef GetTypeName

.Done:
	ld hl, TookOnTypeText
	jp StdBattleTextbox

ConversionCheckTypeMatchup:
; Like BattleCheckTypeMatchup, but only checks matchups for the second type slot.

	ld hl, wEnemyMonType2
	ldh a, [hBattleTurn]
	and a
	jr z, .get_type
	ld hl, wBattleMonType2
.get_type
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar ; preserves hl, de, and bc
	and TYPE_MASK
	push hl
	push de
	push bc
	ld d, a
	ld b, [hl]
	jp CheckType2Matchup
