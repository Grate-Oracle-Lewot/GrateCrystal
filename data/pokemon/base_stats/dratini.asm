	db DRATINI ; 147

	db  41,  64,  45,  50,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 67 ; base exp
	db DRAGON_FANG, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 21 ; step cycles to hatch
	INCBIN "gfx/pokemon/dratini/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, BLITZKRIEG, HIDDEN_POWER, SNORE, BLIZZARD, AVALANCHE, PROTECT, RAIN_DANCE, ACROBATICS, IRON_TAIL, DRAGONBREATH, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, SUBSTITUTE, U_TURN, SURF, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, TRI_ATTACK, AURA_SPHERE
	; end
