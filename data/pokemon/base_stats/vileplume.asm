	db VILEPLUME ; 045

	db  75,  80,  85,  50, 110,  90
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp
	db LEAF_STONE, SUN_STONE ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/vileplume/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_PLANT, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, MOONBLAST, SUBSTITUTE, CUT, FLASH
	; end
