MAX_NUM_MOVES EQU 7

String_LVL_text:
	db "LVL-UP     @"
String_EGG_text:
	db "EGG        @"
String_MOVES_text:
	db " MOVES     @"
String_TECH_text:
	db "TECHNICAL  @"
String_HIDDEN_text:
	db "HIDDEN     @"
String_MACHINES_text:
	db " MACHINES  @"
String_MOVE_text:
	db "MOVE       @"
String_TUTOR_text:
	db " TUTORS    @"
Print_Category_MOVES_text:
	ld hl, String_MOVES_text
	jp Print_Category_text

DisplayDexMonMoves::
	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call Pokedex_Clearbox

	; the byte flag that tells us which type of table we're currently on
	; 0 = Info, 1 = Stats, 2 = Level Moves, 3 =  TMs, 4 = HMs, 5 = Move Tutors, 6 = Egg Moves
	
	ld a, [wPokedexEntryType]
	cp DEXENTRY_LVLUP
	jr z, .LvlUpLearnset
	cp DEXENTRY_TMS
	jr z, .TMs
	cp DEXENTRY_HMS
	jr z, .HMs
	cp DEXENTRY_MTS
	jr z, .MTs
	cp DEXENTRY_EGG
	jr z, .EggMoves
	ld a, DEXENTRY_LVLUP
	call DexEntry_NextCategory

.LvlUpLearnset
; place category name
	ld de, String_LVL_text
	call Print_Category_MOVES_text

	ld a, DEXENTRY_LVLUP
	ld [wPokedexEntryType], a
	call Pokedex_Calc_LvlMovesPtr
	jp Pokedex_Print_NextLvlMoves
.TMs
; place category name
	ld de, String_TECH_text
	call Print_Category_MACHINES_text

	ld a, DEXENTRY_TMS
	ld [wPokedexEntryType], a
	jp Pokedex_PrintTMs
.HMs
; place category name
	ld de, String_HIDDEN_text
	call Print_Category_MACHINES_text

 	ld a, DEXENTRY_HMS
 	ld [wPokedexEntryType], a
 	jp Pokedex_PrintHMs
.MTs
; place category name
	ld de, String_MOVE_text
	ld hl, String_TUTOR_text
	call Print_Category_text

	ld a, DEXENTRY_MTS
	ld [wPokedexEntryType], a
	jp Pokedex_PrintMTs
.EggMoves
; place category name
	ld de, String_EGG_text
	call Print_Category_MOVES_text

	ld a, DEXENTRY_EGG
	ld [wPokedexEntryType], a
	call Pokedex_Calc_EggMovesPtr
	ret z
	jp Pokedex_Print_Egg_moves

Pokedex_Calc_LvlMovesPtr:
	ld a, [wTempSpecies]
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
.SkipEvoBytes	
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a ; cp 0
	jr nz, .SkipEvoBytes
.CalcPageoffset
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld c, MAX_NUM_MOVES
	call SimpleMultiply 
	; double this num and add to first byte after Evo's 0
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ret

Pokedex_Print_NextLvlMoves:
; Print No more than MAX_NUM_MOVES moves
	ld b, 0
	ld c, 0 ; our move counter, max of MAX_NUM_MOVES
.learnset_loop
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	jr z, .FoundEnd
	push hl
	ld [wTextDecimalByte], a
	hlcoord 2, 9
	call DexEntry_adjusthlcoord
	ld [hl], "<DEX_LV>"
	hlcoord 3, 9
	call DexEntry_adjusthlcoord
	ld de, wTextDecimalByte
	push bc
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	pop bc 
	pop hl
	inc hl
	push hl
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	ld [wNamedObjectIndex], a
	call GetMoveName
	hlcoord 7, 9
	call DexEntry_adjusthlcoord
	push bc
	call PlaceString
	pop bc
	pop hl
	inc hl
	inc bc
	ld a, MAX_NUM_MOVES
	cp c
	jr nz, .learnset_loop
	; fallthrough

.MaxedPage ; Printed MAX_NUM_MOVES moves. Moves are still left. Inc the Page counter
	; check to see if really any moves left, we dont want a blank page
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	jr z, .FoundEnd
	jp DexEntry_IncPageNum

.FoundEnd
	ld a, DEXENTRY_TMS
	jp DexEntry_NextCategory

Pokedex_PrintTMs:
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld a, [wPokedexStatus] ; machine moves index
	ld b, a
	ld c, 0 ; current line
