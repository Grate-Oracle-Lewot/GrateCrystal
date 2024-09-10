	db EGG ; 254

	db  10,  10,  10,  10,  10,  10
	;   hp  atk  def  spd  sat  sdf

	db CURSE_TYPE, CURSE_TYPE ; type
	db 255 ; catch rate
	db 10 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/egg/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm
	; end
