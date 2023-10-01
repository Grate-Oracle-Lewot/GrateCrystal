	db MAGMAR ; 126

	db  70,  95,  62,  87, 113,  90
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 183 ; base exp
	db TM_FIRE_PUNCH, TM_FIRE_BLAST ; items
	db GENDER_F25 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/magmar/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, IRON_TAIL, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, SUBSTITUTE, SCALD, STRENGTH, ROCK_SMASH, FLAMETHROWER, TRI_ATTACK
	; end
