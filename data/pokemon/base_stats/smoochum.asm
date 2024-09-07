	db SMOOCHUM ; 238

	db  45,  30,  15,  65,  85,  65
	;   hp  atk  def  spd  sat  sdf

	db ICE, FAIRY ; type
	db 45 ; catch rate
	db 87 ; base exp
	db ICE_BERRY, TM_ICE_PUNCH ; items
	db GENDER_F100 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/smoochum/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SWEET_SCENT, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, DREAM_EATER, REST, THIEF, NIGHTMARE, FAIRY_WIND, HAIL, NIGHT_TERROR, SUBSTITUTE, ICE_BEAM, TRI_ATTACK
	; end
