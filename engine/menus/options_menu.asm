; GetOptionPointer.Pointers indexes
	const_def
	const OPT_TEXT_SPEED      ; 0
	const OPT_BATTLE_SCENE    ; 1
	const OPT_BATTLE_STYLE    ; 2
	const OPT_BATTLE_ITEMS    ; 3
	const OPT_SOUND           ; 4
	const OPT_FRAME           ; 5
	const OPT_MORE_OPTIONS    ; 6
	const OPT_CANCEL          ; 7
NUM_OPTIONS EQU const_value   ; 8

; GetOption2Pointer.Pointers indexes
	const_def
	const OPT2_DIFFICULTY     ; 0
	const OPT2_LEVEL_CAPS     ; 1
	const OPT2_PRINT          ; 2
	const OPT2_BACK           ; 3
	const OPT2_CANCEL         ; 4
NUM_OPTIONS_2 EQU const_value ; 5

	const_def
	const OPT_TEXT_SPEED_FAST ; 0
	const OPT_TEXT_SPEED_MED  ; 1
	const OPT_TEXT_SPEED_SLOW ; 2
	const OPT_TEXT_SPEED_NONE ; 3

	const_def
	const OPT_LEVELCAPS_NONE    ; 0
	const OPT_LEVELCAPS_DISOBEY ; 1
	const OPT_LEVELCAPS_HARDCAP ; 2

	const_def
	const OPT_DIFFICULTY_EASY   ; 0
	const OPT_DIFFICULTY_NORMAL ; 1
	const OPT_DIFFICULTY_HARD   ; 2

	const_def
	const OPT_PRINT_LIGHTEST ; 0
	const OPT_PRINT_LIGHTER  ; 1
	const OPT_PRINT_NORMAL   ; 2
	const OPT_PRINT_DARKER   ; 3
	const OPT_PRINT_DARKEST  ; 4

OptionsMenuOptimization:
	xor a
	ld [wJumptableIndex], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	jp SetPalettes

Options_Back:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, _Option
	and a
	ret

_Option:
	call ClearJoypad
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, StringOptions
	call PlaceString
	xor a
	ld [wJumptableIndex], a

; display the settings of each option when the menu is opened
	ld c, NUM_OPTIONS - 2 ; omit frame type
.print_text_loop
	push bc
	xor a
	ldh [hJoyLast], a
	call GetOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .print_text_loop

	call UpdateFrame ; display the frame type
	call OptionsMenuOptimization

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, ExitOptions
	call OptionsControl
	jr c, .dpad
	call GetOptionPointer
	jr c, ExitOptions

.dpad
	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

Options_MoreOptions:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, _Option2
	and a
	ret

_Option2:
	call ClearJoypad
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, StringOptions2
	call PlaceString
	xor a
	ld [wJumptableIndex], a

; display the settings of each option when the menu is opened
	ld c, NUM_OPTIONS_2 - 1
.print_text_loop
	push bc
	xor a
	ldh [hJoyLast], a
	call GetOption2Pointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .print_text_loop

	call OptionsMenuOptimization

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, ExitOptions
	call Options2Control
	jr c, .dpad
	call GetOption2Pointer
	jr c, ExitOptions

.dpad
	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

StringOptions:
	db "TEXT SPEED<LF>"
	db "        :<LF>"
	db "BATTLE SCENE<LF>"
	db "        :<LF>"
	db "BATTLE STYLE<LF>"
	db "        :<LF>"
	db "BATTLE ITEMS<LF>"
	db "        :<LF>"
	db "SOUND<LF>"
	db "        :<LF>"
	db "FRAME<LF>"
	db "        :TYPE<LF>"
	db "MORE OPTIONS<LF>"
	db "<LF>"
	db "CANCEL@"

StringOptions2:
	db "DIFFICULTY<LF>"
	db "        :<LF>"
	db "LEVEL_CAPS<LF>"
	db "        :<LF>"
	db "GB PRINTER<LF>"
	db "        :<LF>"
	db "BACK<LF>"
	db "<LF>"
	db "CANCEL@"

GetOptionPointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to OPT_* constants
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_BattleItems
	dw Options_Sound
	dw Options_Frame
	dw Options_MoreOptions
	dw Options_Cancel

GetOption2Pointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to OPT2_* constants
	dw Options_Difficulty
	dw Options_LevelCaps
	dw Options_Print
	dw Options_Back
	dw Options_Cancel

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_NONE
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_FAST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_NONE + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 3
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_TEXT_SPEED_* constants
	dw .Fast
	dw .Mid
	dw .Slow
	dw .None

