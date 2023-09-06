BattleCommand_FocusEnergy:
; focusenergy

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_FOCUS_ENERGY, [hl]
	jr nz, .already_pumped
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	call AnimateCurrentMove
	ld hl, GettingPumpedText
	jp StdBattleTextbox

.already_pumped
; new to Grate Crystal: act like Bulk Up (adapted from Curse)
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go
; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
; Raise Attack and Defense.
	call AnimateCurrentMove
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_DefenseUp
	jp BattleCommand_StatUpMessage

.cantraise
; Can't raise either stat.
	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox
