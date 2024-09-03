	db PIKACHU ; 025

	db  35,  55,  40,  90,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, CURSE_TYPE ; type
	db 190 ; catch rate
	db 84 ; base exp
	db BERRY, LIGHT_BALL ; items
	db GENDER_F50 ; gender ratio
	db 6 ; step cycles to hatch
	INCBIN "gfx/pokemon/pikachu_crystal/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, HIDDEN_POWER, SNORE, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, FAIRY_WIND, MOONBLAST, SUBSTITUTE, FLY, SURF, STRENGTH, FLASH, ROCK_SMASH, THUNDERBOLT, TRI_ATTACK, AURA_SPHERE
	; end
