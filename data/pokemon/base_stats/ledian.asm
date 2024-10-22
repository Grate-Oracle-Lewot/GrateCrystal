	db LEDIAN ; 166

	db  55,  84,  50,  85,  55, 110
	;   hp  atk  def  spd  sat  sdf

	db BUG, FAIRY ; type
	db 90 ; catch rate
	db 142 ; base exp
	db STARDUST, STAR_PIECE ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledian/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, FAIRY_WIND, MOONBLAST, SUBSTITUTE, FLY, FLASH, ROCK_SMASH, AURA_SPHERE
	; end
