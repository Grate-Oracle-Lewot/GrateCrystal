BattleCommand_NoItemDamage:
	call GetUserItem
	ld a, [hl]
	and a
	ret nz
	jp DoubleDamage
