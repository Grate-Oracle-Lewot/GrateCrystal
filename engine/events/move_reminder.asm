MoveCost:
	dt 500

EggMoveCost:
	dt 5000

CheckCostAgainstPlayerMoney:
; input: MoveCost or EggMoveCost in hl
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	ret

MoveReminder:
	ld hl, Text_MoveReminderIntro
	call PrintText
	farcall PlaceMoneyTopRight
	call YesNoBox
	jr c, .cancel

	ld hl, MoveCost
	call CheckCostAgainstPlayerMoney
	jr c, .not_enough_money

	ld hl, Text_MoveReminderWhichMon
	call PrintText

.loop_party_menu
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .is_an_egg

	call IsAPokemon
	jr c, .no_moves_to_learn

	call GetRemindableMoves
	jr z, .no_moves_to_learn

.loop_move_menu
	call ChooseMoveToLearn
	jr c, .loop_party_menu

	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1

	predef LearnMove

	ld a, b
	dec a
	jr z, .move_learned

.recheck_for_moves
	call GetRemindableMoves
	jr z, .no_moves_to_learn
	jr .loop_move_menu

.cancel
	ld hl, Text_MoveReminderCancel
	jp PrintText

.is_an_egg
	ld hl, Text_MoveReminderEgg
	call PrintText
	jr .loop_party_menu

.no_moves_to_learn
	ld hl, Text_MoveReminderNoMoves
	call PrintText
	jr .loop_party_menu

.not_enough_money
	ld hl, Text_MoveReminderNoPay
	jp PrintText

.move_learned
	call ReturnToMapWithSpeechTextbox
	farcall PlaceMoneyTopRight
	ld c, 10
	call DelayFrames

	ld hl, MoveCost
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	call ApplyTilemap
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	farcall PlaceMoneyTopRight
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, Text_MoveReminderPaymentReceived
	call PrintText

	ld hl, MoveCost
	call CheckCostAgainstPlayerMoney
	jr c, .cancel
	jr .recheck_for_moves

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

EggMoveTutor:
	ld hl, Text_EggMoveTutorIntro
	call PrintText
	farcall PlaceMoneyTopRight
	call YesNoBox
	jr c, .cancel

	ld hl, EggMoveCost
	call CheckCostAgainstPlayerMoney
	jr c, .not_enough_money

	ld hl, Text_EggMoveTutorWhichMon
	call PrintText

.loop_party_menu
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .is_an_egg

	call IsAPokemon
	jr c, .no_moves_to_learn

	call GetEggRemindableMoves
	jr z, .no_moves_to_learn

.loop_move_menu
	call ChooseMoveToLearn
	jr c, .loop_party_menu

	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1

	predef LearnMove

	ld a, b
	dec a
	jr z, .move_learned

.recheck_for_moves
	call GetEggRemindableMoves
	jr z, .no_moves_to_learn
	jr .loop_move_menu

.cancel
	ld hl, Text_EggMoveTutorCancel
	jp PrintText

.is_an_egg
	ld hl, Text_EggMoveTutorEgg
	call PrintText
	jr .loop_party_menu

.no_moves_to_learn
	ld hl, Text_EggMoveTutorNoMoves
	call PrintText
	jr .loop_party_menu

.not_enough_money
	ld hl, Text_EggMoveTutorNoPay
	jp PrintText

.move_learned
	call ReturnToMapWithSpeechTextbox
	farcall PlaceMoneyTopRight
	ld c, 10
	call DelayFrames

	ld hl, EggMoveCost
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	call ApplyTilemap
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	farcall PlaceMoneyTopRight
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, Text_EggMoveTutorPaymentReceived
	call PrintText

	ld hl, EggMoveCost
	call CheckCostAgainstPlayerMoney
	jr c, .cancel
	jr .recheck_for_moves

GetEggRemindableMoves:
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
	farcall FadeOutPalettes
	farcall BlankScreen
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a

	hlcoord 0,  0
	lb bc, 9, 18
	call TextboxBorder

; Adds a gap in the move list's text box border that prevents clipping with some names.
	hlcoord 2, 0
	lb bc, 1, 16
	call ClearBox

; This displays the Pokémon's species name (not nickname) at the coordinates defined at "hlcoord".
	xor a
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord  3, 0
	call PlaceString

; Displays the level icon (even if at Lv100) and the mon's level at hlcoord.
	farcall CopyMonToTempMon
	hlcoord 13, 0
	ld a, [wTempMonLevel]
	ld [hl], "<EVO_LV>"
	inc hl
	ld c, 3
	call Print8BitNumLeftAlign

; Creates the menu, sets the "B_BUTTON" to cancel and sets up each entry to behave like a TM/HM.
	call ScrollingMenu
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

; The menu header defines the menu's position and what will be included.
; The last two values of "menu_coords" will determine where the vertical scroll arrows will be located.
.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2,  9
	dw .MenuData
	db 1

; This sets up the menu's contents, including the amount of entries displayed before scrolling is required.
; Vertical scroll arrows and the move's details will be displayed.
.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3
	db 4, SCREEN_WIDTH + 2
	db SCROLLINGMENU_ITEMS_NORMAL
	dba  wd002
	dba .print_move_name
	dba .print_pp
	dba .print_move_details

