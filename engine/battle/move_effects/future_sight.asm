BattleCommand_CheckFutureSight:
	ld hl, wPlayerFutureSightCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyFutureSightCount
.ok

	ld a, [hl]
	and a
	ret z
	cp 1
	ret nz

	ld [hl], 0
	ldh a, [hBattleTurn]
	and a
	jr z, .player

; .enemy
	ld a, [wEnemyMonLevel]
	ld [wEnemyFutureSightLevel], a
	ld a, [wEnemyMonSpclAtk]
	ld [wEnemyFutureSightSpAtk], a
	ld a, [wEnemyMonSpclAtk + 1]
	ld [wEnemyFutureSightSpAtk + 1], a
	jr .end

.player
	ld a, [wBattleMonLevel]
	ld [wPlayerFutureSightLevel], a
	ld a, [wBattleMonSpclAtk]
	ld [wPlayerFutureSightSpAtk], a
	ld a, [wBattleMonSpclAtk + 1]
	ld [wPlayerFutureSightSpAtk + 1], a
.end
	ld b, futuresight_command
	jp SkipToBattleCommand

BattleCommand_FutureSight:
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
	call ResetDamage
	ldh a, [hBattleTurn]
	and a
	jr z, .Player

; .Enemy:
	ld hl, wBattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost

	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .enemy_ok
	sla c
	rl b

.enemy_ok
	ld hl, wEnemyFutureSightSpAtk
	ld a, [wEnemyFutureSightLevel]
	jr .End

.Player:
	ld hl, wEnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost

	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .player_ok
	sla c
	rl b

.player_ok
	ld hl, wPlayerFutureSightSpAtk
	ld a, [wPlayerFutureSightLevel]

.End:
	ld e, a
	ld d, FUTURE_SIGHT_BASE_POWER
	push de
	call UnevolvedEviolite
	call TruncateHL_BC
	pop de
	xor a
	ld [wAttackMissed], a
	jr .Done

.Failed:
	pop bc
	call ResetDamage
	call AnimateFailedMove
	call PrintButItFailed
.Done:
	jp EndMoveEffect
