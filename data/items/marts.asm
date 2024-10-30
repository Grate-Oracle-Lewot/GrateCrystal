Marts:
; entries correspond to MART_* constants (see constants/mart_constants.asm)
	table_width 2, Marts
	dw MartCherrygrove
	dw MartCherrygroveDex
	dw MartViolet
	dw MartAzalea
	dw MartCianwood
	dw MartGoldenrod2F1
	dw MartGoldenrod2F2
	dw MartGoldenrod3F
	dw MartGoldenrod3F2
	dw MartGoldenrod4F
	dw MartGoldenrod5F
	dw MartOlivine
	dw MartEcruteak
	dw MartMahogany1
	dw MartMahogany2
	dw MartBlackthorn
	dw MartViridian
	dw MartPewter
	dw MartCerulean
	dw MartLavender
	dw MartVermilion
	dw MartCeladon2F1
	dw MartCeladon2F2
	dw MartCeladon3F
	dw MartCeladon4F1
	dw MartCeladon4F2
	dw MartCeladon4F3
	dw MartCeladon5F1
	dw MartCeladon5F2
	dw MartFuchsia
	dw MartSaffron
	dw MartMtMoon
	dw MartIndigoPlateau
	dw MartUnderground
	dw MartBerry
	dw MartApricorn
	assert_table_length NUM_MARTS

MartCherrygrove:
	db 4 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartCherrygroveDex:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartViolet:
	db 10 ; # items
	db POKE_BALL
	db POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db X_SPEED
	db X_ATTACK
	db X_DEFEND
	db SWAG_BEACON
	db -1 ; end

MartAzalea:
	db 8 ; # items
	db CHARCOAL
	db TM_FALSE_SWIPE
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db FLOWER_MAIL
	db -1 ; end

MartCianwood:
	db 5 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db -1 ; end

MartGoldenrod2F1:
	db 9 ; # items
	db POTION
	db SUPER_POTION
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db -1 ; end

MartGoldenrod2F2:
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db TIMER_BALL
	db ESCAPE_ROPE
	db REPEL
	db POKE_DOLL
	db SWAG_BEACON
	db MUSIC_MAIL
	db -1 ; end

MartGoldenrod3F:
	db 8 ; # items
	db X_ATTACK
	db X_DEFEND
	db X_SPECIAL
	db X_SP_DEFEND
	db X_SPEED
	db DIRE_HIT
	db GUARD_SPEC
	db X_ACCURACY
	db -1 ; end

MartGoldenrod3F2:
	db 7 ; # items
	db FIRE_STONE
	db WATER_STONE
	db LEAF_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db EVERSTONE
	db -1 ; end

MartGoldenrod4F:
	db 5 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db -1 ; end

MartGoldenrod5F:
	db 10 ; # items
	db TM_FAIRY_WIND
	db TM_HEADBUTT
	db TM_SWIFT
	db TM_SNORE
	db TM_SUBSTITUTE
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_SELFDESTRUCT
	db TM_THIEF
	db -1 ; end

MartOlivine:
	db 5 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db MOOMOO_MILK
	db SUPER_REPEL
	db SURF_MAIL
	db -1 ; end

MartEcruteak:
	db 9 ; # items
	db POKE_BALL
	db DUSK_BALL
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db REVIVE
	db -1 ; end

MartMahogany1:
	db 3 ; # items
	db SLOWPOKETAIL
	db SWAG_BEACON
	db TM_THIEF
	db -1 ; end

MartMahogany2:
	db 8 ; # items
	db RAGECANDYBAR
	db GREAT_BALL
	db MOOMOO_MILK
	db HYPER_POTION
	db SUPER_REPEL
	db REVIVE
	db BLUESKY_MAIL
	db TM_HAIL
	db -1 ; end

MartBlackthorn:
	db 9 ; # items
	db ULTRA_BALL
	db DUSK_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db X_EVADE
	db TM_HYPER_BEAM
	db -1 ; end

MartViridian:
	db 10 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db MIRAGE_MAIL
	db TM_MUD_SLAP
	db -1 ; end

MartPewter:
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db X_ATTACK
	db X_DEFEND
	db X_ACCURACY
	db X_EVADE
	db TM_ROLLOUT
	db -1 ; end

