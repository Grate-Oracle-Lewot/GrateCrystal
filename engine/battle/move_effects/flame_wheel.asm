BattleCommand_FlameWheel:
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_CURLED, a
	ret z
	jp DoubleDamage