.Fast: db "FAST   @"
.Mid:  db "MEDIUM @"
.Slow: db "SLOW   @"
.None: db "INSTANT@"

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c, with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_SLOW
	jr z, .slow
	cp TEXT_DELAY_FAST
	jr z, .fast
	cp TEXT_DELAY_NONE
	jr z, .none
	; none of the above
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret

.slow
	ld c, OPT_TEXT_SPEED_SLOW
	lb de, TEXT_DELAY_MED, TEXT_DELAY_NONE
	ret

.fast
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_NONE, TEXT_DELAY_MED
	ret

.none
	ld c, OPT_TEXT_SPEED_NONE
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_FAST
	ret

Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff

.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn

.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.ToggleOn:
	res BATTLE_SCENE, [hl]
	ld de, .On
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, .Off

.Display:
	hlcoord 11, 5
	call PlaceString
	and a
	ret

.On:  db "ON @"
.Off: db "OFF@"

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SHIFT, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SHIFT, [hl]
	ld de, .Set

.Display:
	hlcoord 11, 7
	call PlaceString
	and a
	ret

.Shift: db "SHIFT@"
.Set:   db "SET  @"

Options_BattleItems:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_ITEMS, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit BATTLE_ITEMS, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit BATTLE_ITEMS, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res BATTLE_ITEMS, [hl]
	ld de, .Off
	jr .Display

.ToggleOn:
	set BATTLE_ITEMS, [hl]
	ld de, .On

.Display:
	hlcoord 11, 9
	call PlaceString
	and a
	ret

.Off: db "FORBID@"
.On:  db "ALLOW @"

Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo

.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono

.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono

.SetMono:
	res STEREO, [hl]
	call RestartMapMusic

.ToggleMono:
	ld de, .Mono
	jr .Display

.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic

.ToggleStereo:
	ld de, .Stereo

.Display:
	hlcoord 11, 11
	call PlaceString
	and a
	ret

.Mono:   db "MONO  @"
.Stereo: db "STEREO@"

Options_Frame:
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a

.Save:
	maskbits NUM_FRAMES
	ld [hl], a
	; fallthrough

UpdateFrame:
	ld a, [wTextboxFrame]
	hlcoord 16, 13 ; where on the screen the number is drawn
	add "1"
	ld [hl], a
	call LoadFontsExtra
	and a
	ret

Options_Difficulty:
	call GetDifficultySetting
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_DIFFICULTY_HARD
	jr c, .Increase
	ld c, OPT_DIFFICULTY_EASY - 1

.Increase:
	inc c
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_DIFFICULTY_HARD + 1

.Decrease:
	dec c

.Save:
	ld a, c
	and a
	jr z, .SetEasy
	ld a, c
	cp OPT_DIFFICULTY_NORMAL
	jr z, .SetNormal
; .SetHard:
	res EASY_MODE, [hl]
	set HARD_MODE, [hl]
	jr .NonePressed

.SetNormal:
	res EASY_MODE, [hl]
	res HARD_MODE, [hl]
	jr .NonePressed

.SetEasy:
	set EASY_MODE, [hl]
	res HARD_MODE, [hl]
.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 3
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_DIFFICULTY_* constants
	dw .Easy
	dw .Normal
	dw .Hard

.Easy:   db "EASY  @"
.Normal: db "NORAML@"
.Hard:   db "HARD  @"

GetDifficultySetting:
; reads current difficulty settings to return OPT_DIFFICULTY_* value in c
; both Easy and Hard being on at once should be impossible but results in Normal as a failsafe

	ld hl, wOptions2
	bit EASY_MODE, [hl]
	jr z, .EasyOff
; .EasyOn:
	bit HARD_MODE, [hl]
	jr z, .Easy
	jr .Normal

.EasyOff:
	bit HARD_MODE, [hl]
	jr z, .Normal
.Hard:
	ld c, OPT_DIFFICULTY_HARD
	ret
.Normal:
	ld c, OPT_DIFFICULTY_NORMAL
	ret
.Easy:
	ld c, OPT_DIFFICULTY_EASY
	ret

Options_LevelCaps:
	call GetLevelCapSetting
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_LEVELCAPS_HARDCAP
	jr c, .Increase
	ld c, OPT_LEVELCAPS_NONE - 1

.Increase:
	inc c
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_LEVELCAPS_HARDCAP + 1

