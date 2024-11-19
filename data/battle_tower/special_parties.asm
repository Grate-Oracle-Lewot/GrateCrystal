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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "OMASTAR@@@@"

 	db RHYDON
	db SOFT_SAND
	db IRON_HEAD, ROCK_SLIDE, EARTHQUAKE, HORN_DRILL
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "RHYDON@@@@@"

	assert_table_length 3

BattleTowerMisty:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerMisty

 	db LAPRAS
	db NOISEMAKER
	db SURF, PERISH_SONG, BLIZZARD, RAIN_DANCE
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "QUAGSIRE@@@"

 	db STARMIE
	db MYSTIC_WATER
	db SURF, RAIN_DANCE, THUNDER, ICE_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "MAGNETON@@@"

 	db LANTURN
	db SILVERPOWDER
	db RAIN_DANCE, SIGNAL_BEAM, SURF, THUNDER
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "LANTURN@@@@"

	assert_table_length 3

BattleTowerErika:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerErika

	db JUMPLUFF
	db MIRACLE_SEED
	db TOXIC, LEECH_SEED, COTTON_SPORE, GIGA_DRAIN
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 12, 12, 11 ; DVs
	db 8, 16, 32, 8 ; PP
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
	db "JUMPLUFF@@@"

 	db BELLOSSOM
	db DICTIONARY
	db SUNNY_DAY, MOONLIGHT, PETAL_DANCE, SOLARBEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "BELLOSSOM@@"

 	db VICTREEBEL
	db SCOPE_LENS
	db SUNNY_DAY, SYNTHESIS, POISON_JAB, RAZOR_LEAF
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "CROBAT@@@@@"

 	db TENTACRUEL
	db MIRACLE_SEED
	db SCALD, SLUDGE_BOMB, SURF, GIGA_DRAIN
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "TENTACRUEL@"

 	db SLOWKING
	db QUICK_CLAW
	db CURSE, STRENGTH, POISON_JAB, REST
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "JYNX@@@@@@@"

 	db ALAKAZAM
	db TWISTEDSPOON
	db RECOVER, AURA_SPHERE, PSYCHIC_M, REFLECT
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "ALAKAZAM@@@"

	assert_table_length 3

BattleTowerBlaine:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerBlaine

	db SUNFLORA
	db QUICK_CLAW
	db SUNNY_DAY, SOLARBEAM, FLAMETHROWER, MORNING_SUN
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "SUNFLORA@@@"

 	db ARCANINE
	db CHARCOAL
	db ROAR, FLAMETHROWER, PLAY_ROUGH, CRUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "ARCANINE@@@"

 	db RAPIDASH
	db BERRY_JUICE
	db QUICK_ATTACK, MEGAHORN, FURY_ATTACK, FIRE_BLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "MAROWAK@@@@"

 	db NIDOKING
	db KINGS_ROCK
	db EARTHQUAKE, POISON_JAB, THUNDERPUNCH, MEGAHORN
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "XATU@@@@@@@"

 	db GLIGAR
	db QUICK_CLAW
	db FLY, DIG, SWORDS_DANCE, CRABHAMMER
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "KINGLER@@@@"

 	db HERACROSS
	db FOCUS_BAND
	db MEGAHORN, COUNTER, REVERSAL, FLY
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "SCIZOR@@@@@"

	assert_table_length 3

BattleTowerWhitney:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerWhitney

	db BLISSEY
	db LUCKY_PUNCH
	db HYPER_BEAM, ATTRACT, ROLLOUT, SOFTBOILED
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "GIRAFARIG@@"

 	db MILTANK
	db X_ACCURACY
	db ROLLOUT, ATTRACT, BODY_SLAM, MILK_DRINK
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "NOCTOWL@@@@"

 	db MISDREAVUS
	db SPELL_TAG
	db MEAN_LOOK, PERISH_SONG, CONFUSE_RAY, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "MISDREAVUS@"

 	db GENGAR
	db MIRACLEBERRY
	db HYPNOSIS, SHADOW_BALL, AURA_SPHERE, DREAM_EATER
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "PRIMEAPE@@@"

 	db POLIWRATH
	db HARDHAT
	db HYPNOSIS, WATERFALL, SCALD, SUBMISSION
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "POLIWRATH@@"

 	db KANGASKHAN
	db X_ACCURACY
	db DIZZY_PUNCH, DYNAMICPUNCH, LOW_KICK, MILK_DRINK
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "KANGASKHAN@"

	assert_table_length 3

BattleTowerJasmine:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerJasmine

	db SKARMORY
	db NOISEMAKER
	db SPIKES, DAZZLY_GLEAM, STEEL_WING, SKY_ATTACK
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "SKARMORY@@@"

 	db CLOYSTER
	db X_SP_DEFEND
	db CRABHAMMER, SPIKE_CANNON, ICE_BEAM, PROTECT
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "STEELIX@@@@"

	assert_table_length 3

BattleTowerPryce:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerPryce

	db SNEASEL
	db SCOPE_LENS
	db BEAT_UP, ICE_PUNCH, FAINT_ATTACK, STRENGTH
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "DEWGONG@@@@"

 	db PILOSWINE
	db NEVERMELTICE
	db FLAIL, EARTHQUAKE, HAIL, BLIZZARD
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "PILOSWINE@@"

	assert_table_length 3

