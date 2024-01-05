	db ONIX ; 095

	db  55,  65, 160,  50,  42,  55
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp
	db HARD_STONE, METAL_COAT ; items
	db GENDER_F50 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/onix/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, IRON_TAIL, DRAGONBREATH, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, STRENGTH, ROCK_SMASH, FLAMETHROWER
	; end
