	db METAPOD ; 011

	db  50,  20,  65,  10,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 120 ; catch rate
	db 72 ; base exp
	db X_DEFEND, IRON ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/metapod/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SWEET_SCENT, SNORE, PROTECT, ENDURE, RETURN, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE
	; end
