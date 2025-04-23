CheckForHiddenItems:
; Checks to see if there are hidden items on the screen that have not yet been found.  If it finds one, returns carry.
	call GetMapScriptsBank
	ld [wCurMapScriptBank], a
; Get the coordinate of the bottom right corner of the screen, and load it in wBottomRightYCoord/wBottomRightXCoord.
	ld a, [wXCoord]
	add SCREEN_WIDTH / 4
	ld [wBottomRightXCoord], a
	ld a, [wYCoord]
	add SCREEN_HEIGHT / 4
	ld [wBottomRightYCoord], a
; Get the pointer for the first bg_event in the map...
	ld hl, wCurMapBGEventsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; ... before even checking to see if there are any BG events on this map.
	ld a, [wCurMapBGEventCount]
	and a
	jr z, .nobgeventitems
; For i = 1:wCurMapBGEventCount...
.loop
; Store the counter in wRemainingBGEventCount, and store the bg_event pointer in the stack.
	ld [wRemainingBGEventCount], a
	push hl
; Get the Y coordinate of the BG event.
	call .GetFarByte
	ld e, a
; Is the Y coordinate of the BG event on the screen?  If not, go to the next BG event.
	ld a, [wBottomRightYCoord]
	sub e
	jr c, .next
	cp SCREEN_HEIGHT / 2
	jr nc, .next
; Is the X coordinate of the BG event on the screen?  If not, go to the next BG event.
	call .GetFarByte
	ld d, a
	ld a, [wBottomRightXCoord]
	sub d
	jr c, .next
	cp SCREEN_WIDTH / 2
	jr nc, .next
; Is this BG event a hidden item?  If not, go to the next BG event.
	call .GetFarByte
	cp BGEVENT_ITEM
	jr nz, .next
; Has this item already been found?  If not, set off the Itemfinder.
	ld a, [wCurMapScriptBank]
	call GetFarWord
	ld a, [wCurMapScriptBank]
	call GetFarWord
	ld d, h
	ld e, l
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .itemnearby

.next
; Restore the bg_event pointer and increment it by the length of a bg_event.
	pop hl
	ld bc, BG_EVENT_SIZE
	add hl, bc
; Restore the BG event counter and decrement it.  If it hits zero, there are no hidden items in range.
	ld a, [wRemainingBGEventCount]
	dec a
	jr nz, .loop

.nobgeventitems
	xor a
	ret

.itemnearby
	pop hl
	scf
	ret

.GetFarByte:
	ld a, [wCurMapScriptBank]
	call GetFarByte
	inc hl
	ret

HeadbuttItemEncounter:
	ld hl, HeadbuttItemTable
	jr TreeRockRodItemEncounter

RockItemEncounter:
	ld hl, RockSmashItemTable
	jr TreeRockRodItemEncounter

FishingItemEncounter:
	ld hl, FishingItemTable
	; fallthrough

TreeRockRodItemEncounter:
	call Random
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	jr .loop

.ok
	ld a, [hli]
	inc a
	jr z, .done
	ld a, [hli]
.done
	ld [wScriptVar], a
	ret
	
HeadbuttItemTable:
	db 2, MIRACLE_SEED
	db 2, GOLD_BERRY
	db 2, MIRACLEBERRY
	db 2, MYSTERYBERRY
	db 3, GOLD_LEAF
	db 3, SILVER_LEAF
	db 3, BERRY
	db 4, BITTER_BERRY
	db 4, MINT_BERRY
	db 4, ICE_BERRY
	db 4, BURNT_BERRY
	db 4, PRZCUREBERRY
	db 4, PSNCUREBERRY
	db 4, RED_APRICORN
	db 4, BLU_APRICORN
	db 4, YLW_APRICORN
	db 4, GRN_APRICORN
	db 4, WHT_APRICORN
	db 4, BLK_APRICORN
	db 4, PNK_APRICORN
	db -1

RockSmashItemTable:
	db 1, OLD_AMBER
	db 1, DOME_FOSSIL
	db 1, HELIX_FOSSIL
	db 2, MAX_REVIVE
	db 2, MAX_ELIXER
	db 4, ELIXER
	db 4, MAX_ETHER
	db 6, ETHER
	db 6, REVIVE
	db 8, KINGS_ROCK
	db 8, NUGGET
	db 10, STARDUST
	db 16, HARD_STONE
	db 16, SOFT_SAND
	db 64, BRICK_PIECE
	db -1

FishingItemTable:
	db 1, BIG_PEARL
	db 1, DRAGON_FANG
	db 2, DRAGON_SCALE
	db 3, STAR_PIECE
	db 4, WATER_STONE
	db 4, TRIDENT
	db 8, MYSTIC_WATER
	db 10, PEARL
	db 16, SLOWPOKETAIL
	db 16, BRICK_PIECE
	db -1
