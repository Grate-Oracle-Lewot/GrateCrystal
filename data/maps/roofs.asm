; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_NEW_BARK  ; 0
	const ROOF_VIOLET    ; 1
	const ROOF_AZALEA    ; 2
	const ROOF_OLIVINE   ; 3
	const ROOF_GOLDENROD ; 4
NUM_ROOFS EQU const_value

MapGroupRoofs:
; entries correspond to MAPGROUP_* constants
; values are indexes for Roofs (see below)
	table_width 1, MapGroupRoofs
	db -1             ;  0
	db -1             ;  1 (Cable Club)
	db -1             ;  2 (Pallet)
	db -1             ;  3 (Viridian)
	db -1             ;  4 (Pewter)
	db -1             ;  5 (Cerulean)
	db -1             ;  6 (Vermilion)
	db -1             ;  7 (Lavender)
	db -1             ;  8 (Celadon)
	db -1             ;  9 (Fuchsia)
	db -1             ; 10 (Safari)
	db -1             ; 11 (Saffron Inner)
	db -1             ; 12 (Saffron Outer)
	db -1             ; 13 (Cinnabar)
	db -1             ; 14 (Indigo)
	db ROOF_NEW_BARK  ; 15 (Silver)
	db ROOF_NEW_BARK  ; 16 (New Bark)
	db ROOF_NEW_BARK  ; 17 (Cherrygrove)
	db ROOF_VIOLET    ; 18 (Violet)
	db ROOF_AZALEA    ; 19 (Azalea)
	db ROOF_GOLDENROD ; 20 (Goldenrod)
	db ROOF_VIOLET    ; 21 (Ecruteak)
	db ROOF_OLIVINE   ; 22 (Olivine)
	db ROOF_OLIVINE   ; 23 (Cianwood)
	db ROOF_AZALEA    ; 24 (Mahogany)
	db ROOF_AZALEA    ; 25 (Lake of Rage)
	db ROOF_AZALEA    ; 26 (Blackthorn)
	db -1             ; 27 (Fast Ship)
	db -1             ; 28 (Dungeons)
	assert_table_length NUM_MAP_GROUPS + 1

Roofs:
; entries correspond to ROOF_* constants
	table_width ROOF_LENGTH * LEN_2BPP_TILE, Roofs
INCBIN "gfx/tilesets/roofs/new_bark.2bpp"
INCBIN "gfx/tilesets/roofs/violet.2bpp"
INCBIN "gfx/tilesets/roofs/azalea.2bpp"
INCBIN "gfx/tilesets/roofs/olivine.2bpp"
INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
	assert_table_length NUM_ROOFS
