BattleCommand_Nightmare:
; Can't hit an absent opponent.
	call CheckHiddenOpponent
	jr nz, .failed

; Can't hit a Substitute.
	call CheckSubstituteOpp
	jr nz, .failed

; Only works on a Sleeping opponent.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and SLP_MASK
	jr z, .failed

; Fail if the opponent is already having a Nightmare.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr nz, .failed

; Otherwise give the opponent a Nightmare.
	set SUBSTATUS_NIGHTMARE, [hl]
	call AnimateCurrentMove
	ld hl, StartedNightmareText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
