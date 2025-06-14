	db PHANPY ; 231

	db  90,  60,  60,  40,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, GROUND ; type
	db 120 ; catch rate
	db 124 ; base exp
	db BERRY, TM_ROLLOUT ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/phanpy/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, AVALANCHE, PROTECT, ENDURE, EARTHQUAKE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, SCALD, SURF, STRENGTH, ROCK_SMASH
	; end
