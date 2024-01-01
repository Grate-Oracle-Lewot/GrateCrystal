	db CROCONAW ; 159

	db  65,  80,  80,  58,  59,  63
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 142 ; base exp
	db GOLD_BERRY, MYSTIC_WATER ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/croconaw/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, FALSE_SWIPE, REST, ATTRACT, FURY_CUTTER, HAIL, SUBSTITUTE, SHADOW_CLAW, SCALD, CUT, SURF, STRENGTH, WATERFALL, ROCK_SMASH, ICE_BEAM, TRI_ATTACK, AEROBLAST
	; end
