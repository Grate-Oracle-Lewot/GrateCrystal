GetTypeName:
; Copy the name of type [wNamedObjectIndex] to wStringBuffer1.

	ld a, [wNamedObjectIndex]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld bc, MOVE_NAME_LENGTH
	jp CopyBytes

INCLUDE "data/types/names.asm"

GetHiddenPowerBattleType::
; Return player's move type in a, adjusting for Hidden Power's type

	ld a, [wPlayerMoveStruct + MOVE_EFFECT]
	cp EFFECT_HIDDEN_POWER
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
	ret nz
	ld hl, wBattleMonDVs
	; fallthrough

HiddenPowerType:
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
