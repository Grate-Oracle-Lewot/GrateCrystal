INCLUDE "gfx/font.asm"

EnableHDMAForGraphics:
	db FALSE

_LoadStandardFont::
	ld a, [wFontType]
	cp FONT_2
	jr z, .font_2
	cp FONT_3
	jr z, .font_3
	cp FONT_4
	jr z, .font_4

; .font_1
	ld de, Font0
	ld hl, vTiles1
	lb bc, BANK(Fonts), 32 ; "A" to "]"
	call Get1bppViaHDMA
	ld de, Font0 + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Fonts), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bppViaHDMA
	ld de, Font0 + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Fonts), 32 ; $c0 to "←"
	call Get1bppViaHDMA
	ld de, Font0 + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Fonts), 32 ; "'" to "9"
	jp Get1bppViaHDMA

.font_2
	ld de, Font1
	ld hl, vTiles1
	lb bc, BANK(Fonts), 32 ; "A" to "]"
	call Get1bppViaHDMA
	ld de, Font1 + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Fonts), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bppViaHDMA
	ld de, Font1 + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Fonts), 32 ; $c0 to "←"
	call Get1bppViaHDMA
	ld de, Font1 + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Fonts), 32 ; "'" to "9"
	jp Get1bppViaHDMA

.font_3
	ld de, Font2
	ld hl, vTiles1
	lb bc, BANK(Fonts), 32 ; "A" to "]"
	call Get1bppViaHDMA
	ld de, Font2 + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Fonts), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bppViaHDMA
	ld de, Font2 + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Fonts), 32 ; $c0 to "←"
	call Get1bppViaHDMA
	ld de, Font2 + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Fonts), 32 ; "'" to "9"
	jp Get1bppViaHDMA

.font_4
	ld de, Font3
	ld hl, vTiles1
	lb bc, BANK(Fonts), 32 ; "A" to "]"
	call Get1bppViaHDMA
	ld de, Font3 + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Fonts), 26 ; "a" to "z" (skip "┌" to "┘")
	call Get1bppViaHDMA
	ld de, Font3 + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Fonts), 32 ; $c0 to "←"
	call Get1bppViaHDMA
	ld de, Font3 + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Fonts), 32 ; "'" to "9"
	jp Get1bppViaHDMA

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 25
	call Get2bppViaHDMA
	; fallthrough

_LoadFontsExtra1::
LoadFrame:
	ld a, [wTextboxFrame]
	maskbits NUM_FRAMES
	ld bc, TEXTBOX_FRAME_TILES * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles0 tile "┌" ; $ba
	lb bc, BANK(Frames), TEXTBOX_FRAME_TILES ; "┌" to "┘"
	call Get1bppViaHDMA
	ld hl, vTiles2 tile " " ; $7f
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	jp Get1bppViaHDMA

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 12
	call Get2bppViaHDMA
	ld hl, vTiles2 tile $70
	ld de, FontBattleExtra + 16 tiles ; "<DO>"
	lb bc, BANK(FontBattleExtra), 3 ; "<DO>" to "『"
	call Get2bppViaHDMA
	call LoadFrame
	; fallthrough

LoadHPBar:
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	call Get2bppViaHDMA
	ld de, MobilePhoneTilesGFX + 7 tiles ; mobile phone icon
	ld hl, vTiles2 tile $5e
	lb bc, BANK(MobilePhoneTilesGFX), 2
	jp Get2bppViaHDMA

StatsScreen_LoadFont:
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, vTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bppViaHDMA
	; fallthrough

LoadStatsScreenPageTilesGFX:
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), 17
	jp Get2bppViaHDMA
