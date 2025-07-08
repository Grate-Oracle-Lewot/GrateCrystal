	db PERSIAN ; 053

	db  65,  95,  65, 140,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, STEEL ; type
	db 90 ; catch rate
	db 148 ; base exp
	db NUGGET, AMULET_COIN ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/persian/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, DREAM_EATER, FALSE_SWIPE, REST, ATTRACT, THIEF, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, U_TURN, CUT, FLASH, THUNDERBOLT
	; end
