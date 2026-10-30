; The Pokegear map's and the Fly map's REMATCH and GIFTS views: an icon for each phone trainer with a
; rematch or an item waiting, in the trainer's overworld sprite and colors, over its home landmark.
;
; There can be more than fit at once, so they page, about a second each (wMapIconTurn): landmarks
; sorted north to south are dealt across the pages in turn, so neighbors land on different pages,
; and trainers sharing a landmark take turns on its page. The player's landmark is on every page,
; its trainers taking turns with the player's own icon.
;
; The icons go straight into OAM after the sprite anim structs' (MapTrainers_Draw), so they need no
; structs or OAM data of their own.

MapTrainers_Place::
; Make the icons for wMapIconView on the region in wMapMonIconRegion, and show the first page. Call
; after the player icon is made and recorded (MapIcons_Add): it's the only icon these views record.
	xor a
	ld [wMapTrainerIconCount], a
	ld [wMapTrainerSpriteCount], a

	ld de, HeldItemIcons tile 1 ; the item tile, after the mail one
	ld hl, vTiles0 tile MAP_TRAINER_ITEM_TILE
	lb bc, BANK(HeldItemIcons), 1
	call Request2bpp
	farcall LoadMapTrainerOBPals

	ld c, 1 ; the first PHONE_* contact
.contacts
	push bc
	call MapTrainers_AddContact
	pop bc
	inc c
	ld a, c
	cp NUM_PHONE_CONTACTS + 1
	jr c, .contacts

	call MapTrainers_Sort
	call MapTrainers_Page
	jmp MapTrainers_ShowTurn

MapTrainers_AddContact:
; in: c = a PHONE_* contact
; Adds its icon if it has what this view shows, on the region being shown.

	; the flag this view shows: the rematch one, or for GIFTS the item one after it
	ld l, c
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, PhoneContactWaitingFlags
	add hl, de
	ld a, [wMapIconView]
	cp MAP_VIEW_GIFTS
	jr nz, .got_flag
	inc hl
	inc hl
