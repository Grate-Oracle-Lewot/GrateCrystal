PrintMoveDescriptionScrunched:
	push hl
	ld hl, MoveDescriptionsScrunched
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "data/moves/descriptions_scrunched.asm"
