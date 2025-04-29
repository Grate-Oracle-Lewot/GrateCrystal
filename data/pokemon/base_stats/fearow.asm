	db FEAROW ; 022

	db  65,  95,  65, 105,  61,  61
	;   hp  atk  def  spd  sat  sdf

	db FLYING, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp
	db SHARP_BEAK, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/fearow/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FAIRY_WIND, SUBSTITUTE, CUT, FLY
	; end
