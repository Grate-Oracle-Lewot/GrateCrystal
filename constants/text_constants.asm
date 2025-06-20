; name lengths
NAME_LENGTH               EQU 11
PLAYER_NAME_LENGTH        EQU  8
BOX_NAME_LENGTH           EQU  9
MON_NAME_LENGTH           EQU 11
MOVE_NAME_LENGTH          EQU 13
ITEM_NAME_LENGTH          EQU 13
TRAINER_CLASS_NAME_LENGTH EQU 13
NAME_LENGTH_JAPANESE      EQU  6

; GetName types (see home/names.asm)
	const_def 1
	const MON_NAME       ; 1
	const MOVE_NAME      ; 2
	const MOVE_DESC_NAME ; 3
	const ITEM_NAME      ; 4
	const PARTY_OT_NAME  ; 5
	const ENEMY_OT_NAME  ; 6
	const TRAINER_NAME   ; 7

; see home/text.asm
BORDER_WIDTH   EQU 2
TEXTBOX_WIDTH  EQU SCREEN_WIDTH
TEXTBOX_INNERW EQU TEXTBOX_WIDTH - BORDER_WIDTH
TEXTBOX_HEIGHT EQU 6
TEXTBOX_INNERH EQU TEXTBOX_HEIGHT - BORDER_WIDTH
TEXTBOX_X      EQU 0
TEXTBOX_INNERX EQU TEXTBOX_X + 1
TEXTBOX_Y      EQU SCREEN_HEIGHT - TEXTBOX_HEIGHT
TEXTBOX_INNERY EQU TEXTBOX_Y + 2

; see gfx/frames/*.png
TEXTBOX_FRAME_TILES EQU 6

; PrintNum bit flags
	const_def 5
	const PRINTNUM_MONEY_F        ; 5
	const PRINTNUM_LEFTALIGN_F    ; 6
	const PRINTNUM_LEADINGZEROS_F ; 7

; PrintNum arguments (see engine/math/print_num.asm)
PRINTNUM_MONEY        EQU 1 << PRINTNUM_MONEY_F
PRINTNUM_LEFTALIGN    EQU 1 << PRINTNUM_LEFTALIGN_F
PRINTNUM_LEADINGZEROS EQU 1 << PRINTNUM_LEADINGZEROS_F

; character sets (see charmap.asm)
FIRST_REGULAR_TEXT_CHAR     EQU $7f
FIRST_HIRAGANA_DAKUTEN_CHAR EQU $20

; gfx/font/unown_font.png
FIRST_UNOWN_CHAR EQU $40
