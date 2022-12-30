	db TAUROS ; 128

	db  75, 100,  95, 110,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp
	db TM_HEADBUTT, MOOMOO_MILK ; items
	db GENDER_F0 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/tauros/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT, SUBSTITUTE, SCALD, SURF, STRENGTH, WATERFALL, ROCK_SMASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, TRI_ATTACK
	; end
