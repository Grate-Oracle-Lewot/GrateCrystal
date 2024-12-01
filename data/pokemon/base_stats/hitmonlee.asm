	db HITMONLEE ; 106

	db  50, 130,  53,  97,  25, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 142 ; base exp
	db BLACKBELT_I, FOCUS_BAND ; items
	db GENDER_F12_5 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmonlee/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, POISON_JAB, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, SUBSTITUTE, STRENGTH, ROCK_SMASH, AURA_SPHERE
	; end
