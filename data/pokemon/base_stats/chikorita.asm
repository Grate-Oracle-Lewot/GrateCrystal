	db CHIKORITA ; 152

	db  45,  49,  65,  45,  49,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 65 ; base exp
	db SILVER_LEAF, GOLD_LEAF ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/chikorita/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, SUBSTITUTE, CUT, FLASH, TRI_ATTACK, AURA_SPHERE
	; end
