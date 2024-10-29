; AI_SMART encourages Sunny Day if the user also knows any of these moves.
; These moves aren't encouraged any more than usual during harsh sunlight,
; but AI_AGGRESSIVE will pick them if they do the most damage.
; Solarbeam has its own AI that does encourage it based on weather.
; The healing moves are just encouraged based on the user's remaining HP.

SunnyDayMoves:
	db FIRE_PUNCH
	db EMBER
	db FLAMETHROWER
	db SOLARBEAM
	db FIRE_SPIN
	db FIRE_BLAST
	db FLAME_WHEEL
	db SACRED_FIRE
	db MORNING_SUN
	db SYNTHESIS
	db MOONLIGHT
	db -1 ; end
