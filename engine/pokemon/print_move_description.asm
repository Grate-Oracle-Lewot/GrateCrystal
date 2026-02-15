PrintMoveDescription:
	push hl
	ld hl, MoveDescriptions
	call PrintMoveDescriptionOptimization
	pop hl
	jp PlaceString

PrintMoveDescriptionScrunched:
	push hl
	ld hl, MoveDescriptionsScrunched
	call PrintMoveDescriptionOptimization
	pop hl
	jp PlaceString

PrintMoveDescriptionOptimization:
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ret

INCLUDE "data/moves/descriptions.asm"

INCLUDE "data/moves/descriptions_scrunched.asm"
