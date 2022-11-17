	db UNOWN ; 201

	db  42,  72,  84,  84,  72,  96
	;   hp  atk  def  spd  sat  sdf

	db CURSE_TYPE, CURSE_TYPE ; type
	db 42 ; catch rate
	db 103 ; base exp
	db MYSTERYBERRY, TM_HIDDEN_POWER ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 42 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/unown_a/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, THIEF, NIGHTMARE, FAIRY_WIND, MOONBLAST, DARK_PULSE, SUBSTITUTE, HYPNOSIS, TELEPORT, FLY, STRENGTH, FLASH, THUNDERBOLT, TRI_ATTACK, AURA_SPHERE
	; end
