	db MEOWTH ; 052

	db  40,  50,  40,  95,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, STEEL ; type
	db 255 ; catch rate
	db 69 ; base exp
	db NUGGET, AMULET_COIN ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/meowth/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, THUNDER, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, DREAM_EATER, FALSE_SWIPE, REST, ATTRACT, THIEF, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, HYPNOSIS, CUT, THUNDERBOLT
	; end
