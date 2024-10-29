; AI_SMART encourages Rain Dance if the user also knows any of these moves.
; These moves aren't encouraged any more than usual during rain,
; but AI_AGGRESSIVE will pick them if they do the most damage.
; Thunder has its own AI that does encourage it in the rain.
; Scald is absent from this list due to rain preventing burns.

RainDanceMoves:
	db WATER_GUN
	db HYDRO_PUMP
	db SURF
	db BUBBLEBEAM
	db THUNDER
	db WATERFALL
	db CLAMP
	db BUBBLE
	db CRABHAMMER
	db OCTAZOOKA
	db WHIRLPOOL
	db -1 ; end
