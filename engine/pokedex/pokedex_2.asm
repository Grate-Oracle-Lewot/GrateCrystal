	const_def
	const DEXENTRY_LORE              ;  0
	const DEXENTRY_BASESTATS         ;  1
	const DEXENTRY_LVLUP             ;  2
	const DEXENTRY_TMS               ;  3
	const DEXENTRY_HMS               ;  4
	const DEXENTRY_MTS               ;  5
	const DEXENTRY_EGG               ;  6
	const DEXENTRY_EVO               ;  7
	const DEXENTRY_PICS              ;  8
	const DEXENTRY_AREA_NONE	 ;  9
	const DEXENTRY_AREA_GRASS_JOHTO  ; 10
	const DEXENTRY_AREA_SURF_JOHTO   ; 11
	const DEXENTRY_AREA_GRASS_KANTO  ; 12
	const DEXENTRY_AREA_SURF_KANTO   ; 13
;	const DEXENTRY_AREA_RODS
	const DEXENTRY_AREA_TREES_COMMON ; 14
	const DEXENTRY_AREA_TREES_RARE   ; 15
	const DEXENTRY_AREA_ROCKSMASH    ; 16
	const DEXENTRY_AREA_CONTEST      ; 17
	const DEXENTRY_AREA_ROAMING      ; 18
	
EXPORT DEXENTRY_LORE
EXPORT DEXENTRY_BASESTATS
EXPORT DEXENTRY_LVLUP
EXPORT DEXENTRY_TMS
EXPORT DEXENTRY_HMS
EXPORT DEXENTRY_MTS
EXPORT DEXENTRY_EGG
EXPORT DEXENTRY_EVO
EXPORT DEXENTRY_PICS

EXPORT DEXENTRY_AREA_GRASS_JOHTO
EXPORT DEXENTRY_AREA_SURF_JOHTO

EXPORT DEXENTRY_AREA_GRASS_KANTO
EXPORT DEXENTRY_AREA_SURF_KANTO

; EXPORT DEXENTRY_AREA_RODS
EXPORT DEXENTRY_AREA_TREES_COMMON
EXPORT DEXENTRY_AREA_TREES_RARE
EXPORT DEXENTRY_AREA_ROCKSMASH

EXPORT DEXENTRY_AREA_CONTEST

EXPORT DEXENTRY_AREA_ROAMING

EXPORT DEXENTRY_AREA_NONE

MOVESPAGES_CONT_MASK EQU %00000011

AnimateDexSearchSlowpoke:
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	jp DelayFrames

.FrameIDs:
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame:
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SlowpokeSpriteData
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a ; y
	inc de
	ld a, [hli]
	ld [de], a ; x
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	jr .loop

.SlowpokeSpriteData:
	dbsprite  9, 11, 0, 0, $00, 0
	dbsprite 10, 11, 0, 0, $01, 0
	dbsprite 11, 11, 0, 0, $02, 0
	dbsprite  9, 12, 0, 0, $10, 0
	dbsprite 10, 12, 0, 0, $11, 0
	dbsprite 11, 12, 0, 0, $12, 0
	dbsprite  9, 13, 0, 0, $20, 0
	dbsprite 10, 13, 0, 0, $21, 0
	dbsprite 11, 13, 0, 0, $22, 0
	db -1

HandlePageNumReset:
	ld b, a
	ld a, [wPokedexEntryType]
	cp b
	ret z
	ld a, b
	ld [wPokedexEntryType], a
	xor a
	ld [wPokedexEntryPageNum], a
	ret

DisplayDexEntry:
	ld a, [wPokedexEntryType]
	and a
	jr nz, .next
	ld a, DEXENTRY_LORE
	call HandlePageNumReset
	hlcoord 8, 1
	ld a, [wPokedexShinyToggle]
	bit 0, a
	jr z, .not_shiny
	ld [hl], "<DEX_⁂>"
	jr .next

.not_shiny
	ld [hl], " "	
.next
	ld a, DEXENTRY_LORE
	call HandlePageNumReset
; erase bottom half of page
	hlcoord 1, 8
	lb bc, 8, SCREEN_WIDTH - 1
	call ClearBox
; take away page num and A press since we're assuming we haven't seen the mon
; will re-print if we have, later
	hlcoord 17, 5
	ld bc, 3 ; box 2 tiles high, 9 wide
	ld a, $4e ; category box horizontal line
	call ByteFill
; skinny horizontal line halfway down page
	hlcoord 1, 8
	ld bc, SCREEN_WIDTH - 1
	ld a, $55
	call ByteFill

	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 6
	call PlaceFarString ; dex species nickname
	push bc ; bank?
	push de ; dex entry ptr
	hlcoord 9, 7
	ld de, String_pokemon
	call PlaceString
	pop de ; dex entry ptr
	pop bc ; bank?
	ld h, b
	ld l, c
	push de ; dex entry ptr
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	pop hl ; dex entry ptr
	pop bc ; bank?
	jp z, UncaughtMon_Info_Erase_PageNum ; ret z ; leave if we havent caught
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	inc hl
	ld a, b
	push af
	inc hl
	inc hl
	inc hl
	push hl
	ld a, [wPokedexEntryPageNum]
	and a ; check for page 2
	jr nz, .page2
; Page 1
	call Pokedex_PrintPageNum
	pop de
	inc de
	pop af
	hlcoord 2, 10
	push af
	call PlaceFarString
	pop bc
	call DexEntry_IncPageNum
	ret
; Page 2
.page2
	pop de
	inc de
	pop af
	hlcoord 2, 10
	push af
	call PlaceFarString
	pop bc
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 1
	hlcoord 1, 10
	call ClearBox
	hlcoord 1, 8
	ld bc, 19
	ld a, $55
	call ByteFill
	call Pokedex_PrintPageNum
	pop de
	inc de
	pop af
	hlcoord 2, 10
	call PlaceFarString
	xor a
	ld [wPokedexEntryPageNum], a
	ret

String_pokemon:
	db " #MON @"

GetDexEntryPointer:
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	; b = bank
	ld a, [hli]
	ld b, a
	; de = address
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret

GetDexEntryPagePointer:
	call GetDexEntryPointer
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	and c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

DisplayDexMonType_CustomGFX:
	call GetBaseData
	ld a, [wBaseType1]
	cp CURSE_TYPE
	jr z, .type1_handle_curse
; Skip Bird
	cp BIRD
	jr c, .type1_adjust_done
	cp UNUSED_TYPES
	dec a
	jr c, .type1_adjust_done
	sub UNUSED_TYPES
	jr .type1_adjust_done
.type1_handle_curse
	ld a, 18
.type1_adjust_done
; load the tiles
	ld hl, TypeLightIconGFX
	ld bc, 4 * LEN_2BPP_TILE
	call AddNTimes
	ld d, h
	ld e, l

	ld a, $1
	ldh [rVBK], a
	ld hl, vTiles2 tile $77
	lb bc, BANK(TypeLightIconGFX), 4
	call Request2bpp

	hlcoord 9, 4
	ld [hl], $77
	inc hl
	ld [hl], $78
	inc hl
	ld [hl], $79
	inc hl
	ld [hl], $7a

	ld a, $0
	ldh [rVBK], a
; 2nd Type
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	jr z, .check_floatmon
	cp CURSE_TYPE
	jr z, .type2_handle_curse
; Skip Bird
	cp BIRD
	jr c, .type2_adjust_done
	cp UNUSED_TYPES
	dec a
	jr c, .type2_adjust_done
	sub UNUSED_TYPES
	jr .type2_adjust_done
.type2_handle_curse
	ld a, 18
.type2_adjust_done
; load type 2 tiles
	ld hl, TypeDarkIconGFX
	ld bc, 4 * LEN_2BPP_TILE
	call AddNTimes
	ld d, h
	ld e, l

	ld a, $1
	ldh [rVBK], a

	ld hl, vTiles2 tile $7b
	lb bc, BANK(TypeDarkIconGFX), 4
	call Request2bpp
	hlcoord 13, 4
	ld [hl], $7b
	inc hl
	ld [hl], $7c
	inc hl
	ld [hl], $7d
	inc hl
	ld [hl], $7e
	ld a, $0
	ldh [rVBK], a

.check_floatmon
;	ld a, [wCurSpecies]
;	ld hl, FloatMons
;	call IsInByteArray
;	ret nc
;	hlcoord 17, 6
;	ld [hl], "<DEX_FLT>"
	ret

INCLUDE "data/pokemon/dex_entry_pointers.asm"
INCLUDE "engine/pokedex/pokedex_evolution_page.asm"
INCLUDE "engine/pokedex/pokedex_stats_page.asm"
INCLUDE "engine/pokedex/pokedex_pics_page.asm"
TypeLightIconGFX::
INCBIN "gfx/pokedex/types_light.2bpp"

TypeDarkIconGFX::
INCBIN "gfx/pokedex/types_dark.2bpp"

Pokedex_Clearbox:
	; clear Area BC @ HL
	; xor a
	; ldh [hBGMapMode], a
	lb bc, 7, SCREEN_WIDTH - 1
	hlcoord 1, 9
	call ClearBox
	; call WaitBGMap
	ret

DexEntry_adjusthlcoord:
	; given: current printed lines in c
	push af
	push de
	ld a, 20
	; the num of moves already printed should still be in bc
	call SimpleMultiply ; uses c as the other number
	; result in a
	ld d, 0
	ld e, a
	add hl, de ; allows us to print on the proper row lol
	pop de
	pop af
	ret

DexEntry_IncPageNum:
	ld a, [wPokedexEntryPageNum]
	inc a
	ld [wPokedexEntryPageNum], a
	ret

Pokedex_PrintPageNum:
	push hl
	ld a, [wPokedexEntryPageNum]
	; a = page num, starting with 0 as page 1
	hlcoord 18, 7
	ld [hl], $61 ; p. vram1
	inc hl

	cp 10 ; if we are past nine pages
	jr c, .checkdone
	ld a, 9
.checkdone
	add $62 ; this is how we get the page num tile
	ld [hl], a ; #
	pop hl
	ld a, [wPokedexEntryPageNum]
	ret

DexEntry_NextCategory:
	ld [wPokedexEntryType], a
	xor a
	ld [wPokedexEntryPageNum], a
	ld [wPokedexStatus], a
	ret

DexEntry_NONE_text:
	db "NONE@"

DisplayDexMonStats::
	ld a, [wTempSpecies]
	ld [wCurSpecies], a

	ld a, DEXENTRY_BASESTATS
	call HandlePageNumReset

	call Pokedex_Clearbox
	ld de, .Base_stats_text
	hlcoord 2, 9
	call PlaceString
	call Pokedex_PrintPageNum ; page num is also returned in a
	and a
	jr z, .print_page1
	cp 1
	jr z, .print_page2
	cp 2
	jr z, .print_page3
	jr .print_page4
.print_page1
	call Pokedex_HeightWeight ; 2 lines
	xor a
	ld [wPokedexEntryPageNum], a
	jp DexEntry_IncPageNum
.print_page2
	call Pokedex_GBS_Stats ; 4 lines
	call Pokedex_CatchRate ; 1 line
	jp DexEntry_IncPageNum
.print_page3
	call Pokedex_Get_Items ; 3 lines
	call Pokedex_PrintBaseExp ; 1 line
	call Pokedex_Get_Growth ; 1 lines
	jp DexEntry_IncPageNum
.print_page4
	; these ones NEED to be in this order
	call Pokedex_EggG_SetUp ; 3 lines
	call Pokedex_PrintHatchSteps ; 1 line
	jp Pokedex_Get_GenderRatio ; 1 line

.Base_stats_text:
	db "BASE STATS@"

DisplayDexMonMoves::
	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call Pokedex_Clearbox

	; the byte flag that tells us which type of table we're currently on
	; 0 = Lore, 1 = Stats, 2 = Level Moves, 3 =  TMs, 4 = HMs, 5 = Move Tutors, 6 = Egg Moves
	
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
.LvlUpLearnset_new
	ld a, DEXENTRY_LVLUP
	call DexEntry_NextCategory
.LvlUpLearnset
	ld a, DEXENTRY_LVLUP
	ld [wPokedexEntryType], a
	call Pokedex_Calc_LvlMovesPtr
	jp Pokedex_Print_NextLvlMoves
.TMs
	ld a, DEXENTRY_TMS
	ld [wPokedexEntryType], a
	jp Pokedex_PrintTMs
.HMs
 	ld a, DEXENTRY_HMS
 	ld [wPokedexEntryType], a
 	jp Pokedex_PrintHMs
.MTs
	ld a, DEXENTRY_MTS
	ld [wPokedexEntryType], a
	jp Pokedex_PrintMTs
.EggMoves
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
	ld c, 5
	call SimpleMultiply 
	; double this num and add to first byte after Evo's 0
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	ret

Pokedex_Print_NextLvlMoves:
; Print No more than 5 moves
	ld b, 0
	ld c, 0 ; our move counter, max of 5
	push bc ; our move counter
	push hl ; our offset for the start of Moves
	ld de, .lvl_moves_text
	hlcoord 2, 9
	call PlaceString ; TEXT for 'LVL - Move'
	pop hl
	pop bc
.learnset_loop
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	jr z, .FoundEnd
	push hl
	ld [wTextDecimalByte], a
	hlcoord 2, 11
	call DexEntry_adjusthlcoord
	ld [hl], $5d
	hlcoord 3, 11
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
	hlcoord 7, 11
	call DexEntry_adjusthlcoord
	push bc
	call PlaceString
	pop bc
	pop hl
	inc hl
	inc bc
	ld a, 5
	cp c
	jr nz, .learnset_loop

.MaxedPage ; Printed 5 moves. Moves are still left. Inc the Page counter
	; check to see if really any moves left, we don't want a blank page
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	and a
	jr z, .FoundEnd
	jp DexEntry_IncPageNum
.FoundEnd
	ld a, DEXENTRY_TMS
	jp DexEntry_NextCategory

.lvl_moves_text:
	db "LVL-UP MOVES@"

Pokedex_CheckLvlUpMoves: ; used by pokedex field moves
; move looking for in 'd'
	ld a, [wCurPartySpecies]
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	ld b, a
	call GetFarWord
	ld a, b
	call GetFarByte
	inc hl
	and a
	jr z, .find_move ; does not evolve
	dec hl
; Skip Evo Bytes
; Receives a pointer to the evos and attacks for a mon in b:hl, and skips to the attacks.
.skip_evo_bytes	
	ld a, b
	call GetFarByte
	inc hl
	and a
	jr z, .find_move ; found end
	cp EVOLVE_STAT
	jr nz, .no_extra_skip
	inc hl
.no_extra_skip
	inc hl
	inc hl
	jr .skip_evo_bytes
.find_move
	ld a, BANK(EvosAttacksPointers)
	call GetFarByte
	inc hl
	and a
	jr z, .notfound ; end of mon's lvl up learnset
	ld c, a ; the lvl we learn move
	ld a, BANK(EvosAttacksPointers)
	call GetFarByte
	inc hl
	cp d ; 'd' is not clobbered in any of the used funcs or farcalls
	ret z ; lvl learned move in c, move is in lvl up learnset
	jr .find_move

.notfound
	xor a
	ld c, a
	ret

Pokedex_PrintTMs:
	hlcoord 2, 9
	ld de, .dex_TM_text
	call PlaceString
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld a, [wPokedexStatus] ; machine moves index
	ld b, a
	ld c, 0 ; current line
.tm_loop
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
	jr z, .notcompatible
	call GetMoveName
	push bc ; our count is in c
	hlcoord 7, 11
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	ld a, TM01
	ld a, [wPokedexStatus]
	ld b, a
	ld a, TM01
	add b
	ld [wNamedObjectIndex], a
	call GetItemName
	push bc
	hlcoord 2, 11
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	inc c ; since we printed a line
	ld a, $5
	cp c
	jr nz, .notcompatible ; not yet printed all 5 slots
	; We've printed all 5 slots
	; check if we need to move to next category or if there are moves left
	call Pokedex_anymoreTMs
	jr z, .done ; there are no moves left
	; moves left
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
	ret nz ; we've had at least one HM Move
	hlcoord 4, 11
	ld de, DexEntry_NONE_text
	jp PlaceString

.dex_TM_text:
	db "TECHNICAL MACHINES@"

Pokedex_anymoreTMs:
	; b has the current HM index
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
	hlcoord 2, 9
	ld de, .dex_HM_text
	call PlaceString
	call Pokedex_PrintPageNum ; page num is also returned in a
	ld c, $5
	ld a, [wPokedexStatus]
	ld b, a
	ld c, 0 ; current line
.hm_loop
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
	jr z, .notcompatible
 	call GetMoveName
	push bc ; our count is in c
	hlcoord 7, 11
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	ld a, HM01
	add b
	ld [wNamedObjectIndex], a
	call GetItemName
	push bc
	hlcoord 2, 11
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	inc c ; since we printed a line
	ld a, $5
	cp c
	jr nz, .notcompatible
	call Pokedex_anymoreHMs
	jr z, .done
	jp DexEntry_IncPageNum
.notcompatible
	ld a, NUM_HMS - 1
	cp b
	jr z, .done
	inc b
	jr .hm_loop
.done
	ld a, DEXENTRY_MTS
	call DexEntry_NextCategory
	ld a, c
	and a
	ret nz ; we've had at least one HM Move
	hlcoord 4, 11
	ld de, DexEntry_NONE_text
	jp PlaceString

.dex_HM_text:
	db "HIDDEN MACHINES@"

Pokedex_anymoreHMs:
	ld a, NUM_HMS - 1
	cp b
	jr z, .none
	; b has the current HM index
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
	ld a, 1
	and a
	ret
.none
	xor a
	ld [wPokedexStatus], a
	ret

Pokedex_PrintMTs:
	hlcoord 2, 9
	ld de, .dex_MT_text
	call PlaceString
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
	hlcoord 3, 11
	call DexEntry_adjusthlcoord
	call PlaceString
	pop bc
	inc c ; since we printed a line
	ld a, $5
	cp c
	jr nz, .notcompatible
	; We've printed all 5 slots
	; check if we need to move to next category or if there are moves left
	call Pokedex_anymoreMTs
	jr z, .done ; there are no moves left
	; moves left
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
	ret nz ; we've had at least one HM Move
	hlcoord 4, 11
	ld de, DexEntry_NONE_text
	jp PlaceString

.dex_MT_text:
	db "MOVE TUTORS@"

Pokedex_anymoreMTs:
	ld a, NUM_TUTORS - 1
	cp b
	jr z, .none
	; b has the current HM index
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
	ld c, 5 ; we can print 5 Egg moves per page
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
	; pop af ; preserve current species or else move sets will be messed up for stage2+ mons
	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a
	ld [wTempSpecies], a
	ld [wTempMonSpecies], a

	ld a, BANK(EggMovePointers)
	call GetFarWord
.check_if_any
	ld a, BANK("Egg Moves")
	call GetFarByte
	pop bc
	add hl, bc
	push af ; -1 if no egg moves
	push hl
	hlcoord 2, 9
	ld de, .EggMoves_text
	call PlaceString
	pop hl
	pop af
	cp -1
	ret nz
	; if we reach here, the mon has no egg moves at all
	; will not call Pokedex_Print_Egg_moves
	; increment to next category
	ld a, DEXENTRY_LVLUP
	call DexEntry_NextCategory
	; print NONE
	hlcoord 3, 11
	ld de, DexEntry_NONE_text
	jp PlaceString

.EggMoves_text:
	db "EGG MOVES@"

Pokedex_Print_Egg_moves:
; Print No more than 5 moves
	ld b, 0
	ld c, 0 ; our move counter, max of 4 for 5 moves
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
	hlcoord 3, 11
	call DexEntry_adjusthlcoord
	push bc
	call PlaceString ; places Move Name
	pop bc
	pop hl
	ld a, $4 ; means we just printed 5th move
	cp c
	jr z, .MaxedPage
	inc c
	jr .Egg_loop
.MaxedPage ; Printed 5 moves. Moves are still left. Inc the Page counter
; CheckNextByte, we don't want blank screen if we just printed last move in slot 5
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

Pokedex_DetailedArea:
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ld [wPokedexEvoStage2], a ; highest lvl
	ld [wPokedexEvoStage3], a ; lowest lvl
	ld [wStatsScreenFlags], a ; misc counters
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_NONE
	ret z
.checkpoint
	call Pokedex_Clearbox
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_NONE
	jr c, .first
	call Pokedex_PrintPageNum
	ld a, [wPokedexEntryType]

	ld hl, JohtoGrassWildMons
	cp DEXENTRY_AREA_GRASS_JOHTO
	jr z, .grass
	ld hl, JohtoWaterWildMons
	cp DEXENTRY_AREA_SURF_JOHTO
	jr z, .surf

	ld hl, KantoGrassWildMons
	cp DEXENTRY_AREA_GRASS_KANTO
	jr z, .grass
	ld hl, KantoWaterWildMons
	cp DEXENTRY_AREA_SURF_KANTO
	jr z, .surf

;	cp DEXENTRY_AREA_RODS
;	jr z, .rods

	cp DEXENTRY_AREA_TREES_COMMON
	jr z, .trees
	cp DEXENTRY_AREA_TREES_RARE
	jr z, .trees	
	cp DEXENTRY_AREA_ROCKSMASH
	jr z, .rocksmash

	cp DEXENTRY_AREA_CONTEST
	jr z, .contest

	cp DEXENTRY_AREA_ROAMING
	jr z, .roaming

	; loop back around as if we are arriving for the first time, creating a closed-loop rotation
.first
	xor a
	ld [wPokedexEntryPageNum], a
	call Dex_FindFirstList
	cp DEXENTRY_AREA_NONE
	jr nz, .found
.none
	ld [wPokedexEntryType], a
	ld de, .none_wild_text
	hlcoord 2, 9
	call PlaceString
	xor a
	ld [wPokedexStatus], a ; wildmon entry index
	ld [wPokedexEntryPageNum], a ; page num
	jp Pokedex_PrintPageNum
.found
	ld [wPokedexEntryType], a
	xor a
	ld [wPokedexStatus], a ; wildmon entry index
	ld [wPokedexEntryPageNum], a ; page num
	jp Pokedex_DetailedArea

.grass
	; hl contains the table we are looking at, JohtoGrassWildMons or KantoGrassWildMons	
	call Pokedex_DetailedArea_grass
	jr .skip_empty_area_check
.surf
	call Pokedex_DetailedArea_surf
	jr .skip_empty_area_check
; .rods
;	call Pokedex_DetailedArea_rods
;	jr .skip_empty_area_check
.trees
	call Pokedex_DetailedArea_Trees
	jr .skip_empty_area_check	
.rocksmash
	call Pokedex_DetailedArea_rocksmash
	jr .skip_empty_area_check
.contest
	call Pokedex_DetailedArea_bugcontest
	jr .skip_empty_area_check
.roaming
	call Pokedex_DetailedArea_roaming
	; fallthrough

.skip_empty_area_check
	cp -1 ; -1 means we skipped, 0 is normal
	jp z, .checkpoint

	xor a
	ret

.none_wild_text:
	db "AREA UNKNOWN@"

Dex_FindFirstList:
; grass, surf, trees(+rocks), contest, roaming
	ld hl, JohtoGrassWildMons
	ld a, BANK(JohtoGrassWildMons)
	call Dex_Check_Grass
	and a
	jr z, .grass_johto

	ld hl, JohtoWaterWildMons
	ld a, BANK(JohtoWaterWildMons)
	call Dex_Check_Surf
	and a
	jr z, .surf_johto

	ld hl, KantoGrassWildMons
	ld a, BANK(KantoGrassWildMons)
	call Dex_Check_Grass
	and a
	jr z, .grass_kanto

	ld hl, KantoWaterWildMons
	ld a, BANK(KantoWaterWildMons)
	call Dex_Check_Surf
	and a
	jr z, .surf_kanto

;	xor a
;	ld [wPokedexStatus], a
;	ld hl, FishGroups ; we want to start at the beginning
;	call Dex_Check_Fishing
;	and a
;	jr z, .rods

	call Dex_Check_Trees_firstcommon
	and a
	jr z, .commontrees

	call Dex_Check_Trees_firstrare
	and a
	jr z, .raretrees

	call Dex_Check_rocksmash
	and a
	jr z, .rocksmash

	call Dex_Check_bugcontest
	and a
	jr z, .contest

	call Dex_Check_roaming
	and a
	jr z, .roaming

; none found
	ld a, DEXENTRY_AREA_NONE
	ret
