	db DODRIO ; 085

	db  66, 111,  69, 111,  66,  66
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 159 ; base exp
	db EXP_SHARE, TRIDENT ; items
	db GENDER_F50 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/dodrio/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, POISON_JAB, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, SUBSTITUTE, SHADOW_CLAW, CUT, TRI_ATTACK
	; end
