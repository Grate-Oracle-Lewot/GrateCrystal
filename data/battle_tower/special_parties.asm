BattleTowerBrock:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerBrock

	db KABUTOPS
	db MYSTIC_WATER
	db CUT, WATERFALL, CROSS_CHOP, ROCK_SLIDE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 24, 24, 8, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 305 ; HP
	bigdw 305 ; Max HP
	bigdw 322 ; Atk
	bigdw 300 ; Def
	bigdw 250 ; Spd
	bigdw 222 ; SAtk
	bigdw 232 ; SDef
	db "KABUTOPS@@@"

 	db OMASTAR
	db SILVERPOWDER
	db MEGAHORN, SURF, PROTECT, SPIKE_CANNON
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 8, 16, 16, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 212 ; Atk
	bigdw 340 ; Def
	bigdw 200 ; Spd
	bigdw 322 ; SAtk
	bigdw 232 ; SDef
	db "OMASTAR@@@@"

 	db RHYDON
	db SOFT_SAND
	db IRON_HEAD, ROCK_SLIDE, EARTHQUAKE, HORN_DRILL
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 24, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 405 ; HP
	bigdw 405 ; Max HP
	bigdw 362 ; Atk
	bigdw 340 ; Def
	bigdw 170 ; Spd
	bigdw 192 ; SAtk
	bigdw 192 ; SDef
	db "RHYDON@@@@@"

	assert_table_length 3

BattleTowerMisty:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerMisty

 	db LAPRAS
	db NOISEMAKER
	db SURF, PERISH_SONG, BLIZZARD, RAIN_DANCE
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 16, 8, 8, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 346 ; HP
	bigdw 346 ; Max HP
	bigdw 260 ; Atk
	bigdw 252 ; Def
	bigdw 212 ; Spd
	bigdw 260 ; SAtk
	bigdw 280 ; SDef
	db "LAPRAS@@@@@"

	db QUAGSIRE
	db LEFTOVERS
	db SURF, AMNESIA, EARTHQUAKE, RAIN_DANCE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 16, 32, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 381 ; HP
	bigdw 381 ; Max HP
	bigdw 260 ; Atk
	bigdw 262 ; Def
	bigdw 162 ; Spd
	bigdw 220 ; SAtk
	bigdw 220 ; SDef
	db "QUAGSIRE@@@"

 	db STARMIE
	db MYSTIC_WATER
	db SURF, RAIN_DANCE, THUNDER, ICE_BEAM
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 16, 8, 8, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 311 ; HP
	bigdw 311 ; Max HP
	bigdw 240 ; Atk
	bigdw 262 ; Def
	bigdw 322 ; Spd
	bigdw 300 ; SAtk
	bigdw 260 ; SDef
	db "STARMIE@@@@"

	assert_table_length 3

BattleTowerLtSurge:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerLtSurge

	db ELECTABUZZ
	db BLACKBELT_I
	db MACH_PUNCH, THUNDERPUNCH, LIGHT_SCREEN, DYNAMICPUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 40, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 298 ; Atk
	bigdw 214 ; Def
	bigdw 290 ; Spd
	bigdw 282 ; SAtk
	bigdw 262 ; SDef
	db "ELECTABUZZ@"

	db MAGNETON
	db MAGNET
	db LOCK_ON, DOUBLE_TEAM, FLASH, ZAP_CANNON
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 8, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 305 ; HP
	bigdw 305 ; Max HP
	bigdw 224 ; Atk
	bigdw 300 ; Def
	bigdw 222 ; Spd
	bigdw 344 ; SAtk
	bigdw 248 ; SDef
	db "MAGNETON@@@"

	db LANTURN
	db SILVERPOWDER
	db RAIN_DANCE, SIGNAL_BEAM, SURF, THUNDER
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 8, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 435 ; HP
	bigdw 435 ; Max HP
	bigdw 208 ; Atk
	bigdw 206 ; Def
	bigdw 224 ; Spd
	bigdw 244 ; SAtk
	bigdw 244 ; SDef
	db "LANTURN@@@@"

	assert_table_length 3

