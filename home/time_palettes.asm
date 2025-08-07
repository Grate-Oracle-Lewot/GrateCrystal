UpdateTimeAndPals::
; update time and time-sensitive palettes

; rtc enabled?
	ld a, [wSpriteUpdatesEnabled]
	and a
	ret z

	call UpdateTime

; obj update on?
	ld a, [wVramState]
	bit 0, a ; obj update
	ret z
	; fallthrough

TimeOfDayPals::
	farcall _TimeOfDayPals
	ret

UpdateTimePals::
	farcall _UpdateTimePals
	ret
