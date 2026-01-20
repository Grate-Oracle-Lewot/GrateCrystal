; MemoryMinigame.Jumptable indices
	const_def
	const MEMORYGAME_RESTART_GAME
	const MEMORYGAME_RESTART_BOARD
	const MEMORYGAME_INIT_BOARD_AND_CURSOR
	const MEMORYGAME_CHECK_TRIES_REMAINING
	const MEMORYGAME_PICK_CARD_1
	const MEMORYGAME_PICK_CARD_2
	const MEMORYGAME_DELAY_PICK_AGAIN
	const MEMORYGAME_REVEAL_ALL
	const MEMORYGAME_ASK_PLAY_AGAIN
MEMORYGAME_END_LOOP_F EQU 7

; Reward indices (see gfx/memory_game/memory_game.png)
	const_def
	const MEMORYGAMEREWARD_BACKOFCARD
	const MEMORYGAMEREWARD_POTION
	const MEMORYGAMEREWARD_POKEDOLL
	const MEMORYGAMEREWARD_BOTTLE
	const MEMORYGAMEREWARD_COIN
	const MEMORYGAMEREWARD_POKEBALL
	const MEMORYGAMEREWARD_MAGIKARP
	const MEMORYGAMEREWARD_RARECANDY
	const MEMORYGAMEREWARD_POKEGEAR

_MemoryGame:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call .LoadGFXAndPals
	call DelayFrame
.loop
	call .JumptableLoop
	jr nc, .loop
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ret

.LoadGFXAndPals:
	call DisableLCD
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	farcall ClearSpriteAnims
	ld hl, MemoryGameLZ
	ld de, vTiles2 tile $00
	call Decompress
	ld hl, MemoryGameCursorLZ
	ld de, vTiles0 tile $00
	ld bc, 4 tiles
	ld a, BANK(MemoryGameCursorLZ)
	call Decompress
	ld a, SPRITE_ANIM_DICT_ARROW_CURSOR
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $00
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	ldh [rWY], a
	ld [wJumptableIndex], a
	ld a, $1
	ldh [hBGMapMode], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	jp DmgToCgbObjPal0

.JumptableLoop:
	ld a, [wJumptableIndex]
	bit MEMORYGAME_END_LOOP_F, a
	jr nz, .quit
	call .ExecuteJumptable
	farcall PlaySpriteAnimations
	call DelayFrame
	and a
	ret

.quit
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	scf
	ret

.ExecuteJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw .RestartGame
	dw .ResetBoard
	dw .InitBoardTilemapAndCursorObject
	dw .CheckTriesRemaining
	dw .PickCard1
	dw .PickCard2
	dw .DelayPickAgain
	dw .RevealAll
	dw .AskPlayAgain

.RestartGame:
	ld hl, MemoryGamePlayWithOneCoinText
	call PrintText
	call CardFlip_PrintCoinBalance
	call YesNoBox
	jr c, .NotPlaying
	xor a
	call .DeductCoins
	jr c, .NotPlaying
	call MemoryGame_InitStrings
	ld hl, wJumptableIndex
	inc [hl]
	ret

.NotPlaying:
	ld hl, wJumptableIndex
	set MEMORYGAME_END_LOOP_F, [hl]
	ret

.DeductCoins:
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	ld a, h
	and a
	jr nz, .deduct ; You have at least 256 coins.
	ld a, l
	cp 1
	jr nc, .deduct ; You have at least 1 coin.
	ld hl, CardFlipNotEnoughCoinsText
	call PrintText
	scf
	ret

.deduct
	ld de, -1
	add hl, de
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call CardFlip_PrintCoinBalance
	call WaitSFX
	xor a
	ret

.ResetBoard:
	ld de, SFX_SLOT_MACHINE_START
	call PlaySFX
	call MemoryGame_InitBoard
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wMemoryGameCounter], a
	ld hl, wMemoryGameLastMatches
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld [wMemoryGameNumCardsMatched], a
.InitBoardTilemapAndCursorObject:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .spawn_object
	inc [hl]
	call MemoryGame_Card2Coord
	xor a
	ld [wMemoryGameLastCardPicked], a
	jp MemoryGame_PlaceCard

.spawn_object
	depixel 6, 3, 4, 4
	ld a, SPRITE_ANIM_INDEX_MEMORY_GAME_CURSOR
	call InitSpriteAnimStruct
	ld a, 5
	ld [wMemoryGameNumberTriesRemaining], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.CheckTriesRemaining:
	ld hl, wMemoryGameNumberTriesRemaining
	ld a, [hl]
	and a
	jr nz, .next_try
	ld hl, MemoryGameGameOverText
	call PrintText
	ld a, MEMORYGAME_REVEAL_ALL
	ld [wJumptableIndex], a
	ret

