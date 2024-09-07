	db RATICATE ; 020

	db  55,  81,  60,  99,  50,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, DARK ; type
	db 90 ; catch rate
	db 116 ; base exp
	db BERRY, GOLD_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/raticate/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, POISON_JAB, IRON_TAIL, THUNDER, RETURN, DIG, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, THIEF, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, SHADOW_CLAW, CUT, STRENGTH, ROCK_SMASH, THUNDERBOLT, ICE_BEAM
	; end
