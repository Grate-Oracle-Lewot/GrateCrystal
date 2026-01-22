DefaultOptions:
; wOptions: fast text speed
	db TEXT_DELAY_FAST
; wSaveFileExists: no
	db FALSE
; wTextboxFrame: frame 1
	db FRAME_1
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinterBrightness: normal
	db GBPRINTER_NORMAL
; Unused
	db $00
; wOptions2: battle items on
	db %01000001
	; BATTLE_ITEMS:         1 (ON)
	; LEVEL_CAPS_ON_OFF:    0 (OFF)
	; LEVEL_CAPS_OBEDIENCE: 0 (DISOBEY)
	; EASY_MODE:            0 (OFF)
	; HARD_MODE:            0 (OFF)
	; NUZLOCKE:             0 (OFF)
	; MENU_SIDEBAR:         1 (ON)
	; FONT_NORMAL_UNOWN:    0 (NORMAL)
; Unused
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
