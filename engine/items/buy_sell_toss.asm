SelectQuantityToToss:
	ld hl, TossItem_MenuHeader
	call LoadMenuHeader
	jr Toss_Sell_Loop

SelectQuantityToBuy:
	farcall GetItemPrice
	; fallthrough

RooftopSale_SelectQuantityToBuy:
	ld a, d
	ld [wBuySellItemPrice + 0], a
	ld a, e
	ld [wBuySellItemPrice + 1], a

; limit [wItemQuantity] so that de * [wItemQuantity] <= Money
; 1 <= [wItemQuantity] <= 99
	xor a
	ld [hMoneyTemp + 0], a
	ld [hMoneyTemp + 1], a
	ld [hMoneyTemp + 2], a
	ld b, -1
	jr .start
.loop
	cp 99
	jr nc, .done
.start
	ld a, [hMoneyTemp + 2]
	add e
	ld [hMoneyTemp + 2], a
	ld a, [hMoneyTemp + 1]
	adc d
	ld [hMoneyTemp + 1], a
	ld a, [hMoneyTemp + 0]
	adc 0
	ld [hMoneyTemp + 0], a
	inc b
	push de
	push bc
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	pop bc
	pop de
	ld a, b
	jr nc, .loop
.done
	ld [wItemQuantity], a

	ld hl, BuyItem_MenuHeader
	call LoadMenuHeader
	jr Toss_Sell_Loop

SelectQuantityToSell:
	farcall GetItemPrice
	ld a, d
	ld [wBuySellItemPrice + 0], a
	ld a, e
	ld [wBuySellItemPrice + 1], a
	ld hl, SellItem_MenuHeader
	call LoadMenuHeader
	; fallthrough

Toss_Sell_Loop:
	ld a, 1
	ld [wItemQuantityChange], a
.loop
	call BuySellToss_UpdateQuantityDisplay ; update display
	call BuySellToss_InterpretJoypad       ; joy action
	jr nc, .loop
	cp -1
	jr nz, .nope ; pressed B
	scf
	ret

.nope
	and a
	ret

BuySellToss_InterpretJoypad:
	call JoyTextDelay_ForcehJoyDown ; get joypad
	bit B_BUTTON_F, c
	jr nz, .b
	bit A_BUTTON_F, c
	jr nz, .a
	bit D_DOWN_F, c
	jr nz, .down
	bit D_UP_F, c
	jr nz, .up
	bit D_LEFT_F, c
	jr nz, .left
	bit D_RIGHT_F, c
	jr nz, .right
	and a
	ret

.b
	ld a, -1
	scf
	ret

.a
	ld a, 0
	scf
	ret

.down
	ld hl, wItemQuantityChange
	dec [hl]
	jr nz, .finish_down
	ld a, [wItemQuantity]
	ld [hl], a

.finish_down
	and a
	ret

.up
	ld hl, wItemQuantityChange
	inc [hl]
	ld a, [wItemQuantity]
	cp [hl]
	jr nc, .finish_up
	ld [hl], 1

.finish_up
	and a
	ret

.left
	ld a, [wItemQuantityChange]
	sub 10
	jr c, .load_1
	jr z, .load_1
	jr .finish_left

.load_1
	ld a, 1
.finish_left
	ld [wItemQuantityChange], a
	and a
	ret

.right
	ld a, [wItemQuantityChange]
	add 10
	ld b, a
	ld a, [wItemQuantity]
	cp b
	jr nc, .finish_right
	ld b, a

.finish_right
	ld a, b
	ld [wItemQuantityChange], a
	and a
	ret

BuySellToss_UpdateQuantityDisplay:
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChange
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [wMenuDataPointer]
	ld e, a
	ld a, [wMenuDataPointer + 1]
	ld d, a
	ld a, [wMenuDataBank]
	jp FarCall_de

BuySell_MultiplyPrice:
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [wBuySellItemPrice + 0]
	ldh [hMultiplicand + 1], a
	ld a, [wBuySellItemPrice + 1]
	ldh [hMultiplicand + 2], a
	ld a, [wItemQuantityChange]
	ldh [hMultiplier], a
	push hl
	call Multiply
	pop hl
NoPriceToDisplay:
	ret

Sell_HalvePrice:
	push hl
	ld hl, hProduct + 1
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	pop hl
	ret

DisplayPurchasePrice:
	call BuySell_MultiplyPrice
	jr BuySell_DisplaySubtotal

DisplaySellingPrice:
	call BuySell_MultiplyPrice
	call Sell_HalvePrice
	; fallthrough

BuySell_DisplaySubtotal:
	push hl
	ld hl, hMoneyTemp
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	pop hl
	inc hl
	ld de, hMoneyTemp
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	jp WaitBGMap

TossItem_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 15, 9, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NoPriceToDisplay
	db 0 ; default option

BuyItem_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 15, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw DisplayPurchasePrice
	db -1 ; default option

SellItem_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 7, 15, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw DisplaySellingPrice
	db 0 ; default option
