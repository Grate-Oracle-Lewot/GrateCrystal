InitializeEvents:
; zero out sMysteryGiftTrainerHouseFlag to prevent glitchy Cal
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call OpenSRAM
	ld a, FALSE
	ld [sMysteryGiftTrainerHouseFlag], a
	call CloseSRAM

; initialize events
	ld hl, InitialEvents
.events_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	jr z, .events_done
	ld b, SET_FLAG
	push hl
	call EventFlagAction
	pop hl
	jr .events_loop
.events_done

; initialize engine flags
	ld hl, InitialEngineFlags
.flags_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	jr z, .flags_done
	ld b, SET_FLAG
	push hl
	farcall EngineFlagAction
	pop hl
	jr .flags_loop
.flags_done

; initialize variable sprites
	ld hl, InitialVariableSprites
.sprites_loop
	ld a, [hli]
	inc a
	jr z, .sprites_done
	; subtract 1 to balance the previous 'inc'
	add LOW(wVariableSprites) - 1
	ld e, a
	adc HIGH(wVariableSprites)
	sub e
	ld d, a
	ld a, [hli]
	ld [de], a
	jr .sprites_loop
.sprites_done

	farcall InitializeTrainerRankings
	ret

INCLUDE "data/events/init_events.asm"
