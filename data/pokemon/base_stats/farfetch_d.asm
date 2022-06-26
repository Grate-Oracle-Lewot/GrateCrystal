	db FARFETCH_D ; 083

	db  57, 112,  75,  62,  63,  72
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp
	db STICK, THICK_CLUB ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/farfetch_d/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, FURY_CUTTER, FAIRY_WIND, CUT, FLY
	; end
