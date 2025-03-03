; AI_AGGRESSIVE wants to discourage all moves but the one that does the most damage.
; It can't properly account for multi-hit moves, so their effects are checked for in this list,
; and given a 50% chance to not be discouraged when they otherwise would be.
; AI_SMART encourages these moves if they're super effective and discourages them if they're not very effective.

RecklessMoves:
	db EFFECT_MULTI_HIT
	db EFFECT_DOUBLE_HIT
	db EFFECT_POISON_MULTI_HIT
	db EFFECT_TRIPLE_KICK
	db -1 ; end