MartCerulean:
	db 9 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db MOOMOO_MILK
	db SUPER_REPEL
	db FULL_HEAL
	db DIRE_HIT
	db GUARD_SPEC
	db LITEBLUEMAIL
	db TM_SCALD
	db -1 ; end

MartLavender:
	db 9 ; # items
	db DUSK_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db REVIVE
	db POKE_DOLL
	db AWAKENING
	db ESCAPE_ROPE
	db TM_NIGHTMARE
	db -1 ; end

MartVermilion:
	db 6 ; # items
	db ULTRA_BALL
	db MOOMOO_MILK
	db HYPER_POTION
	db SWAG_BEACON
	db MORPH_MAIL
	db TM_THUNDERPUNCH
	db -1 ; end

MartCeladon2F1:
	db 10 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db POKE_DOLL
	db SWAG_BEACON
	db ESCAPE_ROPE
	db -1 ; end

MartCeladon2F2:
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db TIMER_BALL
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db -1 ; end

MartCeladon3F:
	db 10 ; # items
	db TM_HIDDEN_POWER
	db TM_PROTECT
	db TM_REST
	db TM_PSYCH_UP
	db TM_ATTRACT
	db TM_DEFENSE_CURL
	db TM_SUNNY_DAY
	db TM_RAIN_DANCE
	db TM_SANDSTORM
	db TM_HAIL
	db -1 ; end

MartCeladon4F1:
	db 10 ; # items
	db ANTIVENOM
	db ALOE_VERA
	db HANDWARMER
	db NOISEMAKER
	db LIMBO_STICK
	db DICTIONARY
	db HARDHAT
	db SMOKE_BALL
	db CATCH_CHARM
	db PORTRAITMAIL
	db -1 ; end

MartCeladon4F2:
	db 10 ; # items
	db PINK_BOW
	db BLACKBELT_I
	db SHARP_BEAK
	db POISON_BARB
	db SOFT_SAND
	db HARD_STONE
	db SILVERPOWDER
	db BLACKGLASSES
	db METAL_COAT
	db TRIDENT
	db -1 ; end

MartCeladon4F3:
	db 10 ; # items
	db CHARCOAL
	db MYSTIC_WATER
	db MIRACLE_SEED
	db MAGNET
	db TWISTEDSPOON
	db NEVERMELTICE
	db SPELL_TAG
	db POLKADOT_BOW
	db DRAGON_FANG
	db DRAGON_SCALE
	db -1 ; end

MartCeladon5F1:
	db 6 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db PP_UP
	db -1 ; end

MartCeladon5F2:
	db 9 ; # items
	db X_ATTACK
	db X_DEFEND
	db X_SPECIAL
	db X_SP_DEFEND
	db X_SPEED
	db X_ACCURACY
	db X_EVADE
	db DIRE_HIT
	db GUARD_SPEC
	db -1 ; end

MartFuchsia:
	db 8 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db LOVELY_MAIL
	db TM_SLUDGE_BOMB
	db -1 ; end

MartSaffron:
	db 8 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db TIMER_BALL
	db HYPER_POTION
	db MAX_POTION
	db X_SPECIAL
	db X_SP_DEFEND
	db TM_DREAM_EATER
	db -1 ; end

MartMtMoon:
	db 9 ; # items
	db POKE_DOLL
	db DUSK_BALL
	db STICK
	db LUCKY_PUNCH
	db THICK_CLUB
	db LIGHT_BALL
	db CLEANSE_TAG
	db EON_MAIL
	db TM_MOONBLAST
	db -1 ; end

MartIndigoPlateau:
	db 10 ; # items
	db ULTRA_BALL
	db TIMER_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db TM_DARK_PULSE
	db TM_NIGHT_TERROR
	db -1 ; end

MartUnderground:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1 ; end

MartBerry:
	db 6 ; # items
	db BERRY
	db GOLD_BERRY
	db MYSTERYBERRY
	db MINT_BERRY
	db BITTER_BERRY
	db MIRACLEBERRY
	db -1 ; end

MartApricorn:
	db 7 ; # items
	db RED_APRICORN
	db BLU_APRICORN
	db YLW_APRICORN
	db GRN_APRICORN
	db WHT_APRICORN
	db BLK_APRICORN
	db PNK_APRICORN
	db -1 ; end
