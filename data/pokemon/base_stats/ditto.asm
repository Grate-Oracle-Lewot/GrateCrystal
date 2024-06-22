	db DITTO ; 132

	db  50,  50,  50, 250, 50,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 35 ; catch rate
	db 84 ; base exp
	db EVERSTONE, TRIDENT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/ditto/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_DITTO, EGG_DITTO ; egg groups

	; tm/hm learnset
	tmhm SELFDESTRUCT, PROTECT, SLEEP_TALK, SUBSTITUTE
	; end