.Decrease:
	dec c

.Save:
	ld a, c
	and a
	jr z, .SetNone
	ld a, c
	cp OPT_LEVELCAPS_DISOBEY
	jr z, .SetDisobey
; .SetHardCap:
	set LEVEL_CAPS_ON_OFF, [hl]
	set LEVEL_CAPS_OBEDIENCE, [hl]
	jr .NonePressed

.SetDisobey:
	set LEVEL_CAPS_ON_OFF, [hl]
	res LEVEL_CAPS_OBEDIENCE, [hl]
	jr .NonePressed

.SetNone:
	res LEVEL_CAPS_ON_OFF, [hl]
	res LEVEL_CAPS_OBEDIENCE, [hl]
.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 11
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_LEVELCAPS_* constants
	dw .None
	dw .Disobey
	dw .HardCap

.None:    db "NONE    @"
.Disobey: db "DISOBEY @"
.HardCap: db "HARD CAP@"

GetLevelCapSetting:
; reads current level cap settings to return OPT_LEVELCAPS_* value in c
	ld hl, wOptions2
	bit LEVEL_CAPS_ON_OFF, [hl]
	jr z, .None
	bit LEVEL_CAPS_OBEDIENCE, [hl]
	jr z, .Disobey
; .HardCap:
	ld c, OPT_LEVELCAPS_HARDCAP
	ret
.None:
	ld c, OPT_LEVELCAPS_NONE
	ret
.Disobey:
	ld c, OPT_LEVELCAPS_DISOBEY
	ret

Options_Print:
	call GetPrinterSetting
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c
	cp OPT_PRINT_DARKEST
	jr c, .Increase
	ld c, OPT_PRINT_LIGHTEST - 1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_PRINT_DARKEST + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld [wGBPrinterBrightness], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 7
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_PRINT_* constants
	dw .Lightest
	dw .Lighter
	dw .Normal
	dw .Darker
	dw .Darkest

.Lightest: db "LIGHTEST@"
.Lighter:  db "LIGHTER @"
.Normal:   db "NORMAL  @"
.Darker:   db "DARKER  @"
.Darkest:  db "DARKEST @"

GetPrinterSetting:
; converts GBPRINTER_* value in a to OPT_PRINT_* value in c,
; with previous/next GBPRINTER_* values in d/e
	ld a, [wGBPrinterBrightness]
	and a
	jr z, .IsLightest
	cp GBPRINTER_LIGHTER
	jr z, .IsLight
	cp GBPRINTER_DARKER
	jr z, .IsDark
	cp GBPRINTER_DARKEST
	jr z, .IsDarkest
	; none of the above
	ld c, OPT_PRINT_NORMAL
	lb de, GBPRINTER_LIGHTER, GBPRINTER_DARKER
	ret

.IsLightest:
	ld c, OPT_PRINT_LIGHTEST
	lb de, GBPRINTER_DARKEST, GBPRINTER_LIGHTER
	ret

.IsLight:
	ld c, OPT_PRINT_LIGHTER
	lb de, GBPRINTER_LIGHTEST, GBPRINTER_NORMAL
	ret

.IsDark:
	ld c, OPT_PRINT_DARKER
	lb de, GBPRINTER_NORMAL, GBPRINTER_DARKEST
	ret

.IsDarkest:
	ld c, OPT_PRINT_DARKEST
	lb de, GBPRINTER_DARKER, GBPRINTER_LIGHTEST
	ret

Options_Cancel:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp OPT_CANCEL ; maximum option index
	jr z, .Roll_Up
	inc [hl]
	jr .Done

.Roll_Up:
	ld [hl], OPT_TEXT_SPEED ; minimum option index
.Done:
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a ; OPT_TEXT_SPEED, minimum option index
	jr z, .Roll_Down
	dec [hl]
	jr .Done

.Roll_Down:
	ld [hl], OPT_CANCEL ; maximum option index
	jr .Done

Options2Control:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp OPT2_CANCEL ; maximum option index
	jr z, .Roll_Up
	inc [hl]
	jr .Done

.Roll_Up:
	ld [hl], OPT2_DIFFICULTY ; minimum option index
.Done:
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a ; OPT2_DIFFICULTY, minimum option index
	jr z, .Roll_Down
	dec [hl]
	jr .Done

.Roll_Down:
	ld [hl], OPT2_CANCEL ; maximum option index
	jr .Done

Options_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wJumptableIndex]
	call AddNTimes
	ld [hl], "▶"
	ret
