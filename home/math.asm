SimpleMultiply::
; Return a * c.
	and a
	ret z

	push bc
	ld b, a
	xor a
.loop
	add c
	dec b
	jr nz, .loop
	pop bc
	ret

SimpleDivide::
; Divide a by c. Return quotient b and remainder a.
	ld b, 0
.loop
	inc b
	sub c
	jr nc, .loop
	dec b
	add c
	ret

Multiply::
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
; All values are big endian.
	push hl
	push bc

	farcall _Multiply

	pop bc
	pop hl
	ret

Divide::
; Divide hDividend length b (max 4 bytes) by hDivisor. Result in hQuotient.
; All values are big endian.
	push hl
	push de
	push bc
	homecall _Divide
	pop bc
	pop de
	pop hl
	ret

MultiplyAndDivide::
; a = $xy: multiply multiplicands by x, then divide by y
; Used for damage modifiers, catch rate modifiers, etc.
	push bc
	ld b, a
	swap a
	and $f
	ld c, LOW(hMultiplier)
	ldh [c], a
	call Multiply
	ld a, b
	and $f
	ldh [c], a
	ld b, 4
	call Divide
	pop bc
	ret

ConvertPercentages::
; in: a: value (x/256)
; out: a: value (x/100)
	; Multiply hMultiplicand (3 bytes) by hMultiplier (1 byte) Result in hProduct (4 bytes).
	; All values are big endian.
	; cross multiply by 100, then divide by 256    

	; hMultiplicand (3 bytes) is big endian, so least significant goes to the right    
	ldh [hMultiplicand + 2], a ; 3rd byte of hMultiplicand
	; our value is out of 256 (but still only a max of 255 so 1 byte)
	; so we are always only going to need the 3rd byte of hMultiplicand 

	; zero out the other two bytes
	xor a
	ldh [hMultiplicand + 1], a
	ldh [hMultiplicand], a

	ld a, 100
	ldh [hMultiplier], a ; 1 byte only
	call Multiply

	; since we know 255 is the max possible value, that means our Product will NEVER exceed 2-bytes
	; because we are cross multiplying and now need to divide by 256
	ldh a, [hProduct + 2] ; high byte of the 2-byte Product of the cross multiplication, low byte is hProduct + 3
	; hProduct + 0 and hProduct + 1 will never have anything but zero since we'll never exceed a 2-byte Product
	ret
