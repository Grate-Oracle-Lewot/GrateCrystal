	db PUPITAR ; 247

	db  70,  70,  84,  51,  65,  80
	;   hp  atk  def  spd  sat  sdf

	db ROCK, DARK ; type
	db 45 ; catch rate
	db 144 ; base exp
	db X_DEFEND, IRON ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/pupitar/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, MOONBLAST, DARK_PULSE, NIGHT_TERROR, SUBSTITUTE, STRENGTH, TRI_ATTACK, AURA_SPHERE
	; end
