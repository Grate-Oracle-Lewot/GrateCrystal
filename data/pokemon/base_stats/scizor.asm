	db SCIZOR ; 212

	db  70, 150, 120,  65,  55,  90
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db 25 ; catch rate
	db 200 ; base exp
	db QUICK_CLAW, METAL_COAT ; items
	db GENDER_F50 ; gender ratio
	db 13 ; step cycles to hatch
	INCBIN "gfx/pokemon/scizor/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FURY_CUTTER, SUBSTITUTE, SHADOW_CLAW, CUT, STRENGTH, ROCK_SMASH
	; end
