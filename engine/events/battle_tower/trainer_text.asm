BattleTowerText::
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
	jr .normal

.brock
	ld a, 0
	jr .special
.misty
	ld a, 1
	jr .special
.lt_surge
	ld a, 2
	jr .special
.erika
	ld a, 3
	jr .special
.janine
	ld a, 4
	jr .special
.sabrina
	ld a, 5
	jr .special
.blaine
	ld a, 6
	jr .special
.blue
	ld a, 7
	jr .special
.falkner
	ld a, 8
	jr .special
.bugsy
	ld a, 9
	jr .special
.whitney
	ld a, 10
	jr .special
.morty
	ld a, 11
	jr .special
.chuck
	ld a, 12
	jr .special
.jasmine
	ld a, 13
	jr .special
.pryce
	ld a, 14
	jr .special
.clair
	ld a, 15
	jr .special
.koga
	ld a, 16
	jr .special
.karen
	ld a, 17
	jr .special
.a_d
	ld a, 18
	jr .special
.lucas
	ld a, 19
	jr .special
.percy
	ld a, 20
	jr .special
.lewot
	ld a, 21
	jr .special
.lance
	ld a, 22
	jr .special
.red
	ld a, 23
	jr .special

.normal
	dec a
	ld e, a
	ld d, 0
	ld hl, BTTrainerClassGenders
	add hl, de
	ld a, [hl]
	and a
	jr nz, .female
	; generate a random number between 0 and 24
	ldh a, [hRandomAdd]
	and $1f
	cp 25
	jr c, .okay0
	sub 25

.okay0
	ld hl, BTMaleTrainerTexts
	jr .proceed

.female
	; generate a random number between 0 and 14
	ldh a, [hRandomAdd]
	and $f
	cp 15
	jr c, .okay1
	sub 15

.okay1
	ld hl, BTFemaleTrainerTexts
	jr .proceed

.special
	ld hl, BTSpecialTrainerTexts

.proceed
	ld b, 0
	dec c
	jr nz, .restore
	ld [wBT_TrainerTextIndex], a
	jr .okay2

.restore
	ld a, [wBT_TrainerTextIndex]

.okay2
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
	jp PlaceHLTextAtBC

INCLUDE "mobile/fixed_words.asm"

INCLUDE "data/trainers/genders.asm"

BTMaleTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTGreetingM1Text
	dw BTGreetingM2Text
	dw BTGreetingM3Text
	dw BTGreetingM4Text
	dw BTGreetingM5Text
	dw BTGreetingM6Text
	dw BTGreetingM7Text
	dw BTGreetingM8Text
	dw BTGreetingM9Text
	dw BTGreetingM10Text
	dw BTGreetingM11Text
	dw BTGreetingM12Text
	dw BTGreetingM13Text
	dw BTGreetingM14Text
	dw BTGreetingM15Text
	dw BTGreetingM16Text
	dw BTGreetingM17Text
	dw BTGreetingM18Text
	dw BTGreetingM19Text
	dw BTGreetingM20Text
	dw BTGreetingM21Text
	dw BTGreetingM22Text
	dw BTGreetingM23Text
	dw BTGreetingM24Text
	dw BTGreetingM25Text

.PlayerLost:
	dw BTLossM1Text
	dw BTLossM2Text
	dw BTLossM3Text
	dw BTLossM4Text
	dw BTLossM5Text
	dw BTLossM6Text
	dw BTLossM7Text
	dw BTLossM8Text
	dw BTLossM9Text
	dw BTLossM10Text
	dw BTLossM11Text
	dw BTLossM12Text
	dw BTLossM13Text
	dw BTLossM14Text
	dw BTLossM15Text
	dw BTLossM16Text
	dw BTLossM17Text
	dw BTLossM18Text
	dw BTLossM19Text
	dw BTLossM20Text
	dw BTLossM21Text
	dw BTLossM22Text
	dw BTLossM23Text
	dw BTLossM24Text
	dw BTLossM25Text

