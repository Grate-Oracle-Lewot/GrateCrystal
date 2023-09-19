	db ELECTRODE ; 101

	db  60,  50,  70, 152,  84,  84
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp
	db ULTRA_BALL, POKE_BALL ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/electrode/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, SELFDESTRUCT, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, SUBSTITUTE, FLASH, THUNDERBOLT
	; end