.grass_johto
	ld a, DEXENTRY_AREA_GRASS_JOHTO
	ret
.grass_kanto
	ld a, DEXENTRY_AREA_GRASS_KANTO
	ret
.surf_johto
	ld a, DEXENTRY_AREA_SURF_JOHTO
	ret
.surf_kanto
	ld a, DEXENTRY_AREA_SURF_KANTO
	ret
; .rods
;	ld a, DEXENTRY_AREA_RODS
;	ret
.commontrees
	ld a, DEXENTRY_AREA_TREES_COMMON
	ret
.raretrees
	ld a, DEXENTRY_AREA_TREES_RARE
	ret
.rocksmash
	ld a, DEXENTRY_AREA_ROCKSMASH
	ret
.contest
	ld a, DEXENTRY_AREA_CONTEST
	ret
.roaming
	ld a, DEXENTRY_AREA_ROAMING
	ret

Print_area_entry:
; morn, day, nite, space, map name
; time of day
	push hl ; pointer to map groupnum/name
	push bc ; b has morn encounter rate, c is current print line?
	push de ; day (e) /nite (d) encounter rates
	hlcoord 3, 11 ; same position regardless
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], $65 ; morn icon tile
	ld de, 6
	add hl, de
	ld [hl], $6b ; day icon tile
	add hl, de
	ld [hl], $6c ; nite icon tile 
	hlcoord 7, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], "<%>"
	ld de, 6
	add hl, de
	ld [hl], "<%>"
	add hl, de
	ld [hl], "<%>"
.time_done
	pop de ; nite encounter %
	push de
; encounter % for nite
	ld a, d
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 16, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum
; encounter rate for day
	pop de
	pop bc
	push bc
	ld a, e
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 10, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum
; encounter rate for morn
	pop bc
	push bc
	ld a, b
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 4, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum
	pop bc

; map name
	ld a, BANK(JohtoGrassWildMons)
	pop hl
	push bc
	call GetFarWord
	pop bc
	ld d, h 
	ld e, l
	farcall GetMapGroupNum_Name
	; map name ptr is in de
	hlcoord 2 , 10
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld a, BANK(MapGroupNum_Names)
	push bc
	call PlaceFarString
	ld c, 4
	call DelayFrames
	pop bc ; line counter
	ret

Pokedex_Skip_Empty_Area_Category:
	xor a
	ld [wPokedexStatus], a ; wildmon entry index
	ld [wPokedexEntryPageNum], a ; page num
	ld a, [wPokedexEntryType] ; johto, kanto
	inc a
	call DexEntry_NextCategory
	ld a, -1 ; will signify 
	ret

Pokedex_DetailedArea_grass:
	push hl ; JohtoGrassWildMons or KantoGrassWildMons. still need this push because the function probably clobbers hl
	; need to preserve Wildmon Index
	ld a, [wPokedexStatus] ; wildmon entry index
	push af ; wildmon index
	ld a, BANK(JohtoGrassWildMons) ; same bank for all 3 thankfully
	call Dex_Check_Grass ; since we automatically roll into the next category, we need to check if there's even anything there for us again
	ld b, a ; placeholder for a
	pop af ; wildmon index
	ld [wPokedexStatus], a ; wildmon entry index
	pop hl ; in case we are about to exit
	ld a, b
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category

	push hl ; JohtoGrassWildMons or KantoGrassWildMons
	hlcoord 7, 9
	ld de, .grass_walk_text
	call PlaceString
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_GRASS_JOHTO
	jr nz, .chk_kanto
	hlcoord 1, 9
	ld de, .johto_text
	call PlaceString
	jr .title_done
.chk_kanto
	cp DEXENTRY_AREA_GRASS_KANTO
	jr nz, .title_done
	hlcoord 1, 9
	ld de, .kanto_text
	call PlaceString

.title_done
	ld a, [wPokedexStatus] ; wildmon index
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
	ld a, GRASS_WILDDATA_LENGTH
	ldh [hMultiplier], a
	call Multiply ; wildmon entry index
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	ld c, a ; result of simple multiply in a
	; ld hl, JohtoGrassWildMons
	pop hl ; JohtoGrassWildMons or KantoGrassWildMons
	add hl, bc ; pointing to map group and num?
	ld bc, 0 ; printed line count
	push bc ; printed line count
	push hl ; points to map group/num
.landmark_loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarWord
	pop hl ; points to map group/num
	pop bc ; line counter
	push bc ; line counter
	push hl ; points to map group/num
	; skip map encounter rates
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl ; should now point to lvl of encounter slot
	inc hl ; now pointing to species
; morn
	ld a, 0 ; morn
	call Pokedex_Parse_grass ; encounter % in a
	ld b, a
	ld a, 1 ; day
	call Pokedex_Parse_grass ; encounter % in a
	ld e, a
	ld a, 2 ; nite
	call Pokedex_Parse_grass ; encounter % in a
	ld d, a
	ld a, b
	and a
	jr nz, .print
	ld a, e
	and a
	jr nz, .print
	ld a, d
	and a
	jr z, .done
.print
	pop hl
	push hl
	call Print_area_entry
	pop hl ; points to map group/num
	pop bc ; line counter in c
	inc c
	inc c
	push bc ; print line counter
	push hl
.done
	pop hl ; points to map group/num
	pop bc ; line counter in c
	ld a, [wPokedexStatus] ; wildmon index
	inc a
	ld [wPokedexStatus], a ; wildmon index
	push bc ; line counter in c
	ld b, 0
	ld c, GRASS_WILDDATA_LENGTH
	add hl, bc
	pop bc ; print counter
	; check to see if there is a next entry
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; hl is preserved, also won't clobber print line counter in c
	cp -1
	jr z, .reached_end

	; no need to handle having printed all 3 slots if we had already reached the end of the table
	ld a, c
	cp $6 ; 3 entries, 6 rows
	jr z, .max_print

	push bc ; print line counter in c
	push hl
	jr .landmark_loop
.reached_end
	xor a
	ld [wPokedexStatus], a ; wildmon entry index
	ld [wPokedexEntryPageNum], a ; page num
	ld a, [wPokedexEntryType] ; johto, kanto
	inc a
	call DexEntry_NextCategory
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret
.max_print
	call Grass_check_any_remaining
	and a
	jr z, .reached_end
	ld a, [wPokedexStatus] ; wildmon index
	inc a 
	ld [wPokedexStatus], a ; wildmon index
	call DexEntry_IncPageNum
	; page number is currently in a
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

.grass_walk_text:
	db "GRASS/CAVES@"
.johto_text:
	db "JOHTO@"
.kanto_text:
	db "KANTO@"

Pokedex_Parse_grass:
	push hl ; first species byte in morn
	push bc ; current print line
	ld c, 16 ; 8 entries * 2 bytes
	call SimpleMultiply
	ld b, 0
	ld c, a ; time of day adjustment
	add hl, bc
	ld c, 0 ; up to NUM_GRASSMON * 3, total mon entries, morn/day/nite, 8 per
	ld b, 0 ; for calcing encounter %
	; 25%, 25%, 10%, 10%, 10%, 10%, 5%, 5%
	push bc ; % and NUM_GRASSMON
.map_loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	; a is species
	inc hl ; pointing to next mon lvl
	inc hl ; pointing to next mon species
	; a is mon species 
	ld d, a
	ld a, [wCurSpecies]
	pop bc ; % and NUM_GRASSMON
	cp d ; mon species 
	jr nz, .not_match
	call Add_encounter_percent_grass
	add b
	ld b, a
.not_match
	inc c
	push bc ; % and NUM_GRASSMON
	ld a, c
	cp NUM_GRASSMON
	jr z, .map_loop_end ; end of day group
	jr .map_loop

.map_loop_end ; reach end of day group
	pop bc ; % and NUM_GRASSMON
	ld a, b ; %
	pop bc ; print line, do not modify
	pop hl ; first species byte in morn
	ret

Grass_check_any_remaining:
	push hl
	push de
	push bc

	ld b, 0
	ld c, GRASS_WILDDATA_LENGTH
	add hl, bc
	ld bc, 0 ; fake print line counter
	push bc
	push hl
.landmark_loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarWord
	pop hl ; points to map group/num
	pop bc ; line counter
	push bc ; line counter
	push hl ; points to map group/num
	; skip map encounter rates
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl ; should now point to lvl of encounter slot
	inc hl ; now pointing to species
