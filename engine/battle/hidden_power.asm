HiddenPowerDamage:
; Override Hidden Power's type based on the user's DVs.

	ld hl, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld hl, wEnemyMonDVs
.got_dvs

	; Def & 3
	ld a, [hl]
	and %0011
	ld b, a

	; + (Atk & 3) << 2
	ld a, [hli]
	and %0011 << 4
	swap a
	add a
	add a
	or b

	; add the least significant bit of the Speed DV to increment 50% of the time (to reach Fairy type)
	ld b, a
	ld a, [hl]
	swap a
	and %0001
	add b

; Skip Normal
	inc a

; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add UNUSED_TYPES_END - UNUSED_TYPES

.done
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
