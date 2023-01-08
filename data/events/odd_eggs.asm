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
	prob 9
; Pichu
	prob 7
; Bulbasaur
	prob 7
; Cleffa
	prob 7
; Charmander
	prob 7
; Igglybuff
	prob 7
; Squirtle
	prob 7
; Smoochum
	prob 7
; Chikorita
	prob 7
; Magby
	prob 7
; Cyndaquil
	prob 7
; Elekid
	prob 7
; Totodile
	prob 7
; Tyrogue
	prob 7
	assert_table_length NUM_ODD_EGGS
	assert prob_total == 100, "OddEggProbabilities do not sum to 100%!"

OddEggs:
	table_width NICKNAMED_MON_STRUCT_LENGTH, OddEggs

	db EEVEE
	db NO_ITEM
	db TACKLE, TAIL_WHIP, EXTREMESPEED, 0
	dw 02048 ; OT ID
	dt 156 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 30, 5, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 22 ; Max HP
	bigdw 12 ; Atk
	bigdw 11 ; Def
	bigdw 12 ; Spd
	bigdw 11 ; SAtk
	bigdw 13 ; SDef
	db "EGG@@@@@@@@"

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 20, 15, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 10 ; Atk
	bigdw 8 ; Def
	bigdw 12 ; Spd
	bigdw 10 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db BULBASAUR
	db NO_ITEM
	db TACKLE, GROWL, PETAL_DANCE, 0
	dw 04096 ; OT ID
	dt 135 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 40, 15, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 11 ; Atk
	bigdw 11 ; Def
	bigdw 11 ; Spd
	bigdw 13 ; SAtk
	bigdw 13 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, ENCORE, DIZZY_PUNCH
	dw 00768 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 20, 5, 15 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 9 ; Atk
	bigdw 9 ; Def
	bigdw 8 ; Spd
	bigdw 11 ; SAtk
	bigdw 12 ; SDef
	db "EGG@@@@@@@@"

	db CHARMANDER
	db NO_ITEM
	db SCRATCH, GROWL, OUTRAGE, 0
	dw 04096 ; OT ID
	dt 135 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 40, 15, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 11 ; Atk
	bigdw 10 ; Def
	bigdw 13 ; Spd
	bigdw 12 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DEFENSE_CURL, DIZZY_PUNCH
	dw 00768 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 25, 20, 35, 15 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 25 ; Max HP
	bigdw 9 ; Atk
	bigdw 8 ; Def
	bigdw 8 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

	db SQUIRTLE
	db NO_ITEM
	db RAPID_SPIN, TAIL_WHIP, CRABHAMMER, 0
	dw 03584 ; OT ID
	dt 135 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 35, 30, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 11 ; Atk
	bigdw 13 ; Def
	bigdw 10 ; Spd
	bigdw 11 ; SAtk
	bigdw 12 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db LICK, GROWL, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 40, 15, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 9 ; Atk
	bigdw 8 ; Def
	bigdw 13 ; Spd
	bigdw 15 ; SAtk
	bigdw 13 ; SDef
	db "EGG@@@@@@@@"

	db CHIKORITA
	db NO_ITEM
	db POUND, GROWL, ANCIENTPOWER, 0
	dw 02560 ; OT ID
	dt 135 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 40, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 11 ; Atk
	bigdw 13 ; Def
	bigdw 11 ; Spd
	bigdw 11 ; SAtk
	bigdw 13 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 15, 0, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 14 ; Atk
	bigdw 10 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 12 ; SDef
	db "EGG@@@@@@@@"

	db CYNDAQUIL
	db NO_ITEM
	db TACKLE, DEFENSE_CURL, SACRED_FIRE, 0
	dw 03072 ; OT ID
	dt 135 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 35, 5, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 11 ; Atk
	bigdw 10 ; Def
	bigdw 13 ; Spd
	bigdw 12 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, CHARM, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 30, 20, 15, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 12 ; Atk
	bigdw 10 ; Def
	bigdw 16 ; Spd
	bigdw 13 ; SAtk
	bigdw 12 ; SDef
	db "EGG@@@@@@@@"

	db TOTODILE
	db NO_ITEM
	db SCRATCH, TAIL_WHIP, AEROBLAST, 0
	dw 02560 ; OT ID
	dt 135 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 30, 5, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 13 ; Atk
	bigdw 12 ; Def
	bigdw 10 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, MEDITATE, AURA_SPHERE, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 15, 15, 15 ; DVs
	db 40, 30, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 10 ; Atk
	bigdw 10 ; Def
	bigdw 10 ; Spd
	bigdw 10 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	assert_table_length NUM_ODD_EGGS
