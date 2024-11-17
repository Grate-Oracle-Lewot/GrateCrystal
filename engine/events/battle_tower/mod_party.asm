ModifyBattleTowerParty:
	ld a, BANK(sBTMonOfTrainers)
	call OpenSRAM

	ld a, [wBT_OTMon1]
	cp DITTO
	jr z, .end
	ld a, [wBT_OTMon2]
	cp DITTO
	jr z, .end
	ld a, [wBT_OTMon3]
	cp DITTO
	jr z, .end

	ld a, [sBTMonPrevTrainer1]
	cp DITTO
	jr z, .end
	ld a, [sBTMonPrevTrainer2]
	cp DITTO
	jr z, .end
	ld a, [sBTMonPrevTrainer3]
	cp DITTO
	jr z, .end

	ld a, [sBTMonPrevPrevTrainer1]
	cp DITTO
	jr z, .end
	ld a, [sBTMonPrevPrevTrainer2]
	cp DITTO
	jr z, .end
	ld a, [sBTMonPrevPrevTrainer3]
	cp DITTO
	jr z, .end



.end
	jp CloseSRAM
