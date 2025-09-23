	db GLOOM ; 044

	db  60,  65,  70,  40,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 132 ; base exp
	db VIVICHOKE, LEAF_STONE ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/gloom/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_PLANT, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, MOONBLAST, SUBSTITUTE, CUT, FLASH
	; end
