	db CYNDAQUIL ; 155

	db  39,  52,  43,  70,  64,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp
	db ENERGY_ROOT, CHARCOAL ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/cyndaquil/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, IRON_TAIL, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, DEFENSE_CURL, FALSE_SWIPE, REST, ATTRACT, SUBSTITUTE, SHADOW_CLAW, CUT, FLAMETHROWER, TRI_ATTACK, SACRED_FIRE
	; end