BattleTowerErika:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerErika

	db TANGELA
	db MIRACLE_SEED
	db BUBBLEBEAM, ANCIENTPOWER, GIGA_DRAIN, SLEEP_POWDER
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 32, 16, 8, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 359 ; HP
	bigdw 359 ; Max HP
	bigdw 210 ; Atk
	bigdw 242 ; Def
	bigdw 202 ; Spd
	bigdw 310 ; SAtk
	bigdw 170 ; SDef
	db "TANGELA@@@@"

	db BELLOSSOM
	db DICTIONARY
	db SUNNY_DAY, MOONLIGHT, PETAL_DANCE, SOLARBEAM
	dw 0 ; OT ID
	dt 949930 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 8, 8, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 341 ; HP
	bigdw 341 ; Max HP
	bigdw 250 ; Atk
	bigdw 282 ; Def
	bigdw 192 ; Spd
	bigdw 270 ; SAtk
	bigdw 290 ; SDef
	db "BELLOSSOM@@"

	db VICTREEBEL
	db SCOPE_LENS
	db SUNNY_DAY, SYNTHESIS, POISON_JAB, RAZOR_LEAF
	dw 0 ; OT ID
	dt 949930 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 8, 8, 24, 40 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 351 ; HP
	bigdw 351 ; Max HP
	bigdw 300 ; Atk
	bigdw 222 ; Def
	bigdw 232 ; Spd
	bigdw 290 ; SAtk
	bigdw 230 ; SDef
	db "VICTREEBEL@"

	assert_table_length 3

BattleTowerJanine:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerJanine

	db CROBAT
	db FOCUS_BAND
	db WING_ATTACK, DOUBLE_TEAM, CONFUSE_RAY, POISON_JAB
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 40, 24, 16, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 270 ; Atk
	bigdw 252 ; Def
	bigdw 352 ; Spd
	bigdw 230 ; SAtk
	bigdw 250 ; SDef
	db "CROBAT@@@@@"

	db TENTACRUEL
	db MIRACLE_SEED
	db SCALD, SLUDGE_BOMB, SURF, GIGA_DRAIN
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 24, 16, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 351 ; HP
	bigdw 351 ; Max HP
	bigdw 230 ; Atk
	bigdw 222 ; Def
	bigdw 292 ; Spd
	bigdw 250 ; SAtk
	bigdw 330 ; SDef
	db "TENTACRUEL@"

	db SLOWKING
	db QUICK_CLAW
	db CURSE, STRENGTH, POISON_JAB, REST
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 16, 24, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 391 ; HP
	bigdw 391 ; Max HP
	bigdw 250 ; Atk
	bigdw 252 ; Def
	bigdw 132 ; Spd
	bigdw 290 ; SAtk
	bigdw 310 ; SDef
	db "SLOWKING@@@"

	assert_table_length 3

BattleTowerSabrina:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerSabrina

	db MR__MIME
	db X_SPECIAL
	db BARRIER, BATON_PASS, PSYCHIC_M, MOONBLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 32, 32, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 311 ; HP
	bigdw 311 ; Max HP
	bigdw 210 ; Atk
	bigdw 232 ; Def
	bigdw 252 ; Spd
	bigdw 300 ; SAtk
	bigdw 330 ; SDef
	db "MR.MIME@@@@"

	db JYNX
	db X_ATTACK
	db LOVELY_KISS, ATTRACT, PSYCHIC_M, ICE_PUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 24, 16, 16, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 341 ; HP
	bigdw 341 ; Max HP
	bigdw 210 ; Atk
	bigdw 176 ; Def
	bigdw 282 ; Spd
	bigdw 360 ; SAtk
	bigdw 310 ; SDef
	db "JYNX@@@@@@@"

	db ALAKAZAM
	db TWISTEDSPOON
	db RECOVER, AURA_SPHERE, PSYCHIC_M, REFLECT
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 16, 16, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 301 ; HP
	bigdw 301 ; Max HP
	bigdw 190 ; Atk
	bigdw 182 ; Def
	bigdw 332 ; Spd
	bigdw 364 ; SAtk
	bigdw 286 ; SDef
	db "ALAKAZAM@@@"

	assert_table_length 3

