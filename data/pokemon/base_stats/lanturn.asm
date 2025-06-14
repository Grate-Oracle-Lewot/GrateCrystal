	db LANTURN ; 171

	db 125,  58,  58,  67,  76,  76
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC ; type
	db 75 ; catch rate
	db 156 ; base exp
	db SWAG_BEACON, BRIGHTPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/lanturn/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SNORE, HYPER_BEAM, AVALANCHE, PROTECT, RAIN_DANCE, ENDURE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, NIGHTMARE, MOONBLAST, SUBSTITUTE, SCALD, SURF, FLASH, WHIRLPOOL, WATERFALL, THUNDERBOLT, ICE_BEAM, TRI_ATTACK, AURA_SPHERE
	; end
