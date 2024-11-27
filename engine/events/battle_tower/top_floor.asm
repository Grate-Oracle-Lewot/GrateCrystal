BattleTowerTopFloorLoadSixSpecialAndOneBossTrainer:
	ld a, BANK(sBTTrainers)
	call OpenSRAM

; Load six random unique special trainers
	ldh a, [hRandomAdd]
	ld b, a
.resample ; loop to find a random trainer
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a ; b contains the nr of the trainer
	maskbits BATTLETOWER_NUM_SPECIAL_TRAINERS
	cp BATTLETOWER_NUM_SPECIAL_TRAINERS
	jr nc, .resample
	ld b, a

	ld c, BATTLETOWER_STREAK_LENGTH - 1
	ld hl, sBTTrainers
.next_trainer
	ld a, [hli]
	cp b
	jr z, .resample
	dec c
	jr nz, .next_trainer

; Load one random boss trainer in the 7th trainer slot (via prior hli)
	ldh a, [hRandomAdd]
	ld b, a
.resample2
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a ; b contains the nr of the trainer
	maskbits BATTLETOWER_NUM_BOSS_TRAINERS
	cp BATTLETOWER_NUM_BOSS_TRAINERS
	jr nc, .resample2
	ld b, a
	ld a, [hl]
	jp CloseSRAM

BattleTowerTopFloorLoadCurrentOpponent:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainer)
	ldh [rSVBK], a

	; Fill wBT_OTTrainer with zeros
	xor a
	ld hl, wBT_OTTrainer
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call ByteFill

	; Write $ff into the Item-Slots
	ld a, $ff
	ld [wBT_OTMon1Item], a
	ld [wBT_OTMon2Item], a
	ld [wBT_OTMon3Item], a

	; Set wBT_OTTrainer as start address to write the following data to
	ld de, wBT_OTTrainer

	ld a, BANK(sBTTrainers)
	call OpenSRAM

	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld a, b
	ld b, 0
	add hl, bc
	ld [hl], a

	ld a, [sNrOfBeatenBattleTowerTrainers]
	cp 6
	jr nc, .boss
	ld hl, BattleTowerSpecialTrainers
	jr .merge
.boss
	ld hl, BattleTowerBossTrainers

; Copy name (10 bytes) and class (1 byte) of trainer
.merge
	call CloseSRAM
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

; Load party based on trainer class
	ld a, [wBT_OTTrainerClass]
	cp BROCK
	jr z, BattleTowerLoadBrock
	cp MISTY
	jr z, BattleTowerLoadMisty
	cp LT_SURGE
	jr z, BattleTowerLoadSurge
	cp ERIKA
	jr z, BattleTowerLoadErika
	cp JANINE
	jr z, BattleTowerLoadJanine
	cp SABRINA
	jr z, BattleTowerLoadSabrina
	cp BLAINE
	jr z, BattleTowerLoadBlaine
	cp BLUE
	jr z, BattleTowerLoadBlue
	cp FALKNER
	jr z, BattleTowerLoadFalkner
	cp BUGSY
	jr z, BattleTowerLoadBugsy
	cp WHITNEY
	jr z, BattleTowerLoadWhitney
	cp MORTY
	jr z, BattleTowerLoadMorty
	cp CHUCK
	jr z, BattleTowerLoadChuck
	cp JASMINE
	jr z, BattleTowerLoadJasmine
	cp PRYCE
	jr z, BattleTowerLoadPryce
	cp CLAIR
	jr z, BattleTowerLoadClair
	cp REAL_KOGA
	jr z, BattleTowerLoadKoga
	cp REAL_KAREN
	jr z, BattleTowerLoadKaren
	cp WILL
	jr z, BattleTowerLoadAD
	cp KOGA
	jr z, BattleTowerLoadLucas
	cp BRUNO
	jr z, BattleTowerLoadPercy
	cp KAREN
	jr z, BattleTowerLoadLewot
	cp CHAMPION
	jr z, BattleTowerLoadLance
	cp RED
	jr z, BattleTowerLoadRed
	; fallthrough

BattleTowerLoadDefaultParty:
	ld hl, BattleTowerDefaultParty
	jr BattleTowerLoadSpecialParty

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
	pop af
	ldh [rSVBK], a
	ret

INCLUDE "data/battle_tower/special_classes.asm"

INCLUDE "data/battle_tower/special_parties.asm"
