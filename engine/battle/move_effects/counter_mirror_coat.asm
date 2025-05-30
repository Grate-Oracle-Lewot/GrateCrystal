BattleCommand_Counter:
	call CounterMirrorCoatFirstCheck
	ret z

	ld b, a
	callfar GetMoveEffect
	ld a, b
	cp EFFECT_COUNTER
	ret z

	call CounterMirrorCoatSecondCheck
	ret z

	call CounterMirrorCoatThirdCheck
	ret z

	ld a, [wStringBuffer1 + MOVE_TYPE]
	cp SPECIAL
	ret nc
	jr CounterMirrorCoatFinish

BattleCommand_MirrorCoat:
	call CounterMirrorCoatFirstCheck
	ret z

	ld b, a
	callfar GetMoveEffect
	ld a, b
	cp EFFECT_MIRROR_COAT
	ret z

	call CounterMirrorCoatSecondCheck
	ret z

	call CounterMirrorCoatThirdCheck
	ret z

	ld a, [wStringBuffer1 + MOVE_TYPE]
	cp SPECIAL
	ret c
	; fallthrough

CounterMirrorCoatFinish:
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
	jr z, .failed

	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	adc a
	ld [hl], a
	jr nc, .capped
	ld a, $ff
	ld [hli], a
	ld [hl], a
.capped

	xor a
	ld [wAttackMissed], a
	ret

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret

CounterMirrorCoatFirstCheck:
	ld a, 1
	ld [wAttackMissed], a
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	ret

CounterMirrorCoatSecondCheck:
	call BattleCommand_ResetTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ret z
	jp CheckOpponentWentFirst

CounterMirrorCoatThirdCheck:
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	dec a
	ld de, wStringBuffer1
	call GetMoveData
	ld a, [wStringBuffer1 + MOVE_POWER]
	and a
	ret
