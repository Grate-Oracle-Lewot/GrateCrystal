	db SUNFLORA ; 192

	db  84,  84,  64,  19, 155,  84
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIRE ; type
	db 100 ; catch rate
	db 156 ; base exp
	db SUN_STONE, TM_SUNNY_DAY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/sunflora/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_PLANT, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, SCALD, CUT, FLASH, FLAMETHROWER, TRI_ATTACK
	; end
