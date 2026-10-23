ArenaTrapFailureConditions:
	call CheckHiddenOpponent
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_PROTECT, [hl]
	ret nz

	ld b, GHOST
	call CheckIfTargetIsGivenType
	jr z, .fail

	; return z
	and a
	ret

.fail
	; return nz
	or 1
	ret

CheckAlreadyArenaTrapped:
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	ret

BattleCommand_MeanLook:
	call ArenaTrapFailureConditions
	jr nz, BattleEffect_ButItFailed

	call CheckAlreadyArenaTrapped
	jr nz, BattleEffect_ButItFailed
	; fallthrough

ArenaTrap:
	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextbox

BattleCommand_SpiderWeb:
	call ArenaTrapFailureConditions
	jr nz, BattleEffect_ButItFailed

	call CheckAlreadyArenaTrapped
	jr nz, .already_trapped

	call ArenaTrap
	call BattleCommand_SpeedDown
	jp BattleCommand_StatDownMessage

.already_trapped
	call BattleCommand_SpeedDown
	call BattleCommand_StatDownAnim
	call BattleCommand_StatDownMessage
	jp BattleCommand_StatDownFailText
