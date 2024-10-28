BattleCommand_ShellSmash:
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

; Speed
	inc bc
 	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

 ; Special Attack
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
; Sharply lower Defense and Special Defense, and sharply raise Attack, Special Attack, and Speed.

	call AnimateCurrentMove
	ld a, $10 | DEFENSE
	call BattleCommand_StatDown
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SwitchTurn
	ld a, $10 | SP_DEFENSE
	call BattleCommand_StatDown
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call ResetMiss
	call BattleCommand_SwitchTurn
	call BattleCommand_AttackUp2
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp2
 	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpeedUp2
	jp BattleCommand_StatUpMessage

.cantraise
; Can't raise any stats.

	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox
