MobileCheckOwnMonAnywhere:
; Like CheckOwnMonAnywhere, but only check for species.
; OT/ID don't matter.

	ld a, [wPartyCount]
	and a
	ret z

	ld d, a
	ld e, 0
	ld hl, wPartyMon1Species
	ld bc, wPartyMonOTs
.asm_4a851
	call .CheckMatch
	ret c
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call .AdvanceOTName
	dec d
	jr nz, .asm_4a851
	ld a, BANK(sBoxCount)
	call OpenSRAM
	ld a, [sBoxCount]
	and a
	jr z, .asm_4a888
	ld d, a
	ld hl, sBoxMon1Species
	ld bc, sBoxMonOTs
.asm_4a873
	call .CheckMatch
	jr nc, .asm_4a87c
	jp CloseSRAM

.asm_4a87c
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call .AdvanceOTName
	dec d
	jr nz, .asm_4a873

.asm_4a888
	call CloseSRAM
	ld c, 0
.asm_4a88d
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .asm_4a8d1
	ld hl, .BoxAddresses
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	call OpenSRAM
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	and a
	jr z, .asm_4a8d1
	push bc
	push hl
	ld de, sBoxMons - sBoxCount
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, sBoxMonOTs - sBoxCount
	add hl, de
	ld b, h
	ld c, l
	pop hl
	ld d, a
.asm_4a8ba
	call .CheckMatch
	jr nc, .asm_4a8c4
	pop bc
	jp CloseSRAM

.asm_4a8c4
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call .AdvanceOTName
	dec d
	jr nz, .asm_4a8ba
	pop bc

.asm_4a8d1
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .asm_4a88d
	call CloseSRAM
	and a
	ret

.CheckMatch:
	push bc
	push hl
	push de
	ld d, b
	ld e, c
	ld a, [wScriptVar]
	ld b, [hl]
	cp b
	jr nz, .no_match
	jr .match

.no_match
	pop de
	pop hl
	pop bc
	and a
	ret

.match
	pop de
	pop hl
	pop bc
	scf
	ret

.BoxAddresses:
	table_width 3, MobileCheckOwnMonAnywhere.BoxAddresses
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
	assert_table_length NUM_BOXES

.AdvanceOTName:
	push hl
	ld hl, NAME_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret

UnusedFindItemInPCOrBag:
	ld a, [wScriptVar]
	ld [wCurItem], a
	ld hl, wNumPCItems
	call CheckItem
	jr c, .found

	ld a, [wScriptVar]
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr c, .found

	xor a
	ld [wScriptVar], a
	ret

.found
	ld a, 1
	ld [wScriptVar], a
	ret

Function4a94e:
	call FadeToMenu
	ld a, -1
	ld hl, wd002
	ld bc, 3
	call ByteFill
	xor a
	ld [wd018], a
	ld [wd019], a
	ld b, SCGB_PACKPALS
	call GetSGBLayout
	call SetPalettes
	call Function4aa22
	jr c, .asm_4a985
	jr z, .asm_4a9a1
	jr .asm_4a97b

.asm_4a974
	call Function4aa25
	jr c, .asm_4a985
	jr z, .asm_4a9a1

.asm_4a97b
	call Function4ac58
	ld hl, wd019
	res 1, [hl]
	jr .asm_4a974

.asm_4a985
	ld a, [wd018]
	and a
	jr nz, .asm_4a990
	call Function4aba8
	jr c, .asm_4a974

.asm_4a990
	call CloseSubmenu
	ld hl, wd002
	ld a, -1
	ld bc, 3
	call ByteFill
	scf
	ret

.asm_4a9a1
	call Function4a9c3
	jr c, .asm_4a9b0
	call Function4a9d7
	jr c, .asm_4a974
	call CloseSubmenu
	and a
	ret

.asm_4a9b0
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, MobilePickThreeMonForBattleText
	call PrintText
	jr .asm_4a974

MobilePickThreeMonForBattleText:
	text_far _MobilePickThreeMonForBattleText
	text_end

Function4a9c3:
	ld hl, wd002
	ld a, $ff
	cp [hl]
	jr z, .asm_4a9d5
	inc hl
	cp [hl]
	jr z, .asm_4a9d5
	inc hl
	cp [hl]
	jr z, .asm_4a9d5
	and a
	ret

.asm_4a9d5
	scf
	ret

Function4a9d7:
	ld a, [wd002]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld h, d
	ld l, e
	ld de, wMobileParticipant1Nickname
	ld bc, NAME_LENGTH_JAPANESE
	call CopyBytes
	ld a, [wd003]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld h, d
	ld l, e
	ld de, wMobileParticipant2Nickname
	ld bc, NAME_LENGTH_JAPANESE
	call CopyBytes
	ld a, [wd004]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld h, d
	ld l, e
	ld de, wMobileParticipant3Nickname
	ld bc, NAME_LENGTH_JAPANESE
	call CopyBytes
	ld hl, MobileUseTheseThreeMonText
	call PrintText
	jp YesNoBox

MobileUseTheseThreeMonText:
	text_far _MobileUseTheseThreeMonText
	text_end

Function4aa22:
	call ClearBGPalettes
	; fallthrough

Function4aa25:
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	call Function4aad3
	; fallthrough

Function4aa34:
	ld a, PARTYMENUACTION_MOBILE
	ld [wPartyMenuActionText], a
	farcall WritePartyMenuTilemap
	xor a
	ld [wPartyMenuActionText], a
	farcall PrintPartyMenuText
	call Function4aab6
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	call Function4ab1a
	ret z
	push af
	call Function4aafb
	jr c, .asm_4aa67
	call Function4ab06
	jr c, .asm_4aa67
	pop af
	ret

.asm_4aa67
	ld hl, wd019
	set 1, [hl]
	pop af
	ret

Function4aa7a:
	ld hl, wd002
	ld d, $3
.loop
	ld e, PARTY_LENGTH
	ld a, [hli]
	push de
	push hl
	cp -1
	jr z, .done
	ld hl, wSpriteAnimationStructs
	inc a
	ld d, a
.inner_loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .same_as_d
	jr .next

	ld a, $3
	jr .proceed

.same_as_d
	ld a, $2

.proceed
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .inner_loop
	pop hl
	pop de
	dec d
	jr nz, .loop
	ret

.done
	pop hl
	pop de
	ret

Function4aab6:
	ld hl, wd002
	ld d, $3
.loop
	ld a, [hli]
	cp -1
	ret z
	push de
	push hl
	hlcoord 0, 1
	ld bc, $28
	call AddNTimes
	ld [hl], $ec
	pop hl
	pop de
	dec d
	jr nz, .loop
	ret

Function4aad3:
	ld hl, wPartyCount
	ld a, [hli]
	and a
	ret z ; Nothing in your party

	ld c, a
	xor a
	ldh [hObjectStructIndex], a
.loop
	push bc
	push hl
	ld e, MONICON_PARTYMENU
	farcall LoadMenuMonIcon
	ldh a, [hObjectStructIndex]
	inc a
	ldh [hObjectStructIndex], a
	pop hl
	pop bc
	dec c
	jr nz, .loop

	call Function4aa7a
	farcall PlaySpriteAnimations
	ret

Function4aafb:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	and a
	ret

.egg
	scf
	ret

Function4ab06:
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	ret nz
	scf
	ret

