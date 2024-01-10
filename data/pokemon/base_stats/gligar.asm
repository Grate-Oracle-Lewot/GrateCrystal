	db GLIGAR ; 207

	db  65,  95, 105,  95,  45,  65
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FLYING ; type
	db 60 ; catch rate
	db 150 ; base exp
	db ETHER, MAX_ETHER ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/gligar/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FURY_CUTTER, DARK_PULSE, SUBSTITUTE, SHADOW_CLAW, CUT, FLY, STRENGTH, ROCK_SMASH
	; end
