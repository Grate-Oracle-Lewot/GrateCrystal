; AI_OPPORTUNIST encourages these moves when the player's HP is low.
; AI_PRAGMATIC encourages these moves when the enemy's HP is low.
; AI_SMART tries to use Mirror Move and Disable on these moves. (Also Mimic before I removed that.)
; AI_SIMPLE always encourages these moves.

UsefulMoves:
	db FIRE_PUNCH
	db ICE_PUNCH
	db SIGNAL_BEAM
	db CUT
	db TWINEEDLE
	db FLAMETHROWER
	db SURF
	db ICE_BEAM
	db DRILL_PECK
	db IRON_HEAD
	db SCALD
	db WATERFALL
	db SPIKE_CANNON
	db DRAGON_PULSE
	db DAZZLY_GLEAM
	db SPORE
	db FLASH
	db AIR_SLASH
	db DARK_PULSE
	db ROCK_SLIDE
	db SILVER_WIND
	db TRI_ATTACK
	db AEROBLAST
	db AVALANCHE
	db GIGA_DRAIN
	db SACRED_FIRE
	db U_TURN
	db CRUNCH
	db ANCIENTPOWER
	db POWER_GEM
	db -1 ; end
