LinkCommsBorderGFX:
INCBIN "gfx/trade/border_tiles.2bpp"

LoadMobileTradeBorderTilemap:
	ld hl, MobileTradeBorderTilemap
	decoord 0, 0
	ld bc, SCREEN_AREA
	jp CopyBytes

MobileTradeBorderTilemap:
INCBIN "gfx/trade/border_mobile.tilemap"

CableTradeBorderTopTilemap:
INCBIN "gfx/trade/border_cable_top.tilemap"

CableTradeBorderBottomTilemap:
INCBIN "gfx/trade/border_cable_bottom.tilemap"

LinkTextbox2:
	ld h, d
	ld l, e
	push bc
	push hl
	call LinkTextboxPlaceBorder2
	pop hl
	pop bc
	jr LinkTextbox_Optimization

LinkTextbox:
	ld h, d
	ld l, e
	push bc
	push hl
	call LinkTextboxPlaceBorder
	pop hl
	pop bc
	; fallthrough

LinkTextbox_Optimization:
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

LinkTextboxPlaceBorder:
	push hl
	ld a, $30
	ld [hli], a
	inc a
	call LinkTextboxPlaceRow
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $33
	ld [hli], a
	ld a, " "
	call LinkTextboxPlaceRow
	ld [hl], $34
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop

	ld a, $35
	ld [hli], a
	ld a, $36
	call LinkTextboxPlaceRow
	ld [hl], $37
	ret

LinkTextboxPlaceRow:
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

LinkTextboxPlaceBorder2:
	push hl
	ld a, $76
	ld [hli], a
	inc a
	call LinkTextboxPlaceRow
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $79
	ld [hli], a
	ld a, " "
	call LinkTextboxPlaceRow
	ld [hl], $7a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop

	ld a, $7b
	ld [hli], a
	ld a, $7c
	call LinkTextboxPlaceRow
	ld [hl], $7d
	ret

InitTradeSpeciesList:
	call _LoadTradeScreenBorderGFX
	call LoadCableTradeBorderTilemap
	farcall InitMG_Mobile_LinkTradePalMap
	call PlaceTradePartnerNamesAndParty
	hlcoord 10, 17
	ld de, .CancelString
	jp PlaceString

.CancelString:
	db "CANCEL@"

_LoadTradeScreenBorderGFX:
	ld de, LinkCommsBorderGFX
	ld hl, vTiles2
	lb bc, BANK(LinkCommsBorderGFX), 70
	jp Get2bpp

LinkComms_LoadPleaseWaitTextboxBorderGFX:
	ld de, LinkCommsBorderGFX + $30 tiles
	ld hl, vTiles2 tile $76
	lb bc, BANK(LinkCommsBorderGFX), 8
	jp Get2bpp

LoadCableTradeBorderTilemap:
	call LoadMobileTradeBorderTilemap
	ld hl, CableTradeBorderTopTilemap
	decoord 0, 0
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	ld hl, CableTradeBorderBottomTilemap
	decoord 0, 16
	ld bc, 2 * SCREEN_WIDTH
	jp CopyBytes

PrintWaitingTextAndSyncAndExchangeNybble:
	call LoadStandardMenuHeader
	call .PrintWaitingText
	farcall WaitLinkTransfer
	call Call_ExitMenu
	jp WaitBGMap2

.PrintWaitingText:
	hlcoord 4, 10
	ld b, 1
	ld c, 10
	predef LinkTextboxAtHL
	hlcoord 5, 11
	ld de, .Waiting
	call PlaceString
	call WaitBGMap
	call WaitBGMap2
	ld c, 50
	jp DelayFrames

.Waiting:
	db "WAITING..!@"

LinkTradeMenu:
	call .MenuAction

.GetJoypad:
	push bc
	push af
	ldh a, [hJoyLast]
	and D_PAD
	ld b, a
	ldh a, [hJoyPressed]
	and BUTTONS
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ld d, a
	ret

.MenuAction:
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ldh a, [hBGMapMode]
	push af
	call .loop
	pop af
	ldh [hBGMapMode], a
	ret

.loop
	call .UpdateCursor
	call .UpdateBGMapAndOAM
	call .loop2
	ret nc
	farcall _2DMenuInterpretJoypad
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	ret nz
	call .GetJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .loop
	ret

.UpdateBGMapAndOAM:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ret

.loop2
	call UpdateTimeAndPals
	call .TryAnims
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loop2
	and a
	ret

.UpdateCursor:
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $1f
	jr nz, .not_currently_selected
	ld a, [wCursorOffCharacter]
	ld [hl], a
	push hl
	push bc
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld [hl], a
	pop bc
	pop hl

.not_currently_selected
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuCursorOffsets]
	swap a
	and $f
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	dec b
	jr z, .skip
.loop3
	add c
	dec b
	jr nz, .loop3

.skip
	ld c, SCREEN_WIDTH
	call AddNTimes
	ld a, [w2DMenuCursorOffsets]
	and $f
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .skip2
.loop4
	add c
	dec b
	jr nz, .loop4

.skip2
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $1f
	jr z, .cursor_already_there
	ld [wCursorOffCharacter], a
	ld [hl], $1f
	push hl
	push bc
	ld bc, MON_NAME_LENGTH
	add hl, bc
	ld [hl], $1f
	pop bc
	pop hl
.cursor_already_there
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret

.TryAnims:
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .skip_anims
	farcall PlaySpriteAnimationsAndDelayFrame
.skip_anims
	call JoyTextDelay
	call .GetJoypad
	and a
	ret z
	scf
	ret

PlaceTradePartnerNamesAndParty:
	hlcoord 4, 0
	ld de, wPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 4, 8
	ld de, wOTPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, wPartySpecies
	call .PlaceSpeciesNames
	hlcoord 7, 9
	ld de, wOTPartySpecies
.PlaceSpeciesNames:
	ld c, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wNamedObjectIndex], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ldh [hProduct], a
	call GetPokemonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	jr .loop
