BattleCommand_NoItemDamage:
	call GetUserItem
	ld a, [hl]
	ret nz
	jp DoubleDamage
