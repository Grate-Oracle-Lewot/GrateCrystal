	db SLOWPOKE ; 079

	db  90,  65,  65,  10,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 100 ; base exp
	db SLOWPOKETAIL, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 37 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowpoke/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, AVALANCHE, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, IRON_TAIL, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, ATTRACT, NIGHTMARE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, TELEPORT, SCALD, SURF, STRENGTH, FLASH, ICE_BEAM, AURA_SPHERE
	; end
