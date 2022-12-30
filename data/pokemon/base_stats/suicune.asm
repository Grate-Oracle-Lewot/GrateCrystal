	db SUICUNE ; 245

	db 100,  75, 115,  85,  90, 115
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 10 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 42 ; step cycles to hatch
	INCBIN "gfx/pokemon/suicune/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, REST, FAIRY_WIND, MOONBLAST, HAIL, SUBSTITUTE, SCALD, CUT, SURF, WHIRLPOOL, WATERFALL, ROCK_SMASH, ICE_BEAM, TRI_ATTACK, AEROBLAST, AURA_SPHERE
	; end
