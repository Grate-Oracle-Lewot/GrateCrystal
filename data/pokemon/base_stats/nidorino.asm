	db NIDORINO ; 033

	db  61,  72,  57,  65,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 120 ; catch rate
	db 118 ; base exp
	db POISON_BARB, MOON_STONE ; items
	db GENDER_F0 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidorino/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, IRON_TAIL, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, THIEF, SUBSTITUTE, SHADOW_CLAW, STRENGTH, ROCK_SMASH, THUNDERBOLT, ICE_BEAM
	; end
