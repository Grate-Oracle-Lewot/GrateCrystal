	db AERODACTYL ; 142

	db  80, 105,  65, 130,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp
	db HARD_STONE, REVIVAL_HERB ; items
	db GENDER_F12_5 ; gender ratio
	db 19 ; step cycles to hatch
	INCBIN "gfx/pokemon/aerodactyl/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, BLITZKRIEG, HIDDEN_POWER, SNORE, HYPER_BEAM, AVALANCHE, PROTECT, RAIN_DANCE, ACROBATICS, IRON_TAIL, DRAGONBREATH, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, REST, ATTRACT, STEEL_WING, NIGHT_TERROR, SUBSTITUTE, U_TURN, FLY, ROCK_SMASH, FLAMETHROWER
	; end
