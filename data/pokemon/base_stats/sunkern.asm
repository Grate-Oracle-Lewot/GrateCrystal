	db SUNKERN ; 191

	db  30,  30,  30,  30,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 230 ; catch rate
	db 52 ; base exp
	db SUN_STONE, TM_SOLARBEAM ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/sunkern/front.dimensions"
	db GROWTH_SLIGHTLY_SLOW ; growth rate
	dn EGG_PLANT, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, SELFDESTRUCT, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, SUBSTITUTE, FLASH
	; end
