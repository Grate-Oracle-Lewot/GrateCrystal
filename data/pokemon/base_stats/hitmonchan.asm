	db HITMONCHAN ; 107

	db  50, 105,  79,  76,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 140 ; base exp
	db TM_DYNAMICPUNCH, BLACKBELT_I ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/hitmonchan/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, SUBSTITUTE, STRENGTH, ROCK_SMASH, AURA_SPHERE
	; end
