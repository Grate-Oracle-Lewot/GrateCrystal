	db NINETALES ; 038

	db  73,  76,  75, 100,  81, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ICE ; type
	db 75 ; catch rate
	db 178 ; base exp
	db BURNT_BERRY, FIRE_STONE ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ninetales/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLIGHTLY_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, MOONBLAST, DARK_PULSE, HAIL, SUBSTITUTE, HYPNOSIS, SCALD, FLASH, FLAMETHROWER, ICE_BEAM, TRI_ATTACK, SACRED_FIRE, AEROBLAST
	; end