.PlayerWon:
	dw BTWinM1Text
	dw BTWinM2Text
	dw BTWinM3Text
	dw BTWinM4Text
	dw BTWinM5Text
	dw BTWinM6Text
	dw BTWinM7Text
	dw BTWinM8Text
	dw BTWinM9Text
	dw BTWinM10Text
	dw BTWinM11Text
	dw BTWinM12Text
	dw BTWinM13Text
	dw BTWinM14Text
	dw BTWinM15Text
	dw BTWinM16Text
	dw BTWinM17Text
	dw BTWinM18Text
	dw BTWinM19Text
	dw BTWinM20Text
	dw BTWinM21Text
	dw BTWinM22Text
	dw BTWinM23Text
	dw BTWinM24Text
	dw BTWinM25Text

BTFemaleTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings:
	dw BTGreetingF1Text
	dw BTGreetingF2Text
	dw BTGreetingF3Text
	dw BTGreetingF4Text
	dw BTGreetingF5Text
	dw BTGreetingF6Text
	dw BTGreetingF7Text
	dw BTGreetingF8Text
	dw BTGreetingF9Text
	dw BTGreetingF10Text
	dw BTGreetingF11Text
	dw BTGreetingF12Text
	dw BTGreetingF13Text
	dw BTGreetingF14Text
	dw BTGreetingF15Text

.PlayerLost:
	dw BTLossF1Text
	dw BTLossF2Text
	dw BTLossF3Text
	dw BTLossF4Text
	dw BTLossF5Text
	dw BTLossF6Text
	dw BTLossF7Text
	dw BTLossF8Text
	dw BTLossF9Text
	dw BTLossF10Text
	dw BTLossF11Text
	dw BTLossF12Text
	dw BTLossF13Text
	dw BTLossF14Text
	dw BTLossF15Text

.PlayerWon:
	dw BTWinF1Text
	dw BTWinF2Text
	dw BTWinF3Text
	dw BTWinF4Text
	dw BTWinF5Text
	dw BTWinF6Text
	dw BTWinF7Text
	dw BTWinF8Text
	dw BTWinF9Text
	dw BTWinF10Text
	dw BTWinF11Text
	dw BTWinF12Text
	dw BTWinF13Text
	dw BTWinF14Text
	dw BTWinF15Text

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
	dw BTADGreetingText
	dw BTLucasGreetingText
	dw BTPercyGreetingText
	dw BTLewotGreetingText
	dw BTLanceGreetingText
	dw BTRedGreetingText

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
	dw BTADLossText
	dw BTLucasLossText
	dw BTPercyLossText
	dw BTLewotLossText
	dw BTLanceLossText
	dw BTRedWinLossText

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
	dw BTADWinText
	dw BTLucasWinText
	dw BTPercyWinText
	dw BTLewotWinText
	dw BTLanceWinText
	dw BTRedWinLossText

BTGreetingM1Text:
	text_far _BTGreetingM1Text
	text_end

BTLossM1Text:
	text_far _BTLossM1Text
	text_end

BTWinM1Text:
	text_far _BTWinM1Text
	text_end

BTGreetingM2Text:
	text_far _BTGreetingM2Text
	text_end

BTLossM2Text:
	text_far _BTLossM2Text
	text_end

BTWinM2Text:
	text_far _BTWinM2Text
	text_end

BTGreetingM3Text:
	text_far _BTGreetingM3Text
	text_end

BTLossM3Text:
	text_far _BTLossM3Text
	text_end

BTWinM3Text:
	text_far _BTWinM3Text
	text_end

BTGreetingM4Text:
	text_far _BTGreetingM4Text
	text_end

BTLossM4Text:
	text_far _BTLossM4Text
	text_end

BTWinM4Text:
	text_far _BTWinM4Text
	text_end

BTGreetingM5Text:
	text_far _BTGreetingM5Text
	text_end

BTLossM5Text:
	text_far _BTLossM5Text
	text_end

BTWinM5Text:
	text_far _BTWinM5Text
	text_end

BTGreetingM6Text:
	text_far _BTGreetingM6Text
	text_end

BTLossM6Text:
	text_far _BTLossM6Text
	text_end

BTWinM6Text:
	text_far _BTWinM6Text
	text_end

BTGreetingM7Text:
	text_far _BTGreetingM7Text
	text_end

BTLossM7Text:
	text_far _BTLossM7Text
	text_end

BTWinM7Text:
	text_far _BTWinM7Text
	text_end

BTGreetingM8Text:
	text_far _BTGreetingM8Text
	text_end

BTLossM8Text:
	text_far _BTLossM8Text
	text_end

