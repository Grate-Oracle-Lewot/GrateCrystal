	db FARFETCH_D ; 083

	db  57, 112,  75,  62,  64,  72
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db NORMAL, FLYING ; type
else
	db FIGHTING, FLYING ; type
endc
	db 45 ; catch rate
	db 135 ; base exp
	db LEEK, BONE ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/farfetch_d/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ACROBATICS, POISON_JAB, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FURY_CUTTER, FAIRY_WIND, SUBSTITUTE, SHADOW_CLAW, U_TURN, CUT, FLY, SURF, AURA_SPHERE
	; end
