unownword: MACRO
for n, CHARLEN(\1)
	db CHARSUB(\1, n + 1) - "A" + FIRST_UNOWN_CHAR
endr
	db -1
ENDM

UnownWords:
; entries correspond to UNOWN_* form constants
	table_width 2, UnownWords
	dw UnownWordA ; unused
	dw UnownWordA
	dw UnownWordB
	dw UnownWordC
	dw UnownWordD
	dw UnownWordE
	dw UnownWordF
	dw UnownWordG
	dw UnownWordH
	dw UnownWordI
	dw UnownWordJ
	dw UnownWordK
	dw UnownWordL
	dw UnownWordM
	dw UnownWordN
	dw UnownWordO
	dw UnownWordP
	dw UnownWordQ
	dw UnownWordR
	dw UnownWordS
	dw UnownWordT
	dw UnownWordU
	dw UnownWordV
	dw UnownWordW
	dw UnownWordX
	dw UnownWordY
	dw UnownWordZ
	dw UnownWordExclamation
	dw UnownWordQuestion
	assert_table_length NUM_UNOWN + 1

UnownWordA: unownword "ARPEGGIO"
UnownWordB: unownword "BELCH"
UnownWordC: unownword "CHEESE"
UnownWordD: unownword "DIET"
UnownWordE: unownword "EGO"
UnownWordF: unownword "FOP"
UnownWordG: unownword "GROOVY"
UnownWordH: unownword "HACK"
UnownWordI: unownword "INKLING"
UnownWordJ: unownword "JEOPARDY"
UnownWordK: unownword "KILT"
UnownWordL: unownword "LUV"
UnownWordM: unownword "MARVEL"
UnownWordN: unownword "NINTENDO"
UnownWordO: unownword "OLIMAR"
UnownWordP: unownword "PUPIL"
UnownWordQ: unownword "QUACK"
UnownWordR: unownword "REDNECK"
UnownWordS: unownword "SVELTE"
UnownWordT: unownword "TEPID"
UnownWordU: unownword "ULCER"
UnownWordV: unownword "VIM"
UnownWordW: unownword "WAFFLES"
UnownWordX: unownword "XMAS"
UnownWordY: unownword "YOSHI"
UnownWordZ: unownword "ZAPHOD"
UnownWordExclamation: unownword "AURGH(" ; "Z" + 1 == "("
UnownWordQuestion: unownword "WYNAUT)" ; "Z" + 2 == ")"
