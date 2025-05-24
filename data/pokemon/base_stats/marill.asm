	db MARILL ; 183

	db  80,  30,  60,  50,  40,  60
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 190 ; catch rate
	db 58 ; base exp
	db BERRY, MYSTIC_WATER ; items
	db GENDER_F50 ; gender ratio
	db 6 ; step cycles to hatch
	INCBIN "gfx/pokemon/marill/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, FAIRY_WIND, MOONBLAST, HAIL, SUBSTITUTE, SCALD, U_TURN, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ROCK_SMASH, ICE_BEAM, AEROBLAST, AURA_SPHERE
	; end
