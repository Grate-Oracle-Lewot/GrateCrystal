; stolen from Idain who stole it from Rangi who stole it from TPP (ax)
; (egg part stolen from Nayru who stole it from the same chain of thieves)

MoveReminder:
	ld hl, Text_MoveReminderIntro
	call PrintText
	farcall PlaceMoneyTopRight
	call YesNoBox
	jp c, .cancel

	ld hl, .cost_to_relearn
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	jp c, .not_enough_money

	ld hl, Text_MoveReminderWhichMon
	call PrintText
	call JoyWaitAorB

	ld b, $6
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	call GetRemindableMoves
	jr z, .no_moves

	ld hl, Text_MoveReminderWhichMove
	call PrintText
	call JoyWaitAorB

	call ChooseMoveToLearn
	jr c, .skip_learn

	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, wStringBuffer2 - wStringBuffer1
	call CopyBytes
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	jr z, .skip_learn

	ld hl, .cost_to_relearn
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX

.skip_learn
	call ReturnToMapWithSpeechTextbox
.cancel
	ld hl, Text_MoveReminderCancel
	jp PrintText

.egg
	ld hl, Text_MoveReminderEgg
	jp PrintText

.not_enough_money
	ld hl, Text_MoveReminderNoPay
	jp PrintText

.no_mon
	ld hl, Text_MoveReminderNoMon
	jp PrintText

.no_moves
	ld hl, Text_MoveReminderNoMoves
	jp PrintText

.cost_to_relearn
	dt 500

EggMoveTutor:
	ld hl, Text_EggMoveTutorIntro
	call PrintText
	farcall PlaceMoneyTopRight
	call YesNoBox
	jp c, .cancel

	ld hl, .cost_to_relearn
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	jp c, .not_enough_money

	ld hl, Text_MoveReminderWhichMon
	call PrintText
	call JoyWaitAorB

	ld b, $6
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	call GetEggRemindableMoves
	jr z, .no_moves

	ld hl, Text_EggMoveTutorWhichMove
	call PrintText
	call JoyWaitAorB

	call ChooseMoveToLearn
	jr c, .skip_learn

	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, wStringBuffer2 - wStringBuffer1
	call CopyBytes
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	jr z, .skip_learn

	ld hl, .cost_to_relearn
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX

.skip_learn
	call ReturnToMapWithSpeechTextbox
.cancel
	ld hl, Text_EggMoveTutorCancel
	jp PrintText

.egg
	ld hl, Text_EggMoveTutorEgg
	jp PrintText

.not_enough_money
	ld hl, Text_EggMoveTutorNoPay
	jp PrintText

.no_mon
	ld hl, Text_EggMoveTutorNoMon
	jp PrintText

.no_moves
	ld hl, Text_EggMoveTutorNoMoves
	jp PrintText

.cost_to_relearn
	dt 5000

GetRemindableMoves:
; Get moves remindable by CurPartyMon
; Returns z if no moves can be reminded.
;	EXPORT EvosAttacksPointers, EvosAttacks
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	push af
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a

	ld b, 0
	ld de, wd002 + 1

	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
.skip_evos
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

.loop_moves
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	jr c, .loop_moves

	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves

.done
	pop bc
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

GetEggRemindableMoves:
; Get moves remindable by CurPartyMon
; Returns z if no moves can be reminded.

	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	push af
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a

	ld b, 0
	ld de, wd002 + 1

; Based on GetEggMove in engine/pokemon/breeding.asm
	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld c, a
	ld hl, EggMovePointers ; EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EggMovePointers)
	call GetFarWord

.loop_moves
	ld a, BANK("Egg Moves")
	call GetFarByte
	inc hl
	cp -1 ; last entry in egg move table is -1
	jr z, .done
	ld c, a
    
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves

.done
	pop bc
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

CheckAlreadyInList:
	push hl
	ld hl, wd002 + 1
.loop
	ld a, [hli]
	inc a
	jr z, .nope
	dec a
	cp c
	jr nz, .loop
	pop hl
	scf
	ret
.nope
	pop hl
	and a
	ret

CheckPokemonAlreadyKnowsMove:
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, 4
.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	pop bc
	pop hl
	and a
	ret
