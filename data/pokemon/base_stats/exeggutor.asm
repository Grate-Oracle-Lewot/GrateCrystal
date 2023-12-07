	db EXEGGUTOR ; 103

	db  96,  96,  84,  54, 126,  75
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 212 ; base exp
	db BERRY, LUCKY_EGG ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggutor/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, DRAGONBREATH, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, DREAM_EATER, REST, ATTRACT, THIEF, NIGHTMARE, SUBSTITUTE, TELEPORT, STRENGTH, FLASH
	; end