; morn
	ld a, 0 ; morn
	call Pokedex_Parse_grass ; encounter % in a
	ld b, a
	ld a, 1 ; day
	call Pokedex_Parse_grass ; encounter % in a
	ld e, a
	ld a, 2 ; nite
	call Pokedex_Parse_grass ; encounter % in a
	ld d, a
	ld a, b
	and a
	jr nz, .entries_remaining
	ld a, e
	and a
	jr nz, .entries_remaining
	ld a, d
	and a
	jr nz, .entries_remaining
.done
	pop hl ; points to map group/num
	pop bc ; line counter in c
	push bc ; line counter in c
	ld b, 0
	ld c, GRASS_WILDDATA_LENGTH
	add hl, bc
	pop bc ; print counter
	; check to see if there is a next entry
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; hl is preserved
	cp -1
	jr z, .reached_end
	push bc
	push hl
	jr .landmark_loop

.reached_end
	pop bc
	pop de
	pop hl
	; 0 means none left
	xor a
	ret
.entries_remaining
	pop hl ; realign stack, don't care about values
	pop bc ; realign stack, don't care about values
	
	pop bc
	pop de
	pop hl
	ld a, 1
	ret

Add_encounter_percent_grass:
	; total in b
	; current count in c
	push bc
	call .body
	ld a, b
	pop bc
	ret
.body:
	ld a, c
	ld b, 25
	and a
	ret z
	ld b, 25
	cp 1
	ret z
	ld b, 10
	cp 2
	ret z
	ld b, 10
	cp 3
	ret z
	ld b, 10
	cp 4
	ret z
	ld b, 10
	cp 5
	ret z
	ld b, 5
	cp 6
	ret z
	ld b, 5
	ret

Pokedex_DetailedArea_surf:
	push hl ; JohtoWaterWildMons or KantoWaterWildMons. still need this push because the function probably clobbers hl
	; need to preserve Wildmon Index
	ld a, [wPokedexStatus] ; wildmon entry index
	push af ; wildmon index
	ld a, BANK(JohtoWaterWildMons) ; same bank for all 3 thankfully
	call Dex_Check_Surf ; since we automatically roll into the next category, we need to check if there's even anything there for us again
	ld b, a ; placeholder for a
	pop af ; wildmon index
	ld [wPokedexStatus], a ; wildmon entry index
	pop hl ; in case we are about to exit
	ld a, b
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category

	push hl ; JohtoWaterWildMons or KantoWaterWildMons
	hlcoord 7, 9
	ld de, .surfing_text
	call PlaceString
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_SURF_JOHTO
	jr nz, .chk_kanto
	hlcoord 1, 9
	ld de, .johto_text
	call PlaceString
	jr .title_done
.chk_kanto
	cp DEXENTRY_AREA_SURF_KANTO
	jr nz, .title_done
	hlcoord 1, 9
	ld de, .kanto_text
	call PlaceString

.title_done
	ld a, [wPokedexStatus] ; wildmon index
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
	ld a, WATER_WILDDATA_LENGTH
	ldh [hMultiplier], a
	call Multiply ; wildmon entry index
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	ld c, a ; result of simple multiply in a
	; ld hl, JohtoWaterWildMons
	pop hl ; JohtoWaterWildMons or KantoWaterWildMons
	add hl, bc ; pointing to map group and num?
	ld bc, 0 ; printed line count
	push bc ; printed line count
	push hl ; points to map group/num
.landmark_loop
	ld a, BANK(JohtoWaterWildMons)
	call GetFarWord
	pop hl ; points to map group/num
	pop bc ; line counter
	push bc ; line counter
	push hl ; points to map group/num
	; skip map encounter rates, surf only has one, grass has 3
	inc hl
	inc hl
	inc hl ; should now point to lvl of encounter slot
	inc hl ; now pointing to species
; morn
	ld a, 0 ; morn
	call Pokedex_Parse_surf ; encounter % in a
	ld b, a ; pretend morning
	ld d, a ; pretend day
	ld e, a ; pretend night
	and a
	jr z, .done
.print
	pop hl
	push hl
	call Print_area_entry
	pop hl ; points to map group/num
	pop bc ; line counter in c
	inc c
	inc c
	push bc ; print line counter
	push hl
.done
	pop hl ; points to map group/num
	pop bc ; line counter in c
	ld a, [wPokedexStatus] ; wildmon index
	inc a
	ld [wPokedexStatus], a ; wildmon index
	push bc ; line counter in c
	ld b, 0
	ld c, WATER_WILDDATA_LENGTH
	add hl, bc
	pop bc ; print counter
	; check to see if there is a next entry
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte ; hl is preserved
	cp -1 ; if we've printed a 3rd entry, this doesn't get checked
	jr z, .reached_end

	; we don't need to handle having printed all 3 slots if we were at the end of the table
	ld a, c
	cp $6 ; 3 entries, 6 rows
	jr z, .max_print
	push bc ; print counter
	push hl
	jr .landmark_loop
.reached_end
	xor a
	ld [wPokedexStatus], a ; wildmon entry index
	ld [wPokedexEntryPageNum], a ; page num
	ld a, [wPokedexEntryType] ; johto, kanto
	inc a
	call DexEntry_NextCategory
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret
.max_print
	call Surf_check_any_remaining
	and a
	jr z, .reached_end
	ld a, [wPokedexStatus] ; wildmon index
	inc a 
	ld [wPokedexStatus], a ; wildmon index
	call DexEntry_IncPageNum
	; page number is currently in a
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

.surfing_text:
	db "SURFING@"
.johto_text:
	db "JOHTO@"
.kanto_text:
	db "KANTO@"

Pokedex_Parse_surf:
	push hl ; first species byte, surfing has no time of day
	push bc ; current print line
	ld c, 0 ; up to NUM_WATERMON ; unlike grass, which is 24, this is only 4. and no time of day shenanigans
	ld b, 0 ; for calcing encounter %
	; 40%, 40%, 10%, 10%
	push bc ; % and NUM_WATERMON
.map_loop
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte
	; a is species
	inc hl ; pointing to next mon lvl
	inc hl ; pointing to next mon species
	; a is mon species 
	ld d, a
	ld a, [wCurSpecies]
	pop bc ; % and NUM_GRASSMON
	cp d ; mon species 
	jr nz, .not_match
	call Add_encounter_percent_water
	add b ; accumulated encounter total for this species is in b, this slot % is in a
	ld b, a ; new accumulated encounter % total in b
.not_match
	inc c 
	push bc ; % and NUM_WATERMON
	ld a, c
	cp NUM_WATERMON
	jr z, .map_loop_end ; end of day group
	jr .map_loop

.map_loop_end ; reach end of day group
	pop bc ; % and NUM_WATERMON
	ld a, b ; %
	pop bc ; print line, do not modify
	pop hl ; first species byte in morn
	ret

Surf_check_any_remaining:
	; once we have printed max number of entries per page
	; need to determine if there's anymore in this category (johto/kanto) before switching to next category
	push hl
	push de
	push bc

	ld b, 0
	ld c, WATER_WILDDATA_LENGTH
	add hl, bc
	ld bc, 0 ; fake print line counter
	push bc
	push hl
.landmark_loop
	ld a, BANK(JohtoWaterWildMons)
	call GetFarWord
	pop hl ; points to map group/num
	pop bc ; line counter
	push bc ; line counter
	push hl ; points to map group/num
	; skip map encounter rates, minus two for surf
	inc hl
	inc hl
	inc hl ; should now point to lvl of encounter slot
	inc hl ; now pointing to species
; morn
	ld a, 0 ; morn
	call Pokedex_Parse_surf ; encounter % in a
	and a
	jr nz, .entries_remaining
.done
	pop hl ; points to map group/num
	pop bc ; line counter in c
	push bc ; line counter in c
	ld b, 0
	ld c, WATER_WILDDATA_LENGTH
	add hl, bc
	pop bc ; print counter
	; check to see if there is a next entry
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte ; hl is preserved
	cp -1
	jr z, .reached_end
	push bc
	push hl
	jr .landmark_loop

.reached_end
	pop bc
	pop de
	pop hl
	; 0 means none left
	xor a
	ret
