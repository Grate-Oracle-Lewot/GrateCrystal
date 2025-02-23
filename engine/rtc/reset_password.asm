_ResetClock:
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	ld a, RTC_RESET
	ld [sRTCStatusFlags], a
	jp CloseSRAM
