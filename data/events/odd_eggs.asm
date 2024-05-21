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
	db TACKLE, TAIL_WHIP, CHARM, EXTREMESPEED
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 30, 20, 5 ; PP
	db 19 ; Step cycles to hatch
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
	dw 0 ; OT ID
	dt 0 ; Exp
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
	db TACKLE, CHARM, PETAL_DANCE, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 15, 0 ; PP
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
	db POUND, CHARM, KINESIS, DIZZY_PUNCH
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 20, 15 ; PP
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
	db SCRATCH, CHARM, DRAGON_PULSE, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 10, 0 ; PP
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
	db SING, CHARM, SCREECH, DIZZY_PUNCH
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 25, 20, 20, 15 ; PP
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
	db RAPID_SPIN, CHARM, CRABHAMMER, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 35, 20, 5, 0 ; PP
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
	db LICK, CHARM, SCARY_FACE, DIZZY_PUNCH
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 20, 20, 15 ; PP
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
	db POUND, CHARM, ANCIENTPOWER, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 10, 0 ; PP
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
	db EMBER, SCARY_FACE, DIZZY_PUNCH, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 20, 15, 0 ; PP
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
	db TACKLE, CHARM, SACRED_FIRE, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 5, 0 ; PP
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
	db MACH_PUNCH, LEER, SCARY_FACE, DIZZY_PUNCH
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 25, 40, 20, 15 ; PP
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
	db SCRATCH, CHARM, AEROBLAST, 0
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 5, 0 ; PP
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
	db TACKLE, MEDITATE, SCARY_FACE, AURA_SPHERE
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 30, 20, 10 ; PP
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
