	db STARMIE ; 121

	db  60,  75,  85, 115, 105,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 207 ; base exp
	db STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/starmie/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_3, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, NIGHTMARE, SUBSTITUTE, TELEPORT, SCALD, U_TURN, SURF, FLASH, WHIRLPOOL, WATERFALL, THUNDERBOLT, ICE_BEAM, TRI_ATTACK
	; end
