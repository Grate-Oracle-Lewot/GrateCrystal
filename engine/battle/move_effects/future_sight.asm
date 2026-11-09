BattleCommand_CheckFutureSight:
	ld hl, wPlayerFutureSightCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyFutureSightCount
.ok

	ld a, [hl]
	cp 1
	ret nz

	ld [hl], 0
	ld b, futuresight_command
	jp SkipToBattleCommand

BattleCommand_FutureSight:
	push bc
	call CheckUserIsCharging
	jr nz, .AlreadyChargingFutureSight
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b
.AlreadyChargingFutureSight:
	ld hl, wPlayerFutureSightCount
	ldh a, [hBattleTurn]
	and a
	jr z, .GotFutureSightCount
	ld hl, wEnemyFutureSightCount
.GotFutureSightCount:
	ld a, [hl]
	and a
	jp nz, .Failed
	ld a, 4
	ld [hl], a
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	ld hl, ForesawAttackText
	call StdBattleTextbox
	call BattleCommand_RaiseSub
	pop bc
	ldh a, [hBattleTurn]
	and a
	jr z, .player

; .enemy
	ld a, b
	ld [wEnemyFutureSightSpAtk], a
	ld a, [wEnemyMonLevel]
	ld [wEnemyFutureSightLevel], a
	jr .Done

.player
	ld a, b
	ld [wPlayerFutureSightSpAtk], a
	ld a, [wBattleMonLevel]
	ld [wPlayerFutureSightLevel], a
	jr .Done

.Failed:
	pop bc
	pop bc
	call FutureSightFailed
.Done:
	jp EndMoveEffect

BattleCommand_FutureSightFix:
	ldh a, [hBattleTurn]
	and a
	jr z, .Player

; .Enemy:
	ld a, [wEnemyFutureSightSpAtk]
	push af
	ld a, [wEnemyFutureSightLevel]
	jr .End

.Player:
	ld a, [wPlayerFutureSightSpAtk]
	push af
	ld a, [wPlayerFutureSightLevel]
.End:
	ld e, a
	ld d, FUTURE_SIGHT_BASE_POWER
	pop af
	ld b, a
	xor a
	ld [wAttackMissed], a
	ld [wCriticalHit], a
	push bc
	push de
	call BattleCommand_DamageStats
	ld a, c
	pop de
	pop bc
	ld c, a
	ret
