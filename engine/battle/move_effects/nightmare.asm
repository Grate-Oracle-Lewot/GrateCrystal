BattleCommand_Nightmare:
; In Grate Crystal, Nightmare inflicts Sleep before inflicting the Nightmare status.
; Sleep is affected by the move's accuracy, but Nightmare isn't.

; Check for a Sleep-blocking item.
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .not_protected_by_item

; If item-blocked, fail Sleep without bothering to check Nightmare.
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, ProtectedByText
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.not_protected_by_item
; If target has a Substitute, fail completely.
	call CheckSubstituteOpp
	jr nz, .failed

; If target is already Sleeping, move on to inflicting Nightmare.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP
	jr nz, .done_sleep

; If target has a status other than Sleep, fail completely.
	ld a, [de]
	and a
	jr nz, .failed

; If Sleep-infliction missed, move on to trying to inflict Nightmare.
	ld a, [wAttackMissed]
	and a
	jr nz, .done_sleep

; Animate Nightmare once when inflicting Sleep. Animation will play a second time later when inflicting Nightmare.
	call AnimateCurrentMove
	ld b, %101

; Determine Sleep turn count etc.
.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp SLP
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem

	call z, OpponentCantMove

; Check whether the actual Nightmare status should be inflicted. Substitute has already been accounted for.
.done_sleep
; Can't hit an absent target. For Sleep, this was acconted for with wAttackMissed.
	call CheckHiddenOpponent
	jr nz, .failed

; Only works on a Sleeping target. This part matters in case Nightmare's own Sleep infliction fails.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and SLP
	jr z, .failed

; Fail if the target is already having a Nightmare.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr nz, .failed

; Give the target a Nightmare. Animation will play whether or not it has already played for inflicting Sleep.
	set SUBSTATUS_NIGHTMARE, [hl]
	call AnimateCurrentMove
	ld hl, StartedNightmareText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
