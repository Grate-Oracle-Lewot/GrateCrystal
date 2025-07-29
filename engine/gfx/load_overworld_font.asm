LoadOverworldFont::
	ld de, .OverworldFontGFX
	ld hl, vTiles1
	lb bc, BANK(.OverworldFontGFX), $80
	call Get2bpp
	ld de, .OverworldFontSpaceGFX
	ld hl, vTiles2 tile " "
	lb bc, BANK(.OverworldFontSpaceGFX), 1
	jp Get2bpp

.OverworldFontGFX:
if DEF(_HEART_FONT)
INCBIN "gfx/font/overworld_heart.2bpp"
else
INCBIN "gfx/font/overworld.2bpp"
endc

.OverworldFontSpaceGFX:
INCBIN "gfx/font/overworld_space.2bpp"
