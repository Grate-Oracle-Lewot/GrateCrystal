LoadBattleTowerSpecialTrainer::
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

	ldh a, [hRandomAdd]
	ld b, a
.resample
	call Random
	ldh a, [hRandomAdd]
	add b
	ld b, a
	maskbits BATTLETOWER_NUM_SPECIAL_TRAINERS
	cp BATTLETOWER_NUM_SPECIAL_TRAINERS
	jr nc, .resample

	ld hl, BattleTowerSpecialTrainers
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

INCLUDE "data/battle_tower/special_classes.asm"

INCLUDE "data/battle_tower/special_parties.asm"

BattleTowerSpecialTrainerText::
; Print text c for trainer [wBT_OTTrainerClass]
; 1: Intro text
; 2: Player lost
; 3: Player won
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBT_OTTrainerClass)
	ldh [rSVBK], a
	ld hl, wBT_OTTrainerClass
	ld a, [hl]
	cp BROCK
	jr z, .brock
	cp MISTY
	jr z, .misty
	cp LT_SURGE
	jr z, .lt_surge
	cp ERIKA
	jr z, .erika
	cp JANINE
	jr z, .janine
	cp SABRINA
	jr z, .sabrina
	cp BLAINE
	jr z, .blaine
	cp BLUE
	jr z, .blue
	cp FALKNER
	jr z, .falkner
	cp BUGSY
	jr z, .bugsy
	cp WHITNEY
	jr z, .whitney
	cp MORTY
	jr z, .morty
	cp CHUCK
	jr z, .chuck
	cp JASMINE
	jr z, .jasmine
	cp PRYCE
	jr z, .pryce
	cp CLAIR
	jr z, .clair
	cp REAL_KOGA
	jr z, .koga
	cp REAL_KAREN
	jr z, .karen
	cp WILL
	jr z, .a_d
	cp KOGA
	jr z, .lucas
	cp BRUNO
	jr z, .percy
	cp KAREN
	jr z, .lewot
	cp CHAMPION
	jr z, .lance
	cp RED
	jr z, .red
	xor a
	jr .proceed

.brock
	ld a, 1
	jr .proceed
.misty
	ld a, 2
	jr .proceed
.lt_surge
	ld a, 3
	jr .proceed
.erika
	ld a, 4
	jr .proceed
.janine
	ld a, 5
	jr .proceed
.sabrina
	ld a, 6
	jr .proceed
.blaine
	ld a, 7
	jr .proceed
.blue
	ld a, 8
	jr .proceed
.falkner
	ld a, 9
	jr .proceed
.bugsy
	ld a, 10
	jr .proceed
.whitney
	ld a, 11
	jr .proceed
.morty
	ld a, 12
	jr .proceed
.chuck
	ld a, 13
	jr .proceed
.jasmine
	ld a, 14
	jr .proceed
.pryce
	ld a, 15
	jr .proceed
.clair
	ld a, 16
	jr .proceed
.koga
	ld a, 17
	jr .proceed
.karen
	ld a, 18
	jr .proceed
.a_d
	ld a, 19
	jr .proceed
.lucas
	ld a, 20
	jr .proceed
.percy
	ld a, 21
	jr .proceed
.lewot
	ld a, 22
	jr .proceed
.lance
	ld a, 23
	jr .proceed
.red
	ld a, 24

.proceed
	ld hl, BTSpecialTrainerTexts
	ld b, 0
	dec c
	jr nz, .restore
	ld [wBT_TrainerTextIndex], a
	jr .okay
.restore
	ld a, [wBT_TrainerTextIndex]
.okay
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
	ret

BTSpecialTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTDefaultGreetingText
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
	dw BTADGreetingText
	dw BTLucasGreetingText
	dw BTPercyGreetingText
	dw BTLewotGreetingText
	dw BTLanceGreetingText
	dw BTRedGreetingText

.PlayerLost:
	dw BTDefaultLossText
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
	dw BTADLossText
	dw BTLucasLossText
	dw BTPercyLossText
	dw BTLewotLossText
	dw BTLanceLossText
	dw BTRedWinLossText

.PlayerWon:
	dw BTDefaultWinText
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
	dw BTADWinText
	dw BTLucasWinText
	dw BTPercyWinText
	dw BTLewotWinText
	dw BTLanceWinText
	dw BTRedWinLossText

INCLUDE "data/battle_tower/special_text.asm"