.tm_loop
	push bc
	ld a, TM01
	add b ; machine moves index
	ld [wCurItem], a ; machine moves index
	farcall GetTMHMItemMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	farcall CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr z, .notcompatible
	call GetMoveName
	push bc ; our count is in c
	hlcoord 7, 9
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	ld a, TM01
	ld a, [wPokedexStatus]
	ld b, a
	ld a, TM01
	add b ; machine moves index
	ld [wNamedObjectIndex], a
	call GetItemName
	push bc
	hlcoord 2, 9
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	inc c ; since we printed a line
	ld a, MAX_NUM_MOVES
	cp c
	jr nz, .notcompatible ; not yet printed all slots
	; We've printed all MAX_NUM_MOVES slots
	; check if we need to move to next category or if there are moves left
	call Pokedex_anymoreTMs
	jr z, .done ; there are no moves left
	; there are moves left
	jp DexEntry_IncPageNum

.notcompatible
	ld a, NUM_TMS - 1
	cp b
	jr z, .done
	inc b
	ld a, b
	ld [wPokedexStatus], a ; moves machines index
	jr .tm_loop

.done
	ld a, DEXENTRY_HMS
	call DexEntry_NextCategory
	ld a, c
	and a
	ret nz
	hlcoord 4, 9
	ld de, DexEntry_NONE_text
	jp PlaceString

Pokedex_anymoreTMs:
	; b has the current TM index
	ld a, NUM_TMS - 1
	cp b
	jr z, .none
	inc b
.tmloop
	push bc
	ld a, TM01
	add b
	ld [wCurItem], a
	farcall GetTMHMItemMove
	ld a, [wTempTMHM]	
	ld [wPutativeTMHMMove], a
	farcall CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr nz, .yes
	ld a, NUM_TMS - 1
	cp b
	jr z, .none
	inc b
	jr .tmloop

.yes
	ld a, b
	ld [wPokedexStatus], a ; so we can start off at the next learnable machine
	ld a, 1
	and a
	ret

.none
	xor a
	ld [wPokedexStatus], a
	ret

Pokedex_PrintHMs:
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld a, [wPokedexStatus] ; machine moves index
	ld b, a
	ld c, 0 ; current line
.hm_loop
	push bc
	ld a, HM01
	add b ; machine moves index
	ld [wCurItem], a ; machine moves index
	farcall GetTMHMItemMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	farcall CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr z, .notcompatible
 	call GetMoveName
	push bc ; our count is in c
	hlcoord 7, 9
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	ld a, HM01
	add b ; machine moves index
	ld [wNamedObjectIndex], a
	call GetItemName
	push bc
	hlcoord 2, 9
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	inc c ; since we printed a line
	ld a, MAX_NUM_MOVES
	cp c
	jr nz, .notcompatible ; not yet printed all slots
	; We've printed all MAX_NUM_MOVES slots
	; check if we need to move to next category or if there are moves left
	call Pokedex_anymoreHMs
	jr z, .done ; there are no moves left
	; there are moves left
	jp DexEntry_IncPageNum

.notcompatible
	ld a, NUM_HMS - 1
	cp b
	jr z, .done
	inc b
	ld a, b
	ld [wPokedexStatus], a ; moves machines index
	jr .hm_loop

.done
	ld a, DEXENTRY_MTS
	call DexEntry_NextCategory
	ld a, c
	and a
	ret nz
	hlcoord 4, 9
	ld de, DexEntry_NONE_text
	jp PlaceString

Pokedex_anymoreHMs:
	; b has the current HM index
	ld a, NUM_HMS - 1
	cp b
	jr z, .none
	inc b
.hmloop
	push bc
	ld a, HM01
	add b
	ld [wCurItem], a
	farcall GetTMHMItemMove
	ld a, [wTempTMHM]	
	ld [wPutativeTMHMMove], a
	farcall CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr nz, .yes
	ld a, NUM_HMS - 1
	cp b
	jr z, .none
	inc b
	jr .hmloop

.yes
	ld a, b
	ld [wPokedexStatus], a ; so we can start off at the next learnable machine
	ld a, 1
	and a
	ret

.none
	xor a
	ld [wPokedexStatus], a
	ret

Pokedex_PrintMTs:
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld a, [wPokedexStatus] ; moves machines index
	ld b, a ; result of simple multiply in a
	ld c, 0 ; current line
