	db IGGLYBUFF ; 174

	db  99,  30,  15,  15,  40,  20
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY ; type
	db 170 ; catch rate
	db 39 ; base exp
	db MINT_BERRY, PINK_BOW ; items
	db GENDER_F75 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/igglybuff/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, SELFDESTRUCT, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, DEFENSE_CURL, DREAM_EATER, REST, NIGHTMARE, FAIRY_WIND, MOONBLAST, NIGHT_TERROR, SUBSTITUTE, FLASH, FLAMETHROWER, TRI_ATTACK
	; end
