	db AZUMARILL ; 184

	db 115,  60,  90,  60,  70,  90
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 75 ; catch rate
	db 153 ; base exp
	db BERRY, MYSTIC_WATER ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, FAIRY_WIND, MOONBLAST, HAIL, SUBSTITUTE, SCALD, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ROCK_SMASH, ICE_BEAM, AEROBLAST
	; end
