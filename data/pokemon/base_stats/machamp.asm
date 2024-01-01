	db MACHAMP ; 068

	db  90, 130,  80,  55,  65,  85
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 193 ; base exp
	db BLACKBELT_I, MOON_STONE ; items
	db GENDER_F25 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/machamp/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, FIRE_BLAST, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, NIGHT_TERROR, SUBSTITUTE, STRENGTH, ROCK_SMASH
	; end