BattleTowerBlaine:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerBlaine

	db SUNFLORA
	db QUICK_CLAW
	db SUNNY_DAY, SOLARBEAM, FLAMETHROWER, MORNING_SUN
	dw 0 ; OT ID
	dt 949930 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 8, 16, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 260 ; Atk
	bigdw 218 ; Def
	bigdw 128 ; Spd
	bigdw 402 ; SAtk
	bigdw 260 ; SDef
	db "SUNFLORA@@@"

	db ARCANINE
	db CHARCOAL
	db ROAR, FLAMETHROWER, PLAY_ROUGH, CRUNCH
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 32, 16, 24, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 365 ; HP
	bigdw 365 ; Max HP
	bigdw 312 ; Atk
	bigdw 250 ; Def
	bigdw 280 ; Spd
	bigdw 292 ; SAtk
	bigdw 252 ; SDef
	db "ARCANINE@@@"

	db RAPIDASH
	db BERRY_JUICE
	db QUICK_ATTACK, MEGAHORN, FURY_ATTACK, FIRE_BLAST
	dw 0 ; OT ID
	dt 849970 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 11, 11, 12 ; DVs
	db 48, 8, 32, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 315 ; HP
	bigdw 315 ; Max HP
	bigdw 292 ; Atk
	bigdw 230 ; Def
	bigdw 300 ; Spd
	bigdw 252 ; SAtk
	bigdw 252 ; SDef
	db "RAPIDASH@@@"

	assert_table_length 3

BattleTowerBlue:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerBlue

	db MAROWAK
	db THICK_CLUB
	db SHADOW_CLAW, BONEMERANG, POISON_JAB, NIGHTMARE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 13, 13, 14 ; DVs
	db 24, 24, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 305 ; HP
	bigdw 305 ; Max HP
	bigdw 256 ; Atk
	bigdw 314 ; Def
	bigdw 184 ; Spd
	bigdw 196 ; SAtk
	bigdw 256 ; SDef
	db "MAROWAK@@@@"

	db NIDOKING
	db KINGS_ROCK
	db EARTHQUAKE, POISON_JAB, THUNDERPUNCH, MEGAHORN
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 13, 13, 14 ; DVs
	db 16, 24, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 347 ; HP
	bigdw 347 ; Max HP
	bigdw 300 ; Atk
	bigdw 248 ; Def
	bigdw 264 ; Spd
	bigdw 266 ; SAtk
	bigdw 246 ; SDef
	db "NIDOKING@@@"

	db DONPHAN
	db LEFTOVERS
	db RETURN, EARTHQUAKE, STRENGTH, MEGAHORN
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 13, 13, 14 ; DVs
	db 24, 16, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 385 ; HP
	bigdw 385 ; Max HP
	bigdw 336 ; Atk
	bigdw 334 ; Def
	bigdw 194 ; Spd
	bigdw 216 ; SAtk
	bigdw 246 ; SDef
	db "DONPHAN@@@@"

	assert_table_length 3

BattleTowerFalkner:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerFalkner

	db FEAROW
	db SHARP_BEAK
	db DRILL_PECK, MUD_SLAP, SKY_ATTACK, STEEL_WING
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 24, 16, 8, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 278 ; Atk
	bigdw 218 ; Def
	bigdw 298 ; Spd
	bigdw 210 ; SAtk
	bigdw 210 ; SDef
	db "FEAROW@@@@@"

	db XATU
	db SCOPE_LENS
	db NIGHT_SHADE, PSYCHIC_M, MOONBLAST, TRI_ATTACK
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 32, 16, 8, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 238 ; Atk
	bigdw 228 ; Def
	bigdw 278 ; Spd
	bigdw 278 ; SAtk
	bigdw 228 ; SDef
	db "XATU@@@@@@@"

	db GLIGAR
	db QUICK_CLAW
	db FLY, DIG, SWORDS_DANCE, CRABHAMMER
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 24, 24, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 278 ; Atk
	bigdw 298 ; Def
	bigdw 278 ; Spd
	bigdw 188 ; SAtk
	bigdw 218 ; SDef
	db "GLIGAR@@@@@"

	assert_table_length 3

BattleTowerBugsy:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerBugsy

	db KINGLER
	db SCOPE_LENS
	db CUT, SWORDS_DANCE, SLAM, CRABHAMMER
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 11 ; DVs
	db 24, 24, 32, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 285 ; HP
	bigdw 285 ; Max HP
	bigdw 348 ; Atk
	bigdw 318 ; Def
	bigdw 238 ; Spd
	bigdw 190 ; SAtk
	bigdw 190 ; SDef
	db "KINGLER@@@@"

	db HERACROSS
	db FOCUS_BAND
	db MEGAHORN, COUNTER, REVERSAL, FLY
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 11 ; DVs
	db 8, 32, 24, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 335 ; HP
	bigdw 335 ; Max HP
	bigdw 338 ; Atk
	bigdw 238 ; Def
	bigdw 258 ; Spd
	bigdw 170 ; SAtk
	bigdw 280 ; SDef
	db "HERACROSS@@"

	db SCIZOR
	db METAL_COAT
	db CUT, SWORDS_DANCE, CROSS_CHOP, STEEL_WING
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 11 ; DVs
	db 8, 8, 0, 0 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 315 ; HP
	bigdw 315 ; Max HP
	bigdw 388 ; Atk
	bigdw 328 ; Def
	bigdw 218 ; Spd
	bigdw 200 ; SAtk
	bigdw 270 ; SDef
	db "SCIZOR@@@@@"

	assert_table_length 3

