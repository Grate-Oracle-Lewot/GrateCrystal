	db SKARMORY ; 227

	db  65,  80, 140,  70,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FLYING ; type
	db 45 ; catch rate
	db 168 ; base exp
	db TM_STEEL_WING, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 13 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/skarmory/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FAIRY_WIND, DARK_PULSE, SUBSTITUTE, CUT, FLY
	; end
