LoadSixPikachuParty::
	ldh a, [rSVBK]
	push af
	ld a, BANK(w3_d202)
	ldh [rSVBK], a

; Set w3_d202 as start address to write the following data to
	ld de, w3_d202

	ld hl, PokefanMJoshuaTable
; Copy name (10 bytes) and class (1 byte) of Joshua into de
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, NAME_LENGTH
	call CopyBytes

; Load six Pikachu party into de+11
	ld hl, SixPikachuParty
	ld bc, NICKNAMED_MON_STRUCT_LENGTH * 6
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

PokefanMJoshuaTable:
	table_width (NAME_LENGTH - 1) + 1, PokefanMJoshuaTable
	; name, class
	db "JOSHUA@@@@", POKEFANM
	assert_table_length 1

SixPikachuParty:
	table_width NICKNAMED_MON_STRUCT_LENGTH, SixPikachuParty

	db PIKACHU
	db GOLD_BERRY
	db THUNDERBOLT, THUNDERPUNCH, LIGHT_SCREEN, TRI_ATTACK
	dw 0 ; OT ID
	dt 74088 ; Exp
	; Stat exp
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	dn 9, 9, 15, 14 ; DVs
	db 10, 15, 10, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 42 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 80 ; Atk
	bigdw 67 ; Def
	bigdw 114 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "PIKACHU@@@@"

	db PIKACHU
	db GOLD_BERRY
	db THUNDERBOLT, QUICK_ATTACK, HYPER_FANG, SWIFT
	dw 0 ; OT ID
	dt 74088 ; Exp
	; Stat exp
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	dn 9, 15, 15, 14 ; DVs
	db 10, 30, 10, 25 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 42 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 80 ; Atk
	bigdw 72 ; Def
	bigdw 114 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "PIKACHU@@@@"

	db PIKACHU
	db GOLD_BERRY
	db THUNDERBOLT, DOUBLESLAP, ATTRACT, DAZZLY_GLEAM
	dw 0 ; OT ID
	dt 74088 ; Exp
	; Stat exp
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	dn 11, 11, 15, 14 ; DVs
	db 10, 20, 10, 15 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 42 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 81 ; Atk
	bigdw 69 ; Def
	bigdw 114 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "PIKACHU@@@@"

 	db PIKACHU
	db GOLD_BERRY
	db THUNDERBOLT, THUNDERPUNCH, HI_JUMP_KICK, AURA_SPHERE
	dw 0 ; OT ID
	dt 74088 ; Exp
	; Stat exp
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	dn 13, 11, 15, 14 ; DVs
	db 10, 15, 20, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 42 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 83 ; Atk
	bigdw 69 ; Def
	bigdw 114 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "PIKACHU@@@@"

 	db PIKACHU
	db GOLD_BERRY
	db THUNDERBOLT, THUNDER, RAIN_DANCE, SURF
	dw 0 ; OT ID
	dt 74088 ; Exp
	; Stat exp
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	dn 13, 15, 15, 14 ; DVs
	db 10, 5, 5, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 42 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 83 ; Atk
	bigdw 72 ; Def
	bigdw 114 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "PIKACHU@@@@"

 	db PIKACHU
	db GOLD_BERRY
	db THUNDERBOLT, SIGNAL_BEAM, DOUBLE_TEAM, FLY
	dw 0 ; OT ID
	dt 74088 ; Exp
	; Stat exp
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	bigdw 42000
	dn 15, 14, 15, 14 ; DVs
	db 10, 15, 15, 15 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 42 ; Level
	db 0, 0 ; Status
	bigdw 111 ; HP
	bigdw 111 ; Max HP
	bigdw 85 ; Atk
	bigdw 71 ; Def
	bigdw 114 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "PIKACHU@@@@"

	assert_table_length 6
