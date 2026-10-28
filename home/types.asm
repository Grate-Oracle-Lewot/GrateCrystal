GetHiddenPowerType::
; input: DVs in hl
; output: type in a

	; Def & 3
	ld a, [hl]
	and %0011
	ld b, a

	; + (Atk & 3) << 2
	ld a, [hli]
	and %0011 << 4
	swap a
	add a
	add a
	or b

	; add the least significant bit of the Speed DV to increment 50% of the time (to reach Fairy type)
	ld b, a
	ld a, [hl]
	swap a
	and %0001
	add b

; Skip Normal
	inc a

; Skip unused types
	cp UNUSED_TYPES
	ret c
	add UNUSED_TYPES_END - UNUSED_TYPES
	ret

GetMonTypeIndex::
	; type in a
	and TYPE_MASK
	cp CURSE_TYPE
	jr z, .handle_curse
	cp UNUSED_TYPES
	jr c, .done
	sub UNUSED_TYPES_END - UNUSED_TYPES
	jr .done

.handle_curse:
	ld a, CURSE_TYPE_PALETTE
.done:
	ld c, a
	ret
