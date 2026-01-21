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
; wOptions2: battle items on
	db 1 << BATTLE_ITEMS
	; LEVEL_CAPS_ON_OFF:    0 (OFF)
	; LEVEL_CAPS_OBEDIENCE: 0 (DISOBEY)
	; EASY_MODE:            0 (OFF)
	; HARD_MODE:            0 (OFF)
	; NUZLOCKE:             0 (OFF)
	; MENU_CLOCK:           0 (OFF)
	; FONT_NORMAL_UNOWN:    0 (NORMAL)

	db $00
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
