BattleCommand_Nightmare:
; In Grate Crystal, Nightmare inflicts both Sleep and the actual Nightmare status in one turn.
; Sleep is affected by the move's accuracy, but Nightmare isn't, meaning that if they were already Sleeping, Nightmare status is always inflicted.

; Check if target's held item blocks Sleep.
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr nz, .not_protected_by_item

; Fail completely with "protected by item" text.
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

; If target is already Sleeping, move on to influcting Nightmare.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld a, [de]
	and SLP
	jr nz, .done_sleep

; If target already has status other than Sleep, fail completely.
	ld a, [de]
	and a
	jr nz, .failed

; If Nightmare's Sleep-infliction missed, move on to trying to inflict Nightmare, in case target was already Sleeping.
	ld a, [wAttackMissed]
	and a
	jp nz, .done_sleep

; Animate Nightmare for Sleep-infliction. Animation will play again later for Nightmare-infliction.
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
; If Nightmare-induced Sleep is cured by a held item, don't bother trying to inflict Nightmare due to grammatical awkwardness of "but it failed" in that case.
	ret nz
	call OpponentCantMove

; Try to inflict the actual Nightmare status. Substitute has already been accounted for by this point.
.done_sleep
; Can't hit an absent opponent. For Sleep, this was accounted for with wAttackMissed.
	call CheckHiddenOpponent
	jr nz, .failed

; Only works on a Sleeping opponent. Must be checked in case Nightmare's own Sleep-infliction missed. Safeguard is handled by forcing a miss.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and SLP
	jr z, .failed

; Fail if the opponent is already having a Nightmare.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr nz, .failed

; Give the opponent a Nightmare. Animation will play regardless of whether it already played once for Sleep.
	set SUBSTATUS_NIGHTMARE, [hl]
	call AnimateCurrentMove
	ld hl, StartedNightmareText
	jp StdBattleTextbox

; Fail Sleep and/or Nightmare with "but it failed" text.
.failed
	call AnimateFailedMove
	jp PrintButItFailed
