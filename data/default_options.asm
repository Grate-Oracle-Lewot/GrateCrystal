DefaultOptions:
; wOptions: fast text speed, battle scene on
	db %10000001
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: normal
	db GBPRINTER_NORMAL
; wFontType: font 1
	db FONT_1
; wOptions2: battle items on
	db %00000001
	; BATTLE_ITEMS:         1 (ON)
	; LEVEL_CAPS_ON_OFF:    0 (OFF)
	; LEVEL_CAPS_OBEDIENCE: 0 (DISOBEY)
	; EASY_MODE:            0 (OFF)
	; HARD_MODE:            0 (OFF)
	; NUZLOCKE:             0 (OFF)
	; PARTYWIDE_EXP:        0 (OFF)
	; DIFFICULTY_DOUBLE:    0 (OFF)
; wSidebar
	db 0 ; SIDEBAR_TIME
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
