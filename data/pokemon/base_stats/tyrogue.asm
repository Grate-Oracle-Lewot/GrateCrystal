	db TYROGUE ; 236

	db  35,  35,  35,  40,  15,  50
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 91 ; base exp
	db EVERSTONE, BLACKBELT_I ; items
	db GENDER_F12_5 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/tyrogue/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, THIEF, SUBSTITUTE, STRENGTH, ROCK_SMASH, AURA_SPHERE
	; end
