	db ZUBAT ; 041

	db  40,  45,  35,  55,  30,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp
	db BITTER_BERRY, DICTIONARY ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/zubat/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, ICY_WIND, PROTECT, GIGA_DRAIN, ENDURE, POISON_JAB, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE
	; end
