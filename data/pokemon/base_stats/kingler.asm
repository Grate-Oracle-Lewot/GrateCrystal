	db KINGLER ; 099

	db  55, 130, 115,  75,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, BUG ; type
	db 60 ; catch rate
	db 206 ; base exp
	db PROTEIN, PEARL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kingler/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, FALSE_SWIPE, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, SCALD, CUT, SURF, STRENGTH, WHIRLPOOL, ROCK_SMASH, ICE_BEAM
	; end
