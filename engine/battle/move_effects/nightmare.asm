BattleCommand_Nightmare:
; In Grate Crystal, Nightmare inflicts both Sleep and the actual Nightmare status in one turn.
; Sleep is affected by the move's accuracy, but Nightmare isn't, meaning that if they were already Sleeping, Nightmare status is always inflicted.
; For accuracy to affect anything, you must add "checkhit" to Nightmare's effect in data/moves/effects.asm.

; If target has Protect up, fail completely.
; If Sleep Talk calls Protect and the user of it is faster than the user of Nightmare, this will block the Nightmare status with the Protect status.
; Otherwise, this is redundant since checkhit will cause Nightmare's Sleep-infliction to always miss if Protect is up, and thus Nightmare status can't be inflicted.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr nz, .failed

; If target has a Substitute, fail completely with special text.
	call CheckSubstituteOpp
	jr nz, .substitute_fail

; If target is already Sleeping, move on to inflicting Nightmare.
; This includes targets who are Safeguarded or holding a Sleep-blocking item but who have used Rest, napped due to disobedience, or fell out of a tree.
; Safeguard does not protect against the Nightmare status, which is consistent with vanilla.
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

; If target's held item blocks Sleep, fail completely with special text.
	call GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	jr z, .item_fail

; If target has Safeguard up, fail completely with special text.
	call SafeCheckSafeguard
	jr nz, .safeguard_fail

; If Nightmare's Sleep-infliction missed, move on to trying to inflict Nightmare.
; I think this is redundant (that is, it could just jump to .failed instead), but I'm keeping it just to be safe.
	ld a, [wAttackMissed]
	and a
	jr nz, .done_sleep

; Animate Nightmare for Sleep-infliction. Animation will play again later for Nightmare-infliction.
	call AnimateCurrentMove

; Determine Sleep turn count etc.
	call GetSleepTurns
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
; If Nightmare-induced Sleep is cured by a held item, don't bother trying to inflict Nightmare due to grammatical awkwardness of "but it failed" in that case.
; This is effectively similar to special-text fails for Noisemaker and Safeguard, just cutting off after the "recovered with item" text.
	ret nz
	call OpponentCantMove

; Try to inflict the actual Nightmare status.
.done_sleep
; Can't hit an absent opponent. For Sleep, this was accounted for with checkhit/wAttackMissed.
	call CheckHiddenOpponent
	jr nz, .failed

; Only works on a Sleeping opponent. Must be checked in case Nightmare's own Sleep-infliction failed.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and SLP
	jr z, .failed

; If the opponent is already having a Nightmare, fail with special text.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_NIGHTMARE, [hl]
	jr nz, .already_nightmare

; Give the opponent a Nightmare. Animation will play regardless of whether it already played once for Sleep.
	set SUBSTATUS_NIGHTMARE, [hl]
	call AnimateCurrentMove
	ld hl, StartedNightmareText
	jp StdBattleTextbox

; Fail Sleep and/or Nightmare with "but it failed" text, or "target protected itself" text if Protect is active. Above checks are designed to avoid showing multiple failure messages.
.failed
	jp FailMove

; Fail Sleep and Nightmare with "Substitute blocked the attack" text. Substitute blocks Nightmare even if the target behind the Substitute is Sleeping.
.substitute_fail
	ld hl, SubstituteBlockedStatusText
	jr .special_fail

; Fail Sleep and Nightmare with "protected by item" text.
; In the event that an item holder used Rest, napped due to disobedience, or fell from a tree, we never make it here because Sleep was checked for before the item.
.item_fail
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, ProtectedByText
	jr .special_fail

; Fail Sleep and Nightmare with "protected by Safeguard" text.
; In the event that a Safeguarded target used Rest, napped due to disobedience, or fell from a tree, we never make it here because Sleep was checked for before Safeguard.
.safeguard_fail
	ld hl, SafeguardProtectText
.special_fail
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

; Fail Nightmare with "already having a Nightmare" text.
.already_nightmare
	ld hl, AlreadyHasNightmareText
	jr .special_fail
