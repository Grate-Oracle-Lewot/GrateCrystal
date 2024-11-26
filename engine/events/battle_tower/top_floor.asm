BattleTowerLoadBrock:
	ld hl, BattleTowerBrock
	jr BattleTowerLoadSpecialParty

BattleTowerLoadMisty:
	ld hl, BattleTowerMisty
	jr BattleTowerLoadSpecialParty

BattleTowerLoadSurge:
	ld hl, BattleTowerSurge
	jr BattleTowerLoadSpecialParty

BattleTowerLoadErika:
	ld hl, BattleTowerErika
	jr BattleTowerLoadSpecialParty

BattleTowerLoadJanine:
	ld hl, BattleTowerJanine
	jr BattleTowerLoadSpecialParty

BattleTowerLoadSabrina:
	ld hl, BattleTowerSabrina
	jr BattleTowerLoadSpecialParty

BattleTowerLoadBlaine:
	ld hl, BattleTowerBlaine
	jr BattleTowerLoadSpecialParty

BattleTowerLoadBlue:
	ld hl, BattleTowerBlue
	jr BattleTowerLoadSpecialParty

BattleTowerLoadFalkner:
	ld hl, BattleTowerFalkner
	jr BattleTowerLoadSpecialParty

BattleTowerLoadBugsy:
	ld hl, BattleTowerBugsy
	jr BattleTowerLoadSpecialParty

BattleTowerLoadWhitney:
	ld hl, BattleTowerWhitney
	jr BattleTowerLoadSpecialParty

BattleTowerLoadMorty:
	ld hl, BattleTowerMorty
	jr BattleTowerLoadSpecialParty

BattleTowerLoadChuck:
	ld hl, BattleTowerChuck
	jr BattleTowerLoadSpecialParty

BattleTowerJasmine:
	ld hl, BattleTowerJasmine
	jr BattleTowerLoadSpecialParty

BattleTowerLoadPryce:
	ld hl, BattleTowerPryce
	jr BattleTowerLoadSpecialParty

BattleTowerLoadClair:
	ld hl, BattleTowerClair
	jr BattleTowerLoadSpecialParty

BattleTowerLoadKoga:
	ld hl, BattleTowerKoga
	jr BattleTowerLoadSpecialParty

BattleTowerLoadKaren:
	ld hl, BattleTowerKaren
	jr BattleTowerLoadSpecialParty

BattleTowerLoadAD:
	ld hl, BattleTowerAD
	jr BattleTowerLoadSpecialParty

BattleTowerLoadLucas:
	ld hl, BattleTowerLucas
	jr BattleTowerLoadSpecialParty

BattleTowerLoadPercy:
	ld hl, BattleTowerPercy
	jr BattleTowerLoadSpecialParty

BattleTowerLoadLewot:
	ld hl, BattleTowerLewot
	jr BattleTowerLoadSpecialParty

BattleTowerLoadLance:
	ld hl, BattleTowerLance
	jr BattleTowerLoadSpecialParty

BattleTowerLoadRed:
	ld hl, BattleTowerRed
	; fallthrough

BattleTowerLoadSpecialParty:
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

INCLUDE "data/battle_tower/special_classes.asm"

INCLUDE "data/battle_tower/special_parties.asm"
