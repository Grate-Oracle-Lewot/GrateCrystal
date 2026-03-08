; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_KANTO                ; 01
	const TILESET_KANTO_EXTRA          ; 02
	const TILESET_HOUSE                ; 03
	const TILESET_TRADITIONAL_HOUSE    ; 04
	const TILESET_BILLS_HOUSE          ; 05
	const TILESET_PLAYERS_HOUSE        ; 06
	const TILESET_PLAYERS_ROOM         ; 07
	const TILESET_POKECENTER           ; 08
	const TILESET_POKECOM_CENTER       ; 09
	const TILESET_MART                 ; 0a
	const TILESET_GATE                 ; 0b
	const TILESET_CAVE                 ; 0c
	const TILESET_DARK_CAVE            ; 0d
	const TILESET_ICE_PATH             ; 0e
	const TILESET_FOREST               ; 0f
	const TILESET_PARK                 ; 10
	const TILESET_TOWER                ; 11
	const TILESET_RADIO_TOWER          ; 12
	const TILESET_LAB                  ; 13
	const TILESET_FACILITY             ; 14
	const TILESET_UNDERGROUND          ; 15
	const TILESET_GAME_CORNER          ; 16
	const TILESET_TRAIN_STATION        ; 17
	const TILESET_PORT                 ; 18
	const TILESET_LIGHTHOUSE           ; 19
	const TILESET_ELITE_FOUR_ROOM      ; 1a
	const TILESET_CHAMPIONS_ROOM       ; 1b
	const TILESET_MANSION              ; 1c
	const TILESET_MUSEUM               ; 1d
	const TILESET_SPINNERS             ; 1e
	const TILESET_RUINS_OF_ALPH        ; 1f
	const TILESET_KABUTO_WORD_ROOM     ; 20
	const TILESET_OMANYTE_WORD_ROOM    ; 21
	const TILESET_AERODACTYL_WORD_ROOM ; 22
	const TILESET_HO_OH_WORD_ROOM      ; 23
	const TILESET_VIRIDIAN_GYM         ; 24
	const TILESET_OLIVINE_GYM          ; 25
	const TILESET_BATTLE_TOWER_INSIDE  ; 26
	const TILESET_BATTLE_TOWER_OUTSIDE ; 27
	const TILESET_JOHTO                ; 28
	const TILESET_JOHTO_CHERRY         ; 29
	const TILESET_JOHTO_BURNED         ; 2a
	const TILESET_JOHTO_BEACH          ; 2b
	const TILESET_JOHTO_DESERT         ; 2c
	const TILESET_JOHTO_MODERN         ; 2d
NUM_TILESETS EQU const_value - 1

; wTileset struct size
TILESET_LENGTH EQU 15

; roof length (see gfx/tilesets/roofs)
ROOF_LENGTH EQU 9

; bg palette values (see gfx/tilesets/*_palette_map.asm)
; TilesetBGPalette indexes (see gfx/tilesets/bg_tiles.pal)
	const_def
	const PAL_BG_GRAY   ; 0
	const PAL_BG_RED    ; 1
	const PAL_BG_GREEN  ; 2
	const PAL_BG_WATER  ; 3
	const PAL_BG_YELLOW ; 4
	const PAL_BG_BROWN  ; 5
	const PAL_BG_ROOF   ; 6
	const PAL_BG_TEXT   ; 7
