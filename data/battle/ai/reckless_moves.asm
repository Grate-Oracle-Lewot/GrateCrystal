; AI_AGGRESSIVE wants to discourage all moves but the one that does the most damage.
; It can't properly account for multi-hit moves, so their effects are checked for in this list,
; and given a 50% chance to not be discouraged when they otherwise would be.
; The computer selecting one of these simulates a player gambling on a high number of hits.
; That being said, only EFFECT_MULTI_HIT has a variable number of hits.

RecklessMoves:
	db EFFECT_MULTI_HIT
	db EFFECT_DOUBLE_HIT
	db EFFECT_POISON_MULTI_HIT
	db EFFECT_TRIPLE_KICK
	db -1 ; end
