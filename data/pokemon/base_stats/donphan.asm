	db DONPHAN ; 232

	db 100, 120, 120,  50,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, GROUND ; type
	db 60 ; catch rate
	db 189 ; base exp
	db TM_ROLLOUT, LEFTOVERS ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/donphan/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, EARTHQUAKE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, SCALD, SURF, STRENGTH, ROCK_SMASH
	; end