.mt_loop
	push bc
	ld a, MT01
	add b
	ld [wCurItem], a
	farcall GetTMHMItemMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	farcall CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr z, .notcompatible
	call GetMoveName
	push bc ; our count is in c
	hlcoord 3, 9
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	inc c ; since we printed a line
	ld a, MAX_NUM_MOVES
	cp c
	jr nz, .notcompatible
	; We've printed all MAX_NUM_MOVES slots
	; check if we need to move to next category or if there are moves left
	call Pokedex_anymoreMTs
	jr z, .done ; there are no moves left
	; there are moves left
	jp DexEntry_IncPageNum

.notcompatible
	ld a, NUM_TUTORS - 1
	cp b
	jr z, .done
	inc b
	ld a, b
	ld [wPokedexStatus], a ; moves machines index
	jr .mt_loop

.done
	ld a, DEXENTRY_EGG
	call DexEntry_NextCategory
	ld a, c
	and a
	ret nz
	hlcoord 4, 9
	ld de, DexEntry_NONE_text
	jp PlaceString

Pokedex_anymoreMTs:
	ld a, NUM_TUTORS - 1
	cp b
	jr z, .none
	; b has the current MT index
	inc b
.mtloop
	push bc
	ld a, MT01
	add b
	ld [wCurItem], a
	farcall GetTMHMItemMove
	ld a, [wTempTMHM]	
	ld [wPutativeTMHMMove], a
	farcall CanLearnTMHMMove
	ld a, c
	pop bc
	and a
	jr nz, .yes
	ld a, NUM_TUTORS - 1
	cp b
	jr z, .none
	inc b
	jr .mtloop

.yes
	ld a, 1
	and a
	ret

.none
	xor a
	ret

Pokedex_Calc_EggMovesPtr:
	ld a, DEXENTRY_EGG
	ld [wPokedexEntryType], a
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld a, [wPokedexEntryPageNum]
	ld c, MAX_NUM_MOVES ; we can print MAX_NUM_MOVES Egg moves per page
	call SimpleMultiply ; double this num and add to first byte after Evo's 0
	ld b, 0
	ld c, a
	push bc
; Step 4: Get First byte of learnset
	; push af ; preserve current species or else move sets will be messed up for stage2+ mons
	callfar GetPreEvolution ; changes wCurPartyMon
	callfar GetPreEvolution ; changes wCurPartyMon
	ld a, [wCurPartySpecies]
	dec a ; Bulbasaur is No 1 but entry ZERO
	ld b, 0
	ld c, a
	ld hl, EggMovePointers
	add hl, bc ; trying to add the species number in only 'a' will overflow a
	add hl, bc ; add twice to double the index, words/PTRs are TWO bytes ea
	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a

	ld a, BANK(EggMovePointers)
	call GetFarWord
.check_if_any
	ld a, BANK("Egg Moves")
	call GetFarByte ; a will be -1 if no egg moves
	pop bc
	add hl, bc
	cp -1
	ret nz
	; if we reach here, the mon has no egg moves at all
	; will not call Pokedex_Print_Egg_moves
	; increment to next category
	ld a, DEXENTRY_LVLUP
	call DexEntry_NextCategory
	; print NONE
	hlcoord 3, 9
	ld de, DexEntry_NONE_text
	call PlaceString
	jp PlaceString

Pokedex_Print_Egg_moves:
; Print No more than MAX_NUM_MOVES moves
	ld b, 0
	ld c, 0 ; our move counter, max of MAX_NUM_MOVES - 1 for MAX_NUM_MOVES moves
	; our adjusted pointer based on page num is in hl
.Egg_loop
	ld a, BANK("Egg Moves")
	call GetFarByte ; EGG Move, or -1 for end
	cp -1
	jr z, .FoundEnd
	inc hl ; Moves HL to next Byte
	push hl
	ld [wNamedObjectIndex], a ; all the "Name" Funcs use this 
	call GetMoveName ; returns the string pointer in de
	hlcoord 3, 9
	call DexEntry_adjusthlcoord
	push bc
	call PlaceString ; places Move Name
	pop bc
	pop hl
	ld a, MAX_NUM_MOVES - 1 ; means we just printed last move on page
	cp c
	jr z, .MaxedPage
	inc c
	jr .Egg_loop

.MaxedPage ; Printed MAX_NUM_MOVES moves. Moves are still left. Inc the Page counter
; CheckNextByte, we don't want blank screen if we just printed last move
	ld a, BANK("Egg Moves")
	call GetFarByte ; Move # returned in "a"
	cp -1
	jr z, .FoundEnd
	call DexEntry_IncPageNum
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a
	ret

.FoundEnd
	ld a, DEXENTRY_LVLUP
	call DexEntry_NextCategory
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a
	ret
 
