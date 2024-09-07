	db TURBIN ; ???

	db  100, 90, 130,  50,  45, 110
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 42 ; catch rate
	db 201 ; base exp
	db SLOWPOKETAIL, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/turbin/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_3, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, DEFENSE_CURL, REST, HAIL, NIGHT_TERROR, SUBSTITUTE, SCALD, SURF, WHIRLPOOL, ROCK_SMASH, ICE_BEAM
	; end
