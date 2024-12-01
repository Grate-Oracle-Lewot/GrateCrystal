	db HITMONTOP ; 237

	db  50,  95,  95,  90,  25, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FAIRY ; type
	db 45 ; catch rate
	db 142 ; base exp
	db FOCUS_BAND, BLACKBELT_I ; items
	db GENDER_F12_5 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmontop/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, POISON_JAB, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, THIEF, FAIRY_WIND, SUBSTITUTE, STRENGTH, WHIRLPOOL, ROCK_SMASH, AURA_SPHERE
	; end
