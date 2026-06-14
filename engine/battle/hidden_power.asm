HiddenPowerDamage:
; Override Hidden Power's type based on the user's DVs.

	ld bc, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld bc, wEnemyMonDVs
.got_dvs

	farcall FarHiddenPowerType

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or SPECIAL
	ld [hl], a

; Get the rest of the damage formula variables based on the new type.
	farcall BattleCommand_DamageStats ; damagestats
	ret
