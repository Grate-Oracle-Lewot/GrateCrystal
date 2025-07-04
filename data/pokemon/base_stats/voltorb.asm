	db VOLTORB ; 100

	db  40,  30,  50, 100,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp
	db POKE_BALL, GREAT_BALL ; items
	db GENDER_UNKNOWN ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/voltorb/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, SELFDESTRUCT, HIDDEN_POWER, SNORE, PROTECT, RAIN_DANCE, ENDURE, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, SUBSTITUTE, U_TURN, FLASH, THUNDERBOLT
	; end
