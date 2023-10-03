	db PINSIR ; 127

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp
	db PROTEIN, SCOPE_LENS ; items
	db GENDER_F50 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/pinsir_f/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FALSE_SWIPE, REST, ATTRACT, THIEF, FURY_CUTTER, NIGHT_TERROR, SUBSTITUTE, CUT, STRENGTH, ROCK_SMASH
	; end
