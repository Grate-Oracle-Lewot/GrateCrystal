INCLUDE "engine/gfx/sgb_layouts.asm"

SHINY_ATK_BIT EQU 5
SHINY_DEF_VAL EQU 15
SHINY_SPD_VAL EQU 15
SHINY_SPC_VAL EQU 15

CheckShininess:
; Check if a mon is shiny by DVs at bc.
; Return carry if shiny.

	ld l, c
	ld h, b

; Attack
	ld a, [hl]
	and 1 << SHINY_ATK_BIT
	jr z, .not_shiny

; Defense
	ld a, [hli]
	and $f
	cp  SHINY_DEF_VAL
	jr nz, .not_shiny

; Speed
	ld a, [hl]
	and $f0
	cp  SHINY_SPD_VAL << 4
	jr nz, .not_shiny

; Special
	ld a, [hl]
	and $f
	cp  SHINY_SPC_VAL
	jr nz, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret

Unused_CheckShininess:
; Return carry if the DVs at hl are all 10 or higher.

; Attack
	ld a, [hl]
	cp 10 << 4
	jr c, .not_shiny

; Defense
	ld a, [hli]
	and $f
	cp 10
	jr c, .not_shiny

; Speed
	ld a, [hl]
	cp 10 << 4
	jr c, .not_shiny

; Special
	ld a, [hl]
	and $f
	cp 10
	jr c, .not_shiny

; shiny
	scf
	ret

.not_shiny
	and a
	ret

InitPartyMenuPalettes:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuOBPals
	jp WipeAttrmap

; SGB layout for SCGB_PARTY_MENU_HP_BARS
SGB_ApplyPartyMenuHPPals:
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, $5
	jr z, .okay
	dec a
	ld e, $a
	jr z, .okay
	ld e, $f
.okay
	push de
	ld hl, wSGBPals + 10
	ld bc, $6
	ld a, [wSGBPals]
	call AddNTimes
	pop de
	ld [hl], e
	ret

LoadTrainerClassPaletteAsNthBGPal:
	ld a, [wTrainerClass]
	call GetTrainerPalettePointer
	ld a, e
	jr LoadNthMiddleBGPal

LoadMonPaletteAsNthBGPal:
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	ld a, e
	bit 7, a
	jr z, LoadNthMiddleBGPal
	and $7f
	inc hl
	inc hl
	inc hl
	inc hl

LoadNthMiddleBGPal:
	push hl
	ld hl, wBGPals1
	ld de, 1 palettes
.loop
	and a
	jr z, .got_addr
	add hl, de
	dec a
	jr .loop

.got_addr
	ld e, l
	ld d, h
	pop hl
	jp LoadPalette_White_Col1_Col2_Black

ApplyMonOrTrainerPals:
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .get_trainer
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	jr .load_palettes

.get_trainer
	ld a, [wTrainerClass]
	call GetTrainerPalettePointer

.load_palettes
	ld de, wBGPals1
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	call ApplyAttrmap
	jp ApplyPals

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, wBGPals2 palette PAL_BATTLE_BG_ENEMY_HP color 1
	jr .okay

