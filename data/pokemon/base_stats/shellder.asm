	db SHELLDER ; 090

	db  35,  65, 110,  40,  55,  35
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db WATER, WATER ; type
else
	db WATER, STEEL ; type
endc
	db 190 ; catch rate
	db 97 ; base exp
	db PEARL, BLACK_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/shellder/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_3, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SNORE, BLIZZARD, AVALANCHE, PROTECT, RAIN_DANCE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, DEFENSE_CURL, REST, ATTRACT, FURY_CUTTER, HAIL, SUBSTITUTE, SURF, WHIRLPOOL, ROCK_SMASH, ICE_BEAM
	; end
