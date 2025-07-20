PrintMonTypes:
; Print one or both types of [wCurSpecies] on the stats screen at hl.

	push hl
	call GetBaseData
	ld a, [wCurSpecies]
	cp PIKACHU
	jr nz, .skip_pikachu
	ld hl, wTempMonDVs
	predef GetPikachuForm
	ld a, [wPikachuForm]
	dec a
	ld hl, SecondPikachuTypes

	add l
	ld l, a
	adc h
	sub l
	ld h, a

	ld a, [hl]
	ld [wBaseType2], a
.skip_pikachu
	pop hl

	push hl
	ld a, [wBaseType1]
	call .Print

	; Single-typed monsters really have two of the same type.
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	pop hl
	jr z, .hide_type_2

	ld bc, SCREEN_WIDTH
	add hl, bc

.Print:
	ld b, a
	jr PrintType

.hide_type_2
	; Erase any type name that was here before.
	; Seems to be pointless in localized versions.
	ld a, " "
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	ld [hl], a
	inc bc
	add hl, bc
	ld bc, NAME_LENGTH_JAPANESE - 1
	jp ByteFill

PrintMoveType:
; Print the type of move b at hl.

	push hl
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves
	call AddNTimes
	ld de, wStringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [wStringBuffer1 + MOVE_TYPE]
	and TYPE_MASK
	pop hl
	ld b, a
	; fallthrough

PrintType:
; Print type b at hl.

	ld a, b
	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

PrintBattleMoveType:
; Print the type of move b at hl.
	push hl
	ld a, b
	cp HIDDEN_POWER
	jr z, .print_hidden_power
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves
	call AddNTimes
	ld de, wStringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [wStringBuffer1 + MOVE_TYPE]
	pop hl

	ld b, a
	jr PrintType

.print_hidden_power
	call GetHiddenPowerBattleType
	pop hl
	ld b, a
	jr PrintType

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

GetHiddenPowerType:
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	jr HiddenPowerType

GetHiddenPowerBattleType:
	ld hl, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, HiddenPowerType
	ld hl, wEnemyMonDVs
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
