	db NIDOKING ; 034

	db  81, 102,  77,  85,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 195 ; base exp
	db MOON_STONE, KINGS_ROCK ; items
	db GENDER_F0 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidoking/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, AVALANCHE, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, IRON_TAIL, THUNDER, EARTHQUAKE, RETURN, DIG, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, FURY_CUTTER, MOONBLAST, SUBSTITUTE, SHADOW_CLAW, SURF, STRENGTH, ROCK_SMASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, TRI_ATTACK
	; end
