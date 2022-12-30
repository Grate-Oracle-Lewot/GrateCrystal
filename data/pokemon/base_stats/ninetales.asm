	db NINETALES ; 038

	db  84,  75,  75, 110, 101, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ICE ; type
	db 75 ; catch rate
	db 178 ; base exp
	db BURNT_BERRY, FIRE_STONE ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninetales/front.dimensions"
	db GROWTH_SLIGHTLY_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, MOONBLAST, DARK_PULSE, HAIL, SUBSTITUTE, HYPNOSIS, SCALD, FLASH, FLAMETHROWER, ICE_BEAM, TRI_ATTACK, SACRED_FIRE, AEROBLAST
	; end
