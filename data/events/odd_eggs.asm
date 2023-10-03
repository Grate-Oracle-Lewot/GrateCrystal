NUM_ODD_EGGS EQU 14

prob: MACRO
prob_total = prob_total + (\1)
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
; entries correspond to OddEggs (below)
	table_width 2, OddEggProbabilities
prob_total = 0
; Eevee
	prob 8
; Pikachu
	prob 7
; Bulbasaur
	prob 7
; Clairy
	prob 7
; Charmander
	prob 7
; Jigglypuff
	prob 7
; Squirtle
	prob 7
; Jynx
	prob 7
; Chikorita
	prob 7
; Magmar
	prob 7
; Cyndaquil
	prob 7
; Electabuzz
	prob 7
; Totodile
	prob 7
; Tyrogue
	prob 8
	assert_table_length NUM_ODD_EGGS
	assert prob_total == 100, "OddEggProbabilities do not sum to 100%!"

OddEggs:
	table_width NICKNAMED_MON_STRUCT_LENGTH, OddEggs

	db EEVEE
	db NO_ITEM
	db TACKLE, CHARM, EXTREMESPEED, 0
	dw 02048 ; OT ID
	dt 1 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 5, 0 ; PP
	db 18 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db PIKACHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 1 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 20, 15, 0 ; PP
	db 5 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db BULBASAUR
	db NO_ITEM
	db TACKLE, PETAL_DANCE, 0, 0
	dw 04096 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 15, 0, 0 ; PP
	db 11 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db CLEFAIRY
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 15, 0 ; PP
	db 5 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db CHARMANDER
	db NO_ITEM
	db SCRATCH, DRAGON_PULSE, 0, 0
	dw 04296 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 10, 0, 0 ; PP
	db 11 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db JIGGLYPUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 00720 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 25, 20, 15, 0 ; PP
	db 5 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 13 ; Max HP
	bigdw 6 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 6 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db SQUIRTLE
	db NO_ITEM
	db RAPID_SPIN, CRABHAMMER, 0, 0
	dw 03584 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 35, 5, 0, 0 ; PP
	db 11 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db JYNX
	db NO_ITEM
	db LICK, GROWL, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 1 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 40, 15, 0 ; PP
	db 13 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 8 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db CHIKORITA
	db NO_ITEM
	db POUND, ANCIENTPOWER, 0, 0
	dw 02560 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 10, 0, 0 ; PP
	db 11 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db MAGMAR
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 00419 ; OT ID
	dt 1 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 15, 0, 0 ; PP
	db 13 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 7 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 7 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db CYNDAQUIL
	db NO_ITEM
	db TACKLE, SACRED_FIRE, 0, 0
	dw 03072 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 5, 0, 0 ; PP
	db 11 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db ELECTABUZZ
	db NO_ITEM
	db MACH_PUNCH, DIZZY_PUNCH, 0, 0
	dw 00421 ; OT ID
	dt 1 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 25, 15, 0, 0 ; PP
	db 13 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 7 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 7 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db TOTODILE
	db NO_ITEM
	db SCRATCH, AEROBLAST, 0, 0
	dw 02420 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 5, 0, 0 ; PP
	db 11 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, MEDITATE, AURA_SPHERE, 0
	dw 00242 ; OT ID
	dt 1 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 30, 10, 0 ; PP
	db 13 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	assert_table_length NUM_ODD_EGGS
