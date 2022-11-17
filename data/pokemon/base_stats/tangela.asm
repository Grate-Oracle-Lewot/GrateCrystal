	db TANGELA ; 114

	db  84,  60, 125,  55, 110,  40
	;   hp  atk  def  spd  sat  sdf

	db GRASS, WATER ; type
	db 45 ; catch rate
	db 188 ; base exp
	db LEMONADE, ALOE_VERA ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/tangela/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_PLANT, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, SELFDESTRUCT, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, DEFENSE_CURL, REST, ATTRACT, THIEF, SUBSTITUTE, CUT, SURF, FLASH, WHIRLPOOL
	; end
