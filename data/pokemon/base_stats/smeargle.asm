	db SMEARGLE ; 235

	db  55,  42,  42,  75,  42,  42
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 108 ; base exp
	db PP_UP, TM_SKETCH ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/smeargle/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm SKETCH
	; end