Function4ab1a:
.asm_4ab1a
	ld a, $fb
	ld [wMenuJoypadFilter], a
	ld a, $26
	ld [w2DMenuCursorOffsets], a
	ld a, $2
	ld [w2DMenuNumCols], a
	call Function4adf7
	call StaticMenuJoypad
	call Function4abc3
	jr c, .asm_4ab1a
	push af
	call Function4ab99
	call nc, PlaceHollowCursor
	pop af
	bit 1, a
	jr nz, .asm_4ab6d
	ld a, [wPartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY]
	ld [wPartyMenuCursor], a
	cp b
	jr z, .asm_4ab7e
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
	call .read_text_sfx
	ld a, $1
	and a
	ret

.asm_4ab6d
	ld a, [wMenuCursorY]
	ld [wPartyMenuCursor], a
.asm_4ab73
	call .read_text_sfx
	scf
	ret

.asm_4ab7e
	ld a, $1
	ld [wd018], a
	ld a, [wMenuCursorX]
	cp $2
	jr z, .asm_4ab73
	call .read_text_sfx
	xor a
	ld [wd018], a
	and a
	ret

.read_text_sfx
	ld de, SFX_READ_TEXT
	call PlaySFX
	jp WaitSFX

Function4ab99:
	bit 1, a
	jr z, .asm_4aba6
	ld a, [wd002]
	cp $ff
	jr z, .asm_4aba6
	scf
	ret

.asm_4aba6
	and a
	ret

Function4aba8:
	ld hl, wd004
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	and a
	ret

.asm_4abbe
	ld a, $ff
	ld [hl], a
	scf
	ret

Function4abc3:
	bit 3, a
	jr z, .asm_4abd5
	ld a, [wPartyCount]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	jr .asm_4ac29

.asm_4abd5
	bit 6, a
	jr z, .asm_4abeb
	ld a, [wMenuCursorY]
	ld [wMenuCursorY], a
	and a
	jr nz, .asm_4ac29
	ld a, [wPartyCount]
	inc a
	ld [wMenuCursorY], a
	jr .asm_4ac29

.asm_4abeb
	bit 7, a
	jr z, .asm_4ac08
	ld a, [wMenuCursorY]
	ld [wMenuCursorY], a
	ld a, [wPartyCount]
	inc a
	inc a
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .asm_4ac29
	ld a, $1
	ld [wMenuCursorY], a
	jr .asm_4ac29

.asm_4ac08
	bit 4, a
	jr nz, .asm_4ac10
	bit 5, a
	jr z, .asm_4ac56

.asm_4ac10
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wPartyCount]
	inc a
	cp b
	jr nz, .asm_4ac29
	ld a, [wMenuCursorX]
	cp $1
	jr z, .asm_4ac26
	ld a, $1
	jr .asm_4ac29

.asm_4ac26
	ld [wMenuCursorX], a

.asm_4ac29
	hlcoord 0, 1
	lb bc, 13, 1
	call ClearBox
	call Function4aab6
	ld a, [wPartyCount]
	hlcoord 6, 1
.asm_4ac3b
	ld bc, $28
	add hl, bc
	dec a
	jr nz, .asm_4ac3b
	ld [hl], $7f
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [wPartyCount]
	inc a
	cp b
	jr z, .asm_4ac54
	ld a, $1
	ld [wMenuCursorX], a

.asm_4ac54
	scf
	ret

.asm_4ac56
	and a
	ret

Function4ac58:
	lb bc, 2, 18
	hlcoord 1, 15
	call ClearBox
	farcall FreezeMonIcons
	ld hl, MenuHeader_0x4aca2
	call LoadMenuHeader
	ld hl, wd019
	bit 1, [hl]
	jr z, .asm_4ac89
	hlcoord 11, 13
	ld b, $3
	ld c, $7
	call Textbox
	hlcoord 13, 14
	ld de, String_4ada7
	call PlaceString
	jr .asm_4ac96

.asm_4ac89
	hlcoord 11, 9
	ld b, $7
	ld c, $7
	call Textbox
	call Function4ad68

.asm_4ac96
	ld a, $1
	ldh [hBGMapMode], a
	call Function4acaa
	call ExitMenu
	and a
	ret

