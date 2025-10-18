	db RHYHORN ; 111

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db GROUND, ROCK ; type
else
	db STEEL, ROCK ; type
endc
	db 120 ; catch rate
	db 135 ; base exp
	db IRON, HARDHAT ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhyhorn/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, BLITZKRIEG, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, AVALANCHE, PROTECT, POISON_JAB, IRON_TAIL, THUNDER, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, ATTRACT, SUBSTITUTE, CUT, SURF, STRENGTH, ROCK_SMASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