BTWinM8Text:
	text_far _BTWinM8Text
	text_end

BTGreetingM9Text:
	text_far _BTGreetingM9Text
	text_end

BTLossM9Text:
	text_far _BTLossM9Text
	text_end

BTWinM9Text:
	text_far _BTWinM9Text
	text_end

BTGreetingM10Text:
	text_far _BTGreetingM10Text
	text_end

BTLossM10Text:
	text_far _BTLossM10Text
	text_end

BTWinM10Text:
	text_far _BTWinM10Text
	text_end

BTGreetingM11Text:
	text_far _BTGreetingM11Text
	text_end

BTLossM11Text:
	text_far _BTLossM11Text
	text_end

BTWinM11Text:
	text_far _BTWinM11Text
	text_end

BTGreetingM12Text:
	text_far _BTGreetingM12Text
	text_end

BTLossM12Text:
	text_far _BTLossM12Text
	text_end

BTWinM12Text:
	text_far _BTWinM12Text
	text_end

BTGreetingM13Text:
	text_far _BTGreetingM13Text
	text_end

BTLossM13Text:
	text_far _BTLossM13Text
	text_end

BTWinM13Text:
	text_far _BTWinM13Text
	text_end

BTGreetingM14Text:
	text_far _BTGreetingM14Text
	text_end

BTLossM14Text:
	text_far _BTLossM14Text
	text_end

BTWinM14Text:
	text_far _BTWinM14Text
	text_end

BTGreetingM15Text:
	text_far _BTGreetingM15Text
	text_end

BTLossM15Text:
	text_far _BTLossM15Text
	text_end

BTWinM15Text:
	text_far _BTWinM15Text
	text_end

BTGreetingM16Text:
	text_far _BTGreetingM16Text
	text_end

BTLossM16Text:
	text_far _BTLossM16Text
	text_end

BTWinM16Text:
	text_far _BTWinM16Text
	text_end

BTGreetingM17Text:
	text_far _BTGreetingM17Text
	text_end

BTLossM17Text:
	text_far _BTLossM17Text
	text_end

BTWinM17Text:
	text_far _BTWinM17Text
	text_end

BTGreetingM18Text:
	text_far _BTGreetingM18Text
	text_end

BTLossM18Text:
	text_far _BTLossM18Text
	text_end

BTWinM18Text:
	text_far _BTWinM18Text
	text_end

BTGreetingM19Text:
	text_far _BTGreetingM19Text
	text_end

BTLossM19Text:
	text_far _BTLossM19Text
	text_end

BTWinM19Text:
	text_far _BTWinM19Text
	text_end

BTGreetingM20Text:
	text_far _BTGreetingM20Text
	text_end

BTLossM20Text:
	text_far _BTLossM20Text
	text_end

BTWinM20Text:
	text_far _BTWinM20Text
	text_end

BTGreetingM21Text:
	text_far _BTGreetingM21Text
	text_end

BTLossM21Text:
	text_far _BTLossM21Text
	text_end

BTWinM21Text:
	text_far _BTWinM21Text
	text_end

BTGreetingM22Text:
	text_far _BTGreetingM22Text
	text_end

BTLossM22Text:
	text_far _BTLossM22Text
	text_end

BTWinM22Text:
	text_far _BTWinM22Text
	text_end

BTGreetingM23Text:
	text_far _BTGreetingM23Text
	text_end

BTLossM23Text:
	text_far _BTLossM23Text
	text_end

BTWinM23Text:
	text_far _BTWinM23Text
	text_end

BTGreetingM24Text:
	text_far _BTGreetingM24Text
	text_end

BTLossM24Text:
	text_far _BTLossM24Text
	text_end

BTWinM24Text:
	text_far _BTWinM24Text
	text_end

BTGreetingM25Text:
	text_far _BTGreetingM25Text
	text_end

BTLossM25Text:
	text_far _BTLossM25Text
	text_end

BTWinM25Text:
	text_far _BTWinM25Text
	text_end

BTGreetingF1Text:
	text_far _BTGreetingF1Text
	text_end

BTLossF1Text:
	text_far _BTLossF1Text
	text_end

BTWinF1Text:
	text_far _BTWinF1Text
	text_end

BTGreetingF2Text:
	text_far _BTGreetingF2Text
	text_end

BTLossF2Text:
	text_far _BTLossF2Text
	text_end

