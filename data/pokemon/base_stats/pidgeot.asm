	db PIDGEOT ; 018

	db  83,  80,  75, 101,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp
	db TM_RETURN, TM_SWIFT ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/pidgeot/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, FAIRY_WIND, SUBSTITUTE, FLY
	; end
