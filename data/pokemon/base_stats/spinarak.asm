	db SPINARAK ; 167

	db  50,  60,  50,  37,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db BUG, DARK ; type
	db 255 ; catch rate
	db 54 ; base exp
	db ESCAPE_ROPE, ANTIDOTE ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/spinarak/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, GIGA_DRAIN, ENDURE, POISON_JAB, SOLARBEAM, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, THIEF, FURY_CUTTER, NIGHTMARE, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, CUT, FLASH
	; end
