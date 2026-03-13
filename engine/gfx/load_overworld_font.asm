LoadOverworldFont::
	ld a, [wFontType]
	cp FONT_2
	jr z, .font_2
	cp FONT_3
	jr z, .font_3
	cp FONT_4
	jr z, .font_4
	ld de, .OverworldFont0GFX
	jr .finish

.font_2
	ld de, .OverworldFont1GFX
	jr .finish

.font_3
	ld de, .OverworldFont2GFX
	jr .finish

.font_4
	ld de, .OverworldFont3GFX
.finish
	ld hl, vTiles1
	lb bc, BANK(.OverworldFontGFX), $80
	call Get2bpp
	ld de, .OverworldFontSpaceGFX
	ld hl, vTiles2 tile " "
	lb bc, BANK(.OverworldFontSpaceGFX), 1
	jp Get2bpp

.OverworldFont0GFX:
INCBIN "gfx/font/overworld0.2bpp"

.OverworldFont1GFX:
INCBIN "gfx/font/overworld1.2bpp"

.OverworldFont2GFX:
INCBIN "gfx/font/overworld2.2bpp"

.OverworldFont3GFX:
INCBIN "gfx/font/overworld3.2bpp"

.OverworldFontSpaceGFX:
INCBIN "gfx/font/overworld_space.2bpp"
