	db PRIMEAPE ; 057

	db  87, 110,  70,  93,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, DARK ; type
	db 75 ; catch rate
	db 159 ; base exp
	db TM_THIEF, TM_IRON_TAIL ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/primeape/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, THIEF, FIRE_PUNCH, SUBSTITUTE, SHADOW_CLAW, STRENGTH, ROCK_SMASH, THUNDERBOLT
	; end