BattleTowerWhitney:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerWhitney

	db BLISSEY
	db LUCKY_PUNCH
	db HYPER_BEAM, ATTRACT, ROLLOUT, SOFTBOILED
	dw 0 ; OT ID
	dt 800000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 10, 10, 11 ; DVs
	db 8, 16, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 701 ; HP
	bigdw 701 ; Max HP
	bigdw 110 ; Atk
	bigdw 108 ; Def
	bigdw 198 ; Spd
	bigdw 240 ; SAtk
	bigdw 360 ; SDef
	db "BLISSEY@@@@"

	db GIRAFARIG
	db LEFTOVERS
	db ROCK_SMASH, HEADBUTT, SHADOW_BALL, ATTRACT
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 10, 10, 11 ; DVs
	db 24, 32, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 413 ; HP
	bigdw 413 ; Max HP
	bigdw 266 ; Atk
	bigdw 226 ; Def
	bigdw 264 ; Spd
	bigdw 282 ; SAtk
	bigdw 228 ; SDef
	db "GIRAFARIG@@"

	db MILTANK
	db X_ACCURACY
	db ROLLOUT, ATTRACT, BODY_SLAM, MILK_DRINK
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 10, 10, 11 ; DVs
	db 32, 16, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 381 ; HP
	bigdw 381 ; Max HP
	bigdw 250 ; Atk
	bigdw 298 ; Def
	bigdw 288 ; Spd
	bigdw 170 ; SAtk
	bigdw 230 ; SDef
	db "MILTANK@@@@"

	assert_table_length 3

BattleTowerMorty:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerMorty

	db NOCTOWL
	db BERRY_JUICE
	db AIR_SLASH, REFLECT, MEAN_LOOK, CURSE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 24, 16, 8, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 373 ; HP
	bigdw 373 ; Max HP
	bigdw 188 ; Atk
	bigdw 188 ; Def
	bigdw 228 ; Spd
	bigdw 260 ; SAtk
	bigdw 280 ; SDef
	db "NOCTOWL@@@@"

	db MISDREAVUS
	db SPELL_TAG
	db MEAN_LOOK, PERISH_SONG, CONFUSE_RAY, SHADOW_BALL
	dw 0 ; OT ID
	dt 800000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 8, 8, 26, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 293 ; HP
	bigdw 293 ; Max HP
	bigdw 208 ; Atk
	bigdw 208 ; Def
	bigdw 278 ; Spd
	bigdw 278 ; SAtk
	bigdw 278 ; SDef
	db "MISDREAVUS@"

	db GENGAR
	db MIRACLEBERRY
	db HYPNOSIS, SHADOW_BALL, AURA_SPHERE, DREAM_EATER
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 32, 24, 16, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 293 ; HP
	bigdw 293 ; Max HP
	bigdw 218 ; Atk
	bigdw 208 ; Def
	bigdw 318 ; Spd
	bigdw 348 ; SAtk
	bigdw 238 ; SDef
	db "GENGAR@@@@@"

	assert_table_length 3

BattleTowerChuck:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerChuck

	db PRIMEAPE
	db X_ATTACK
	db SWAGGER, OUTRAGE, CROSS_CHOP, MEGA_PUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 24, 16, 8, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 347 ; HP
	bigdw 347 ; Max HP
	bigdw 308 ; Atk
	bigdw 228 ; Def
	bigdw 274 ; Spd
	bigdw 198 ; SAtk
	bigdw 248 ; SDef
	db "PRIMEAPE@@@"

	db POLIWRATH
	db HARDHAT
	db HYPNOSIS, WATERFALL, SCALD, SUBMISSION
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 32, 24, 24, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 278 ; Atk
	bigdw 278 ; Def
	bigdw 228 ; Spd
	bigdw 228 ; SAtk
	bigdw 268 ; SDef
	db "POLIWRATH@@"

	db KANGASKHAN
	db X_ACCURACY
	db DIZZY_PUNCH, DYNAMICPUNCH, LOW_KICK, MILK_DRINK
	dw 0 ; OT ID
	dt 849970 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 24, 8, 40, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 278 ; Atk
	bigdw 248 ; Def
	bigdw 268 ; Spd
	bigdw 168 ; SAtk
	bigdw 248 ; SDef
	db "KANGASKHAN@"

	assert_table_length 3

