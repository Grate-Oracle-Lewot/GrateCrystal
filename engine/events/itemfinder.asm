ItemFinder:
	farcall CheckForHiddenItems
	jr c, .found_something
	ld hl, .Script_FoundNothing
	jr .resume

.found_something
	ld hl, .Script_FoundSomething
.resume
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.ItemfinderSound:
	ld a, [wHiddenItemDistance]
	and a
	jr nz, .convert_distance_to_delay

	inc a ; DelayFrames doesn't work properly with C=0.
.convert_distance_to_delay
	add a
	ld c, a
	add a
	add a
	add c
	inc a
	inc a
	ld b, a ; Delay between beeps.
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call PlaySFX
	ld de, SFX_TRANSACTION
	call WaitPlaySFX

	ld c, 2 ; Number of beeps after the first one.
.sfx_loop
	push bc
	ld c, b
	call DelayFrames
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call PlaySFX
	ld de, SFX_TRANSACTION
	call WaitPlaySFX
	pop bc
	dec c
	jr nz, .sfx_loop
	jp WaitSFX

.Script_FoundSomething:
	reloadmappart
	special UpdateTimePals
	callasm .ItemfinderSound
	writetext .ItemfinderItemNearbyText
	closetext
	end

.Script_FoundNothing:
	reloadmappart
	special UpdateTimePals
	writetext .ItemfinderNopeText
	closetext
	end

.ItemfinderItemNearbyText:
	text_far _ItemfinderItemNearbyText
	text_end

.ItemfinderNopeText:
	text_far _ItemfinderNopeText
	text_end
