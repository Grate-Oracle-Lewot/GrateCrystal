	db NIDORAN_M ; 032

	db  46,  57,  40,  50,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp
	db PSNCUREBERRY, POISON_BARB ; items
	db GENDER_F0 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidoran_m/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, BLITZKRIEG, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, POISON_JAB, IRON_TAIL, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, THIEF, SUBSTITUTE, SHADOW_CLAW, THUNDERBOLT
	; end
