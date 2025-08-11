	db SLUGMA ; 218

	db  50,  40,  40,  30,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 78 ; base exp
	db X_SPEED, CARBOS ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/slugma/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, SCALD, ROCK_SMASH, FLAMETHROWER
	; end
