	db MURKROW ; 198

	db  80, 105,  42,  91,  95,  42
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 45 ; catch rate
	db 147 ; base exp
	db BLACKGLASSES, LIMBO_STICK ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/murkrow/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, ICY_WIND, PROTECT, ENDURE, FRUSTRATION, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, FLY
	; end
