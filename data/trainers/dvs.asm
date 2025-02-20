TrainerClassDVs:
; entries correspond to trainer classes (see constants/trainer_constants.asm)
	table_width 2, TrainerClassDVs
	;  atk,def,spd,spc
	dn 10, 10, 10, 10 ; FALKNER
	dn 11, 10, 10, 11 ; WHITNEY
	dn 10, 10, 10, 11 ; BUGSY
	dn 10, 10, 10, 10 ; MORTY
	dn 10, 10, 10, 10 ; PRYCE
	dn 11, 10, 10, 11 ; JASMINE
	dn 10, 10, 10, 10 ; CHUCK
	dn 11, 12, 11, 11 ; CLAIR
	dn 12, 13, 13, 12 ; RIVAL1
	dn 15, 15, 15, 15 ; POKEMON_PROF
	dn 11, 15, 15, 13 ; WILL (A.D.)
	dn 14, 13, 13, 14 ; CAL
	dn 13, 13, 13, 14 ; BRUNO (Percy)
	dn 14, 14, 14, 14 ; KAREN (Lewot)
	dn 13, 13, 13, 12 ; KOGA (Lucas)
	dn 14, 14, 14, 14 ; CHAMPION (Lance)
	dn 12, 11, 11, 12 ; BROCK
	dn 11, 12, 12, 11 ; MISTY
	dn 12, 11, 11, 12 ; LT_SURGE
	dn 10,  8,  9, 11 ; SCIENTIST
	dn 11, 12, 12, 11 ; ERIKA
	dn  6,  5,  5,  6 ; YOUNGSTER
	dn  6,  7,  7,  6 ; SCHOOLBOY
	dn  8,  9, 11,  8 ; BIRD_KEEPER
	dn  7,  8,  7,  7 ; LASS
	dn 11, 12, 12, 11 ; JANINE
	dn 12, 13,  9, 10 ; COOLTRAINER_M
	dn 11, 12, 12,  9 ; COOLTRAINER_F
	dn  7,  8,  8,  7 ; BEAUTY
	dn  8,  9,  9,  8 ; POKEMANIAC
	dn  8,  7,  7,  8 ; GRUNT_M
	dn  6, 11,  9,  8 ; GENTLEMAN
	dn  9,  8, 10,  9 ; SKIER
	dn  9,  8,  8,  9 ; TEACHER
	dn 11, 12, 12, 11 ; SABRINA
	dn  6,  7,  7,  6 ; BUG_CATCHER
	dn  8,  9,  9,  8 ; FISHER
	dn  8,  9,  9,  8 ; SWIMMER_M
	dn  9,  8,  8,  9 ; SWIMMER_F
	dn 10,  9,  9,  8 ; SAILOR
	dn  8,  9,  9,  8 ; SUPER_NERD
	dn 12, 13, 13, 12 ; RIVAL2
	dn  8,  9,  9,  8 ; GUITARIST
	dn  8, 13,  9,  8 ; HIKER
	dn  8,  9, 11,  8 ; BIKER
	dn 12, 11, 11, 12 ; BLAINE
	dn  8,  9,  9,  8 ; BURGLAR
	dn 10,  9,  9,  8 ; FIREBREATHER
	dn  8,  7, 15,  8 ; JUGGLER
	dn 12,  9,  9,  8 ; BLACKBELT_T
	dn 10, 11, 11, 10 ; EXECUTIVE_M
	dn  8,  9,  9, 12 ; PSYCHIC_T
	dn  7,  6,  6,  7 ; PICNICKER
	dn  6,  7,  7,  6 ; CAMPER
	dn 11, 10, 10, 11 ; EXECUTIVE_F
	dn  8,  9,  9, 10 ; SAGE
	dn  9,  8,  8, 11 ; MEDIUM
	dn  8,  9, 11,  8 ; BOARDER
	dn 10,  9,  9,  8 ; POKEFAN_M
	dn  9, 10, 10,  9 ; KIMONO_GIRL
	dn  7,  6,  6,  7 ; TWINS
	dn 11, 12, 12,  9 ; POKEFAN_F
	dn 14, 15, 15, 14 ; RED
	dn 14, 13, 13, 14 ; BLUE
	dn 10,  9,  7,  8 ; OFFICER
	dn  7,  8,  8,  7 ; GRUNTF
	dn 12, 13, 13, 12 ; MYSTICALMAN
	dn 13, 14, 14, 13 ; REAL_KAREN
	dn 12, 13, 13, 12 ; REAL_KOGA
	dn 12, 13, 13, 12 ; BOSS
	dn  8,  8,  8,  8 ; JESSIE &
	dn 15,  0,  0,  0 ; AEROBONES
	dn 15, 14, 14, 14 ; KABUBONES
	dn  0,  0,  0,  0 ; MISSINGNO_T
	dn  6,  7,  7,  6 ; GAMBLER
	dn 13, 14, 14, 13 ; CAL_F
	dn  6,  5,  5,  6 ; OLD
	dn 13, 14, 14, 13 ; LORELEI
	dn 13, 14, 14, 13 ; AGATHA
	dn 14, 13, 13, 14 ; REAL_BRUNO
	dn 14, 13, 13, 14 ; REAL_WILL
	dn  6,  7,  7, 14 ; ENGINEER
	assert_table_length NUM_TRAINER_CLASSES
