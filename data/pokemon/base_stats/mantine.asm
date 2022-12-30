	db MANTINE ; 226

	db  85,  40,  70,  70,  80, 140
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 168 ; base exp
	db FRESH_WATER, TM_STEEL_WING ; items
	db GENDER_F50 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/mantine/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, STEEL_WING, SUBSTITUTE, SCALD, FLY, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
