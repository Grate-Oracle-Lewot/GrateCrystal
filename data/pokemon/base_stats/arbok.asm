	db ARBOK ; 024

	db  60,  95,  70,  80,  65,  80
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK ; type
	db 90 ; catch rate
	db 147 ; base exp
	db ANTIDOTE, LUCKY_EGG ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/arbok/front.dimensions"
	db GROWTH_SLIGHTLY_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, POISON_JAB, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, DEFENSE_CURL, REST, ATTRACT, THIEF, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, STRENGTH, WATERFALL
	; end
