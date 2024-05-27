	db ABRA ; 063

	db  25,  20,  15,  90, 105,  55
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp
	db TM_TELEPORT, TWISTEDSPOON ; items
	db GENDER_F25 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/abra/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, PSYCH_UP, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE, TELEPORT
	; end
