	db BAYLEEF ; 153

	db  60,  62,  80,  60,  63,  80
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 142 ; base exp
	db SILVER_LEAF, GOLD_LEAF ; items
	db GENDER_F12_5 ; gender ratio
	db 11 ; step cycles to hatch
	INCBIN "gfx/pokemon/bayleef/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, IRON_TAIL, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, REST, ATTRACT, FURY_CUTTER, SUBSTITUTE, CUT, STRENGTH, FLASH, ROCK_SMASH, TRI_ATTACK, AURA_SPHERE
	; end
