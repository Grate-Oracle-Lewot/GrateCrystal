farcall: MACRO ; bank, address
	rst BetterFarCall
	dbw BANK(\1), \1
ENDM

farjump: MACRO
	rst BetterFarCall
	dbw BANK(\1) | $80, \1
ENDM

homecall: MACRO
	ldh a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