BattleTowerClair:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerClair

	db GYARADOS
	db MYSTIC_WATER
	db WATERFALL, OUTRAGE, IRON_TAIL, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "GYARADOS@@@"

 	db DRAGONAIR
	db EVERSTONE
	db THUNDER_WAVE, FLAMETHROWER, SURF, SLAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "KINGDRA@@@@"

	assert_table_length 3

BattleTowerKoga:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerKoga

	db AZUMARILL
	db BERRY_JUICE
	db BELLY_DRUM, DEFENSE_CURL, ROLLOUT, WATERFALL
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "WEEZING@@@@"

	assert_table_length 3

BattleTowerKaren:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerKaren

	db UMBREON
	db LEFTOVERS
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "UMBREON@@@@"

 	db MURKROW
	db NOISEMAKER
	db FAINT_ATTACK, AIR_SLASH, NIGHT_SHADE, DESTINY_BOND
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "MURKROW@@@@"

 	db HOUNDOOM
	db BLACKGLASSES
	db ROAR, SMOG, FLAMETHROWER, CRUNCH
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "HOUNDOOM@@@"

	assert_table_length 3

BattleTowerAD:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerAD

	db SHUCKLE
	db LEFTOVERS
	db TOXIC, ATTRACT, DOUBLE_TEAM, REST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 15, 15, 13 ; DVs
	db 8, 10, 24, 8 ; PP
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
	db "SHUCKLE@@@@"

 	db NINETALES
	db FOCUS_BAND
	db FLAMETHROWER, ICE_BEAM, TRI_ATTACK, ROAR
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 11, 15, 15, 13 ; DVs
	db 16, 16, 16, 20 ; PP
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "FARFETCH'D@"

	assert_table_length 3

BattleTowerLucas:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerLucas

	db AMPHAROS
	db DRAGON_FANG
	db RAIN_DANCE, THUNDER, SIGNAL_BEAM, DRAGON_PULSE
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 12 ; DVs
	db 8, 8, 24, 16 ; PP
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
	db "AMPHAROS@@@"

 	db POLITOED
	db TWISTEDSPOON
	db HYPNOSIS, DREAM_EATER, SHADOW_BALL, BUBBLEBEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 12 ; DVs
	db 32, 24, 24, 32 ; PP
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
	db "POLITOED@@@"

 	db MEGANIUM
	db BERRY_JUICE
	db BODY_SLAM, SOLARBEAM, IRON_TAIL, EARTH_POWER
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "MEGANIUM@@@"

	assert_table_length 3

BattleTowerPercy:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerPercy

	db WIGGLYTUFF
	db BRIGHTPOWDER
	db MOONBLAST, BODY_SLAM, ROLLOUT, PSYCHIC_M
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "SUDOWOODO@@"

 	db WHIMSICOTT
	db KINGS_ROCK
	db LEECH_SEED, SHADOW_BALL, SOLARBEAM, MOONBLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 13, 13, 13, 14 ; DVs
	db 16, 24, 16, 8 ; PP
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
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 32, 16, 24, 16 ; PP
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
	db "YAMMY@@@@@@"

 	db GENGAR
	db FOCUS_BAND
	db HYPNOSIS, DARK_PULSE, DREAM_EATER, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 32, 24, 24, 24 ; PP
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
	db "GINGER@@@@@"

 	db FERALIGATR
	db BERRY_JUICE
	db WATERFALL, CRUNCH, EARTHQUAKE, AEROBLAST
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "ZIGG@@@@@@@"

	assert_table_length 3

BattleTowerLance:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerLance

	db EXEGGUTOR
	db MIRACLE_SEED
	db DRAGON_PULSE, GIGA_DRAIN, PSYCHIC_M, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 14, 14, 14 ; DVs
	db 16, 8, 16, 8 ; PP
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
	db "EXEGGUTOR@@"

 	db TYRANITAR
	db BLACKGLASSES
	db CRUNCH, ROCK_SLIDE, EARTHQUAKE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "TYRANITAR@@"

 	db DRAGONITE
	db DRAGON_FANG
	db SKY_ATTACK, THUNDER_WAVE, OUTRAGE, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "DRAGONITE@@"

	assert_table_length 3

BattleTowerRed:
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerRed

 	db SNORLAX
	db LEFTOVERS
	db BELLY_DRUM, NIGHT_TERROR, REST, BODY_SLAM
	dw 0 ; OT ID
	dt 1000000 ; Exp
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
	bigdw 303 ; HP
	bigdw 303 ; Max HP
	bigdw 198 ; Atk
	bigdw 198 ; Def
	bigdw 598 ; Spd
	bigdw 198 ; SAtk
	bigdw 198 ; SDef
	db "SNORLAX@@@@"

 	db ESPEON
	db NOISEMAKER
	db AURA_SPHERE, REFLECT, SHADOW_BALL, PSYCHIC_M
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 15, 15, 14 ; DVs
	db 16, 16, 24, 16 ; PP
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
	db "ESPEON@@@@@"

	db RAICHU
	db BERRY_JUICE
	db CHARM, THUNDERBOLT, DAZZLY_GLEAM, SURF
	dw 0 ; OT ID
	dt 1000000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 14, 15, 15, 14 ; DVs
	db 32, 16, 24, 16 ; PP
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
	db "RAICHU@@@@@"

	assert_table_length 3
