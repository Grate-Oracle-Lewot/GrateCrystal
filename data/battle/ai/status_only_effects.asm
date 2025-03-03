; AI_BASIC dismisses StatusOnlyEffects if the player already has a status condition.
; AI_STATUS encourages StatusBideEffects if the player is storing energy with Bide.
; AI_TROLL always encourages StatusBideEffects.

StatusBideEffects:
	db EFFECT_CONFUSE
	db EFFECT_LEECH_SEED
	db EFFECT_SPITE
	db EFFECT_NIGHTMARE
	db EFFECT_SWAGGER
	db EFFECT_ATTRACT
StatusOnlyEffects:
	db EFFECT_SLEEP
	db EFFECT_TOXIC
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db -1 ; end
