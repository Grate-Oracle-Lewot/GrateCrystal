	db SPEAROW ; 021

	db  40,  60,  30,  70,  31,  31
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db NORMAL, FLYING ; type
else
	db FLYING, FLYING ; type
endc
	db 255 ; catch rate
	db 58 ; base exp
	db BERRY, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/spearow/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, BLITZKRIEG, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ACROBATICS, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, FALSE_SWIPE, REST, ATTRACT, THIEF, STEEL_WING, FAIRY_WIND, SUBSTITUTE, U_TURN, CUT
	; end
