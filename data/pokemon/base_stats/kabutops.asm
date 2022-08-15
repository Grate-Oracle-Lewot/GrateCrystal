	db KABUTOPS ; 141

	db  60, 115, 105,  80,  65,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 201 ; base exp
	db QUICK_CLAW, KINGS_ROCK ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 30 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/kabutops/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, FRUSTRATION, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FALSE_SWIPE, REST, ATTRACT, THIEF, FURY_CUTTER, SUBSTITUTE, CUT, SURF, WHIRLPOOL, ROCK_SMASH, ICE_BEAM
	; end
