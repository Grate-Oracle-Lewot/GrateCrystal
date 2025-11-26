unownwall: MACRO
for n, CHARLEN(\1)
x = CHARSUB(\1, n + 1)
if x == "-"
	db $64
elif x >= "Y"
	db 2 * (x - "Y") + $60
elif x >= "Q"
	db 2 * (x - "Q") + $40
elif x >= "I"
	db 2 * (x - "I") + $20
else
	db 2 * (x - "A")
endc
endr
	db -1 ; end
ENDM

; Can't use Z, I needed a ladder

UnownWalls:
; UNOWNWORDS_ESCAPE
	; db $88, $c4, $84, $80, $ae, $88, -1
	unownwall "ESCAPE"
; UNOWNWORDS_LIGHT
	; db $a6, $a0, $8c, $8e, $c6, -1
	unownwall "LIGHT"
; UNOWNWORDS_WATER
	; db $cc, $80, $c6, $88, $c2, -1
	unownwall "WATER"
; UNOWNWORDS_HO_OH
	; db $8e, $ac, $64, $ac, $8e, -1
	unownwall "HO-OH"
; UNOWNWORDS_GRATE
	; db $8c, $c2, $80, $c6, $88, -1
	unownwall "GRATE"

MenuHeaders_UnownWalls:
; UNOWNWORDS_ESCAPE
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_LIGHT
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_WATER
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_HO_OH
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_GRATE
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
