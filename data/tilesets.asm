tileset: MACRO
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw NULL
	dw \1PalMap
ENDM

; Associated data:
; - The *GFX, *Meta, and *Coll are defined in gfx/tilesets.asm
; - The *PalMap are defined in gfx/tileset_palette_maps.asm
; - The *Anim are defined in engine/tilesets/tileset_anims.asm

Tilesets::
; entries correspond to TILESET_* constants (see constants/tileset_constants.asm)
	table_width TILESET_LENGTH, Tilesets
	tileset Tileset0
	tileset TilesetKanto
	tileset TilesetKantoExtra
	tileset TilesetHouse
	tileset TilesetTraditionalHouse
	tileset TilesetBillsHouse
	tileset TilesetPlayersHouse
	tileset TilesetPlayersRoom
	tileset TilesetPokecenter
	tileset TilesetPokeComCenter
	tileset TilesetMart
	tileset TilesetGate
	tileset TilesetCave
	tileset TilesetDarkCave
	tileset TilesetIcePath
	tileset TilesetForest
	tileset TilesetPark
	tileset TilesetTower
	tileset TilesetRadioTower
	tileset TilesetLab
	tileset TilesetFacility
	tileset TilesetUnderground
	tileset TilesetGameCorner
	tileset TilesetTrainStation
	tileset TilesetPort
	tileset TilesetLighthouse
	tileset TilesetEliteFourRoom
	tileset TilesetChampionsRoom
	tileset TilesetMansion
	tileset TilesetMuseum
	tileset TilesetSpinners
	tileset TilesetRuinsOfAlph
	tileset TilesetKabutoWordRoom
	tileset TilesetOmanyteWordRoom
	tileset TilesetAerodactylWordRoom
	tileset TilesetHoOhWordRoom
	tileset TilesetViridianGym
	tileset TilesetOlivineGym
	tileset TilesetBattleTowerInside
	tileset TilesetBattleTowerOutside
	tileset TilesetJohto
	tileset TilesetJohtoCherry
	tileset TilesetJohtoBurned
	tileset TilesetJohtoBeach
	tileset TilesetJohtoDesert
	tileset TilesetJohtoModern
	assert_table_length NUM_TILESETS + 1
