BattleCommand_HeldDamage:
; Don't steal items in link battles.
	ld a, [wLinkMode]
	and a
	ret nz

; Don't steal if the move effect didn't trigger. Redundant because Thief has a 100% effect chance.
	ld a, [wEffectFailed]
	and a
	ret nz

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The enemy must have an item to steal.
	call Thief_EnemyItem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!
	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c
	jp DoubleDamage

.enemy
; The player must have an item to steal.
	call Thief_PlayerItem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!
	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c
	jp DoubleDamage

BattleCommand_Thief:
; Don't steal items in link battles.
	ld a, [wLinkMode]
	and a
	ret nz

; Don't steal if the move effect didn't trigger. Redundant because Thief has a 100% effect chance.
	ld a, [wEffectFailed]
	and a
	ret nz

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The enemy must have an item to steal.
	call Thief_EnemyItem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!
	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	call Thief_EnemyItem
	xor a ; NO_ITEM
	ld [hl], a
	ld [de], a

; If the player wasn't holding anything, give them the stolen item.
	call Thief_PlayerItem
	ld a, [hl]
	and a
	jr nz, .knock_off

	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a
	jr .stole

.enemy
; The player must have an item to steal.
	call Thief_PlayerItem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!
	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	call Thief_PlayerItem
	xor a ; NO_ITEM
	ld [hl], a
	ld [de], a

; If the enemy wasn't holding anything, give them the stolen item.
	call Thief_EnemyItem
	ld a, [hl]
	and a
	jr nz, .knock_off

	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jp StdBattleTextbox

.knock_off
	call GetItemName
	ld hl, KnockOffText
	jp StdBattleTextbox

Thief_PlayerItem:
	ld a, MON_ITEM
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

Thief_EnemyItem:
	ld a, MON_ITEM
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret
