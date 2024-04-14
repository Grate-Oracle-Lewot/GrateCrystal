	db KAKUNA ; 014

	db  45,  25,  60,  15,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 120 ; catch rate
	db 71 ; base exp
	db X_DEFEND, IRON ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/kakuna/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SWEET_SCENT, SNORE, PROTECT, ENDURE, RETURN, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE
	; end
