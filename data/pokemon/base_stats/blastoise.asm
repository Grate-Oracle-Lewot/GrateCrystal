	db BLASTOISE ; 009

	db  80,  83, 105,  78,  85, 103
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 210 ; base exp
	db GOLD_BERRY, MYSTIC_WATER ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/blastoise/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROAR, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, AVALANCHE, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, DARK_PULSE, HAIL, SUBSTITUTE, SCALD, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ROCK_SMASH, ICE_BEAM, TRI_ATTACK, AEROBLAST
	; end
