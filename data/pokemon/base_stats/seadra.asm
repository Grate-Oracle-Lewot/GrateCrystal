	db SEADRA ; 117

	db  55,  65,  95,  85,  95,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 155 ; base exp
	db DRAGON_SCALE, SMOKE_BALL ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/seadra/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, DRAGONBREATH, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, SUBSTITUTE, SCALD, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM, TRI_ATTACK
	; end