.next_try
	push hl
	ld hl, CardFlipChooseACardText
	call PrintText
	call MemoryGame_PrintTries
	pop hl
	dec [hl]
	xor a
	ld [wMemoryGameCardChoice], a
	ld hl, wJumptableIndex
	inc [hl]
.PickCard1:
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard1], a
	ld a, e
	ld [wMemoryGameCard1Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	xor a
	ld [wMemoryGameCardChoice], a
	ld de, SFX_STOP_SLOT
	call PlaySFX
	ld hl, wJumptableIndex
	inc [hl]
	ret

.PickCard2:
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld hl, wMemoryGameCard1Location
	cp [hl]
	ret z
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard2], a
	ld a, e
	ld [wMemoryGameCard2Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	ld a, 64
	ld [wMemoryGameCounter], a
	ld de, SFX_STOP_SLOT
	call PlaySFX
	ld hl, wJumptableIndex
	inc [hl]
.DelayPickAgain:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	and a
	jr z, .PickAgain
	dec [hl]
	ret

.PickAgain:
	call MemoryGame_CheckMatch
	ld a, MEMORYGAME_CHECK_TRIES_REMAINING
	ld [wJumptableIndex], a
	ret

.RevealAll:
	xor a
	ld [wMemoryGameCounter], a
.RevelationLoop:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .finish_round
	inc [hl]
	push af
	call MemoryGame_Card2Coord
	pop af
	push hl
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	pop hl
	cp -1
	jr z, .RevelationLoop
	ld [wMemoryGameLastCardPicked], a
	call MemoryGame_PlaceCard
	jr .RevelationLoop

.finish_round
	call WaitPressAorB_BlinkCursor
.AskPlayAgain:
	xor a
	ld [wJumptableIndex], a
	ret

MemoryGame_CheckMatch:
	ld hl, wMemoryGameCard1
	ld a, [hli]
	cp [hl]
	jp nz, .no_match

	ld hl, wMemoryGameNumberTriesRemaining
	inc [hl]

	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard

	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard

	ld a, [wMemoryGameCard1Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1

	ld a, [wMemoryGameCard2Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1

	ld hl, wMemoryGameLastMatches
.find_empty_slot
	ld a, [hli]
	and a
	jr nz, .find_empty_slot
	dec hl
	ld a, [wMemoryGameCard1]
	ld [hl], a
	ld [wMemoryGameLastCardPicked], a
	ld hl, wMemoryGameNumCardsMatched
	ld e, [hl]
	inc [hl]
	ld d, 0
	hlcoord 0, 0
	add hl, de
	call MemoryGame_PlaceCard

; Take action based on what was matched
	ld a, [wMemoryGameLastCardPicked]
	cp MEMORYGAMEREWARD_POKEGEAR
	jr nz, .next1
	ld c, 25
	jp .Payout

.next1
	cp MEMORYGAMEREWARD_RARECANDY
	jr nz, .next2
	ld hl, wMemoryGameNumberTriesRemaining
	inc [hl]
	ld hl, .ExtraTryText
	call PrintText
	ld de, SFX_2ND_PLACE
	call PlaySFX
	call WaitSFX
	jp WaitPressAorB_BlinkCursor

.next2
	cp MEMORYGAMEREWARD_COIN
	jr nz, .next3
	ld c, 10
	jr .Payout

.next3
	cp MEMORYGAMEREWARD_BOTTLE
	jr nz, .next4
	ld c, 5
	jr .Payout

.next4
	cp MEMORYGAMEREWARD_POKEDOLL
	jr nz, .next5
	ld c, 3
	jr .Payout

.next5
	cp MEMORYGAMEREWARD_POTION
	jr nz, .next6
	ld c, 2
	jr .Payout

.next6
	cp MEMORYGAMEREWARD_POKEBALL
	jr nz, .next7
	ld c, 1
	jr .Payout

.next7
	; MEMORYGAMEREWARD_MAGIKARP or any other value
	ld hl, .NoPrizeText
	call PrintText
	ld de, SFX_BUMP
	call PlaySFX
	call WaitSFX
	jp WaitPressAorB_BlinkCursor

.ExtraTryText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameExtraTryText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

.no_match
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, MemoryGameDarnText
	call PrintText
	call MemoryGame_PrintTries
	call WaitPressAorB_BlinkCursor

	xor a
	ld [wMemoryGameLastCardPicked], a

	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard

	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	jp MemoryGame_PlaceCard

.Payout:
	ld a, c
	push bc
	ld [wStringBuffer2], a
	ld hl, .VictoryText
	call PrintText
	call CardFlip_PrintCoinBalance
	ld de, SFX_3RD_PLACE
	call PlaySFX
	call WaitSFX
	pop bc

.loop
	push bc
	call .IsCoinCaseFull
	jr c, .full
	call .AddCoinPlaySFX

.full
	call CardFlip_PrintCoinBalance
	ld c, 2
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	jp WaitPressAorB_BlinkCursor

.AddCoinPlaySFX:
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	inc hl
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_PAY_DAY
	jp PlaySFX

.IsCoinCaseFull:
	ld a, [wCoins]
	cp HIGH(MAX_COINS)
	jr c, .less
	jr z, .check_low
	jr .more

.check_low
	ld a, [wCoins + 1]
	cp LOW(MAX_COINS)
	jr c, .less

.more
	scf
	ret

.less
	and a
	ret

.VictoryText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameYeahText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

.NoPrizeText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameNoPrizeText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

MemoryGame_InitBoard:
	ld hl, wMemoryGameCards
	ld bc, wMemoryGameCardsEnd - wMemoryGameCards
	xor a
	call ByteFill
	call MemoryGame_GetDistributionOfTiles

	ld c, 2
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 8
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 4
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 7
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 3
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 6
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 1
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 5
	ld hl, wMemoryGameCards
	ld b, wMemoryGameCardsEnd - wMemoryGameCards
.loop
	ld a, [hl]
	and a
	jr nz, .no_load
	ld [hl], c
.no_load
	inc hl
	dec b
	jr nz, .loop
	ret

MemoryGame_SampleTilePlacement:
	push hl
	ld de, wMemoryGameCards
.loop
	call Random
	and %00111111
	cp 45
	jr nc, .loop
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld [hl], c
	dec c
	jr nz, .loop
	pop hl
	inc hl
	ret

MemoryGame_GetDistributionOfTiles:
	ld a, [wMenuCursorY]
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .distributions
	add hl, de
	ret

.distributions
	db $02, $03, $06, $06, $06, $08, $08, $06
	db $02, $02, $04, $06, $06, $08, $08, $09
	db $02, $02, $02, $04, $07, $08, $08, $0c

MemoryGame_PlaceCard:
	ld a, [wMemoryGameLastCardPicked]
	add a
	add a
	add 4
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	inc a
	ld [hl], a
	ld c, 3
	jp DelayFrames

MemoryGame_DeleteCard:
	ld a, $1
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld c, 3
	jp DelayFrames

MemoryGame_InitStrings:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $1
	jp ByteFill

MemoryGame_PrintTries:
	hlcoord 9, 15
	lb bc, 1, 9
	call Textbox
	hlcoord 10, 16
	ld de, .tries_text
	call PlaceString
	hlcoord 17, 16
	ld de, wMemoryGameNumberTriesRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

.tries_text:
	db "TRIES@"

MemoryGame_Card2Coord:
	ld d, 0
.find_row
	sub 9
	jr c, .found_row
	inc d
	jr .find_row

.found_row
	add 9
	ld e, a
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
.loop2
	ld a, d
	and a
	jr z, .done
	add hl, bc
	dec d
	jr .loop2

.done
	sla e
	add hl, de
	ret

MemoryGame_InterpretJoypad_AnimateCursor:
	ld a, [wJumptableIndex]
	cp MEMORYGAME_CHECK_TRIES_REMAINING
	jr c, .quit
	cp MEMORYGAME_DELAY_PICK_AGAIN
	ret z
	cp MEMORYGAME_REVEAL_ALL
	jr nc, .quit
	call JoyTextDelay
	ld hl, hJoypadPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressed_a
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .pressed_right
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up
	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
	ret

.quit
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.pressed_a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a
	ld [wMemoryGameCardChoice], a
	ret

.pressed_left
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	dec [hl]
	jr .play_movement_sound

.pressed_right
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp (9 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	jr .play_movement_sound

.pressed_up
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub 9
	ld [hl], a
	jr .play_movement_sound

.pressed_down
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp (5 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add 9
	ld [hl], a
	; fallthrough

.play_movement_sound
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	jp PlaySFX

CardFlipNotEnoughCoinsText:
	text_far _CardFlipNotEnoughCoinsText
	text_end

CardFlipChooseACardText:
	text_far _CardFlipChooseACardText
	text_end

MemoryGamePlayWithOneCoinText:
	text_far _MemoryGamePlayWithOneCoinText
	text_end

MemoryGameYeahText:
	text_far _MemoryGameYeahText
	text_end

MemoryGameNoPrizeText:
	text_far _MemoryGameNoPrizeText
	text_end

MemoryGameExtraTryText:
	text_far _MemoryGameExtraTryText
	text_end

MemoryGameDarnText:
	text_far _MemoryGameDarnText
	text_end

MemoryGameGameOverText:
	text_far _MemoryGameGameOverText
	text_end

MemoryGameLZ:
INCBIN "gfx/memory_game/memory_game.2bpp.lz"

MemoryGameCursorLZ:
INCBIN "gfx/memory_game/cursor.2bpp.lz"
