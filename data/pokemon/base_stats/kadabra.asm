	db KADABRA ; 064

	db  42,  35,  30, 105, 120,  73
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp
	db TWISTEDSPOON, MOON_STONE ; items
	db GENDER_F25 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/kadabra/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, RAIN_DANCE, ENDURE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, THUNDERPUNCH, DREAM_EATER, FALSE_SWIPE, REST, ATTRACT, THIEF, FIRE_PUNCH, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, TELEPORT, U_TURN, FLASH, TRI_ATTACK, AURA_SPHERE
	; end