; This prints the move's name in the menu.
; This is purely visual as the actual entry is stored in "wd002".
.print_move_name
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	jp PlaceString

.print_pp
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de

	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wBuffer1], a
	ld hl, wStringBuffer1 + 9
	ld de, wBuffer1
	lb bc, 1, 2
	call PrintNum
	ld hl, wStringBuffer1 + 11
	ld [hl], "/"
	ld hl, wStringBuffer1 + 12
	call PrintNum
	
	ld hl, wStringBuffer1 + 14
	ld [hl], "@"

	pop hl
	ld de, wStringBuffer1
	call PlaceString

; This prints the PP gfx before the move's PP.
	ld bc, 6
	add hl, bc
	ld a, "P"
	ld [hli], a
	ld [hl], a
	ret

; This adds a text box border line to the description box that replaces a leftover piece of the notch that remains when the cancel option is highlighted.
.cancel_border_fix
	hlcoord 0, 9
	ld [hl], "│"
	inc hl
	ret

; This begins the printing of all of the move's details, including the border around the description.
.print_move_details
	hlcoord 0, 10
	lb bc, 6, 18
	call TextboxBorder

; This code will relative jump to the ".cancel_border_fix" local jump if the cancel entry is highlighted.
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel_border_fix

.print_move_desc
	push de
	ld a, [wMenuSelection]
	inc a
	pop de
	ret z
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDescription

.print_move_type
	ld a, [wCurSpecies]
	ld b, a
	hlcoord 2, 11
	predef PrintMoveType

.print_move_stat_strings
	hlcoord 0, 9
	ld de, MoveTypeTopString
	call PlaceString
	hlcoord 0, 10
	ld de, MoveTypeString
	call PlaceString
	hlcoord 12, 11
	ld de, MoveAttackString
	call PlaceString
	hlcoord  4, 12
	ld de, MoveChanceString
	call PlaceString
	hlcoord 12, 12
	ld de, MoveAccuracyString
	call PlaceString

.print_move_category
	ld a, [wCurSpecies]
	ld b, a
	farcall GetMoveCategoryName
	hlcoord 1, 10
	ld de, wStringBuffer1
	call PlaceString
	hlcoord 1, 11
	ld [hl], "/"
	inc hl

.print_move_chance
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_CHANCE) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 1
	jr c, .print_move_null_chance
	Call ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord  8, 12
	call PrintNum
	jr .print_move_accuracy

; This prints "---" if the move has a status effect chance of "0".
; This means one of three things:
; It does not inflict a status effect.
; It is always successful in inflicting a status effect unless something blocks it.
; It causes a weather effect.
.print_move_null_chance
	ld de, MoveNullValueString
	ld bc, 3
	hlcoord  8, 12
	call PlaceString

.print_move_accuracy
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_EFFECT) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld hl, PerfectAccuracyEffects
	call IsInByteArray
	jr c, .imperfect

	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_ACC) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	Call ConvertPercentages
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 16, 12
	call PrintNum
	jr .print_move_attack

; This prints "---" if the move's effect is in the list of perfect accuracy effects.
; This list is stored in the home bank, so it can be accessed from anywhere.
.imperfect
	ld de, MoveNullValueString
	ld bc, 3
	hlcoord 16, 12
	call PlaceString

.print_move_attack
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_POWER) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 2
	jr c, .print_move_null_attack
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 16, 11
	jp PrintNum

; This prints "---" if the move has an attack of "0".
; This means that the move does not initially cause damage or is a one hit knockout move.
.print_move_null_attack
	hlcoord 16, 11
	ld de, MoveNullValueString
	ld bc, 3
	jp PlaceString

MoveTypeTopString:
	db "┌────────┐@"

MoveTypeString:
	db "│        └@"

MoveAttackString:
	db "ATK/@"

MoveAccuracyString:
	db "ACC/@"

MoveChanceString:
	db "EFF/@"

MoveNullValueString:
	db "---@"

Text_MoveReminderIntro:
	text_far _MoveReminderIntro
	text_end
	
Text_MoveReminderWhichMon:
	text_far _MoveReminderWhichMon
	text_end

Text_MoveReminderCancel:
	text_far _MoveReminderCancel
	text_end
	
Text_MoveReminderEgg:
	text_far _MoveReminderEgg
	text_end

Text_MoveReminderNoMoves:
	text_far _MoveReminderNoMoves
	text_end

Text_MoveReminderNoPay:
	text_far _MoveReminderNoPay
	text_end

Text_MoveReminderPaymentReceived:
	text_far _MoveReminderPaymentReceived
	text_end

Text_EggMoveTutorIntro:
	text_far _EggMoveTutorIntro
	text_end

Text_EggMoveTutorWhichMon:
	text_far _EggMoveTutorWhichMon
	text_end

Text_EggMoveTutorCancel:
	text_far _EggMoveTutorCancel
	text_end
	
Text_EggMoveTutorEgg:
	text_far _EggMoveTutorEgg
	text_end

Text_EggMoveTutorNoMoves:
	text_far _EggMoveTutorNoMoves
	text_end

Text_EggMoveTutorNoPay:
	text_far _EggMoveTutorNoPay
	text_end

Text_EggMoveTutorPaymentReceived:
	text_far _EggMoveTutorPaymentReceived
	text_end
