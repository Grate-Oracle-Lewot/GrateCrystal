	db CATERPIE ; 010

	db  45,  30,  35,  45,  20,  20
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 255 ; catch rate
	db 53 ; base exp
	db SILVER_LEAF, GOLD_LEAF ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/caterpie/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SWEET_SCENT, SNORE, PROTECT, ENDURE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, SUBSTITUTE
	; end
