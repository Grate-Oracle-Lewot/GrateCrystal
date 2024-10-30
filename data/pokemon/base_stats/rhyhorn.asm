	db RHYHORN ; 111

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db STEEL, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp
	db IRON, HARDHAT ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhyhorn/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, ICY_WIND, PROTECT, ENDURE, POISON_JAB, IRON_TAIL, THUNDER, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, ATTRACT, SUBSTITUTE, CUT, SURF, STRENGTH, ROCK_SMASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
