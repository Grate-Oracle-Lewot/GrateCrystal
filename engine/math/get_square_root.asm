; optimized by DamienDoury

GetSquareRoot:
; Return the square root of de in b.
; Special case: we return ceil(sqrt(0)) = 1, which is wrong but matches the vanilla function.

	ld a, d
	or e
	ld b, 1
	ret z

	push bc
	ld h, d
	ld l, e
	ld de, 0
	ld bc, $4000

.loop:
	push hl

	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc a, b
	ld h, a
	jr c, .no_bit

	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc a, d
	ld h, a
	jr c, .no_bit

.take_bit:
	pop af
	srl d
	rr e
	ld a, e
	add a, c
	ld e, a
	ld a, d
	adc a, b
	ld d, a
	jr .next

.no_bit:
	pop hl
	srl d
	rr e

.next:
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .loop

	pop bc
	ld b, e
	ld a, h
	or l
	ret z

; ceiling
	inc b
	ret nz

; capped at 255
	dec b
	ret
