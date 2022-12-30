	db BELLOSSOM ; 182

	db  75,  80,  95,  50,  90, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 184 ; base exp
	db SUN_STONE, LEAF_STONE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/bellossom/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_PLANT, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, FAIRY_WIND, MOONBLAST, SUBSTITUTE, CUT, FLASH
	; end
