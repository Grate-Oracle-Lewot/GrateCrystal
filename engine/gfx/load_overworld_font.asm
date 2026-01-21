LoadOverworldFont::
	ld de, .OverworldUnownFontGFX
	ld a, [wOptions2]
	bit FONT_NORMAL_UNOWN, a
	jr z, .normal
	jr .continue

.normal
	ld de, .OverworldFontGFX
.continue
	ld hl, vTiles1
	lb bc, BANK(.OverworldFontGFX), $80
	call Get2bpp
	ld de, .OverworldFontSpaceGFX
	ld hl, vTiles2 tile " "
	lb bc, BANK(.OverworldFontSpaceGFX), 1
	jp Get2bpp

.OverworldFontGFX:
INCBIN "gfx/font/overworld.2bpp"

.OverworldUnownFontGFX:
INCBIN "gfx/font/unown_speaking_font_overworld.2bpp"

.OverworldFontSpaceGFX:
INCBIN "gfx/font/overworld_space.2bpp"