BattleTowerJasmine:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerJasmine

	db SKARMORY
	db NOISEMAKER
	db SPIKES, DAZZLY_GLEAM, STEEL_WING, SKY_ATTACK
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 10, 10, 11 ; DVs
	db 10, 24, 32, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 321 ; HP
	bigdw 321 ; Max HP
	bigdw 250 ; Atk
	bigdw 368 ; Def
	bigdw 268 ; Spd
	bigdw 170 ; SAtk
	bigdw 230 ; SDef
	db "SKARMORY@@@"

	db CLOYSTER
	db X_SP_DEFEND
	db CRABHAMMER, SPIKE_CANNON, ICE_BEAM, PROTECT
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 10, 10, 11 ; DVs
	db 8, 24, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 291 ; HP
	bigdw 291 ; Max HP
	bigdw 280 ; Atk
	bigdw 448 ; Def
	bigdw 228 ; Spd
	bigdw 260 ; SAtk
	bigdw 180 ; SDef
	db "CLOYSTER@@@"

	db STEELIX
	db METAL_COAT
	db SCREECH, EARTHQUAKE, ROCK_SLIDE, IRON_TAIL
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 10, 10, 11 ; DVs
	db 32, 16, 24, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 341 ; HP
	bigdw 341 ; Max HP
	bigdw 260 ; Atk
	bigdw 488 ; Def
	bigdw 148 ; Spd
	bigdw 200 ; SAtk
	bigdw 220 ; SDef
	db "STEELIX@@@@"

	assert_table_length 3

BattleTowerPryce:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerPryce

	db SNEASEL
	db SCOPE_LENS
	db BEAT_UP, ICE_PUNCH, FAINT_ATTACK, STRENGTH
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 16, 24, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 308 ; Atk
	bigdw 208 ; Def
	bigdw 328 ; Spd
	bigdw 168 ; SAtk
	bigdw 248 ; SDef
	db "SNEASEL@@@@"

	db DEWGONG
	db LEFTOVERS
	db REST, SLEEP_TALK, ICE_BEAM, SURF
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 8, 24, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 228 ; Atk
	bigdw 248 ; Def
	bigdw 228 ; Spd
	bigdw 228 ; SAtk
	bigdw 278 ; SDef
	db "DEWGONG@@@@"

	db PILOSWINE
	db NEVERMELTICE
	db FLAIL, EARTHQUAKE, HAIL, BLIZZARD
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 10, 10, 10, 10 ; DVs
	db 32, 16, 8, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 318 ; Atk
	bigdw 248 ; Def
	bigdw 218 ; Spd
	bigdw 218 ; SAtk
	bigdw 208 ; SDef
	db "PILOSWINE@@"

	assert_table_length 3

BattleTowerClair:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerClair

	db GYARADOS
	db MYSTIC_WATER
	db WATERFALL, OUTRAGE, IRON_TAIL, HYPER_BEAM
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 11, 11 ; DVs
	db 24, 16, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 385 ; HP
	bigdw 385 ; Max HP
	bigdw 340 ; Atk
	bigdw 250 ; Def
	bigdw 252 ; Spd
	bigdw 210 ; SAtk
	bigdw 290 ; SDef
	db "GYARADOS@@@"

	db DRAGONAIR
	db EVERSTONE
	db THUNDER_WAVE, FLAMETHROWER, SURF, SLAM
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 11, 11 ; DVs
	db 16, 16, 16, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 317 ; HP
	bigdw 317 ; Max HP
	bigdw 258 ; Atk
	bigdw 222 ; Def
	bigdw 230 ; Spd
	bigdw 230 ; SAtk
	bigdw 230 ; SDef
	db "DRAGONAIR@@"

	db KINGDRA
	db SCOPE_LENS
	db SMOKESCREEN, SURF, DRAGON_PULSE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 11, 11 ; DVs
	db 24, 16, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 345 ; HP
	bigdw 345 ; Max HP
	bigdw 280 ; Atk
	bigdw 282 ; Def
	bigdw 260 ; Spd
	bigdw 280 ; SAtk
	bigdw 280 ; SDef
	db "KINGDRA@@@@"

	assert_table_length 3

