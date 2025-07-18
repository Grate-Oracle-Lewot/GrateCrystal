; Replaces the functionality of sgb.asm to work with CGB hardware.

CheckCGB:
	ldh a, [hCGB]
	and a
SetDefaultBattlePalette: ; placeholder in lieu of dynamic palette system
	ret

LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_DEFAULT
	jr nz, .not_default
	ld a, [wDefaultSGBLayout]
.not_default
	cp SCGB_PARTY_MENU_HP_BARS
	jp z, CGB_ApplyPartyMenuHPPals
	call ResetBGPals
	ld l, a
	ld h, 0
	add hl, hl
	ld de, CGBLayoutJumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	push de
	jp hl
.done:
	ret

CGBLayoutJumptable:
; entries correspond to SCGB_* constants (see constants/scgb_constants.asm)
	table_width 2, CGBLayoutJumptable
	dw _CGB_BattleGrayscale
	dw _CGB_BattleColors
	dw _CGB_PokegearPals
	dw _CGB_StatsScreenHPPals
	dw _CGB_Pokedex
	dw _CGB_Pokedex_EvoPage
	dw _CGB_Pokedex_PicsPage
	dw _CGB_SlotMachine
	dw _CGB_Diploma
	dw _CGB_MapPals
	dw _CGB_PartyMenu
	dw _CGB_Evolution
	dw _CGB_MoveList
	dw _CGB_PokedexSearchOption
	dw _CGB_Pokepic
	dw _CGB_MagnetTrain
	dw _CGB_PackPals
	dw _CGB_TrainerCard
	dw _CGB_TrainerCardKanto
	dw _CGB_PokedexUnownMode
	dw _CGB_BillsPC
	dw _CGB_UnownPuzzle
	dw _CGB_GamefreakLogo
	dw _CGB_PlayerOrMonFrontpicPals
	dw _CGB_TradeTube
	dw _CGB_TrainerOrMonFrontpicPals
	dw _CGB_MysteryGift
	assert_table_length NUM_SCGB_LAYOUTS

_CGB_BattleGrayscale:
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1 palette PAL_BATTLE_BG_EXP
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wOBPals1
	ld c, 2
	call CopyPalettes
	jr _CGB_FinishBattleScreenLayout

