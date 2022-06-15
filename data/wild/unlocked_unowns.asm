unown_set: MACRO
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to wUnlockedUnowns bits
	dw .Set_A_K ; ENGINE_UNLOCKED_UNOWNS_A_TO_K
	dw .Set_L_R ; ENGINE_UNLOCKED_UNOWNS_L_TO_R
	dw .Set_S_W ; ENGINE_UNLOCKED_UNOWNS_S_TO_W
	dw .Set_X_Z ; ENGINE_UNLOCKED_UNOWNS_X_TO_Z
.End

.Set_A_K:
	unown_set A, B, C, D, E, F, G, H
.Set_L_R:
	unown_set I, J, K, L, M, N
.Set_S_W:
	unown_set O, P, Q, R, S, T
.Set_X_Z:
	unown_set U, V, W, X, Y, Z