.entries_remaining
	pop hl ; realign stack, don't care about values
	pop bc ; realign stack, don't care about values
	
	pop bc
	pop de
	pop hl
	ld a, 1
	ret

Add_encounter_percent_water:
	; total in b
	; current count in c
	ld a, c
	and a
	jr nz, .slot2
	ld a, 40
	ret
.slot2
	cp 1
	jr nz, .slot3
	ld a, 40
	ret
.slot3
	cp 2
	jr nz, .slot4
	ld a, 10
	ret
.slot4
	ld a, 10
	; whatever value is currently in a will be added to b
	ret

Dex_Check_Grass:
	; hl is JohtoGrassWildMons or KantoGrassWildMons
	call GetFarByte
	cp -1 ; swarm tables will be empty, just -1
	ret z
.landmark_loop
	push hl ; points to map group/num
	inc hl
	inc hl
	inc hl
	inc hl ; should now point to lvl of encounter slot
	inc hl ; now pointing to species
	inc hl
	ld a, BANK(JohtoGrassWildMons)
	call Pokedex_LookCheck_grass
	and a
	jr z, .found
	pop hl ; points to map group/num
	ld a, [wPokedexStatus]
	inc a
	ld [wPokedexStatus], a
	ld b, 0
	ld c, GRASS_WILDDATA_LENGTH
	add hl, bc
	; check to see if there is a next entry
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; hl is preserved
	cp -1
	ret z
	; push hl ; hl is JohtoGrassWildMons or KantoGrassWildMons
	jr .landmark_loop
.found
	pop hl
	xor a
	ret

Pokedex_LookCheck_grass:
	ld bc, 0 ; up to NUM_GRASSMON * 3, total mon entries, morn/day/nite, 8 per
	; push bc ; up to NUM_GRASSMON * 3
	push af ; bank
.map_loop
	pop af
	push af
	push bc
	call GetFarByte
	; a is species
	inc hl ; pointing to next mon lvl
	inc hl ; pointing to next mon species
	; a is mon species 
	ld d, a
	ld a, [wCurSpecies]
	pop bc
	cp d
	jr z, .found
	; pop bc ; % and NUM_GRASSMON
	inc c
	push bc ; % and NUM_GRASSMON
	ld a, c
	cp NUM_GRASSMON * 3
	jr z, .map_loop_end ; end of wildmon entry, species not found in any time
	pop bc
	jr .map_loop
.map_loop_end
	pop bc
	pop af
	ld a, 1
	ret
.found
	pop af
	xor a
	ret

Dex_Check_Surf:
	; hl is JohtoGrassWildMons or KantoGrassWildMons
	call GetFarByte
	cp -1 ; swarm tables will be empty, just -1
	ret z
.landmark_loop
	push hl ; points to map group/num

	inc hl
	inc hl ; should now point to lvl of encounter slot
	inc hl ; now pointing to species
	inc hl
	ld a, BANK(JohtoWaterWildMons)
	; ld a, BANK(KantoWaterWildMons)
	call Pokedex_LookCheck_surf
	and a
	jr z, .found
	pop hl ; points to map group/num
	ld a, [wPokedexStatus]
	inc a
	ld [wPokedexStatus], a
	ld b, 0
	ld c, WATER_WILDDATA_LENGTH
	add hl, bc
	; check to see if there is a next entry
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte ; hl is preserved
	cp -1
	; jr z, .reached_end
	ret z
	; push hl ; hl is JohtoGrassWildMons or KantoGrassWildMons
	jr .landmark_loop
.found
	pop hl
	xor a
	ret

Pokedex_LookCheck_surf:
	ld bc, 0 ; up to NUM_WATERMON * 3, total mon entries, 1 per day, 4 per
	; push bc ; up to NUM_WATERMON * 3
	push af ; bank
.map_loop
	pop af
	push af
	push bc
	call GetFarByte
	; a is species
	inc hl ; pointing to next mon lvl
	inc hl ; pointing to next mon species
	; a is mon species 
	ld d, a
	ld a, [wCurSpecies]
	pop bc
	cp d
	jr z, .found
	; pop bc ; % and NUM_WATERMON
	inc c
	push bc ; % and NUM_WATERMON
	ld a, c
	cp NUM_WATERMON ; no time of day considerations
	jr z, .map_loop_end ; end of wildmon entry, species not found in any time
	pop bc
	jr .map_loop
.map_loop_end
	pop bc
	pop af
	ld a, 1
	ret
.found
	pop af
	xor a
	ret

Pokedex_DetailedArea_Trees:
	ld a, [wPokedexStatus] ; TreeMonMaps entry index, will be zero if we haven't started yet
	and a
	jr nz, .start
	call Dex_Check_Trees
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category
.start
	xor a
	ld [wPokedexEvoStage2], a ; lines printed
	ld [wPokedexEvoStage3], a ; encounter % total
	; print the title, HEADBUTT TREES - COMMON
	call Print_TreeTitle
	; using wPokedexStatus/TreeMonMaps entry index, calculate ptr
.map_loop	
; RockMonMaps::
; 	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	ld hl, TreeMonMaps
	ld bc, 3 ; bytes per entry in TreeMonMaps, two for map group and ID, and one for tree set
	ld a, [wPokedexStatus] ; TreeMonMaps entry index
	call AddNTimes
	; check for -1
	ld a, BANK(TreeMonMaps)
	call GetFarByte
	cp -1
	jr z, .donedone
	ld a, BANK(TreeMonMaps)
	push hl
	call GetFarWord ; map id and group
	ld d, h ; map num
	ld e, l ; map group
	pop hl
	push de ; map
	inc hl
	inc hl
	ld a, BANK(TreeMonMaps)
	call GetFarByte ; tree set index
	; set up hl based on index
	ld hl, TreeMons
	ld bc, 2 ; table of ptrs
	call AddNTimes  	
	; check the set for species match
	; if match, encounter % in wPokedexEvoStage3
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_TREES_RARE
	jr z, .rare
	call Dex_Check_commontree_rocksmash_set
	jr .setcheckdone
.rare
	call Dex_Check_raretree_set
.setcheckdone	
	pop de ; map
	and a
	jr z, .print_tree
	call inc_trees_rocksmash_map_index
	jr .map_loop
.donedone
	ld a, [wPokedexEntryType] ; rocksmash
	inc a
	jp DexEntry_NextCategory
.print_tree
	call Print_Trees_Rocksmash ; map info in de, encounter % in wPokedexEvoStage3
	call inc_trees_rocksmash_map_index
	ld a, [wPokedexEvoStage2] ; lines printed
	inc a
	inc a ; since each result takes 2 lines
	ld [wPokedexEvoStage2], a ; lines printed
	; check if we are at max printed, 3
	cp 6
	jr z, .thispagedone
	jr .map_loop
.thispagedone
	; check if any remaining entries
	call AnyRemaining_trees
	and a
	jr nz, .donedone
	jp DexEntry_IncPageNum

Dex_Check_Trees_firstcommon:
	ld a, DEXENTRY_AREA_TREES_RARE
	jr Dex_Check_Trees_firstrare.stub
Dex_Check_Trees_firstrare:
	ld a, DEXENTRY_AREA_TREES_RARE
.stub	
	ld [wPokedexEntryType], a
	call Dex_Check_Trees
	ld b, a ; results of check trees
	xor a
	ld [wPokedexEntryType], a
	ld a, b ; results of check trees
	ret

Dex_Check_Trees:
; check for matching mons in RockSmashMons
; return zero in 'a' if found, else 1 in 'a'
	ld hl, TreeMons ; table of pointers, NUM_ROCKSMASH_SETS
	ld b, 0 ; corresponds to NUM_TREEMON_SETS, so we check each entry
.setloop	
	push bc ; tree set index
	push hl ; TreeMons ptr
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_TREES_RARE
	jr z, .rare
.common
	call Dex_Check_commontree_rocksmash_set
	jr .setcheckdone
.rare
	call Dex_Check_raretree_set
.setcheckdone	
	pop hl ; TreeMons ptr
	pop bc ; tree set index
	and a ; if zero, found, exit with zero in 'a'
	ret z

	ld a, NUM_TREEMON_SETS - 1
	cp b ; tree set index
	jr z, .notfound
	inc hl ; TreeMons ptr
	inc hl ; TreeMons ptr, 2 bytes per entry
	inc b ; tree set index
	jr .setloop
