BattleTowerTopFloorLoadSixSpecialAndOneBossTrainer::
	ld a, BANK(sBTTrainers)
	call OpenSRAM

; Fill sNrOfBeatenBattleTowerTrainers and sBTTrainers with zeros
	xor a
	ld [sNrOfBeatenBattleTowerTrainers], a
	ld hl, sBTTrainers
	ld bc, BATTLETOWER_STREAK_LENGTH
	call ByteFill

; Load six random special trainers
	ld c, BATTLETOWER_STREAK_LENGTH - 1
	ld hl, sBTTrainers
.loop
	call Random
	ld b, a ; b contains the nr of the trainer
	maskbits BATTLETOWER_NUM_SPECIAL_TRAINERS
	cp BATTLETOWER_NUM_SPECIAL_TRAINERS
	jr nc, .loop
	ld b, a
	ld [hli], a
	dec c
	jr nz, .loop

; Load one random boss trainer into 7th slot
.resample
	call Random
	maskbits BATTLETOWER_NUM_BOSS_TRAINERS
	cp BATTLETOWER_NUM_BOSS_TRAINERS
	jr nc, .resample
	ld [hl], a
	jp CloseSRAM

BattleTowerTopFloorLoadCurrentOpponent::
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

; Find stored nr of current trainer based on win streak, put in c
	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld b, 0
	add hl, bc
	ld c, [hl]

	ld a, [sNrOfBeatenBattleTowerTrainers]
	cp 6
	jr nc, .boss
	ld hl, BattleTowerSpecialTrainers
	jr .merge
.boss
	ld hl, BattleTowerBossTrainers
.merge
	call CloseSRAM
; Add c to table at hl to find trainer name and class
	add hl, bc
; Copy name (10 bytes) and class (1 byte) of trainer into de
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

; Load party into de+11 based on trainer class
	ld a, [wBT_OTTrainerClass]
	cp BROCK
	jr z, BattleTowerLoadBrock
	cp MISTY
	jr z, BattleTowerLoadMisty
	cp LT_SURGE
	jr z, BattleTowerLoadLtSurge
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

BattleTowerLoadLtSurge:
	ld hl, BattleTowerLtSurge
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

BattleTowerLoadJasmine:
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

BattleTowerTopFloorText::
; Print text c for trainer [wBT_OTTrainerClass]
; 1: Intro text
; 2: Player lost
; 3: Player won
	ldh a, [rSVBK]
	push af

	ld a, BANK(sBTTrainers)
	call OpenSRAM

; Find stored nr of current trainer based on win streak, put in c
	ld hl, sBTTrainers
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld c, a
	ld b, 0
	add hl, bc
	ld c, [hl]

	ld a, [sNrOfBeatenBattleTowerTrainers]
	cp 6
	jr nc, .boss
	ld hl, BTSpecialTrainerTexts
	jr .merge
.boss
	ld hl, BTBossTrainerTexts
.merge
	call CloseSRAM
; Add c to table at hl to find trainer text
	add hl, bc
	ld [wBT_TrainerTextIndex], a
	push af
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld l, c
	ld h, a
	bccoord 1, 14
	pop af
	ldh [rSVBK], a
	call CloseSRAM
	jp PlaceHLTextAtBC

BTSpecialTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTBrockGreetingText
	dw BTMistyGreetingText
	dw BTLtSurgeGreetingText
	dw BTErikaGreetingText
	dw BTJanineGreetingText
	dw BTSabrinaGreetingText
	dw BTBlaineGreetingText
	dw BTBlueGreetingText
	dw BTFalknerGreetingText
	dw BTBugsyGreetingText
	dw BTWhitneyGreetingText
	dw BTMortyGreetingText
	dw BTChuckGreetingText
	dw BTJasmineGreetingText
	dw BTPryceGreetingText
	dw BTClairGreetingText
	dw BTKogaGreetingText
	dw BTKarenGreetingText

.PlayerLost:
	dw BTBrockLossText
	dw BTMistyLossText
	dw BTLtSurgeLossText
	dw BTErikaLossText
	dw BTJanineLossText
	dw BTSabrinaLossText
	dw BTBlaineLossText
	dw BTBlueLossText
	dw BTFalknerLossText
	dw BTBugsyLossText
	dw BTWhitneyLossText
	dw BTMortyLossText
	dw BTChuckLossText
	dw BTJasmineLossText
	dw BTPryceLossText
	dw BTClairLossText
	dw BTKogaLossText
	dw BTKarenLossText

.PlayerWon:
	dw BTBrockWinText
	dw BTMistyWinText
	dw BTLtSurgeWinText
	dw BTErikaWinText
	dw BTJanineWinText
	dw BTSabrinaWinText
	dw BTBlaineWinText
	dw BTBlueWinText
	dw BTFalknerWinText
	dw BTBugsyWinText
	dw BTWhitneyWinText
	dw BTMortyWinText
	dw BTChuckWinText
	dw BTJasmineWinText
	dw BTPryceWinText
	dw BTClairWinText
	dw BTKogaWinText
	dw BTKarenWinText

BTBossTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTADGreetingText
	dw BTLucasGreetingText
	dw BTPercyGreetingText
	dw BTLewotGreetingText
	dw BTLanceGreetingText
	dw BTRedGreetingText

.PlayerLost:
	dw BTADLossText
	dw BTLucasLossText
	dw BTPercyLossText
	dw BTLewotLossText
	dw BTLanceLossText
	dw BTRedLossText

.PlayerWon:
	dw BTADWinText
	dw BTLucasWinText
	dw BTPercyWinText
	dw BTLewotWinText
	dw BTLanceWinText
	dw BTRedWinText

INCLUDE "data/battle_tower/special_classes.asm"

INCLUDE "data/battle_tower/special_parties.asm"

INCLUDE "data/battle_tower/special_text.asm"
