	db MAGBY ; 240

	db  45,  75,  37,  83,  70,  55
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 117 ; base exp
	db BURNT_BERRY, TM_FIRE_PUNCH ; items
	db GENDER_F25 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/magby/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, IRON_TAIL, RETURN, PSYCHIC_M, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, REST, THIEF, FIRE_PUNCH, SUBSTITUTE, SCALD, FLAMETHROWER, TRI_ATTACK
	; end
