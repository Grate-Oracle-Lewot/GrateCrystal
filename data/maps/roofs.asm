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
	db -1             ;  1
	db ROOF_AZALEA    ;  2 (Lake of Rage)
	db ROOF_NEW_BARK  ;  3 (Silver Cave)
	db -1             ;  4
	db -1             ;  5
	db -1             ;  6
	db -1             ;  7
	db -1             ;  8
	db -1             ;  9
	db -1             ; 10
	db -1             ; 11
	db -1             ; 12
	db -1             ; 13
	db -1             ; 14
	db -1             ; 15
	db -1             ; 16
	db ROOF_NEW_BARK  ; 17 (New Bark)
	db ROOF_NEW_BARK  ; 18 (Cherrygrove)
	db ROOF_VIOLET    ; 19 (Violet)
	db ROOF_AZALEA    ; 20 (Azalea)
	db ROOF_GOLDENROD ; 21 (Goldenrod)
	db ROOF_VIOLET    ; 22 (Ecruteak)
	db ROOF_OLIVINE   ; 23 (Olivine)
	db ROOF_OLIVINE   ; 24 (Cianwood)
	db ROOF_AZALEA    ; 25 (Mahogany)
	db ROOF_AZALEA    ; 26 (Blackthorn)
	db -1             ; 27
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
