	db VULPIX ; 037

	db  48,  42,  40,  75,  70,  75
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ICE ; type
	db 190 ; catch rate
	db 63 ; base exp
	db BURNT_BERRY, ICE_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/vulpix/front.dimensions"
	db GROWTH_SLIGHTLY_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, ICY_WIND, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, FAIRY_WIND, MOONBLAST, DARK_PULSE, HAIL, SUBSTITUTE, SHADOW_CLAW, SCALD, FLASH, FLAMETHROWER, ICE_BEAM, TRI_ATTACK
	; end
