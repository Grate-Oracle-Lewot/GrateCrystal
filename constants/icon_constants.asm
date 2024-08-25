; IconPointers indexes (see data/icon_pointers.asm)
	const_def
	const ICON_NULL        ;  0
	const ICON_POLIWAG     ;  1
	const ICON_JIGGLYPUFF  ;  2
	const ICON_DIGLETT     ;  3
	const ICON_PIKACHU     ;  4
	const ICON_STARYU      ;  5
	const ICON_FISH        ;  6
	const ICON_BIRD        ;  7
	const ICON_MONSTER     ;  8
	const ICON_CLEFAIRY    ;  9
	const ICON_ODDISH      ; 10
	const ICON_BUG         ; 11
	const ICON_GHOST       ; 12
	const ICON_LAPRAS      ; 13
	const ICON_HUMANSHAPE  ; 14
	const ICON_FOX         ; 15
	const ICON_EQUINE      ; 16
	const ICON_SHELL       ; 17
	const ICON_BLOB        ; 18
	const ICON_SERPENT     ; 19
	const ICON_VOLTORB     ; 20
	const ICON_SQUIRTLE    ; 21
	const ICON_BULBASAUR   ; 22
	const ICON_CHARMANDER  ; 23
	const ICON_CATERPILLAR ; 24
	const ICON_UNOWN       ; 25
	const ICON_GEODUDE     ; 26
	const ICON_FIGHTER     ; 27
	const ICON_EGG         ; 28
	const ICON_JELLYFISH   ; 29
	const ICON_MOTH        ; 30
	const ICON_BAT         ; 31
	const ICON_SNORLAX     ; 32
	const ICON_HO_OH       ; 33
	const ICON_LUGIA       ; 34
	const ICON_GYARADOS    ; 35
	const ICON_SLOWPOKE    ; 36
	const ICON_SUDOWOODO   ; 37
	const ICON_BIGMON      ; 38
	const ICON_CHANSEY     ; 39
	const ICON_FLOWER      ; 40
	const ICON_FLEA        ; 41
	const ICON_SPIRAL      ; 42
	const ICON_SEAL        ; 43
	const ICON_PINECO      ; 44
	const ICON_CELEBI      ; 45
	const ICON_RAIKOU      ; 46
	const ICON_ENTEI       ; 47
	const ICON_SUICUNE     ; 48
	const ICON_MANTINE     ; 49
	const ICON_ARBOK       ; 50
	const ICON_VILEPLUME   ; 51
	const ICON_ABRA        ; 52
	const ICON_JYNX        ; 53
NUM_ICONS EQU const_value - 1

; LoadMenuMonIcon.Jumptable indexes (see engine/gfx/mon_icons.asm)
	const_def
	const MONICON_PARTYMENU
	const MONICON_NAMINGSCREEN
	const MONICON_MOVES
	const MONICON_TRADE
	const MONICON_MOBILE1
	const MONICON_MOBILE2
	const MONICON_UNUSED ; Nayru's dex

; party menu icon palettes
	const_def
	const PAL_ICON_RED    ; 0
	const PAL_ICON_BLUE   ; 1
	const PAL_ICON_GREEN  ; 2
	const PAL_ICON_BROWN  ; 3
	const PAL_ICON_PINK   ; 4
	const PAL_ICON_GRAY   ; 5
	const PAL_ICON_YELLOW ; 6
	const PAL_ICON_PURPLE ; 7