.notfound
	ld a, 1
	ret

AnyRemaining_trees:
	; given map index in wPokedexStatus, return 0 if species match, else 1
.map_loop	
; RockMonMaps::
; 	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	ld hl, TreeMonMaps
	ld bc, 3 ; bytes per entry in TreeMonMaps, two for map group and ID, and one for rocksmash set
	ld a, [wPokedexStatus] ; TreeMonMaps entry index
	call AddNTimes
	; check for -1
	ld a, BANK(TreeMonMaps)
	call GetFarByte
	cp -1
	jr z, .notfound
	inc hl
	inc hl
	ld a, BANK(TreeMonMaps)
	call GetFarByte ; tree set index
	; set up hl based on index
	ld hl, TreeMons
	ld bc, 2 ; table of ptrs
	call AddNTimes  	
	; check the set for species match
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_TREES_RARE
	jr z, .rare
	call Dex_Check_commontree_rocksmash_set
	jr .setcheckdone
.rare
	call Dex_Check_raretree_set
.setcheckdone
	and a
	ret z
	call inc_trees_rocksmash_map_index
	jr .map_loop
.notfound
	ld a, 1
	ret

Print_Trees_Rocksmash:
; map info in de, encounter % in wPokedexEvoStage3
	farcall GetMapGroupNum_Name ; map info needs to be in de
	; map name ptr is in de
	hlcoord 2, 10
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld a, BANK(MapGroupNum_Names)
	call PlaceFarString

	hlcoord 3, 11 ; same position regardless
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a	
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], $65 ; morn icon tile
	ld de, 6
	add hl, de
	ld [hl], $6b ; day icon tile
	add hl, de
	ld [hl], $6c ; nite icon tile 
	hlcoord 7, 11
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a		
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], "<%>"
	ld de, 6
	add hl, de
	ld [hl], "<%>"
	add hl, de
	ld [hl], "<%>"

	ld de, wPokedexEvoStage3 ; encounter %
	hlcoord 4, 11
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a	
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum

	hlcoord 10, 11
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a		
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum

	hlcoord 16, 11
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a		
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	jp PrintNum

Print_TreeTitle:
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_TREES_COMMON
	jr z, .common
	hlcoord 1, 9
	ld de, .headbutt_tree_rare_text
	jp PlaceString	
.common
	hlcoord 1, 9
	ld de, .headbutt_tree_common_text
	jp PlaceString

.headbutt_tree_common_text:
	db "COMMON SHAKE-TREES@"
.headbutt_tree_rare_text:
	db "RARE SHAKE-TREES@"

inc_trees_rocksmash_map_index:
	ld a, [wPokedexStatus]
	inc a
	ld [wPokedexStatus], a
	ret

Dex_Check_commontree_rocksmash_set:
	xor a
	ld [wPokedexEvoStage3], a ; encounter % total
	; get the ptr from the double ptr in hl
	ld a, BANK(TreeMons)
	call GetFarWord
