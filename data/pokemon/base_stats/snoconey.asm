	db SNOCONEY ; 238

	db  42,  94,  42, 142,  84,  80
	;   hp  atk  def  spd  sat  sdf

	db ICE, GRASS ; type
	db 84 ; catch rate
	db 168 ; base exp
	db ICE_BERRY, RAGECANDYBAR ; items
	db GENDER_F50 ; gender ratio
	db 14 ; step cycles to hatch
	INCBIN "gfx/pokemon/snoconey/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, SELFDESTRUCT, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, BLIZZARD, HYPER_BEAM, AVALANCHE, PROTECT, GIGA_DRAIN, ENDURE, POISON_JAB, SOLARBEAM, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, REST, ATTRACT, THIEF, FAIRY_WIND, MOONBLAST, HAIL, SUBSTITUTE, U_TURN, FLASH, ICE_BEAM, AEROBLAST
	; end
