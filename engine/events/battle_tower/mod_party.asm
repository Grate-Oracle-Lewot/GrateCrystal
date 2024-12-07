ModifyBattleTowerParty::
	ld a, BANK(sBTMonOfTrainers)
	call OpenSRAM

	ld a, [sBTMonPrevTrainer1]
	cp DITTO
	jr z, .jirk
	ld a, [sBTMonPrevPrevTrainer1]
	cp DITTO
	jr z, .jirk

	call Random
	cp 10
;	jr nc, .jirk

	ld a, [wBTChoiceOfLvlGroup]
	dec a
	ld hl, BattleTowerDittos
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	; overwrite the first mon in the current team
	ld de, wBT_OTMon1
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call CopyBytes

	ld a, [sBTMonPrevTrainer1]
	ld [sBTMonPrevPrevTrainer1], a
	ld a, [wBT_OTMon1]
	ld [sBTMonPrevTrainer1], a

.jirk
	ld a, [sBTMonPrevTrainer3]
	cp JIRK
	jr z, .end
	ld a, [sBTMonPrevPrevTrainer3]
	cp JIRK
	jr z, .end

	call Random
	cp 10
	jr nc, .end

	ld a, [wBTChoiceOfLvlGroup]
	dec a
	ld hl, BattleTowerJirks
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call AddNTimes

	; overwrite the third mon in the current team
	ld de, wBT_OTMon3
	ld bc, NICKNAMED_MON_STRUCT_LENGTH
	call CopyBytes

	ld a, [sBTMonPrevTrainer3]
	ld [sBTMonPrevPrevTrainer3], a
	ld a, [wBT_OTMon3]
	ld [sBTMonPrevTrainer3], a

.end
	jp CloseSRAM

INCLUDE "data/battle_tower/dittos.asm"

INCLUDE "data/battle_tower/jirks.asm"
