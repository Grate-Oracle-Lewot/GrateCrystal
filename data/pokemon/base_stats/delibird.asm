	db DELIBIRD ; 225

	db  54,  84,  54, 135,  84,  54
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 45 ; catch rate
	db 183 ; base exp
	db NUGGET, CHARCOAL ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/delibird/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, SOLARBEAM, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, REST, ATTRACT, THIEF, FAIRY_WIND, HAIL, SUBSTITUTE, SCALD, FLY, STRENGTH, FLASH, ICE_BEAM, TRI_ATTACK, AEROBLAST
	; end
