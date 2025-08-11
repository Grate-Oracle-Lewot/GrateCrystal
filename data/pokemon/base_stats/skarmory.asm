	db SKARMORY ; 227

	db  65,  80, 140,  90,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FLYING ; type
	db 45 ; catch rate
	db 168 ; base exp
	db TM_STEEL_WING, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/skarmory/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, BLITZKRIEG, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, AVALANCHE, PROTECT, ACROBATICS, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FAIRY_WIND, DARK_PULSE, SUBSTITUTE, U_TURN, CUT, FLY
	; end
