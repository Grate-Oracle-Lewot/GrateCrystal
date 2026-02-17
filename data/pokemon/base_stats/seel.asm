	db SEEL ; 086

	db  65,  45,  55,  45,  45,  70
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db WATER, WATER ; type
else
	db WATER, ICE ; type
endc
	db 190 ; catch rate
	db 100 ; base exp
	db SPRING_WATER, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/seel/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SNORE, BLIZZARD, AVALANCHE, PROTECT, RAIN_DANCE, ACROBATICS, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, HAIL, SUBSTITUTE, U_TURN, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
