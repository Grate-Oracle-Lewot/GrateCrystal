	db SHUCKLE ; 213

	db  20,  10, 255,  05,  10, 255
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK ; type
	db 190 ; catch rate
	db 80 ; base exp
	db BERRY_JUICE, BERRY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/shuckle/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_BUG, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, STRENGTH, FLASH, WHIRLPOOL, ROCK_SMASH, AURA_SPHERE
	; end
