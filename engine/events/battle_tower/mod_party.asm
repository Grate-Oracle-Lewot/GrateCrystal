ModifyBattleTowerParty:
	ld a, BANK(sBTMonOfTrainers)
	call OpenSRAM

	ld a, [sBTMonPrevTrainer1]
	cp DITTO
	jr z, .end
	ld a, [sBTMonPrevPrevTrainer1]
	cp DITTO
	jr z, .end

	call Random
	cp 10
	jr nc, .end

	ld a, [wBTChoiceOfLvlGroup]
	dec a
	ld hl, BattleTowerDittos
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	; overwrite the first mon in the current team
	ld de, wBT_OTMon1
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call CopyBytes

	ld a, [wNamedObjectIndex]
	push af
	push de
	ld hl, -NICKNAMED_MON_STRUCT_LENGTH
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	call GetPokemonName
	ld h, d
	ld l, e
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop de
	pop af

	ld [wNamedObjectIndex], a
	ld a, [sBTMonPrevTrainer1]
	ld [sBTMonPrevPrevTrainer1], a
	ld a, [wBT_OTMon1]
	ld [sBTMonPrevTrainer1], a

.end
	jp CloseSRAM

INCLUDE "data/battle_tower/dittos.asm"
