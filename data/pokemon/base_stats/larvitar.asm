	db LARVITAR ; 246

	db  50,  64,  50,  41,  45,  50
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db ROCK, GROUND ; type
else
	db ROCK, DARK ; type
endc
	db 45 ; catch rate
	db 67 ; base exp
	db HARD_STONE, BLACKGLASSES ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/larvitar/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, BLITZKRIEG, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, AVALANCHE, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, MOONBLAST, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, STRENGTH, ROCK_SMASH, TRI_ATTACK, AURA_SPHERE
	; end
