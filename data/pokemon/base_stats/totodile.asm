	db TOTODILE ; 158

	db  50,  67,  64,  43,  46,  48
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 65 ; base exp
	db GOLD_BERRY, MYSTIC_WATER ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/totodile/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, AVALANCHE, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, FALSE_SWIPE, REST, ATTRACT, HAIL, SUBSTITUTE, SHADOW_CLAW, SCALD, CUT, SURF, WATERFALL, ICE_BEAM, TRI_ATTACK, AEROBLAST
	; end
