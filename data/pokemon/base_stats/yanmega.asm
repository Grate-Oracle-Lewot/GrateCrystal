	db YANMEGA ; 252

	db  86,  76,  86,  95, 116,  56
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db BUG, FLYING ; type
else
	db BUG, DRAGON ; type
endc
	db 30 ; catch rate
	db 198 ; base exp
	db SILVERPOWDER, BRIGHTPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/yanmega/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ACROBATICS, SOLARBEAM, DRAGONBREATH, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, REST, ATTRACT, THIEF, STEEL_WING, FURY_CUTTER, FAIRY_WIND, SUBSTITUTE, U_TURN, FLY, STRENGTH, FLASH, TRI_ATTACK
	; end
