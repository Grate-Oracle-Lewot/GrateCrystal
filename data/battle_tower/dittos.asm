BattleTowerDittos:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerDittos

	db DITTO
	db X_SPEED
	db TRANSFORM, PROTECT, SELFDESTRUCT, SUBSTITUTE
	dw 0 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 8, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "@@@@@@@@@@@"

  assert_table_length 10
