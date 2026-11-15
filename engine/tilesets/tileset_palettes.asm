LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion
	cp TILESET_SPINNERS
	jr z, .spinners
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	jr .do_nothing

.house
	call LoadHousePalette
	scf
	ret

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion
	call LoadMansionPalette
	scf
	ret

.spinners
	call LoadSpinnersPalette
	scf
	ret

.battle_tower_inside
	call LoadBattleTowerInsidePalette
	scf
	ret

.do_nothing
	and a
	ret

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	jr LoadEightPalettes

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	jr LoadEightPalettes

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	jr LoadEightPalettes

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	; fallthrough

LoadEightPalettes:
	ld bc, 8 palettes
	jp FarCopyWRAM

LoadSpinnersPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, SpinnersPalette
	jr LoadEightPalettes

LoadBattleTowerInsidePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerInsidePalette
	jr LoadEightPalettes

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	jp FarCopyWRAM

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

SpinnersPalette:
INCLUDE "gfx/tilesets/spinners.pal"

BattleTowerInsidePalette:
INCLUDE "gfx/tilesets/battle_tower_inside.pal"
