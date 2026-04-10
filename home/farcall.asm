FarCall_de::
; Call a:de.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _de_
	jr ReturnFarCall

FarCall_hl::
; Call a:hl.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _hl_
	; fallthrough

ReturnFarCall::
	push af
	push hl
	ld hl, sp + 5
	ld a, [hl]
	pop hl
	rst Bankswitch
	pop af
	inc sp
	inc sp
	ret
