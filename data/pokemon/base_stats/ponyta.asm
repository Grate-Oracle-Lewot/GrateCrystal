	db PONYTA ; 077

	db  50,  85,  55,  90,  65,  65
	;   hp  atk  def  spd  sat  sdf

if DEF(_VANILLA_TYPES)
	db FIRE, FIRE ; type
else
	db FIRE, FAIRY ; type
endc
	db 190 ; catch rate
	db 152 ; base exp
	db X_SPEED, CHARCOAL ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/ponyta/front.dimensions"
	db GROWTH_SLIGHTLY_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ACROBATICS, IRON_TAIL, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, FAIRY_WIND, MOONBLAST, SUBSTITUTE, U_TURN, FLAMETHROWER, TRI_ATTACK
	; end