.yes
	pop bc
	pop hl
	scf
	ret

ChooseMoveToLearn:
	; Number of items stored in wd002
	; List of items stored in wd002 + 1
	call FadeToMenu
	farcall BlankScreen
	call UpdateSprites
	ld hl, .MenuDataHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	call SpeechTextbox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

.carry
	scf
	ret

.MenuDataHeader:
	db $40 ; flags
	db 1, 1 ; start coords
	db 11, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $30 ; pointers
	db 5, SCREEN_WIDTH + 2 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wd002
	dba .PrintMoveName
	dba .PrintDetails
	dba .PrintMoveDesc

.PrintMoveName
	push de
	ld a, [wMenuSelection]
	ld [wd265], a
	call GetMoveName
	pop hl
	jp PlaceString

.PrintDetails
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de
	dec a

	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	and TYPE_MASK
	ld [wd265], a
	; bc = a * 4
	ld c, a
	add a
	add a
	ld b, 0
	ld c, a
	ld hl, .Types
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wStringBuffer1 + 3
	ld bc, 3
	call PlaceString
	ld hl, wStringBuffer1 + 6
	ld [hl], "/"

	ld a, [wMenuSelection]
	dec a
	
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_POWER
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld hl, wStringBuffer1 + 7
	and a
	jr z, .no_power
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	call PrintNum
	jr .got_power
.no_power
	ld de, .ThreeDashes
	ld bc, 3
	call PlaceString
.got_power
	ld hl, wStringBuffer1 + 7 + 3
	ld [hl], "/"

	ld a, [wMenuSelection]
	dec a

; print accuracy
	ld a, [wMenuSelection]
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_ACC
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wBuffer1], a
	ld hl, wStringBuffer1 + 11
	ld de, wBuffer1
	lb bc, 1, 3
	call PrintNum
	ld hl, wStringBuffer1 + 14
	ld [hl], "@"

	pop hl
	ld de, wStringBuffer1
	jp PlaceString

.ThreeDashes
	db "---@"

.Types
	db "NML@"
	db "FIT@"
	db "FLY@"
	db "PSN@"
	db "GRD@"
	db "RCK@"
	db "ERR@"
	db "BUG@"
	db "GST@"
	db "STL@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "ERR@"
	db "???@"
	db "FIR@"
	db "WTR@"
	db "GRS@"
	db "ELC@"
	db "PSY@"
	db "ICE@"
	db "DGN@"
	db "DRK@"
	db "FAE@"

.PrintMoveDesc
	push de
	call SpeechTextbox
	ld a, [wMenuSelection]
	inc a
	pop de
	ret z
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDescription
	ret

Text_MoveReminderIntro:
	text_far _MoveReminderIntro
	text_end
	
Text_MoveReminderWhichMon:
	text_far _MoveReminderWhichMon
	text_end

Text_MoveReminderWhichMove:
	text_far _MoveReminderWhichMove
	text_end

Text_MoveReminderCancel:
	text_far _MoveReminderCancel
	text_end
	
Text_MoveReminderEgg:
	text_far _MoveReminderEgg
	text_end

Text_MoveReminderNoPay:
	text_far _MoveReminderNoPay
	text_end

Text_MoveReminderNoMon:
	text_far _MoveReminderNoMon
	text_end
	
Text_MoveReminderNoMoves:
	text_far _MoveReminderNoMoves
	text_end

Text_EggMoveTutorIntro:
	text_far _EggMoveTutorIntro
	text_end

Text_EggMoveTutorWhichMove:
	text_far _EggMoveTutorWhichMove
	text_end

Text_EggMoveTutorCancel:
	text_far _EggMoveTutorCancel
	text_end
	
Text_EggMoveTutorEgg:
	text_far _EggMoveTutorEgg
	text_end

Text_EggMoveTutorNoPay:
	text_far _EggMoveTutorNoPay
	text_end

Text_EggMoveTutorNoMon:
	text_far _EggMoveTutorNoMon
	text_end
	
Text_EggMoveTutorNoMoves:
	text_far _EggMoveTutorNoMoves
	text_end
