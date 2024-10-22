	db LEDYBA ; 165

	db  40,  42,  30,  55,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FAIRY ; type
	db 255 ; catch rate
	db 54 ; base exp
	db STARDUST, STAR_PIECE ; items
	db GENDER_F50 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledyba/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, TOXIC, HIDDEN_POWER, SUNNY_DAY, SWEET_SCENT, SNORE, PROTECT, GIGA_DRAIN, ENDURE, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, FAIRY_WIND, MOONBLAST, SUBSTITUTE, FLASH
	; end
