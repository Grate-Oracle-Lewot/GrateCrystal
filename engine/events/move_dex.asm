MoveDex::
	ld hl, Text_MoveDexIntro
	call PrintText
	call YesNoBox
	jr c, .cancel

	ld hl, MovesDexOrder
	call ViewMoveList
	call ReturnToMapWithSpeechTextbox

.cancel
	ld hl, Text_MoveDexOutro
	jp PrintText

ViewMoveList:
	farcall BlankScreen
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a

	hlcoord 0,  0
	lb bc, 9, 18
	call TextboxBorder

	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	and a
	ret

.carry
	scf
	ret

; The menu header defines the menu's position and what will be included.
; The last two values of "menu_coords" will determine where the vertical scroll arrows will be located.
.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2,  9
	dw .MenuData
	db 1

; This sets up the menu's contents, including the amount of entries displayed before scrolling is required.
; Vertical scroll arrows and the move's details will be displayed.
.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3
	db 4, SCREEN_WIDTH + 2
	db SCROLLINGMENU_ITEMS_NORMAL
	dba MovesDexOrder
	dba .print_move_name
	dba .print_pp
	dba .print_move_details

.print_move_name
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	jp PlaceString

.print_pp
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de

	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 2
	ld hl, wStringBuffer1 + 12
	call PrintNum
	ld hl, wStringBuffer1 + 14
	ld [hl], "@"

	pop hl
	ld de, wStringBuffer1
	call PlaceString

; This prints the PP gfx before the move's PP.
	ld bc, 9
	add hl, bc
	ld a, "P"
	ld [hli], a
	ld [hl], a
	ret

; This adds a text box border line to the description box that replaces a leftover piece of the notch that remains when the cancel option is highlighted.
.cancel_border_fix
	hlcoord 0, 10
	ld de, MoveDexBottomString
	jp PlaceString

; This begins the printing of all of the move's details, including the border around the description.
.print_move_details
	hlcoord 0, 11
	lb bc, 5, 18
	call TextboxBorder

; This code will relative jump to the ".cancel_border_fix" local label if the cancel entry is highlighted.
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel_border_fix

; Print move description
	push de
	ld a, [wMenuSelection]
	inc a
	pop de
	ret z
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 15
	predef PrintMoveDescriptionScrunched

	ld b, SCGB_MOVE_LIST
	call GetSGBLayout ; reload proper palettes for new Move Type and Category, and apply

; Print move stat strings
	hlcoord 0, 10
	ld de, MoveDexTopString
	call PlaceString
	hlcoord 0, 11
	ld de, MoveDexSidesString
	call PlaceString
	hlcoord 1, 11
	ld de, MoveDexAttackString
	call PlaceString
	hlcoord 1, 12
	ld de, MoveDexAccuracyString
	call PlaceString
	hlcoord 1, 13
	ld de, MoveDexChanceString
	call PlaceString

; Print move category
	ld a, [wCurSpecies]
	dec a
	ld hl, Moves + MOVE_TYPE
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	push af ; raw Move Type+category Byte, unmasked
	and ~TYPE_MASK
	swap a
	srl a
	srl a
	dec a
	ld hl, CategoryIconGFX ; ptr to Category GFX loaded from PNG(2bpp)
	ld bc, 2 tiles
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile $59 ; category icon tile slot in VRAM, destination
	lb bc, BANK(CategoryIconGFX), 2
	call Request2bpp ; Load 2bpp at b:de to occupy c tiles of hl.
	hlcoord 16, 13
	ld a, $59 ; category icon tile 1
	ld [hli], a
	ld [hl], $5a ; category icon tile 2

; Print move type
	pop af ; raw Move Type+category Byte, unmasked
	call GetMonTypeIndex
; Type Index adjust done
; Load Type GFX Tiles, color will be in Slot 4 of Palette
	ld hl, TypeIconGFX ; ptr for PNG w/ black Tiles, since this screen is using Slot 4 in the Palette for Type color
	ld bc, 4 * LEN_1BPP_TILE ; purely Black and White tiles are 1bpp. Type Tiles are 4 Tiles wide
	call AddNTimes ; increments pointer based on Type Index
	ld d, h
	ld e, l ; de is the source Pointer
	ld hl, vTiles2 tile $5b ; $5b is destination Tile for first Type Tile
	lb bc, BANK(TypeIconGFX), 4 ; Bank in 'b', num of Tiles to load in 'c'
	call Request1bpp
	hlcoord 11, 13
	ld a, $5b ; first Type Tile
	ld [hli], a
	inc a ; Tile $5c
	ld [hli], a
	inc a ; Tile $5d
	ld [hli], a
	ld [hl], $5e ; final Type Tile

.print_move_chance
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_CHANCE) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 1
	jr c, .print_move_null_chance
	call ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 5, 13
	call PrintNum
	jr .print_move_accuracy

; This prints "---" if the move has a status effect chance of 0.
; This means one of three things:
; It does not inflict a status effect.
; It is always successful in inflicting a status effect unless something blocks it.
; It causes a weather effect.
.print_move_null_chance
	ld de, MoveDexNullValueString
	ld bc, 3
	hlcoord 5, 13
	call PlaceString

.print_move_accuracy
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_EFFECT) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld hl, PerfectAccuracyEffects
	call IsInByteArray
	jr c, .perfect

	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_ACC) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	call ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 5, 12
	call PrintNum
	jr .print_move_attack

; This prints "---" if the move's effect is in the list of perfect accuracy effects.
; This list is stored in the home bank, so it can be accessed from anywhere.
.perfect
	ld de, MoveDexNullValueString
	ld bc, 3
	hlcoord 5, 12
	call PlaceString

.print_move_attack
	ld a, [wMenuSelection]
	cp SELFDESTRUCT
	jr z, .print_selfdestruct_attack
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_POWER) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 2
	jr c, .print_move_null_attack
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 5, 11
	jp PrintNum

; Print 500 for Selfdestruct's power, since it halves enemy defense.
.print_selfdestruct_attack
	hlcoord 5, 11
	ld de, MoveDex500String
	ld bc, 3
	jp PlaceString

; This prints "---" if the move has an attack of 0 or 1.
; This covers status moves, OHKO moves, level damage, etc.
.print_move_null_attack
	hlcoord 5, 11
	ld de, MoveDexNullValueString
	ld bc, 3
	jp PlaceString

MoveDexTopString:
	db "┌────────┐@"
MoveDexSidesString:
	db "│        └@"
MoveDexBottomString:
	db "└─────────@"
MoveDexAttackString:
	db "POW@"
MoveDexAccuracyString:
	db "HIT    <%>@"
MoveDexChanceString:
	db " FX    <%>@"
MoveDexNullValueString:
	db "---@"
MoveDex500String:
	db "500@"

Text_MoveDexIntro:
  text "I've memorized the"
  line "stats of every"

  para "#MON move."
  line "Wanna see?"
  done

Text_MoveDexOutro:
  text "Come back anytime!"
  done

INCLUDE "data/moves/dex_order.asm"
