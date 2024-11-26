TestLoadBrock:
	ld hl, BattleTowerBrock
	ld bc, NICKNAMED_MON_STRUCT_LENGTH * 3
	call CopyBytes

	ld a, [sBTMonPrevTrainer1]
	ld [sBTMonPrevPrevTrainer1], a
	ld a, [sBTMonPrevTrainer2]
	ld [sBTMonPrevPrevTrainer2], a
	ld a, [sBTMonPrevTrainer3]
	ld [sBTMonPrevPrevTrainer3], a
	ld a, [wBT_OTMon1]
	ld [sBTMonPrevTrainer1], a
	ld a, [wBT_OTMon2]
	ld [sBTMonPrevTrainer2], a
	ld a, [wBT_OTMon3]
	ld [sBTMonPrevTrainer3], a
	jp CloseSRAM

INCLUDE "data/battle_tower/special_parties.asm"