BTWinF2Text:
	text_far _BTWinF2Text
	text_end

BTGreetingF3Text:
	text_far _BTGreetingF3Text
	text_end

BTLossF3Text:
	text_far _BTLossF3Text
	text_end

BTWinF3Text:
	text_far _BTWinF3Text
	text_end

BTGreetingF4Text:
	text_far _BTGreetingF4Text
	text_end

BTLossF4Text:
	text_far _BTLossF4Text
	text_end

BTWinF4Text:
	text_far _BTWinF4Text
	text_end

BTGreetingF5Text:
	text_far _BTGreetingF5Text
	text_end

BTLossF5Text:
	text_far _BTLossF5Text
	text_end

BTWinF5Text:
	text_far _BTWinF5Text
	text_end

BTGreetingF6Text:
	text_far _BTGreetingF6Text
	text_end

BTLossF6Text:
	text_far _BTLossF6Text
	text_end

BTWinF6Text:
	text_far _BTWinF6Text
	text_end

BTGreetingF7Text:
	text_far _BTGreetingF7Text
	text_end

BTLossF7Text:
	text_far _BTLossF7Text
	text_end

BTWinF7Text:
	text_far _BTWinF7Text
	text_end

BTGreetingF8Text:
	text_far _BTGreetingF8Text
	text_end

BTLossF8Text:
	text_far _BTLossF8Text
	text_end

BTWinF8Text:
	text_far _BTWinF8Text
	text_end

BTGreetingF9Text:
	text_far _BTGreetingF9Text
	text_end

BTLossF9Text:
	text_far _BTLossF9Text
	text_end

BTWinF9Text:
	text_far _BTWinF9Text
	text_end

BTGreetingF10Text:
	text_far _BTGreetingF10Text
	text_end

BTLossF10Text:
	text_far _BTLossF10Text
	text_end

BTWinF10Text:
	text_far _BTWinF10Text
	text_end

BTGreetingF11Text:
	text_far _BTGreetingF11Text
	text_end

BTLossF11Text:
	text_far _BTLossF11Text
	text_end

BTWinF11Text:
	text_far _BTWinF11Text
	text_end

BTGreetingF12Text:
	text_far _BTGreetingF12Text
	text_end

BTLossF12Text:
	text_far _BTLossF12Text
	text_end

BTWinF12Text:
	text_far _BTWinF12Text
	text_end

BTGreetingF13Text:
	text_far _BTGreetingF13Text
	text_end

BTLossF13Text:
	text_far _BTLossF13Text
	text_end

BTWinF13Text:
	text_far _BTWinF13Text
	text_end

BTGreetingF14Text:
	text_far _BTGreetingF14Text
	text_end

BTLossF14Text:
	text_far _BTLossF14Text
	text_end

BTWinF14Text:
	text_far _BTWinF14Text
	text_end

BTGreetingF15Text:
	text_far _BTGreetingF15Text
	text_end

BTLossF15Text:
	text_far _BTLossF15Text
	text_end

BTWinF15Text:
	text_far _BTWinF15Text
	text_end

BTBrockGreetingText:
	text_far _BTBrockGreetingText
	text_end

BTBrockLossText:
	text_far _BTBrockLossText
	text_end

BTBrockWinText:
	text_far _BTBrockWinText
	text_end

BTMistyGreetingText:
	text_far _BTMistyGreetingText
	text_end

BTMistyLossText:
	text_far _BTMistyLossText
	text_end

BTMistyWinText:
	text_far _BTMistyWinText
	text_end

BTLtSurgeGreetingText:
	text_far _BTLtSurgeGreetingText
	text_end

BTLtSurgeLossText:
	text_far _BTLtSurgeLossText
	text_end

BTLtSurgeWinText:
	text_far _BTLtSurgeWinText
	text_end

BTErikaGreetingText:
	text_far _BTErikaGreetingText
	text_end

BTErikaLossText:
	text_far _BTErikaLossText
	text_end

BTErikaWinText:
	text_far _BTErikaWinText
	text_end

BTJanineGreetingText:
	text_far _BTJanineGreetingText
	text_end

BTJanineLossText:
	text_far _BTJanineLossText
	text_end

BTJanineWinText:
	text_far _BTJanineWinText
	text_end

BTSabrinaGreetingText:
	text_far _BTSabrinaGreetingText
	text_end

