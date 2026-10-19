	db ELECTRODE ; 101

	db  60,  50,  70, 152,  84,  84
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db ELECTRIC, ELECTRIC ; type
else
	db ELECTRIC, FIRE ; type
endc
	db 60 ; catch rate
	db 150 ; base exp
	db ULTRA_BALL, POKE_BALL ; items
	db GENDER_UNKNOWN ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/electrode/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, BLITZKRIEG, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, SOLARBEAM, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, DEFENSE_CURL, REST, MOONBLAST, SUBSTITUTE, TELEPORT, U_TURN, FLASH, FLAMETHROWER, THUNDERBOLT, TRI_ATTACK
	; end
