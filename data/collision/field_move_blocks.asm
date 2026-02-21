; these blocks all use COLL_CUT_TREE in one quadrant
CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_JOHTO_MODERN, .johto_modern
	dbw TILESET_KANTO,        .kanto
	dbw TILESET_PARK,         .park
	dbw TILESET_FOREST,       .forest
	dbw TILESET_JOHTO_CHERRY, .johto
	dbw TILESET_JOHTO_BURNED, .johto
	dbw TILESET_JOHTO_BEACH,  .johto
	dbw TILESET_JOHTO_DESERT, .johto_desert
	dbw TILESET_KANTO_EXTRA,  .kanto
	db -1 ; end

.johto_desert:
; facing block, replacement block, animation
	db $23, $02, $01 ; dry grass
	db $44, $02, $01 ; dry grass
.johto:
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $3f, $00 ; tree
	db $67, $3e, $00 ; tree
.johto_modern:
	db $03, $02, $01 ; grass
	db -1 ; end

.kanto:
; facing block, replacement block, animation
	db $0b, $0a, $01 ; grass
	db $32, $6d, $00 ; tree
	db $33, $6c, $00 ; tree
	db $34, $6f, $00 ; tree
	db $35, $4c, $00 ; tree
	db $60, $6e, $00 ; tree
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $13, $03, $01 ; tall grass
	db $03, $04, $01 ; grass
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $0f, $17, $00 ; tree
	db -1 ; end


; these blocks all use COLL_WHIRLPOOL in one quadrant
WhirlpoolBlockPointers:
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_JOHTO_CHERRY, .johto
	dbw TILESET_JOHTO_BEACH,  .johto
	dbw TILESET_JOHTO_BURNED, .johto
	dbw TILESET_JOHTO_DESERT, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, $00 ; whirlpool
	db -1 ; end
