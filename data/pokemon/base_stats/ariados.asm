	db ARIADOS ; 168

	db  80,  90,  80,  49,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, DARK ; type
	db 90 ; catch rate
	db 142 ; base exp
	db DUSK_BALL, ANTIVENOM ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/ariados/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, POISON_JAB, SOLARBEAM, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, THIEF, FURY_CUTTER, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, FLASH
	; end
