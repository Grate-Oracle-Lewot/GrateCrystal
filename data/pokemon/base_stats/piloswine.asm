	db PILOSWINE ; 221

	db 105, 115,  80,  65,  65,  60
	;   hp  atk  def  spd  sat  sdf

	db ICE, GROUND ; type
	db 75 ; catch rate
	db 183 ; base exp
	db BIG_MUSHROOM, TINYMUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/piloswine/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, BLITZKRIEG, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, AVALANCHE, PROTECT, RAIN_DANCE, POISON_JAB, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, HAIL, SUBSTITUTE, CUT, STRENGTH, ROCK_SMASH, ICE_BEAM
	; end
