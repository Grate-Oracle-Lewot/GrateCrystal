	db PICHU ; 172

	db  20,  40,  15,  60,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FAIRY ; type
	db 190 ; catch rate
	db 42 ; base exp
	db BERRY, LIGHT_BALL ; items
	db GENDER_F50 ; gender ratio
	db 6 ; step cycles to hatch
	INCBIN "gfx/pokemon/pichu/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, HIDDEN_POWER, SNORE, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, FAIRY_WIND, MOONBLAST, SUBSTITUTE, FLY, SURF, FLASH, ROCK_SMASH, THUNDERBOLT, TRI_ATTACK, AURA_SPHERE
	; end
