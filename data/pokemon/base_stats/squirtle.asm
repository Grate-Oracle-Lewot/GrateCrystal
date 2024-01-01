	db SQUIRTLE ; 007

	db  44,  48,  67,  43,  50,  66
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 65 ; base exp
	db GOLD_BERRY, MYSTIC_WATER ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/squirtle/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, HAIL, SUBSTITUTE, SCALD, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ROCK_SMASH, ICE_BEAM, TRI_ATTACK, AEROBLAST
	; end
