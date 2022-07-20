TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 25, SPEAROW,     8
	db 20, SPEAROW,    19
	db 20, SPEAROW,    31
	db 15, AIPOM,       8
	db 10, AIPOM,      19
	db 10, AIPOM,      31
	db -1
; rare
	db 25, SPEAROW,     8
	db 20, HERACROSS,  19
	db 20, HERACROSS,  31
	db 15, AIPOM,       8
	db 10, AIPOM,      19
	db 10, AIPOM,      31
	db -1

TreeMonSet_Town:
; common
	db 25, SPEAROW,     8
	db 20, EKANS,       8
	db 20, SPEAROW,    15
	db 15, AIPOM,       8
	db 10, AIPOM,       5
	db 10, AIPOM,      15
	db -1
; rare
	db 25, SPEAROW,     8
	db 20, HERACROSS,   8
	db 20, HERACROSS,  15
	db 15, AIPOM,       8
	db 10, AIPOM,       5
	db 10, AIPOM,      15
	db -1

TreeMonSet_Route:
; common
	db 25, HOOTHOOT,    8
	db 20, SPINARAK,    8
	db 20, LEDYBA,      8
	db 15, EXEGGCUTE,   8
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1
; rare
	db 25, HOOTHOOT,    8
	db 20, PINECO,      8
	db 20, PINECO,      5
	db 15, EXEGGCUTE,   8
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1

TreeMonSet_Kanto:
; common
	db 25, HOOTHOOT,   19
	db 20, EKANS,      19
	db 20, HOOTHOOT,   31
	db 15, EXEGGCUTE,  19
	db 10, EXEGGCUTE,   8
	db 10, EXEGGCUTE,  31
	db -1
; rare
	db 25, HOOTHOOT,   19
	db 20, PINECO,     19
	db 20, PINECO,     31
	db 15, EXEGGCUTE,  19
	db 10, EXEGGCUTE,   8
	db 10, EXEGGCUTE,  31
	db -1

TreeMonSet_Lake:
; common
	db 25, HOOTHOOT,    8
	db 20, VENONAT,     8
	db 20, HOOTHOOT,   15
	db 15, EXEGGCUTE,   8
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1
; rare
	db 25, HOOTHOOT,    8
	db 20, PINECO,      8
	db 20, PINECO,     15
	db 15, EXEGGCUTE,   8
	db 10, EXEGGCUTE,   5
	db 10, EXEGGCUTE,  15
	db -1

TreeMonSet_Forest:
; common
	db 25, HOOTHOOT,    8
	db 20, PINECO,      8
	db 20, PINECO,      5
	db 15, NOCTOWL,     8
	db 10, BUTTERFREE,  8
	db 10, BEEDRILL,    8
	db -1
; rare
	db 25, HOOTHOOT,    8
	db 20, CATERPIE,    8
	db 20, WEEDLE,      8
	db 15, HOOTHOOT,    5
	db 10, METAPOD,     8
	db 10, KAKUNA,      8
	db -1

TreeMonSet_Rock:
	db 20, GEODUDE,    15
	db 20, KRABBY,     15
	db 20, SHELLDER,   15
	db 20, ARBOK,      15
	db 10, SHUCKLE,    15
	db 10, DUNSPARCE,  15
	db -1
