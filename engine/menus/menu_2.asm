PlaceMenuItemName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetItemName
	pop hl
	jp PlaceString

PlaceMartMenuItemName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetItemName
	cp TM01
	jr c, .place_string
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, STRING_BUFFER_LENGTH
	call CopyBytes
	ld de, wStringBuffer4 + STRLEN("TM##")
	callfar AppendTMHMMoveName
	ld de, wStringBuffer4
.place_string:
	pop hl
	jp PlaceString

PlaceMenuItemQuantity:
	push de
	ld a, [wMenuSelection]
	ld [wCurItem], a
	farcall _CheckTossableItem
	ld a, [wItemAttributeValue]
	pop hl
	and a
	ret nz
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wMenuSelectionQuantity
	lb bc, 1, 2
	jp PrintNum

PlaceMoneyTopRight:
	ld hl, MoneyTopRightMenuHeader
	call CopyMenuHeader
	jr PlaceMoneyTextbox

PlaceMoneyBottomLeft:
	ld hl, MoneyBottomLeftMenuHeader
	call CopyMenuHeader
	jr PlaceMoneyTextbox

PlaceMoneyAtTopLeftOfTextbox:
	ld hl, MoneyTopRightMenuHeader
	lb de, 0, 11
	call OffsetMenuHeader
	; fallthrough

PlaceMoneyTextbox:
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	jp PrintNum

MoneyTopRightMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, 2
	dw NULL
	db 1 ; default option

MoneyBottomLeftMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 11, 8, 13
	dw NULL
	db 1 ; default option

DisplayCoinCaseBalance:
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 11, 0
	ld b, 1
	ld c, 7
	call Textbox
	hlcoord 12, 0
	ld de, CoinString
	call PlaceString
	hlcoord 17, 1
	ld de, ShowMoney_TerminatorString
	call PlaceString
	ld de, wCoins
	lb bc, 2, 4
	hlcoord 13, 1
	jp PrintNum

DisplayMoneyAndCoinBalance:
	hlcoord 5, 0
	ld b, 3
	ld c, 13
	call Textbox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 12, 1
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 15, 3
	ld de, wCoins
	lb bc, 2, 4
	jp PrintNum

MoneyString:
	db "MONEY@"
CoinString:
	db "COIN@"
ShowMoney_TerminatorString:
	db "@"

StartMenu_DrawBugContestStatusBox:
	hlcoord 0, 0
	ld b, 5
	ld c, 17
	jp Textbox

StartMenu_PrintBugContestStatus:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 1, 5
	ld de, .BallsString
	call PlaceString
	hlcoord 8, 5
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, .CaughtString
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, .NoneString
	jr z, .no_contest_mon
	ld [wNamedObjectIndex], a
	call GetPokemonName

.no_contest_mon
	hlcoord 8, 1
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .skip_level
	hlcoord 1, 3
	ld de, .LevelString
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, 3
	call Print8BitNumLeftAlign

.skip_level
	pop af
	ld [wOptions], a
	ret

.CaughtString:
	db "CAUGHT@"
.BallsString:
	db "BALLS:@"
.NoneString:
	db "None@"
.LevelString:
	db "LEVEL@"

FindApricornsInBag:
; Checks the bag for Apricorns.
	ld hl, wKurtApricornCount
	xor a
	ld [hli], a
	assert wKurtApricornCount + 1 == wKurtApricornItems
	dec a
	ld bc, 10
	call ByteFill

	ld hl, ApricornBalls
.loop
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	pop hl
	jr nc, .nope
	ld a, [hl]
	call .addtobuffer
.nope
	inc hl
	inc hl
	jr .loop

.done
	ld a, [wKurtApricornCount]
	and a
	ret nz
	scf
	ret

.addtobuffer:
	push hl
	ld hl, wKurtApricornCount
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	ret

INCLUDE "data/items/apricorn_balls.asm"

PlaceItemInBagQuantity:
	hlcoord 0, 0
	ld b, 1
	ld c, 7
	call Textbox
	hlcoord 1, 1
	ld de, .InBagString
	call PlaceString

	ld a, [wMenuSelection]
	cp -1
	jr z, ClearItemInBagQuantityBox

	hlcoord 6, 1
	ld de, wMenuSelectionQuantity
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

.InBagString:
	db "PACK×@"

ClearItemInBagQuantityBox:
	hlcoord 0, 0
	ld b, 3
	ld c, 9
	jp ClearBox