BattleTowerKoga:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerKoga

	db AZUMARILL
	db BERRY_JUICE
	db BELLY_DRUM, DEFENSE_CURL, ROLLOUT, WATERFALL
	dw 0 ; OT ID
	dt 800000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 13, 13, 12 ; DVs
	db 8, 48, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 212 ; Atk
	bigdw 274 ; Def
	bigdw 214 ; Spd
	bigdw 232 ; SAtk
	bigdw 272 ; SDef
	db "AZUMARILL@@"

	db HITMONTOP
	db BLACKBELT_I
	db PLAY_ROUGH, DEFENSE_CURL, ROLLING_KICK, COUNTER
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 13, 13, 12 ; DVs
	db 24, 48, 24, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 285 ; HP
	bigdw 285 ; Max HP
	bigdw 282 ; Atk
	bigdw 284 ; Def
	bigdw 234 ; Spd
	bigdw 162 ; SAtk
	bigdw 312 ; SDef
	db "HITMONTOP@@"

	db WEEZING
	db LEFTOVERS
	db SMOKESCREEN, SMOG, SILVER_WIND, SUBSTITUTE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 12, 13, 13, 12 ; DVs
	db 24, 32, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 315 ; HP
	bigdw 315 ; Max HP
	bigdw 272 ; Atk
	bigdw 334 ; Def
	bigdw 214 ; Spd
	bigdw 262 ; SAtk
	bigdw 232 ; SDef
	db "WEEZING@@@@"

	assert_table_length 3

BattleTowerKaren:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerKaren

	db UMBREON
	db BERRY_JUICE
	db SAND_ATTACK, CONFUSE_RAY, FAINT_ATTACK, MEAN_LOOK
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 14, 14, 13 ; DVs
	db 24, 16, 32, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 381 ; HP
	bigdw 381 ; Max HP
	bigdw 224 ; Atk
	bigdw 316 ; Def
	bigdw 226 ; Spd
	bigdw 214 ; SAtk
	bigdw 354 ; SDef
	db "UMBREON@@@@"

	db MURKROW
	db NOISEMAKER
	db FAINT_ATTACK, AIR_SLASH, NIGHT_SHADE, DESTINY_BOND
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 14, 14, 13 ; DVs
	db 32, 24, 32, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 351 ; HP
	bigdw 351 ; Max HP
	bigdw 304 ; Atk
	bigdw 180 ; Def
	bigdw 278 ; Spd
	bigdw 304 ; SAtk
	bigdw 178 ; SDef
	db "MURKROW@@@@"

	db HOUNDOOM
	db BLACKGLASSES
	db ROAR, SMOG, FLAMETHROWER, CRUNCH
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 14, 14, 13 ; DVs
	db 32, 32, 16, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 359 ; HP
	bigdw 359 ; Max HP
	bigdw 284 ; Atk
	bigdw 216 ; Def
	bigdw 286 ; Spd
	bigdw 332 ; SAtk
	bigdw 272 ; SDef
	db "HOUNDOOM@@@"

	assert_table_length 3

BattleTowerAD:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerAD

	db SHUCKLE
	db LEFTOVERS
	db TOXIC, ATTRACT, DOUBLE_TEAM, REST
	dw 0 ; OT ID
	dt 949930 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 15, 15, 13 ; DVs
	db 8, 10, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 243 ; HP
	bigdw 243 ; Max HP
	bigdw 47 ; Atk
	bigdw 608 ; Def
	bigdw 108 ; Spd
	bigdw 114 ; SAtk
	bigdw 604 ; SDef
	db "SHUCKLE@@@@"

	db NINETALES
	db FOCUS_BAND
	db FLAMETHROWER, ICE_BEAM, TRI_ATTACK, CONFUSE_RAY
	dw 0 ; OT ID
	dt 849970 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 15, 15, 13 ; DVs
	db 16, 16, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 371 ; HP
	bigdw 371 ; Max HP
	bigdw 177 ; Atk
	bigdw 248 ; Def
	bigdw 318 ; Spd
	bigdw 296 ; SAtk
	bigdw 314 ; SDef
	db "NINETALES@@"

	db FARFETCH_D
	db STICK
	db SWORDS_DANCE, SHADOW_CLAW, FLY, CROSS_CHOP
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 15, 15, 13 ; DVs
	db 24, 24, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 317 ; HP
	bigdw 317 ; Max HP
	bigdw 314 ; Atk
	bigdw 248 ; Def
	bigdw 222 ; Spd
	bigdw 222 ; SAtk
	bigdw 238 ; SDef
	db "FARFETCH'D@"

	assert_table_length 3

