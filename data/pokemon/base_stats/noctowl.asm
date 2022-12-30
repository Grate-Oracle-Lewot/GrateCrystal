	db NOCTOWL ; 164

	db 100,  50,  50,  70,  86,  96
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp
	db NOISEMAKER, TM_DREAM_EATER ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/noctowl/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, ENDURE, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, MOONBLAST, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, HYPNOSIS, TELEPORT, FLY, FLASH
	; end