.Player:
	ld de, wBGPals2 palette PAL_BATTLE_BG_PLAYER_HP color 1

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	ld bc, 4
	ld a, BANK(wBGPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	jp FillBoxCGB

LoadStatsScreenPals:
	call CheckCGB
	ret z
	ld hl, StatsScreenPals
	ld b, 0
	add hl, bc
	add hl, bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, [hli]
	ld [wBGPals1 palette 0], a
	ld [wBGPals1 palette 2], a
	ld a, [hl]
	ld [wBGPals1 palette 0 + 1], a
	ld [wBGPals1 palette 2 + 1], a
	pop af
	ldh [rSVBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	call CheckCGB
	jr nz, .cgb
	push hl
	ld hl, PalPacket_Pal01
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hli]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	call PushSGBPals
	ld hl, BlkPacket_AllPal0
	jp PushSGBPals

.cgb
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrmap
	jp ApplyAttrmap

.MailPals:
INCLUDE "gfx/mail/mail.pal"

INCLUDE "engine/gfx/cgb_layouts.asm"

CopyFourPalettes:
	ld de, wBGPals1
	ld c, 4

CopyPalettes:
.loop
	push bc
	ld a, [hli]
	push hl
	call GetPredefPal
	call LoadHLPaletteIntoDE
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetPredefPal:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PredefPals
	add hl, bc
	ret

LoadHLPaletteIntoDE:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld c, 1 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld a, LOW(PALRGB_WHITE)
	ld [de], a
	inc de
	ld a, HIGH(PALRGB_WHITE)
	ld [de], a
	inc de

	ld c, 2 * PAL_COLOR_SIZE
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ldh [rSVBK], a
	ret

FillBoxCGB:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, wBGPals1
	ld c, 1 palettes
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ldh [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

WipeAttrmap:
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	jp ByteFill

ApplyPals:
	ld hl, wBGPals1
	ld de, wBGPals2
	ld bc, 16 palettes
	ld a, BANK(wGBCPalettes)
	jp FarCopyWRAM

ApplyAttrmap:
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .UpdateVBank1
	ldh a, [hBGMapMode]
	push af
	ld a, $2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	ret

.UpdateVBank1:
	hlcoord 0, 0, wAttrmap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, $1
	ldh [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	ld a, $0
	ldh [rVBK], a
	ret

; CGB layout for SCGB_PARTY_MENU_HP_BARS
CGB_ApplyPartyMenuHPPals:
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, wAttrmap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wSGBPals]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	jp FillBoxCGB

InitPartyMenuOBPals:
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	jp FarCopyWRAM

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	push de
	farcall GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [wTempEnemyMonSpecies]
	call GetFrontpicPalettePointer
	pop de
	ret

GetPlayerOrMonPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [wPlayerSpriteSetupFlags]
	bit PLAYERSPRITESETUP_FEMALE_TO_MALE_F, a
	jr nz, .male
	ld a, [wPlayerGender]
	and a
	jr z, .male
	ld hl, KrisPalette
	ret

.male
	ld hl, PlayerPalette
	ret

GetFrontpicPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [wTrainerClass]

GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

BattleObjectPals:
INCLUDE "gfx/battle_anims/battle_anims.pal"

GetMonPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

GetMonNormalOrShinyPalettePointer:
	push bc
	call GetMonPalettePointer
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr
	ret

PushSGBPals:
	ld a, [wJoypadDisable]
	push af
	set JOYPAD_DISABLE_SGB_TRANSFER_F, a
	ld [wJoypadDisable], a
	call _PushSGBPals
	pop af
	ld [wJoypadDisable], a
	ret

_PushSGBPals:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.loop2
	ld e, $8
	ld a, [hli]
	ld d, a
.loop3
	bit 0, d
	ld a, $10
	jr nz, .okay
	ld a, $20
.okay
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .loop3
	dec b
	jr nz, .loop2
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	call SGBDelayCycles
	pop bc
	dec b
	jr nz, .loop
	ret

InitSGBBorder:
	call CheckCGB
	ret nz

; SGB/DMG only
	di
	ld a, [wJoypadDisable]
	push af
	set JOYPAD_DISABLE_SGB_TRANSFER_F, a
	ld [wJoypadDisable], a

	xor a
	ldh [rJOYP], a
	ldh [hSGB], a
	call PushSGBBorderPalsAndWait
	jr nc, .skip
	ld a, $1
	ldh [hSGB], a
	call _InitSGBBorderPals
	call SGBBorder_PushBGPals
	call SGBDelayCycles
	call SGB_ClearVRAM
	call PushSGBBorder
	call SGBDelayCycles
	call SGB_ClearVRAM
	ld hl, MaskEnCancelPacket
	call _PushSGBPals

.skip
	pop af
	ld [wJoypadDisable], a
	ei
	ret

InitCGBPals::
	call CheckCGB
	ret z

; CGB only
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	ld hl, vTiles3
	ld bc, $200 tiles
	xor a
	call ByteFill
	ld a, BANK(vTiles0)
	ldh [rVBK], a
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld c, 4 * 8
.bgpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rBGPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld c, 4 * 8
.obpals_loop
	ld a, LOW(PALRGB_WHITE)
	ldh [rOBPD], a
	ld a, HIGH(PALRGB_WHITE)
	ldh [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals1
	call .LoadWhitePals
	ld hl, wBGPals2
	call .LoadWhitePals
	pop af
	ldh [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .loop
	ret

_InitSGBBorderPals:
	ld hl, .PacketPointerTable
	ld c, 9
.loop
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call _PushSGBPals
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

.PacketPointerTable:
	dw MaskEnFreezePacket
	dw DataSndPacket1
	dw DataSndPacket2
	dw DataSndPacket3
	dw DataSndPacket4
	dw DataSndPacket5
	dw DataSndPacket6
	dw DataSndPacket7
	dw DataSndPacket8

PushSGBBorder:
	call .LoadSGBBorderPointers
	push de
	call SGBBorder_YetMorePalPushing
	pop hl
	jp SGBBorder_MorePalPushing

.LoadSGBBorderPointers:
	ld hl, SGBBorderGFX
	ld de, SGBBorderMapAndPalettes
	ret

SGB_ClearVRAM:
	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
	xor a
	jp ByteFill

PushSGBBorderPalsAndWait:
	ld hl, MltReq2Packet
	call _PushSGBPals
	call SGBDelayCycles
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ldh [rJOYP], a
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $10
	ldh [rJOYP], a
rept 6
	ldh a, [rJOYP]
endr
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	call .FinalPush
	and a
	ret

.carry
	call .FinalPush
	scf
	ret

.FinalPush:
	ld hl, MltReq1Packet
	call _PushSGBPals
	vc_hook Network_RESET
	jp SGBDelayCycles

SGBBorder_PushBGPals:
	call DisableLCD
	ld a, %11100100
	ldh [rBGP], a
	ld hl, PredefPals
	ld de, vTiles1
	ld bc, $100 tiles
	call CopyData
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, PalTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

SGBBorder_MorePalPushing:
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	ld de, vTiles1
	ld bc, (6 + SCREEN_WIDTH + 6) * 5 * 2
	call CopyData
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld bc, 6 * 2
	call CopyData
	ld bc, SCREEN_WIDTH * 2
	call ClearBytes
	ld bc, 6 * 2
	call CopyData
	pop bc
	dec b
	jr nz, .loop
	ld bc, (6 + SCREEN_WIDTH + 6) * 5 * 2
	call CopyData
	ld bc, $100
	call ClearBytes
	ld bc, 16 palettes
	call CopyData
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, PctTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

SGBBorder_YetMorePalPushing:
	call DisableLCD
	ld a, %11100100
	ldh [rBGP], a
	ld de, vTiles1
	ld b, $80
.loop
	push bc
	ld bc, 1 tiles
	call CopyData
	ld bc, 1 tiles
	call ClearBytes
	pop bc
	dec b
	jr nz, .loop
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, ChrTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

CopyData:
; copy bc bytes of data from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

ClearBytes:
; clear bc bytes of data starting from de
.loop
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

DrawDefaultTiles:
; Draw 240 tiles (2/3 of the screen) from tiles in VRAM
	hlbgcoord 0, 0 ; BG Map 0
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	ld a, $80 ; starting tile
	ld c, 12 + 1
.line
	ld b, 20
.tile
	ld [hli], a
	inc a
	dec b
	jr nz, .tile
; next line
	add hl, de
	dec c
	jr nz, .line
	ret

SGBDelayCycles:
	ld de, 7000
.wait
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .wait
	ret

INCLUDE "gfx/sgb/blk_packets.asm"
INCLUDE "gfx/sgb/pal_packets.asm"
INCLUDE "data/sgb_ctrl_packets.asm"

PredefPals:
	table_width PALETTE_SIZE, PredefPals
INCLUDE "gfx/sgb/predef.pal"
	assert_table_length NUM_PREDEF_PALS

SGBBorderMapAndPalettes:
; interleaved tile ids and palette ids, without the center 20x18 screen area
INCBIN "gfx/sgb/sgb_border.sgb.tilemap"
; four SGB palettes of 16 colors each; only the first 4 colors are used
INCLUDE "gfx/sgb/sgb_border.pal"

SGBBorderGFX:
INCBIN "gfx/sgb/sgb_border.2bpp"

HPBarPals:
INCLUDE "gfx/battle/hp_bar.pal"

ExpBarPalette:
INCLUDE "gfx/battle/exp_bar.pal"

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

LoadMapPals:
	farcall LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wEnvironment]
	and 7
	ld e, a
	ld d, 0
	ld hl, EnvironmentColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals1
	ld b, 8
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ldh [rSVBK], a

.got_pals
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	ret nz
.outside
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp NITE_F
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, wBGPals1 palette PAL_BG_ROOF color 1
	ld bc, 4
	ld a, BANK(wBGPals1)
	call FarCopyWRAM

	; Day Care outdoor palettes
	ld a, [wMapGroup]
	cp GROUP_ROUTE_34
	ret nz

	ld a, [wMapNumber]
	cp MAP_ROUTE_34
	ret nz

	ld a, BANK(wBreedMon1Species)
	ld hl, wBreedMon1Species
	call GetFarWRAMByte
	and a
	jr z, .day_care_mon_2
	ld [wCurPartySpecies], a

	ld hl, wBreedMon1DVs ; HL now points to the params of the wBreedMon1, which is needed by GetMenuMonIconPalette to determine if it's shiny.
	ld de, GetMenuMonIconPalette
	ld a, BANK(GetMenuMonIconPalette)	
	call FarCall_de
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, PartyMenuOBPals
	add hl, de

	inc hl
	inc hl

	ld de, wOBPals1 palette PAL_OW_TREE + 2
	ld bc, 1 palettes - 2
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

.day_care_mon_2
	ld a, BANK(wBreedMon2Species)
	ld hl, wBreedMon2Species
	call GetFarWRAMByte
	and a
	ret z
	ld [wCurPartySpecies], a

	ld hl, wBreedMon2DVs ; HL now points to the params of the wBreedMon2, which is needed by GetMenuMonIconPalette to determine if it's shiny.
	ld de, GetMenuMonIconPalette
	ld a, BANK(GetMenuMonIconPalette)	
	call FarCall_de
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, PartyMenuOBPals
	add hl, de

	inc hl
	inc hl

	ld de, wOBPals1 palette PAL_OW_ROCK + 2
	ld bc, 1 palettes - 2
	ld a, BANK(wOBPals1)
	jp FarCopyWRAM

LoadCPaletteBytesFromHLIntoDE:
	; Loads the number of Palettes passed in 'c' when called
	; Source address is 'hl'
	; Destination address is 'de'
	ldh a, [rSVBK]
	push af
	ld a, BANK("GBC Video")
	ldh [rSVBK], a
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

LoadMonBaseTypePal:
	; destination address of Palette and Slot is passed in 'de'
	; Type Index (already fixed/adjusted if a Special Type) is passed in 'c'
	ld hl, TypeIconPals ; pointer to the Type Colors designated in gfx\types_cats_status_pals.asm
	ld a, c ; c is the Type Index
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 2
	jp FarCopyColorWRAM

LoadDexTypePals:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	ldh [rSVBK], a	

	ld hl, TypeIconPals
	ld a, b
	add a
	push bc
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 2
	push de
	call FarCopyColorWRAM
	pop de

	ld hl, TypeIconPals
	pop bc
	ld a, c
	add a
	ld c, a
	ld b, 0
	add hl, bc
	inc de
	inc de
	ld bc, 2
	push de
	call FarCopyColorWRAM
	pop de
	inc de
	inc de

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	ldh [rSVBK], a
	ret

LoadSingleBlackPal:
	; Destination address of the Palette and Slot is passed in 'de'
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	xor a ; the color black is $0000
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ldh [rSVBK], a
	ret

; Input: E must contain the offset of the selected palette from PartyMenuOBPals.
SetFirstOBJPalette::
	ld hl, PartyMenuOBPals
	ld d, 0
	add hl, de
 	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	ld a, TRUE
 	ldh [hCGBPalUpdate], a
 	jp ApplyPals

INCLUDE "data/maps/environment_colors.asm"

PartyMenuBGMobilePalette:
INCLUDE "gfx/stats/party_menu_bg_mobile.pal"

PartyMenuBGPalette:
INCLUDE "gfx/stats/party_menu_bg.pal"

TilesetBGPalette:
INCLUDE "gfx/tilesets/bg_tiles.pal"

MapObjectPals::
INCLUDE "gfx/overworld/npc_sprites.pal"

RoofPals:
	table_width PAL_COLOR_SIZE * 2 * 2, RoofPals
INCLUDE "gfx/tilesets/roofs.pal"
	assert_table_length NUM_MAP_GROUPS + 1

DiplomaPalettes:
INCLUDE "gfx/diploma/diploma.pal"

PartyMenuOBPals:
INCLUDE "gfx/stats/party_menu_ob.pal"

UnusedGSTitleBGPals:
INCLUDE "gfx/title/unused_gs_bg.pal"

UnusedGSTitleOBPals:
INCLUDE "gfx/title/unused_gs_fg.pal"

MalePokegearPals:
INCLUDE "gfx/pokegear/pokegear.pal"

FemalePokegearPals:
INCLUDE "gfx/pokegear/pokegear_f.pal"

SlotMachinePals:
INCLUDE "gfx/slots/slots.pal"

TypeIconPals:
; NORMAL      (0)
	RGB 21, 21, 14
; FIGHTING    (1)
	RGB 25, 05, 02
; FLYING      (2)
	RGB 22, 17, 30
; POISON      (3)
	RGB 22, 07, 19
; GROUND      (4)
	RGB 29, 24, 12
; ROCK        (5)
	RGB 24, 20, 07
; BUG         (6)
	RGB 21, 23, 06
; GHOST       (7)
	RGB 15, 11, 18
; STEEL       (8)
	RGB 23, 23, 25
; FIRE        (9)
	RGB 31, 15, 04
; WATER      (10)
	RGB 11, 18, 30
; GRASS      (11)
	RGB 11, 25, 11
; ELECTRIC   (12)
	RGB 31, 24, 06
; PSYCHIC_T  (13)
	RGB 31, 09, 15
; ICE        (14)
	RGB 16, 27, 27
; DRAGON     (15)
	RGB 15, 07, 31
; DARK       (16)
	RGB 15, 11, 09
; FAIRY      (17)
	RGB 31, 20, 29
; CURSE_TYPE (18)
	RGB 13, 19, 19

LoadPokemonPalette:
	ld a, [wCurPartySpecies]
	; hl = palette
	call GetMonPalettePointer
	; load palette into de (set by caller)
	ld bc, PAL_COLOR_SIZE * 2
	ld a, BANK(wBGPals1)
	jp FarCopyWRAM
