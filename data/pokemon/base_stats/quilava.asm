	db QUILAVA ; 156

	db  58,  64,  58,  80,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp
	db GOLD_BERRY, CHARCOAL ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/quilava/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, DEFENSE_CURL, FALSE_SWIPE, REST, ATTRACT, FURY_CUTTER, SUBSTITUTE, SHADOW_CLAW, CUT, FLASH, ROCK_SMASH, FLAMETHROWER, TRI_ATTACK, SACRED_FIRE
	; end