BattleTowerLucas:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerLucas

	db AMPHAROS
	db DRAGON_FANG
	db RAIN_DANCE, THUNDER, SIGNAL_BEAM, DRAGON_PULSE
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 12 ; DVs
	db 8, 8, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 381 ; HP
	bigdw 381 ; Max HP
	bigdw 181 ; Atk
	bigdw 264 ; Def
	bigdw 204 ; Spd
	bigdw 322 ; SAtk
	bigdw 272 ; SDef
	db "AMPHAROS@@@"

	db POLITOED
	db TWISTEDSPOON
	db HYPNOSIS, DREAM_EATER, SHADOW_BALL, BUBBLEBEAM
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 12 ; DVs
	db 32, 24, 24, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 401 ; HP
	bigdw 401 ; Max HP
	bigdw 181 ; Atk
	bigdw 244 ; Def
	bigdw 234 ; Spd
	bigdw 272 ; SAtk
	bigdw 292 ; SDef
	db "POLITOED@@@"

	db MEGANIUM
	db BERRY_JUICE
	db BODY_SLAM, SOLARBEAM, IRON_TAIL, EARTH_POWER
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 12 ; DVs
	db 24, 16, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 365 ; HP
	bigdw 365 ; Max HP
	bigdw 264 ; Atk
	bigdw 296 ; Def
	bigdw 254 ; Spd
	bigdw 262 ; SAtk
	bigdw 294 ; SDef
	db "MEGANIUM@@@"

	assert_table_length 3

BattleTowerPercy:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerPercy

	db WIGGLYTUFF
	db BRIGHTPOWDER
	db MOONBLAST, BODY_SLAM, ROLLOUT, PSYCHIC_M
	dw 0 ; OT ID
	dt 800000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 14 ; DVs
	db 8, 24, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 499 ; HP
	bigdw 499 ; Max HP
	bigdw 244 ; Atk
	bigdw 194 ; Def
	bigdw 204 ; Spd
	bigdw 286 ; SAtk
	bigdw 216 ; SDef
	db "WIGGLYTUFF@"

	db SUDOWOODO
	db MIRACLEBERRY
	db ROCK_SLIDE, DIG, FAINT_ATTACK, VITAL_THROW
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 14 ; DVs
	db 24, 24, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 294 ; Atk
	bigdw 334 ; Def
	bigdw 154 ; Spd
	bigdw 176 ; SAtk
	bigdw 236 ; SDef
	db "SUDOWOODO@@"

	db WHIMSICOTT
	db KINGS_ROCK
	db LEECH_SEED, SHADOW_BALL, SOLARBEAM, MOONBLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 14 ; DVs
	db 16, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 321 ; HP
	bigdw 321 ; Max HP
	bigdw 165 ; Atk
	bigdw 264 ; Def
	bigdw 326 ; Spd
	bigdw 250 ; SAtk
	bigdw 246 ; SDef
	db "WHIMSICOTT@"

	assert_table_length 3

BattleTowerLewot:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerLewot

	db YANMEGA
	db CANDIED_YAM
	db HYPNOSIS, DRAGON_PULSE, DREAM_EATER, SILVER_WIND
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 32, 16, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 345 ; HP
	bigdw 345 ; Max HP
	bigdw 185 ; Atk
	bigdw 268 ; Def
	bigdw 286 ; Spd
	bigdw 328 ; SAtk
	bigdw 208 ; SDef
	db "YAMMY@@@@@@"

	db JUMPLUFF
	db MIRACLE_SEED
	db TOXIC, LEECH_SEED, AIR_SLASH, GIGA_DRAIN
	dw 0 ; OT ID
	dt 949930 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 8, 16, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 323 ; HP
	bigdw 323 ; Max HP
	bigdw 143 ; Atk
	bigdw 236 ; Def
	bigdw 316 ; Spd
	bigdw 206 ; SAtk
	bigdw 286 ; SDef
	db "CHEER@@@@@@"

	db FERALIGATR
	db BERRY_JUICE
	db WATERFALL, CRUNCH, EARTHQUAKE, AEROBLAST
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 24, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 308 ; Atk
	bigdw 296 ; Def
	bigdw 252 ; Spd
	bigdw 256 ; SAtk
	bigdw 266 ; SDef
	db "ZIGG@@@@@@@"

	assert_table_length 3

