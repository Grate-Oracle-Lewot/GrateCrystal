	db HYPNO ; 097

	db  85,  73,  70,  67,  74, 115
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, DARK ; type
	db 75 ; catch rate
	db 165 ; base exp
	db MINT_BERRY, TM_DREAM_EATER ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/hypno/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, THUNDERPUNCH, DREAM_EATER, REST, ATTRACT, THIEF, FIRE_PUNCH, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, TELEPORT, STRENGTH, FLASH
	; end
