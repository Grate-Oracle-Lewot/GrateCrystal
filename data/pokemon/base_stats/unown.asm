	db UNOWN ; 201

	db  42,  72,  84,  84,  72,  96
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
else
	db CURSE_TYPE, CURSE_TYPE ; type
endc
	db 42 ; catch rate
	db 103 ; base exp
	db SILVER_BERRY, TM_HIDDEN_POWER ; items
	db GENDER_UNKNOWN ; gender ratio
	db 42 ; step cycles to hatch
	INCBIN "gfx/pokemon/unown_a/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ACROBATICS, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, THIEF, NIGHTMARE, FAIRY_WIND, MOONBLAST, DARK_PULSE, SUBSTITUTE, TELEPORT, U_TURN, FLY, STRENGTH, FLASH, THUNDERBOLT, TRI_ATTACK, AURA_SPHERE
	; end