BattleTowerLance:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerLance

	db EXEGGUTOR
	db MIRACLE_SEED
	db DRAGON_PULSE, GIGA_DRAIN, PSYCHIC_M, HYPER_BEAM
	dw 0 ; OT ID
	dt 1059860 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 16, 8, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 365 ; HP
	bigdw 365 ; Max HP
	bigdw 225 ; Atk
	bigdw 264 ; Def
	bigdw 204 ; Spd
	bigdw 348 ; SAtk
	bigdw 246 ; SDef
	db "EXEGGUTOR@@"

	db TYRANITAR
	db BLACKGLASSES
	db CRUNCH, ROCK_SLIDE, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 24, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 373 ; HP
	bigdw 373 ; Max HP
	bigdw 364 ; Atk
	bigdw 316 ; Def
	bigdw 218 ; Spd
	bigdw 286 ; SAtk
	bigdw 296 ; SDef
	db "TYRANITAR@@"

	db DRAGONITE
	db DRAGON_FANG
	db SKY_ATTACK, THUNDER_WAVE, OUTRAGE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 8, 16, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 355 ; HP
	bigdw 355 ; Max HP
	bigdw 364 ; Atk
	bigdw 286 ; Def
	bigdw 256 ; Spd
	bigdw 296 ; SAtk
	bigdw 296 ; SDef
	db "DRAGONITE@@"

	assert_table_length 3

BattleTowerRed:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerRed

	db SNORLAX
	db LEFTOVERS
	db BELLY_DRUM, NIGHT_TERROR, REST, BODY_SLAM
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 15, 15, 14 ; DVs
	db 8, 16, 8, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 505 ; HP
	bigdw 505 ; Max HP
	bigdw 316 ; Atk
	bigdw 228 ; Def
	bigdw 158 ; Spd
	bigdw 226 ; SAtk
	bigdw 316 ; SDef
	db "SNORLAX@@@@"

	db ESPEON
	db NOISEMAKER
	db AURA_SPHERE, REFLECT, SHADOW_BALL, PSYCHIC_M
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 15, 15, 14 ; DVs
	db 16, 16, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 315 ; HP
	bigdw 315 ; Max HP
	bigdw 163 ; Atk
	bigdw 218 ; Def
	bigdw 318 ; Spd
	bigdw 356 ; SAtk
	bigdw 286 ; SDef
	db "ESPEON@@@@@"

	db RAICHU
	db BERRY_JUICE
	db SURF, THUNDERBOLT, DAZZLY_GLEAM, FLASH
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 0
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 15, 15, 14 ; DVs
	db 16, 16, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 305 ; HP
	bigdw 305 ; Max HP
	bigdw 213 ; Atk
	bigdw 208 ; Def
	bigdw 318 ; Spd
	bigdw 276 ; SAtk
	bigdw 256 ; SDef
	db "RAICHU@@@@@"

	assert_table_length 3

BattleTowerDefaultParty:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerDefaultParty

	db DITTO
	db X_SPEED
	db TRANSFORM, SELFDESTRUCT, NO_MOVE, NO_MOVE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 0, 0 ; PP
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
	db "DITTO@@@@@@"

	db JIRK
	db X_EVADE
	db CONFUSE_RAY, SPORE, MIND_READER, HORN_DRILL
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 0
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 1, 15, 15, 1 ; DVs
	db 16, 16, 8, 8 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 323 ; HP
	bigdw 323 ; Max HP
	bigdw 155 ; Atk
	bigdw 218 ; Def
	bigdw 290 ; Spd
	bigdw 230 ; SAtk
	bigdw 190 ; SDef
	db "JIRK@@@@@@@"

	db DRAGONITE
	db DRAGON_FANG
	db SKY_ATTACK, THUNDER_WAVE, OUTRAGE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 8, 16, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 355 ; HP
	bigdw 355 ; Max HP
	bigdw 364 ; Atk
	bigdw 286 ; Def
	bigdw 256 ; Spd
	bigdw 296 ; SAtk
	bigdw 296 ; SDef
	db "DRAGONITE@@"

	assert_table_length 3