; TreeMonSet_Rock::
; 	db 90, KRABBY,     15
.loop
	ld a, BANK(TreeMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	cp -1
	jr z, .done
	ld b, a ; encounter %
	; we aren't at the end, so increment ptr by 1 and check species, that's all we care about
	inc hl
	ld a, BANK(TreeMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	ld c, a ; pokemon species of entry in ContestMons
	ld a, [wCurSpecies] ; current pokedex entry species
	cp c
	call z, .found
	; species didn't match, inc hl by 3, need to check for -1
	inc hl
	inc hl
	jr .loop
.found
	ld a, [wPokedexEvoStage3]
	add b ; this encounter %
	ld [wPokedexEvoStage3], a ; encounter % total
	ret
.done
	ld a, [wPokedexEvoStage3]
	ld b, a
	xor a
	cp b
	ret nz

	ld a, 1
	ret	

Dex_Check_raretree_set:
	xor a
	ld [wPokedexEvoStage3], a ; encounter % total
	; get the ptr from the double ptr in hl
	ld a, BANK(TreeMons)
	call GetFarWord
; 	db 10, AIPOM,      10
.loop1 ; get past the common table
	ld a, BANK(TreeMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	cp -1
	jr z, .loop2setup
	inc hl
	inc hl
	inc hl
	jr .loop1
.loop2setup
	inc hl
.loop2
	ld a, BANK(TreeMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	cp -1
	jr z, .done
	ld b, a ; encounter %
	; we aren't at the end, so increment ptr by 1 and check species, that's all we care about
	inc hl
	ld a, BANK(TreeMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	ld c, a ; pokemon species of entry in ContestMons
	ld a, [wCurSpecies] ; current pokedex entry species
	cp c
	call z, .found
	; species didn't match, inc hl by 3, need to check for -1
	inc hl
	inc hl
	jr .loop2
.found
	ld a, [wPokedexEvoStage3]
	add b ; this encounter %
	ld [wPokedexEvoStage3], a ; encounter % total
	ret
.done
	ld a, [wPokedexEvoStage3]
	ld b, a
	xor a
	cp b
	ret nz

	ld a, 1
	ret

Pokedex_DetailedArea_rocksmash:
	ld a, [wPokedexStatus] ; RockMonMaps entry index, will be zero if we haven't started yet
	and a
	jr nz, .start
	call Dex_Check_rocksmash
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category
.start
	xor a
	ld [wPokedexEvoStage2], a ; lines printed
	ld [wPokedexEvoStage3], a ; encounter % total
	; print the title, ROCK SMASH
	hlcoord 1, 9
	ld de, .rocksmash_text
	call PlaceString
	; using wPokedexStatus/RockMonMaps entry index, calculate ptr
.map_loop	
; RockMonMaps::
; 	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	ld hl, RockMonMaps
	ld bc, 3 ; bytes per entry in RockMonMaps, two for map group and ID, and one for rocksmash set
	ld a, [wPokedexStatus] ; RockMonMaps entry index
	call AddNTimes
	; check for -1
	ld a, BANK(RockMonMaps)
	call GetFarByte
	cp -1
	jr z, .donedone
	ld a, BANK(RockMonMaps)
	push hl
	call GetFarWord ; map id and group
	ld d, h ; map num
	ld e, l ; map group
	pop hl
	push de ; map
	inc hl
	inc hl
	ld a, BANK(RockMonMaps)
	call GetFarByte ; ROCKSMASH_SETS index
	; set up hl based on index
	ld hl, RockSmashMons
	ld bc, 2 ; table of ptrs
	call AddNTimes  	
	; check the set for species match
	; if match, encounter % in wPokedexEvoStage3
	call Dex_Check_commontree_rocksmash_set
	pop de ; map
	and a
	jr z, .print_rocksmash
	call inc_trees_rocksmash_map_index
	jr .map_loop
.donedone
	ld a, [wPokedexEntryType] ; rocksmash
	inc a
	jp DexEntry_NextCategory	
.print_rocksmash
	call Print_Trees_Rocksmash ; map info in de, encounter % in wPokedexEvoStage3
	call inc_trees_rocksmash_map_index
	ld a, [wPokedexEvoStage2] ; lines printed
	inc a
	inc a ; since each result takes 2 lines
	ld [wPokedexEvoStage2], a ; lines printed
	; check if we are at max printed, 3
	cp 6
	jr z, .thispagedone
	jr .map_loop
.thispagedone

	; check if any remaining entries
	call AnyRemaining_RockSmash
	and a
	jr nz, .donedone
	jp DexEntry_IncPageNum

.rocksmash_text:
	db "SMASHABLE ROCKS@"

Dex_Check_rocksmash:
; check for matching mons in RockSmashMons
; return zero in 'a' if found, else 1 in 'a'
	ld hl, RockSmashMons ; table of pointers, NUM_ROCKSMASH_SETS
	ld b, 0 ; corresponds to NUM_ROCKSMASH_SETS, so we check each entry, to support more than one rock smash set
.setloop	
	push bc ; rock smash set index
	push hl ; RockSmashMons ptr
	call Dex_Check_commontree_rocksmash_set
	pop hl ; RockSmashMons ptr
	pop bc ; rock smash set index
	and a ; if zero, found, exit with zero in 'a'
	ret z

	ld a, NUM_ROCKSMASH_SETS - 1
	cp b ; rock smash set index
	jr z, .notfound
	inc hl ; RockSmashMons ptr
	inc hl ; RockSmashMons ptr
	inc b ; rock smash set index
	jr .setloop
.notfound
	ld a, 1
	ret

AnyRemaining_RockSmash:
	; given map index in wPokedexStatus, return 0 if species match, else 1
.map_loop	
; RockMonMaps::
; 	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	ld hl, RockMonMaps
	ld bc, 3 ; bytes per entry in RockMonMaps, two for map group and ID, and one for rocksmash set
	ld a, [wPokedexStatus] ; RockMonMaps entry index
	call AddNTimes
	; check for -1
	ld a, BANK(RockMonMaps)
	call GetFarByte
	cp -1
	jr z, .notfound
	inc hl
	inc hl
	ld a, BANK(RockMonMaps)
	call GetFarByte ; ROCKSMASH_SETS index
	; set up hl based on index
	ld hl, RockSmashMons
	ld bc, 2 ; table of ptrs
	call AddNTimes  	
	; check the set for species match	
	call Dex_Check_commontree_rocksmash_set
	and a
	ret z
	call inc_trees_rocksmash_map_index
	jr .map_loop
.notfound
	ld a, 1
	ret

Dex_Check_bugcontest:
	ld hl, ContestMons
; ContestMons:
; 	   %, species,   min, max
; 	db 20, CATERPIE,    7, 18

; given 'hl', point in ContestMons, check for any further matching mons
; return zero in 'a' if found, else 1 in 'a'
.loop
	ld a, BANK(ContestMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	cp -1
	jr z, .notfound
	; we aren't at the end, so increment ptr by 1 and check species, that's all we care about
	inc hl
	ld a, BANK(ContestMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	ld c, a ; pokemon species of entry in ContestMons
	ld a, [wCurSpecies] ; current pokedex entry species
	cp c
	jr z, .found
	; species didn't match, inc hl by 3, need to check for -1
	inc hl
	inc hl
	inc hl
	jr .loop
.found
	xor a
	ret
.notfound
	ld a, 1
	ret

Pokedex_DetailedArea_bugcontest:
	call Dex_Check_bugcontest
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category
	
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a

	; print the title, BUG CONTEST
	hlcoord 1, 9
	ld de, .bugcontest_text
	call PlaceString
	hlcoord 1, 10
	ld de, .park_text
	call PlaceString

	ld hl, ContestMons
	ld e, 0
.loop
	ld a, BANK(ContestMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	ld d, a ; encounter %
	cp -1
	jr z, .done
	; we aren't at the end, so increment ptr by 1 and check species, that's all we care about
	inc hl
	ld a, BANK(ContestMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	ld c, a ; pokemon species of entry in ContestMons
	ld a, [wCurSpecies] ; current pokedex entry species
	cp c
	jr z, .found
	; species didn't match, inc hl by 3, need to check for -1
.continue
	inc hl
	inc hl
	inc hl
	jr .loop
.found
	; 'e' is the accumulated %, in case of multiple species entries
	ld a, d
	add e
	ld e, a
	jr .continue
.done
	; if 'e' is above zero, print
	xor a
	cp e
	jr z, .donedone
	call BugContest_Print
.donedone
	ld a, [wPokedexEntryType] ; bug
	inc a
	jp DexEntry_NextCategory

.bugcontest_text:
	db "BUG-CATCH CONTEST@"
.park_text:
	db "-NATIONAL PARK@"

BugContest_Print:
	ld b, e ; encounter %
	hlcoord 3, 11 ; same position regardless
	ld [hl], $65 ; morn icon tile
	ld de, 6
	add hl, de
	ld [hl], $6b ; day icon tile
	add hl, de
	ld [hl], $6c ; nite icon tile 
	hlcoord 7, 11
	ld [hl], "<%>"
	ld de, 6
	add hl, de
	ld [hl], "<%>"
	add hl, de
	ld [hl], "<%>"
	ld a, b ; encounter %
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 16, 11
	lb bc, 1, 3
	call PrintNum
	hlcoord 10, 11
	call PrintNum
	hlcoord 4, 11
	jp PrintNum

Dex_Check_roaming:
	ld a, [wCurSpecies]
	ld hl, wRoamMon1Species
	cp [hl]
	jr z, .found
	ld hl, wRoamMon2Species
	cp [hl]
	jr z, .found
	ld a, NUM_ROAMMONS
	cp 3
	jr nz, .no_third_roamer
	ld a, [wCurSpecies]
	ld hl, wRoamMon3Species
	cp [hl]
	jr z, .found
.no_third_roamer	
	; none found
	ld a, 1
	ret
.found
	xor a
	ret

Pokedex_DetailedArea_roaming:
	call Dex_Check_roaming
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category
	
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a

	; print the title, ROAMING
	hlcoord 1, 9
	ld de, .roaming_text
	call PlaceString
	ld bc, 0 ; print line counter for 'DexEntry_adjusthlcoord' in 'c'

	ld a, [wCurSpecies]
	ld hl, wRoamMon1Species
	cp [hl]
	call z, Dex_Print_Roamer_Info
	
	ld a, [wCurSpecies]
	ld hl, wRoamMon2Species
	cp [hl]
	call z, Dex_Print_Roamer_Info
	; call Dex_Print_Roamer_Info
	
	ld a, NUM_ROAMMONS
	cp 3
	jr nz, .donedone

	ld a, [wCurSpecies]
	ld hl, wRoamMon3Species
	cp [hl]
	call z, Dex_Print_Roamer_Info
.donedone
	ld a, [wPokedexEntryType] ; roaming
	inc a
	jp DexEntry_NextCategory

.roaming_text:
	db "ROAMING@"

Dex_Print_Roamer_Info:
	; push bc ; line counter in c
	; roamer ptr in hl
	; line counter in c
	inc hl ; now pointing to LVL
	ld a, [hl] ; roamer LVL
	ld [wPokedexEvoStage2], a ; roamer LVL

	inc hl ; now pointing to map group
	ld a, [hli] ; now pointing to map num
	ld e, a
	ld a, [hli] ; now pointing to HP
	ld d, a

	ld a, [hli] ; now pointing to DVs
	ld [wPokedexEvoStage3], a ; Roamer HP

	push hl ; now pointing to DVs

	farcall GetMapGroupNum_Name ; map info in 'de'
	; map name ptr is in de
	hlcoord 2, 10
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld a, BANK(MapGroupNum_Names)
	push bc ; current print line in c
	call PlaceFarString
	pop bc ; current print line in c

	; print roamer's lvl	
	ld a, [wPokedexEvoStage2]
	cp 100
	jr nz, .two_digits
	hlcoord 4, 11
	jr .lvl_spot_decided
.two_digits
	hlcoord 3, 11
.lvl_spot_decided
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	push bc ; current print line in c
	lb bc, 1, 3 ; num of bytes of the number, max digits
	ld de, wPokedexEvoStage2 ; roamer's LVL
	call PrintNum
	pop bc ; current print line in c
	; print lvl symbol
	hlcoord 3, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], $5d ; lvl symbol

; if HP is 0, means the DVs haven't been init'd yet upon seeing it in battle for the first time
; if HP is 0, don't print
	push bc ; current print line in c
	ld a, [wPokedexEvoStage3] ; Roamer's HP
	and a
	jr z, .not_initd
; HP string and /
	hlcoord 8, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld de, .hp_text
	call PlaceString
	pop bc ; current print line in c
	; current HP
	
	hlcoord 12, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld de, wPokedexEvoStage3 ; Roamer's HP
	push bc ; current print line in c
	lb bc, 1, 3 ; num of bytes of the number, max digits
	call PrintNum
	ld a, 1 ; for next check

.not_initd
	pop bc ; current print line in c
	pop hl ; now pointing to DVs
; check if shiny
	push bc ; current print line in c
	; check if DVs are init'd
	and a ; will still be zero if we jumped here after DV check, else will be 1
	jr z, .not_shiny

	ld b, h
	ld c, l
	farcall CheckShininess ; ptr needs to be in bc
	; scf if shiny
	jr nc, .not_shiny
	; shiny tile is $64
	pop bc ; current print line in c
	push bc ; current print line in c
	hlcoord 1, 11
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], $64
; shiny check done
.not_shiny
	pop bc ; line counter in c
	inc c ; for next print, in case there are mult roamers of same species
	inc c
	ret

.hp_text:
	db "HP:@"