_CGB_BattleColors:
	ld de, wBGPals1
	call GetBattlemonBackpicPalettePointer
	push hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER
	call GetEnemyFrontpicPalettePointer
	push hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY
	ld a, [wEnemyHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY_HP
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER_HP
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_EXP
	ld de, wOBPals1
	pop hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_OB_ENEMY
	pop hl
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_OB_PLAYER
	ld a, SCGB_BATTLE_COLORS
	ld [wDefaultSGBLayout], a
	call ApplyPals
	; fallthrough

_CGB_FinishBattleScreenLayout:
	call InitPartyMenuBGPal7
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call ByteFill
	hlcoord 0, 4, wAttrmap
	lb bc, 8, 10
	ld a, PAL_BATTLE_BG_PLAYER
	call FillBoxCGB
	hlcoord 10, 0, wAttrmap
	lb bc, 7, 10
	ld a, PAL_BATTLE_BG_ENEMY
	call FillBoxCGB
	hlcoord 0, 0, wAttrmap
	lb bc, 4, 10
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call FillBoxCGB
	hlcoord 10, 7, wAttrmap
	lb bc, 5, 10
	ld a, PAL_BATTLE_BG_PLAYER_HP
	call FillBoxCGB
	hlcoord 10, 11, wAttrmap
	lb bc, 1, 9
	ld a, PAL_BATTLE_BG_EXP
	call FillBoxCGB
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	call ByteFill
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	jp ApplyAttrmap

InitPartyMenuBGPal7:
	farcall Function100dc0
	; fallthrough

Mobile_InitPartyMenuBGPal7:
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

InitPartyMenuBGPal0:
	farcall Function100dc0
	ld hl, PartyMenuBGPalette
	jr nc, .not_mobile
	ld hl, PartyMenuBGMobilePalette
.not_mobile
	ld de, wBGPals1 palette 0
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM

_CGB_PokegearPals:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld hl, FemalePokegearPals
	jr .got_pals

.male
	ld hl, MalePokegearPals
.got_pals
	ld de, wBGPals1
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld de, wBGPals1 palette 6
	ld a, PREDEFPAL_POKEGEAR_TOD_ICONS
	call GetPredefPal
	call LoadHLPaletteIntoDE

	hlcoord 10, 1, wAttrmap
	ld bc, 1 ; 1 tile
	ld a, 0 ; palette 0
	set 5, a ; flip on y axis
	call ByteFill

	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_StatsScreenHPPals:
	ld de, wBGPals1
	ld a, [wCurHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; hp palette
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black ; mon palette
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; exp palette
	ld hl, StatsScreenPagePals
	ld de, wBGPals1 palette 3
	ld bc, 4 palettes ; pink, green, blue, and orange page palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrmap

	hlcoord 0, 0, wAttrmap
	lb bc, 8, SCREEN_WIDTH
	ld a, $1 ; mon palette
	call FillBoxCGB

	hlcoord 10, 16, wAttrmap
	ld bc, 10
	ld a, $2 ; exp palette
	call ByteFill

	hlcoord 11, 5, wAttrmap
	lb bc, 2, 2
	ld a, $3 ; pink page palette
	call FillBoxCGB

	hlcoord 13, 5, wAttrmap
	lb bc, 2, 2
	ld a, $4 ; green page palette
	call FillBoxCGB

	hlcoord 15, 5, wAttrmap
	lb bc, 2, 2
	ld a, $5 ; blue page palette
	call FillBoxCGB

	hlcoord 17, 5, wAttrmap
	lb bc, 2, 2
	ld a, $6 ; orange page palette
	call FillBoxCGB

	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

StatsScreenPagePals:
INCLUDE "gfx/stats/pages.pal"

StatsScreenPals:
INCLUDE "gfx/stats/stats.pal"

_CGB_Pokedex:
	ld de, wBGPals1
	; ld a, PREDEFPAL_POKEDEX
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld hl, PokedexQuestionMarkPalette
	call LoadHLPaletteIntoDE ; green question mark palette
	jr .got_palette

.is_pokemon
	call GetMonPalettePointer
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	inc hl
	inc hl
	inc hl
	inc hl
.not_shiny
	call LoadPalette_White_Col1_Col2_Black ; mon palette

; black background for Pal 7
	ld de, wBGPals1 palette 7 ; First color slot of Pal 7	
	call LoadSingleBlackPal ; loads black into slot 1 of pal 7, since it is normally white but pokedex has black background
; mon type 1	
	ld a, [wTempSpecies]
	ld [wCurSpecies], a	
	call GetBaseData
	ld a, [wBaseType1]
	ld c, a ; farcall will clobber a for the bank
	predef GetMonTypeIndex
; load the 1st type pal 
	; type index is already in c
	ld de, wBGPals1 palette 7 + 2 ; slot 2 of pal 7
	farcall LoadMonBaseTypePal ; loads type color into slot 2 of pal 7
; mon type 2
	ld a, [wBaseType2]
	ld c, a ; farcall will clobber a for the bank
	ld a, [wBaseType1]
	cp c
	jr z, .same_type	
	predef GetMonTypeIndex
; load the 2nd type pal 
	; type index is already in c
	ld de, wBGPals1 palette 7 + 4 ; slot 3 of pal 7
	farcall LoadMonBaseTypePal ; loads type color into slot 3 of pal 7
	jr .got_palette
.same_type
	ld de, wBGPals1 palette 7 + 4 ; slot 3 of pal 7
	call LoadSingleBlackPal	

.got_palette
	call WipeAttrmap
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; green question mark palette
	call FillBoxCGB

; mon base types
	hlcoord 9, 4, wAttrmap
	lb bc, 1, 8
	ld a, 7 | VRAM_BANK_1 ; mon base type pals ; VRAM 1
	call FillBoxCGB

	call InitPartyMenuOBPals
	ld hl, PokedexCursorPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

; category enclosure + page nums + A >
	hlcoord 18, 5, wAttrmap
	ld bc, 2
	ld a, 0 | VRAM_BANK_1 ; dex pal PREDEFPAL_POKEDEX
	call ByteFill
	hlcoord 18, 7, wAttrmap
	ld bc, 2
	ld a, 0 | VRAM_BANK_1 ; dex pal PREDEFPAL_POKEDEX
	call ByteFill

	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Pokedex_EvoPage:
	call WipeAttrmap

	ld de, wBGPals1
	; ld a, PREDEFPAL_POKEDEX
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette

	ld de, wBGPals1 palette 6
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette	

; main screen within border, vram 1
	hlcoord 1, 1, wAttrmap
	lb bc, 16, 19
	ld a, 0 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; mon slot 1 types
	hlcoord 16, 2, wAttrmap
	lb bc, 2, 4
	ld a, 1 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; mon slot 2 types
	hlcoord 16, 5, wAttrmap
	lb bc, 2, 4
	ld a, 2 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; mon slot 3 types
	hlcoord 16, 8, wAttrmap
	lb bc, 3, 4
	ld a, 3 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; mon slot 4 types
	hlcoord 16, 12, wAttrmap
	lb bc, 3, 4
	ld a, 4 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB
; flip bottom row of sprite icon borders
	hlcoord 1, 4, wAttrmap
	ld bc, 4
	ld a, 0 | Y_FLIP | VRAM_BANK_1 ; VRAM 1
	call ByteFill
	hlcoord 1, 8, wAttrmap
	ld bc, 4
	call ByteFill	
	hlcoord 1, 12, wAttrmap
	ld bc, 4
	call ByteFill	
	hlcoord 1, 16, wAttrmap
	ld bc, 4
	call ByteFill				

	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Pokedex_PicsPage:
	call WipeAttrmap
	ld de, wBGPals1
	; ld a, PREDEFPAL_POKEDEX
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
; pokemon pals
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	inc hl
	inc hl
	inc hl
	inc hl
.not_shiny
	call LoadPalette_White_Col1_Col2_Black ; mon palette
; secondary pokedex pal
	ld de, wBGPals1 palette 6
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette	
	
	ld de, wBGPals1 palette 6
	call LoadSingleBlackPal
; black background
	ld de, wBGPals1 palette 7	
	call LoadSingleBlackPal

; animated front pic
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, 1 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; back pic
	hlcoord 11, 2, wAttrmap
	lb bc, 6, 6
	ld a, 1 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; sprite box border
	hlcoord 1, 13, wAttrmap
	lb bc, 4, 4
	ld a, 0 | VRAM_BANK_1 ; VRAM 1
	call FillBoxCGB

; page/up down arrows
	hlcoord 9, 0, wAttrmap
	ld [hl], 0 ; remove VRAM 1 bit
	hlcoord 19, 0, wAttrmap
	ld [hl], 0 ; remove VRAM 1 bit

; animated icon, upper right corner fix
	hlcoord 4, 13, wAttrmap
	ld [hl], 0 | X_FLIP | VRAM_BANK_1
; animated icon, lower right corner fix
	hlcoord 4, 16, wAttrmap
	ld [hl], 0 | X_FLIP | Y_FLIP | VRAM_BANK_1
; animated icon, lower left corner fix
	hlcoord 1, 16, wAttrmap
	ld [hl], 0 | Y_FLIP | VRAM_BANK_1		
; sprite border right side
	hlcoord 4, 14, wAttrmap
	ld [hl], 0 | X_FLIP | VRAM_BANK_1
	hlcoord 4, 15, wAttrmap
	ld [hl], 0 | X_FLIP | VRAM_BANK_1
; page bottom border row, bottom of sprite border	
	hlcoord 2, 16, wAttrmap
	ld bc, 2
	ld a, 0 | Y_FLIP | VRAM_BANK_1
	call ByteFill

	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

CheckPokedexColor:
	ld a, [wCurPokedexColor]
	cp DEXCOLOR_BLUE
	jr nz, .Yellow
	ld a, PREDEFPAL_TRADE_TUBE
	ret

.Yellow
	cp DEXCOLOR_YELLOW
	jr nz, .Purple
	ld a, PREDEFPAL_RB_YELLOWMON
	ret

.Purple
	cp DEXCOLOR_PURPLE
	jr nz, .Orange
	ld a, PREDEFPAL_47
	ret

.Orange
	cp DEXCOLOR_ORANGE
	jr nz, .Green
	ld a, PREDEFPAL_BETA_POKEGEAR
	ret

.Green
	cp DEXCOLOR_GREEN
	jr nz, .Pink
	ld a, PREDEFPAL_RB_GREENMON
	ret

.Pink
	cp DEXCOLOR_PINK
	jr nz, .Cyan
	ld a, PREDEFPAL_RB_PINKMON
	ret

.Cyan
	cp DEXCOLOR_CYAN
	jr nz, .Lilac
	ld a, PREDEFPAL_RB_CYANMON
	ret

.Lilac
	cp DEXCOLOR_LILAC
	jr nz, .Lime
	ld a, PREDEFPAL_RB_PURPLEMON
	ret

.Lime
	cp DEXCOLOR_LIME
	jr nz, .Brown
	ld a, PREDEFPAL_BETA_INTRO_VENUSAUR
	ret

.Brown
	cp DEXCOLOR_BROWN
	jr nz, .Black
	ld a, PREDEFPAL_RB_BROWNMON
	ret

.Black
	cp DEXCOLOR_BLACK
	jr nz, .Gray
	ld a, PREDEFPAL_BLACKOUT
	ret

.Gray
	cp DEXCOLOR_GRAY
	jr nz, .White
	ld a, PREDEFPAL_CGB_BADGE
	ret

.White
	cp DEXCOLOR_WHITE
	jr nz, .Red
	ld a, PREDEFPAL_BETA_RADIO
	ret

.Red
	ld a, PREDEFPAL_POKEDEX
	ret

PokedexQuestionMarkPalette:
INCLUDE "gfx/pokedex/question_mark.pal"

PokedexCursorPalette:
INCLUDE "gfx/pokedex/cursor.pal"

_CGB_BillsPC:
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .GetMonPalette
	ld hl, BillsPCOrangePalette
	call LoadHLPaletteIntoDE
	jr .GotPalette

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
.GotPalette:
	call WipeAttrmap
	hlcoord 1, 4, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; mon palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

BillsPCOrangePalette:
INCLUDE "gfx/pc/orange.pal"

_CGB_PokedexUnownMode:
	ld de, wBGPals1
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	hlcoord 7, 5, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; mon palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_SlotMachine:
	ld hl, SlotMachinePals
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrmap
	hlcoord 0, 2, wAttrmap
	lb bc, 10, 3
	ld a, $2 ; "3" palette
	call FillBoxCGB
	hlcoord 17, 2, wAttrmap
	lb bc, 10, 3
	ld a, $2 ; "3" palette
	call FillBoxCGB
	hlcoord 0, 4, wAttrmap
	lb bc, 6, 3
	ld a, $3 ; "2" palette
	call FillBoxCGB
	hlcoord 17, 4, wAttrmap
	lb bc, 6, 3
	ld a, $3 ; "2" palette
	call FillBoxCGB
	hlcoord 0, 6, wAttrmap
	lb bc, 2, 3
	ld a, $4 ; "1" palette
	call FillBoxCGB
	hlcoord 17, 6, wAttrmap
	lb bc, 2, 3
	ld a, $4 ; "1" palette
	call FillBoxCGB
	hlcoord 4, 2, wAttrmap
	lb bc, 2, 12
	ld a, $1 ; Vileplume palette
	call FillBoxCGB
	hlcoord 3, 2, wAttrmap
	lb bc, 10, 1
	ld a, $1 ; lights palette
	call FillBoxCGB
	hlcoord 16, 2, wAttrmap
	lb bc, 10, 1
	ld a, $1 ; lights palette
	call FillBoxCGB
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7 ; text palette
	call ByteFill
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_Diploma:
	ld hl, DiplomaPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrmap
	jp ApplyAttrmap

_CGB_MapPals:
	call LoadMapPals
	ld a, SCGB_MAPPALS
	ld [wDefaultSGBLayout], a
	ret

_CGB_PartyMenu:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuBGPal0
	call InitPartyMenuBGPal7
	call InitPartyMenuOBPals
	jp ApplyAttrmap

_CGB_Evolution:
	ld de, wBGPals1
	ld a, c
	and a
	jr z, .pokemon
	ld a, PREDEFPAL_BLACKOUT
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jr .got_palette

.pokemon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.got_palette
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PREDEFPAL_UNOWN_PUZZLE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals1
	ld a, LOW(palred 31 + palgreen 0 + palblue 0)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 0 + palblue 0)
	ld [hl], a
	pop af
	ldh [rSVBK], a
	call WipeAttrmap
	jp ApplyAttrmap

_CGB_TrainerCard:
	ld de, wBGPals1
	xor a ; CHRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BUGSY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, WHITNEY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, MORTY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, CHUCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, JASMINE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, PRYCE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, .BadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; chris
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; chris
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB
	hlcoord 3, 10, wAttrmap
	lb bc, 3, 3
	ld a, $1 ; falkner
	call FillBoxCGB
	hlcoord 7, 10, wAttrmap
	lb bc, 3, 3
	ld a, $2 ; bugsy
	call FillBoxCGB
	hlcoord 11, 10, wAttrmap
	lb bc, 3, 3
	ld a, $3 ; whitney
	call FillBoxCGB
	hlcoord 15, 10, wAttrmap
	lb bc, 3, 3
	ld a, $4 ; morty
	call FillBoxCGB
	hlcoord 3, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; chuck
	call FillBoxCGB
	hlcoord 7, 13, wAttrmap
	lb bc, 3, 3
	ld a, $6 ; jasmine
	call FillBoxCGB
	hlcoord 11, 13, wAttrmap
	lb bc, 3, 3
	ld a, $7 ; pryce
	call FillBoxCGB
	; clair uses kris's palette
	ld a, [wPlayerGender]
	and a
	push af
	jr z, .got_gender3
	hlcoord 15, 13, wAttrmap
	lb bc, 3, 3
	ld a, $1
	call FillBoxCGB
	; top-right corner still uses the border's palette
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; Kris (F)
	jr z, .got_gender3
	ld a, $0 ; Chris (M)
.got_gender3
	pop af
	ld c, $0
	jr nz, .got_gender4
	inc c
.got_gender4
	ld a, c
	hlcoord 18, 1, wAttrmap
	ld [hl], a
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.BadgePalettes:
INCLUDE "gfx/trainer_card/johto_badges.pal"

_CGB_TrainerCardKanto:
	ld de, wBGPals1
	xor a ; CHRIS & MISTY
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, FALKNER ; KRIS
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BROCK
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, LT_SURGE ; ERIKA
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, JANINE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, SABRINA
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BLAINE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld a, BLUE
	call GetTrainerPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, .BadgePalettes
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	; fill screen with opposite-gender palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; kris
	jr z, .got_gender
	ld a, $0 ; chris
.got_gender
	call ByteFill
	; fill trainer sprite area with same-gender palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, [wPlayerGender]
	and a
	ld a, $0 ; chris
	jr z, .got_gender2
	ld a, $1 ; kris
.got_gender2
	call FillBoxCGB
	hlcoord 3, 10, wAttrmap
	lb bc, 3, 3
	ld a, $2 ; brock
	call FillBoxCGB
	hlcoord 7, 10, wAttrmap
	lb bc, 3, 3
	ld a, $0 ; misty / chris
	call FillBoxCGB
	hlcoord 11, 10, wAttrmap
	lb bc, 3, 3
	ld a, $3 ; lt.surge / erika
	call FillBoxCGB
	hlcoord 15, 10, wAttrmap
	lb bc, 3, 3
	ld a, $3 ; erika / lt.surge
	call FillBoxCGB
	hlcoord 3, 13, wAttrmap
	lb bc, 3, 3
	ld a, $4 ; janine
	call FillBoxCGB
	hlcoord 7, 13, wAttrmap
	lb bc, 3, 3
	ld a, $5 ; Sabrina
	call FillBoxCGB
	hlcoord 11, 13, wAttrmap
	lb bc, 3, 3
	ld a, $6 ; blaine
	call FillBoxCGB
	hlcoord 15, 13, wAttrmap
	lb bc, 3, 3
	ld a, $7 ; Blue
	call FillBoxCGB
	; top-right corner still uses the border's palette
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; Kris (F)
	jr z, .got_gender3
	ld a, $0 ; Chris (M)
.got_gender3
	hlcoord 18, 1, wAttrmap
	ld [hl], a
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.BadgePalettes:
INCLUDE "gfx/trainer_card/kanto_badges.pal"

_CGB_MoveList:
	ld de, wBGPals1
	ld a, PREDEFPAL_GOLDENROD
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	hlcoord 11, 1, wAttrmap
	lb bc, 2, 9
	ld a, $1
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_PokedexSearchOption:
	ld de, wBGPals1
	call CheckPokedexColor
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_PackPals:
; pack pals
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .tutorial_male

	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .tutorial_male

	ld hl, .KrisPackPals
	jr .got_gender

.tutorial_male
	ld hl, .ChrisPackPals

.got_gender
	ld de, wBGPals1
	ld bc, 8 palettes ; 6 palettes?
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call WipeAttrmap
	hlcoord 0, 0, wAttrmap
	lb bc, 1, 10
	ld a, $1
	call FillBoxCGB
	hlcoord 10, 0, wAttrmap
	lb bc, 1, 10
	ld a, $2
	call FillBoxCGB
	hlcoord 7, 2, wAttrmap
	lb bc, 9, 1
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 7, wAttrmap
	lb bc, 3, 5
	ld a, $4
	call FillBoxCGB
	hlcoord 0, 3, wAttrmap
	lb bc, 3, 5
	ld a, $5
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.ChrisPackPals:
INCLUDE "gfx/pack/pack.pal"

.KrisPackPals:
INCLUDE "gfx/pack/pack_f.pal"

_CGB_Pokepic:
	call _CGB_MapPals
	ld de, SCREEN_WIDTH
	hlcoord 0, 0, wAttrmap
	ld a, [wMenuBorderTopCoord]
.loop
	and a
	jr z, .found_top
	dec a
	add hl, de
	jr .loop

.found_top
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, PAL_BG_GRAY
	call FillBoxCGB
	jp ApplyAttrmap

_CGB_MagnetTrain: ; unused placeholder to match up with SGB set
	ld hl, PalPacket_MagnetTrain + 1
	call CopyFourPalettes
	call WipeAttrmap
	hlcoord 0, 4, wAttrmap
	lb bc, 10, SCREEN_WIDTH
	ld a, PAL_BG_GREEN
	call FillBoxCGB
	hlcoord 0, 6, wAttrmap
	lb bc, 6, SCREEN_WIDTH
	ld a, PAL_BG_RED
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

_CGB_GamefreakLogo:
	ld de, wBGPals1
	ld a, PREDEFPAL_GAMEFREAK_LOGO_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld hl, .GamefreakDittoPalette
	ld de, wOBPals1
	call LoadHLPaletteIntoDE
	ld hl, .GamefreakDittoPalette
	ld de, wOBPals1 palette 1
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	jp ApplyPals

.GamefreakDittoPalette:
INCLUDE "gfx/splash/ditto.pal"

_CGB_PlayerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	jp ApplyPals

_CGB_TradeTube:
	ld hl, PalPacket_TradeTube + 1
	call CopyFourPalettes
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld de, wOBPals1 palette 7
	ld a, PREDEFPAL_TRADE_TUBE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jp WipeAttrmap

_CGB_TrainerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	jp ApplyPals

_CGB_MysteryGift:
	ld hl, .MysteryGiftPalettes
	ld de, wBGPals1
	ld bc, 2 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	hlcoord 3, 7, wAttrmap
	lb bc, 8, 14
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 5, wAttrmap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 16, wAttrmap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 0, wAttrmap
	lb bc, 17, 2
	ld a, $1
	call FillBoxCGB
	hlcoord 18, 5, wAttrmap
	lb bc, 12, 1
	ld a, $1
	call FillBoxCGB
	jp ApplyAttrmap

.MysteryGiftPalettes:
INCLUDE "gfx/mystery_gift/mystery_gift.pal"

.MysteryGiftPalette:
INCLUDE "gfx/mystery_gift/gs_mystery_gift.pal"