.got_flag
	ld a, BANK(PhoneContactWaitingFlags)
	call GetFarWord
	ld a, h
	cp HIGH(-1)
	ret z ; none
	ld d, h
	ld e, l
	push bc
	ld b, CHECK_FLAG
	call EngineFlagAction
	ld a, c
	pop bc
	and a
	ret z

	; its landmark, from its home map
	push bc
	ld a, c
	ld hl, PhoneContacts + PHONE_CONTACT_MAP_GROUP
	ld bc, PHONE_CONTACT_SIZE
	rst AddNTimes
	assert PHONE_CONTACT_MAP_NUMBER == PHONE_CONTACT_MAP_GROUP + 1
	ld a, BANK(PhoneContacts)
	call GetFarWord ; l = the map group, h = the map number
	ld b, l
	ld c, h
	call GetWorldMapLocation
	pop bc
	ld b, a

	; on the region being shown?
	assert JOHTO_REGION == 0 && KANTO_REGION == 1
	cp KANTO_LANDMARK
	sbc a ; -1 for Johto, 0 for Kanto
	inc a ; JOHTO_REGION or KANTO_REGION
	ld hl, wMapMonIconRegion
	cp [hl]
	ret nz

	ld a, [wMapTrainerIconCount]
	cp MAX_MAP_TRAINER_ICONS
	ret nc

	; its sprite and colors
	ld l, c
	ld h, 0
	add hl, hl
	ld de, PhoneContactMapIcons
	add hl, de
	ld a, [hli] ; its sprite
	ld c, [hl] ; its PAL_OW_* colors
	push bc
	call MapTrainers_LoadSprite
	pop bc
	ret c ; no room for another sprite
	push af ; its first tile

	; b = its landmark, c = its colors
	ld e, b
	farcall GetLandmarkCoords ; d = y, e = x
	ld hl, wMapTrainerIconCount
	ld a, [hl]
	inc [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl ; 8 bytes each
	push de
	ld de, wMapTrainerIcons
	add hl, de
	pop de
	assert MAP_TRAINER_ICON_Y == 0 && MAP_TRAINER_ICON_LANDMARK == 1 && MAP_TRAINER_ICON_X == 2 && \
		MAP_TRAINER_ICON_TILE == 3 && MAP_TRAINER_ICON_ATTR == 4
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	pop af
	ld [hli], a
	ld a, c
	add MAP_TRAINER_FIRST_PAL
	ld [hl], a
	ret

MapTrainers_LoadSprite:
; in: a = an overworld sprite
; out: a = the first of its standing frame's 4 tiles, loaded the first time a sprite is asked for;
;      carry if there's no room for another sprite
	ld b, a
	ld hl, wMapTrainerSprites
	ld a, [wMapTrainerSpriteCount]
	ld c, a
	ld e, 0 ; which loaded sprite
.find
	ld a, e
	cp c
	jr z, .new
	ld a, [hli]
	cp b
	jr z, .got_tile
	inc e
	jr .find

.new
	ld a, c
	cp MAX_MAP_TRAINER_SPRITES
	ccf
	ret c
	ld [hl], b
	inc a
	ld [wMapTrainerSpriteCount], a
	ld a, e
	call .FirstTile
	push af
	ld a, b
	farcall GetSprite ; de = its graphics, b = their bank
	pop af
	push af
	; hl = vTiles0 tile a
	assert LOW(vTiles0) == 0
	swap a
	ld l, a
	and $f
	add HIGH(vTiles0)
	ld h, a
	ld a, l
	and $f0
	ld l, a
	ld c, 4 ; facing down, standing
	call Request2bpp
	pop af
	ret

.got_tile
	ld a, e
.FirstTile:
; a = a loaded sprite's place -> a = its first tile, and no carry
	add a
	add a
	add MAP_TRAINER_FIRST_TILE
	ret

MapTrainers_Sort:
; Bubble the icons into order, north to south, those on one landmark together.
.pass
	ld a, [wMapTrainerIconCount]
	cp 2
	ret c
	dec a
	ld b, a ; pairs to compare
	ld c, FALSE ; swapped any this pass
	ld hl, wMapTrainerIcons
.pair
	; de = this icon, hl = the next
	ld d, h
	ld e, l
	ld a, l
	add MAP_TRAINER_ICON_LENGTH
	ld l, a
	adc h
	sub l
	ld h, a
	assert MAP_TRAINER_ICON_Y == 0 && MAP_TRAINER_ICON_LANDMARK == 1
	ld a, [de]
	cp [hl]
	jr c, .next ; further north
	jr nz, .swap
	inc de
	inc hl
	ld a, [de]
	dec de
	cp [hl]
	dec hl
	jr c, .next
	jr z, .next
.swap
	push bc
	ld c, MAP_TRAINER_ICON_LENGTH
.swap_byte
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .swap_byte
	pop bc
	ld c, TRUE
	ld a, l
	sub MAP_TRAINER_ICON_LENGTH
	ld l, a
	jr nc, .next
	dec h
.next
	dec b
	jr nz, .pair
	ld a, c
	and a
	jr nz, .pass
	ret

MapTrainers_Page:
; Fill in each icon's turn on its landmark, and the landmark's page. The player's landmark, if the
; player icon is on this map, is on every page; the rest are dealt across as few pages as fit in
; what OAM the sprite anim structs leave.
	ld a, 1
	ld [wMapTrainerPages], a
	ld a, MAP_TRAINER_PINNED
	ld [wMapTrainerPinnedLandmark], a
	ld a, [wMapIconCount]
	and a
	jr z, .got_pinned
	ld a, [wMapIcons + 2] ; the player icon's landmark
	ld [wMapTrainerPinnedLandmark], a
.got_pinned
	ld a, [wMapTrainerIconCount]
	and a
	ret z

; Each icon's turn on its landmark; and how many landmarks there are besides the player's.
	ld b, a
	ld c, -1 ; the landmark before
	lb de, 0, 0 ; d = the turn, e = landmarks besides the player's
	ld hl, wMapTrainerIcons
.turns
	inc hl ; MAP_TRAINER_ICON_Y
	ld a, [hli] ; MAP_TRAINER_ICON_LANDMARK
	cp c
	ld c, a
	jr z, .same_landmark
	ld d, -1
	ld a, [wMapTrainerPinnedLandmark]
	cp c
	jr z, .same_landmark
	inc e
.same_landmark
	inc d
	assert MAP_TRAINER_ICON_RANK == MAP_TRAINER_ICON_LANDMARK + 5
	inc hl
	inc hl
	inc hl
	inc hl ; MAP_TRAINER_ICON_RANK
	ld a, d
	ld [hli], a
	inc hl ; the next icon
	dec b
	jr nz, .turns

; How many icons share each one's landmark. Backwards, so a landmark's last icon is met first.
	ld a, [wMapTrainerIconCount]
	ld b, a
	push de
	lb de, 0, 0 ; d = the turn of the icon after, as if one more landmark began; e = its count
	dec hl ; the last icon's MAP_TRAINER_ICON_SIZE
	assert MAP_TRAINER_ICON_SIZE == MAP_TRAINER_ICON_LENGTH - 1
.counts
	dec hl
	ld a, [hli] ; MAP_TRAINER_ICON_RANK
	ld c, a
	ld a, d
	and a
	ld a, e ; not its landmark's last: as many as the icon after
	jr nz, .got_count
	ld a, c
	inc a ; its landmark's last: one more than its turn
.got_count
	ld [hl], a
	ld e, a
	ld d, c
	ld a, l
	sub MAP_TRAINER_ICON_LENGTH
	ld l, a
	jr nc, .counted
	dec h
.counted
	dec b
	jr nz, .counts
	pop de

; How many icons fit beside the structs, each of which here is a 2x2 icon or arrow; one place goes
; to the player's landmark, on every page, if trainers are on it.
	push de
	ld hl, wSpriteAnimationStructs
	ld de, SPRITEANIMSTRUCT_LENGTH
	lb bc, NUM_SPRITE_ANIM_STRUCTS, OAM_COUNT / 4
.structs
	ld a, [hl]
	and a
	jr z, .next_struct
	dec c
.next_struct
	add hl, de
	dec b
	jr nz, .structs
	pop de
	ld a, c
	cp MAX_MAP_TRAINERS_SHOWN + 1
	jr c, .got_room
	ld c, MAX_MAP_TRAINERS_SHOWN
.got_room
	call MapTrainers_PinnedHasTrainers
	jr nc, .got_pages_room
	dec c
.got_pages_room
	ld a, c
	and a
	jr nz, .divide_pages
	inc c
.divide_pages
	; pages = landmarks / room, rounded up, and at least 1
	ld b, 0
	ld a, e
.divide
	inc b
	sub c
	jr z, .got_pages
	jr nc, .divide
.got_pages
	ld a, b
	ld [wMapTrainerPages], a

; Deal the landmarks across the pages in turn, north to south.
	ld hl, wMapTrainerIcons
	ld a, [wMapTrainerIconCount]
	ld b, a
	ld c, -1 ; which landmark, of those besides the player's
	ld e, 0 ; its page
.deal
	inc hl ; MAP_TRAINER_ICON_Y
	ld a, [hli] ; MAP_TRAINER_ICON_LANDMARK
	ld d, a
	assert MAP_TRAINER_ICON_PAGE == MAP_TRAINER_ICON_LANDMARK + 4 && \
		MAP_TRAINER_ICON_RANK == MAP_TRAINER_ICON_PAGE + 1
	inc hl
	inc hl
	inc hl ; MAP_TRAINER_ICON_PAGE
	ld a, [wMapTrainerPinnedLandmark]
	cp d
	ld a, MAP_TRAINER_PINNED
	jr z, .got_page
	inc hl
	ld a, [hld] ; MAP_TRAINER_ICON_RANK
	and a
	jr nz, .same_page ; not its landmark's first
	inc c
	ld a, [wMapTrainerPages]
	ld d, a
	ld a, c
.page_mod
	cp d
	jr c, .got_page_mod
	sub d
	jr .page_mod

.got_page_mod
	ld e, a
.same_page
	ld a, e
.got_page
	ld [hli], a ; MAP_TRAINER_ICON_PAGE
	inc hl
	inc hl ; the next icon
	dec b
	jr nz, .deal
	ret

MapTrainers_PinnedHasTrainers:
; out: carry if any icon is on the player's landmark. Preserves bc and de.
	ld a, [wMapTrainerPinnedLandmark]
	cp MAP_TRAINER_PINNED
	ret z ; and no carry
	push bc
	ld c, a
	ld a, [wMapTrainerIconCount]
	ld b, a
	ld hl, wMapTrainerIcons + MAP_TRAINER_ICON_LANDMARK
.loop
	ld a, [hl]
	cp c
	jr z, .yes
	ld a, l
	add MAP_TRAINER_ICON_LENGTH
	ld l, a
	adc h
	sub l
	ld h, a
	dec b
	jr nz, .loop
	pop bc
	and a
	ret

.yes
	pop bc
	scf
	ret

MapTrainers_Update::
; Each frame on the map: on a new turn, show the next page.
	ld a, [wMapIconView]
	and a ; MAP_VIEW_SWARMS
	ret z
	ld a, [wMapIconTurn]
	ld hl, wMapTrainerShownTurn
	cp [hl]
	ret z
	; fallthrough

MapTrainers_ShowTurn:
; The icons whose turn it is go in wMapTrainersShown, for MapTrainers_Draw. The player icon stands
; aside during a turn of a trainer on its landmark.
	ld a, [wMapIconTurn]
	ld [wMapTrainerShownTurn], a
	; this turn's page, and how many times that page has come round before
	ld c, a
	ld a, [wMapTrainerPages]
	ld b, a
	ld a, c
	ld d, 0
.page_mod
	cp b
	jr c, .got_page
	sub b
	inc d
	jr .page_mod

.got_page
	ld [wMapTrainerTurnPage], a
	ld a, d
	ld [wMapTrainerTurnRound], a
	xor a
	ld [wMapTrainersShownCount], a
	ld [wMapTrainerPlayerAside], a

	ld a, [wMapTrainerIconCount]
	and a
	ret z
	ld b, a
	ld hl, wMapTrainerIcons
.icons
	push bc
	push hl
	call .IsItsTurn
	pop hl
	push hl
	call c, .Show
	pop hl
	ld de, MAP_TRAINER_ICON_LENGTH
	add hl, de
	pop bc
	dec b
	jr nz, .icons

; The player icon, if its landmark has trainers: on its landmark, or parked off-screen as
; MapIcons_Apply parks icons.
	call MapTrainers_PinnedHasTrainers
	ret nc
	ld a, [wMapTrainerPinnedLandmark]
	ld e, a
	farcall GetLandmarkCoords ; d = its y
	ld a, [wMapTrainerPlayerAside]
	and a
	jr z, .player_y
	ld d, 0
.player_y
	ld hl, wMapIcons ; the player icon's struct
	ld a, [hli]
	ld h, [hl]
	add SPRITEANIMSTRUCT_YCOORD
	ld l, a
	adc h
	sub l
	ld h, a
	ld [hl], d
	ret

.IsItsTurn:
; in: hl = an icon. out: carry if it's that icon's turn.
	ld de, MAP_TRAINER_ICON_SIZE
	add hl, de
	assert MAP_TRAINER_ICON_RANK == MAP_TRAINER_ICON_SIZE - 1 && \
		MAP_TRAINER_ICON_PAGE == MAP_TRAINER_ICON_RANK - 1
	ld a, [hld]
	ld e, a ; how many share its landmark
	ld a, [hld]
	ld d, a ; its turn on its landmark
	ld a, [hl] ; its page
	cp MAP_TRAINER_PINNED
	jr z, .pinned
	ld hl, wMapTrainerTurnPage
	cp [hl]
	jr nz, .not_its_turn
	ld a, [wMapTrainerTurnRound]
	jr .turn_mod

.pinned
	; the player icon has the first turn there
	inc d
	inc e
	ld a, [wMapIconTurn]
.turn_mod
	cp e
	jr c, .got_turn
	sub e
	jr .turn_mod

.got_turn
	cp d
	jr nz, .not_its_turn
	scf
	ret

.not_its_turn
	and a
	ret

.Show:
; in: hl = an icon whose turn it is
	ld a, [wMapTrainersShownCount]
	cp MAX_MAP_TRAINERS_SHOWN
	ret nc
	inc a
	ld [wMapTrainersShownCount], a
	dec a
	add a
	add a
	add LOW(wMapTrainersShown)
	ld e, a
	adc HIGH(wMapTrainersShown)
	sub e
	ld d, a
	assert MAP_TRAINER_ICON_Y == 0 && MAP_TRAINER_ICON_LANDMARK == 1 && MAP_TRAINER_ICON_X == 2 && \
		MAP_TRAINER_ICON_TILE == 3 && MAP_TRAINER_ICON_ATTR == 4 && MAP_TRAINER_ICON_PAGE == 5
	ld a, [hli]
	ld [de], a
	inc de
	inc hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	cp MAP_TRAINER_PINNED
	ret nz
	ld a, TRUE
	ld [wMapTrainerPlayerAside], a
	ret

MapTrainers_Draw::
; Each frame, after PlaySpriteAnimations: the icons whose turn it is, into OAM after the structs'.
	ld a, [wMapTrainersShownCount]
	and a
	ret z
	ld b, a
	ld hl, wMapTrainersShown
	ld d, HIGH(wShadowOAM)
	ld a, [wCurSpriteOAMAddr]
	ld e, a
.icon
	ld a, e
	cp LOW(wShadowOAMEnd) - 4 * OBJ_SIZE + 1
	ret nc
	push bc
	ld a, [hli]
	sub TILE_WIDTH
	ld b, a ; the top row's y
	ld a, [hli]
	sub TILE_WIDTH
	ld c, a ; the left column's x
	xor a ; top left
	call .Sprite
	ld a, c
	add TILE_WIDTH
	ld c, a
	ld a, 1 ; top right
	call .Sprite
	ld a, b
	add TILE_WIDTH
	ld b, a
	ld a, 3 ; bottom right
	call .Sprite
	ld a, c
	sub TILE_WIDTH
	ld c, a
	ld a, [wMapIconView]
	cp MAP_VIEW_GIFTS
	jr z, .item
	ld a, 2 ; bottom left
	call .Sprite
	jr .next

.item
	; the party menu's held-item marker takes the bottom left, as it does there
	ld a, b
	ld [de], a
	inc e
	ld a, c
	ld [de], a
	inc e
	ld a, MAP_TRAINER_ITEM_TILE
	ld [de], a
	inc e
	ld a, MAP_TRAINER_ITEM_PAL
	ld [de], a
	inc e
.next
	inc hl
	inc hl ; the next icon
	pop bc
	dec b
	jr nz, .icon
	ret

.Sprite:
; in: b = y, c = x, a = which of the icon's 4 tiles, hl = the icon's tile and attributes,
;     de = the OAM entry to write, which this advances past
	push af
	ld a, b
	ld [de], a
	inc e
	ld a, c
	ld [de], a
	inc e
	pop af
	add [hl]
	ld [de], a
	inc e
	inc hl
	ld a, [hld]
	ld [de], a
	inc e
	ret

LoadMapViewLabelGFX::
; The view labels and the SEL and START glyphs, into VRAM bank 1 from BG tile 0. The screen may be on.
	ldh a, [rVBK]
	push af
	ld a, BANK(vTiles5)
	ldh [rVBK], a
	ld de, MapViewLabelsGFX
	ld hl, vTiles5
	lb bc, BANK(MapViewLabelsGFX), MAP_VIEW_LABEL_SHEET_TILES
	call Request2bpp
	pop af
	ldh [rVBK], a
	ret

PlaceMapViewLabel::
; The view's label in the map's bottom corner on the sea, under the SEL glyph: bottom left on Johto,
; bottom right on Kanto, against the border. Once START swaps regions, its glyph too, above the
; region's plaque against the border. Call after TownMapPals, which gives every tile the attributes
; of its id.
; in: a = JOHTO_REGION or KANTO_REGION
	push af
	and a ; JOHTO_REGION
	jr nz, .kanto
	hlcoord 1, 15
	call .PlaceSelect
	hlcoord 1, 16
	call .PlaceLabel
	hlcoord SCREEN_WIDTH - 1 - MAP_VIEW_START_WIDTH, 15 ; above JOHTO
	jr .start

.kanto
	hlcoord SCREEN_WIDTH - 1 - MAP_VIEW_SELECT_WIDTH, 15
	call .PlaceSelect
	call .GetLabel
	ld a, SCREEN_WIDTH - 1
	sub c
	ld e, a
	ld d, 0
	hlcoord 0, 16
	add hl, de
	call .PlaceLabel
	hlcoord 1, 15 ; above KANTO
.start
	; START, once it swaps regions: when Indigo Plateau has been visited
	push hl
	ld hl, wVisitedSpawns
	lb bc, CHECK_FLAG, SPAWN_INDIGO
	ld d, 0
	predef SmallFarFlagAction
	pop hl
	pop af
	ld a, c
	and a
	ret z
	ld a, MAP_VIEW_SHEET_START * MAP_VIEW_LABEL_SHEET_WIDTH
	lb bc, PAL_TOWNMAP_EARTH | BG_BANK1, MAP_VIEW_START_WIDTH ; the sea's colors, for its corners
	jr .PlaceTiles

.PlaceSelect:
	ld a, MAP_VIEW_SHEET_SELECT * MAP_VIEW_LABEL_SHEET_WIDTH
	lb bc, PAL_TOWNMAP_EARTH | BG_BANK1, MAP_VIEW_SELECT_WIDTH ; the sea's colors, for its corners
	jr .PlaceTiles

.GetLabel:
; out: a = the view label's first tile, c = how many
	push hl
	ld a, [wMapIconView]
	ld e, a
	ld d, 0
	ld hl, .LabelWidths
	add hl, de
	ld c, [hl]
	pop hl
	assert MAP_VIEW_SHEET_SWARMS == MAP_VIEW_SWARMS && MAP_VIEW_SHEET_REMATCH == MAP_VIEW_REMATCH && \
		MAP_VIEW_SHEET_GIFTS == MAP_VIEW_GIFTS
	assert MAP_VIEW_LABEL_SHEET_WIDTH == 6
	ld a, e
	add a
	add e
	add a ; its row of the sheet
	ret

.PlaceLabel:
	call .GetLabel
	ld b, PAL_TOWNMAP_BORDER | BG_BANK1 ; the plaque letters' colors
	; fallthrough

.PlaceTiles:
; in: hl = where in wTilemap, a = the first tile, b = their attributes, c = how many
	push hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld d, h
	ld e, l
	pop hl
.tile
	ld [hli], a
	inc a
	push af
	ld a, b
	ld [de], a
	inc de
	pop af
	dec c
	jr nz, .tile
	ret

.LabelWidths:
; entries correspond to MAP_VIEW_* constants
	table_width 1
	db 4 ; SWARMS
	db 5 ; REMATCH
	db 3 ; GIFTS
	assert_table_length NUM_MAP_VIEWS

MapViewLabelsGFX:
INCBIN "gfx/pokegear/map_view_labels.2bpp"
.End:
	assert MapViewLabelsGFX.End - MapViewLabelsGFX == MAP_VIEW_LABEL_SHEET_TILES tiles

INCLUDE "data/phone/map_icons.asm"