BTSabrinaLossText:
	text_far _BTSabrinaLossText
	text_end

BTSabrinaWinText:
	text_far _BTSabrinaWinText
	text_end

BTBlaineGreetingText:
	text_far _BTBlaineGreetingText
	text_end

BTBlaineLossText:
	text_far _BTBlaineLossText
	text_end

BTBlaineWinText:
	text_far _BTBlaineWinText
	text_end

BTBlueGreetingText:
	text_far _BTBlueGreetingText
	text_end

BTBlueLossText:
	text_far _BTBlueLossText
	text_end

BTBlueWinText:
	text_far _BTBlueWinText
	text_end

BTFalknerGreetingText:
	text_far _BTFalknerGreetingText
	text_end

BTFalknerLossText:
	text_far _BTFalknerLossText
	text_end

BTFalknerWinText:
	text_far _BTFalknerWinText
	text_end

BTBugsyGreetingText:
	text_far _BTBugsyGreetingText
	text_end

BTBugsyLossText:
	text_far _BTBugsyLossText
	text_end

BTBugsyWinText:
	text_far _BTBugsyWinText
	text_end

BTWhitneyGreetingText:
	text_far _BTWhitneyGreetingText
	text_end

BTWhitneyLossText:
	text_far _BTWhitneyLossText
	text_end

BTWhitneyWinText:
	text_far _BTWhitneyWinText
	text_end

BTMortyGreetingText:
	text_far _BTMortyGreetingText
	text_end

BTMortyLossText:
	text_far _BTMortyLossText
	text_end

BTMortyWinText:
	text_far _BTMortyWinText
	text_end

BTChuckGreetingText:
	text_far _BTChuckGreetingText
	text_end

BTChuckLossText:
	text_far _BTChuckLossText
	text_end

BTChuckWinText:
	text_far _BTChuckWinText
	text_end

BTJasmineGreetingText:
	text_far _BTJasmineGreetingText
	text_end

BTJasmineLossText:
	text_far _BTJasmineLossText
	text_end

BTJasmineWinText:
	text_far _BTJasmineWinText
	text_end

BTPryceGreetingText:
	text_far _BTPryceGreetingText
	text_end

BTPryceLossText:
	text_far _BTPryceLossText
	text_end

BTPryceWinText:
	text_far _BTPryceWinText
	text_end

BTClairGreetingText:
	text_far _BTClairGreetingText
	text_end

BTClairLossText:
	text_far _BTClairLossText
	text_end

BTClairWinText:
	text_far _BTClairWinText
	text_end

BTKogaGreetingText:
	text_far _BTKogaGreetingText
	text_end

BTKogaLossText:
	text_far _BTKogaLossText
	text_end

BTKogaWinText:
	text_far _BTKogaWinText
	text_end

BTKarenGreetingText:
	text_far _BTKarenGreetingText
	text_end

BTKarenLossText:
	text_far _BTKarenLossText
	text_end

BTKarenWinText:
	text_far _BTKarenWinText
	text_end

BTADGreetingText:
	text_far _BTADGreetingText
	text_end

BTADLossText:
	text_far _BTADLossText
	text_end

BTADWinText:
	text_far _BTADWinText
	text_end

BTLucasGreetingText:
	text_far _BTLucasGreetingText
	text_end

BTLucasLossText:
	text_far _BTLucasLossText
	text_end

BTLucasWinText:
	text_far _BTLucasWinText
	text_end

BTPercyGreetingText:
	text_far _BTPercyGreetingText
	text_end

BTPercyLossText:
	text_far _BTPercyLossText
	text_end

BTPercyWinText:
	text_far _BTPercyWinText
	text_end

BTLewotGreetingText:
	text_far _BTLewotGreetingText
	text_end

BTLewotLossText:
	text_far _BTLewotLossText
	text_end

BTLewotWinText:
	text_far _BTLewotWinText
	text_end

BTLanceGreetingText:
	text_far _BTLanceGreetingText
	text_end

BTLanceLossText:
	text_far _BTLanceLossText
	text_end

BTLanceWinText:
	text_far _BTLanceWinText
	text_end

BTRedGreetingText:
	text_far _BTRedGreetingText
	text_end

BTRedWinLossText:
	text_far _BTRedWinLossText
	text_end
