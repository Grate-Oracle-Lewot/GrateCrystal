	; MainMenuItems indexes
	const_def
	const MAINMENU_NEW_GAME      ; 0
	const MAINMENU_CONTINUE      ; 1
	const MAINMENU_NEW_GAME_PLUS ; 2

	; MainMenu.Strings and MainMenu.Jumptable indexes
	const_def
	const MAINMENUITEM_CONTINUE      ; 0
	const MAINMENUITEM_NEW_GAME      ; 1
	const MAINMENUITEM_NEW_GAME_PLUS ; 2
	const MAINMENUITEM_OPTION        ; 3
	const MAINMENUITEM_DELETE_SAVE   ; 4

MobileMenuGFX:
INCBIN "gfx/mobile/mobile_menu.2bpp"

MainMenu:
.loop
	xor a
	ld [wDisableTextAcceleration], a
	call ClearTilemapEtc
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPaused
	res GAME_TIMER_PAUSED_F, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MainMenuJoypadLoop
	call CloseWindow
	ret c
	call ClearTilemap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 13, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
; entries correspond to MAINMENUITEM_* constants
	db "CONTINUE@"
	db "NEW GAME@"
	db "NEW GAME +@"
	db "OPTION@"
	db "DELETE SAVE@"

.Jumptable:
; entries correspond to MAINMENUITEM_* constants
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_NewGamePlus
	dw MainMenu_Option
	dw MainMenu_DeleteSave

MainMenuItems:
; entries correspond to MAINMENU_* constants

	; MAINMENU_NEW_GAME
	db 2
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db -1

	; MAINMENU_CONTINUE
	db 4
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_DELETE_SAVE
	db -1

	; MAINMENU_NEW_GAME_PLUS
	db 5
	db MAINMENUITEM_CONTINUE
	db MAINMENUITEM_NEW_GAME
	db MAINMENUITEM_NEW_GAME_PLUS
	db MAINMENUITEM_OPTION
	db MAINMENUITEM_DELETE_SAVE
	db -1

MainMenu_GetWhichMenu:
	ld a, [wSaveFileExists]
	and a
	jr nz, .next1
	ld a, MAINMENU_NEW_GAME
	ret

.next1
	ld a, BANK(sMysteryGiftUnusedFlag)
	call OpenSRAM
	ld a, [sMysteryGiftUnusedFlag]
	and a
	call CloseSRAM
	jr nz, .next2
	ld a, MAINMENU_CONTINUE
	ret

.next2
	ld a, MAINMENU_NEW_GAME_PLUS
	ret

MainMenuJoypadLoop:
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret

MainMenu_PrintCurrentTimeAndDay:
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call .PlaceBox
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.PlaceBox:
	call CheckRTCStatus
	and RTC_RESET
	jp nz, SpeechTextbox
	hlcoord 0, 14
	ld b, 2
	ld c, 18
	jp Textbox

.PlaceTime:
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and RTC_RESET
	jp nz, .PrintTimeNotSet
	call UpdateTime
	call GetWeekday
	ld b, a
	decoord 1, 15
	call .PrintDayOfWeek
	decoord 4, 16
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
	ld [hl], ":"
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

.PrintTimeNotSet:
	hlcoord 1, 14
	ld de, .TimeNotSetString
	jp PlaceString

.TimeNotSetString:
	db "TIME NOT SET@"

.PrintDayOfWeek:
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	jp PlaceString

.Days:
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
.Day:
	db "DAY@"

ClearTilemapEtc:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	jp ClearWindowData

MainMenu_Continue:
	farcall Continue
	ret

MainMenu_NewGame:
	farcall NewGame
	ret

MainMenu_NewGamePlus:
	farcall NewGamePlus
	ret

MainMenu_Option:
	farcall _Option
	ret

MainMenu_DeleteSave:
	farcall _DeleteSaveData
	jp Init