MenuHeader_0x4aca2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 9, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw NULL
	db 1 ; default option

Function4acaa:
.asm_4acaa
	ld a, $a0
	ld [wMenuDataFlags], a
	ld a, [wd019]
	bit 1, a
	jr z, .asm_4acc2
	ld a, $2
	ld [wMenuDataItems], a
	ld a, $c
	ld [wMenuBorderTopCoord], a
	jr .asm_4accc

.asm_4acc2
	ld a, $4
	ld [wMenuDataItems], a
	ld a, $8
	ld [wMenuBorderTopCoord], a

.asm_4accc
	ld a, $b
	ld [wMenuBorderLeftCoord], a
	ld a, $1
	ld [wMenuCursorPosition], a
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT
	call PlaySFX
	ldh a, [hJoyPressed]
	bit 0, a
	jr nz, .asm_4acf4
	bit 1, a
	ret nz
	jr .asm_4acaa

.asm_4acf4
	ld a, [wd019]
	bit 1, a
	jr nz, .asm_4ad0e
	ld a, [wMenuCursorY]
	cp $1
	jr z, Function4ad17
	cp $2
	jp z, Function4ad56
	cp $3
	jp z, Function4ad60
	ret

.asm_4ad0e
	ld a, [wMenuCursorY]
	cp $1
	jr z, Function4ad56
	ret

Function4ad17:
	call Function4adb2
	jr z, .asm_4ad4a
	ld hl, wd002
	ld a, $ff
	cp [hl]
	jr z, .asm_4ad39
	inc hl
	cp [hl]
	jr z, .asm_4ad39
	inc hl
	cp [hl]
	jr z, .asm_4ad39
	ld de, SFX_WRONG
	call WaitPlaySFX
	ld hl, MobileOnlyThreeMonMayEnterText
	jp PrintText

.asm_4ad39
	ld a, [wCurPartyMon]
	ld [hl], a
	call Function4a9c3
	ret c
	ld a, [wd019]
	set 0, a
	ld [wd019], a
	ret

.asm_4ad4a
	ld a, $ff
	ld [hl], a
	jp Function4adc2

MobileOnlyThreeMonMayEnterText:
	text_far _MobileOnlyThreeMonMayEnterText
	text_end

Function4ad56:
	farcall OpenPartyStats
	jp WaitBGMap2

Function4ad60:
	farcall ManagePokemonMoves
	ret

Function4ad68:
	hlcoord 13, 12
	ld de, String_4ad88
	call PlaceString
	call Function4adb2
	jr c, .asm_4ad7e
	hlcoord 13, 10
	ld de, String_4ada0
	jr .asm_4ad84

.asm_4ad7e
	hlcoord 13, 10
	ld de, String_4ad9a

.asm_4ad84
	jp PlaceString

String_4ad88:
	db   "つよさをみる"
	next "つかえるわざ"
	next "もどる@"

String_4ad9a:
	db   "さんかする@"

String_4ada0:
	db   "さんかしない@"

String_4ada7:
	db   "つよさをみる"
	next "もどる@" ; BACK

Function4adb2:
	ld hl, wd002
	ld a, [wCurPartyMon]
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	scf
	ret

Function4adc2:
	ld a, [wd002]
	cp $ff
	jr nz, .skip
	ld a, [wd003]
	cp $ff
	jr nz, .skip2
	ld a, [wd004]
	ld [wd002], a
	ld a, $ff
	ld [wd004], a
	jr .skip

.skip2
	ld [wd002], a
	ld a, $ff
	ld [wd003], a

.skip
	ld a, [wd003]
	cp $ff
	ret nz
	ld b, a
	ld a, [wd004]
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret

Function4adf7:
	ld a, [wd019]
	bit 0, a
	ret z
	ld a, [wPartyCount]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	ld a, [wd019]
	res 0, a
	ld [wd019], a
	ret
