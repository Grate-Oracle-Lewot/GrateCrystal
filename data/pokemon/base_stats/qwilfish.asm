	db QWILFISH ; 211

	db  75, 105,  90,  85,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIRE ; type
	db 45 ; catch rate
	db 121 ; base exp
	db TM_SCALD, SODA_POP ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/qwilfish/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, SWIFT, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, SCALD, SURF, WHIRLPOOL, WATERFALL, FLAMETHROWER, ICE_BEAM, TRI_ATTACK
	; end
