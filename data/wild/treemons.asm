TreeMons::
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_None
	dw TreeMonSet_City
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	assert_table_length NUM_TREEMON_SETS

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_None:
TreeMonSet_City:
; common
	db 25, SPEAROW,    10
	db 20, SPEAROW,    20
	db 20, FEAROW,     30
	db 15, AIPOM,      10
	db 10, AIPOM,      20
	db 10, AIPOM,      30
	db -1
; rare
	db 25, SPEAROW,    10
	db 20, HERACROSS,  20
	db 20, HERACROSS,  30
	db 15, AIPOM,      10
	db 10, AIPOM,      20
	db 10, AIPOM,      30
	db -1

TreeMonSet_Town:
; common
	db 25, SPEAROW,    10
	db 20, EKANS,      10
	db 20, SPEAROW,    15
	db 15, AIPOM,      10
	db 10, AIPOM,       5
	db 10, AIPOM,      15
	db -1
; rare
	db 25, SPEAROW,    10
	db 20, HERACROSS,  10
	db 20, HERACROSS,  15
	db 15, AIPOM,      10
	db 10, AIPOM,       5
	db 10, AIPOM,      15
	db -1

TreeMonSet_Route:
; common
	db 25, HOOTHOOT,   10
	db 20, SPINARAK,   10
	db 20, LEDYBA,     10
	db 15, EXEGGCUTE,  10
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1
; rare
	db 25, HOOTHOOT,   10
	db 20, PINECO,     10
	db 20, PINECO,      5
	db 15, EXEGGCUTE,  10
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1

TreeMonSet_Kanto:
; common
	db 25, HOOTHOOT,   20
	db 20, EKANS,      20
	db 20, NOCTOWL,    40
	db 15, EXEGGCUTE,  20
	db 10, EXEGGCUTE,  10
	db 10, EXEGGCUTE,  30
	db -1
; rare
	db 25, HOOTHOOT,   20
	db 20, PINECO,     20
	db 20, FORRETRESS, 40
	db 15, EXEGGCUTE,  30
	db 10, EXEGGCUTE,  10
	db 10, EXEGGCUTE,  50
	db -1

TreeMonSet_Lake:
; common
	db 25, HOOTHOOT,   10
	db 20, VENONAT,    10
	db 20, HOOTHOOT,   15
	db 15, EXEGGCUTE,  10
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1
; rare
	db 25, HOOTHOOT,   10
	db 20, PINECO,     10
	db 20, PINECO,     15
	db 15, SUNKERN,    10
	db 10, SUNKERN,     5
	db 10, SUNKERN,    15
	db -1

TreeMonSet_Forest:
; common
	db 25, HOOTHOOT,   10
	db 20, PINECO,     10
	db 20, PINECO,      5
	db 15, NOCTOWL,    10
	db 10, BUTTERFREE, 10
	db 10, BEEDRILL,   10
	db -1
; rare
	db 25, HOOTHOOT,   10
	db 20, CATERPIE,   10
	db 20, WEEDLE,     10
	db 15, HOOTHOOT,    5
	db 10, METAPOD,    10
	db 10, KAKUNA,     10
	db -1

RockSmashMons::
	; broke off from the above table, for nayru's pokedex
	; delineation was needed because there is no 'rare' table for rocksmash
	table_width 2, RockSmashMons
	dw TreeMonSet_Rock
	assert_table_length NUM_ROCKSMASH_SETS

; can have as many entries as you want as long as the % adds up to 100
TreeMonSet_Rock:
	db 20, GEODUDE,    15
	db 20, KRABBY,     15
	db 20, SHELLDER,   15
	db 20, ARBOK,      20
	db 10, DUNSPARCE,  15
	db 10, SHUCKLE,    20
	db -1
