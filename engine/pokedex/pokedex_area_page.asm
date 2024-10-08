INCLUDE "data/wild/non_wildmon_locations.asm"

String_johto_text:
	db "JOHTO:     @"
String_kanto_text:
	db "KANTO:     @"

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

	cp DEXENTRY_AREA_EVENTWILDMONS
	jp z, .eventwildmons

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

; erase category banner, page number and A > indicator	
	hlcoord 9, 6
	lb bc, 2, 11 ; erase a box 2 tiles high, 9 wide, ; to 18, 7
	call ClearBox
; overwrite the A button with plain line
	hlcoord 18, 5
	ld bc, 2
	ld a, $4e ; category box border
	jp ByteFill

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
	jr .skip_empty_area_check
.eventwildmons
	call Pokedex_DetailedArea_eventwildmons
	; fallthrough

.skip_empty_area_check
	cp -1 ; -1 means we skipped, 0 is normal
	jp z, .checkpoint

	xor a
	ret

.none_wild_text:
	db "AREA UNKNOWN!@"

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

	ld hl, EventWildMons
	call Dex_Check_eventmons
	and a
	jr z, .eventwildmons

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
.eventwildmons
	ld a, DEXENTRY_AREA_EVENTWILDMONS
	ret

Print_area_entry:
; morn, day, nite, space, map name
; time of day
	push hl ; pointer to map groupnum/name
	push bc ; b has morn encounter rate, c is current print line?
	push de ; day (e) /nite (d) encounter rates
	hlcoord 2, 10 ; same position regardless
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], $65 ; morn icon tile
	ld de, 6
	add hl, de
	ld [hl], $6b ; day icon tile
	add hl, de
	ld [hl], $6c ; nite icon tile 
	hlcoord 6, 10
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
	hlcoord 15, 10
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
	hlcoord 9, 10
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum
; encounter rate for morn
	pop bc
	push bc
	ld a, b
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 3, 10
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
	hlcoord 2 , 9
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld a, BANK(MapGroupNum_Names)
	push bc
	call PlaceFarString
	ld c, 4
	call DelayFrames
	pop bc ; line counter
	ret

DexArea_IncWildMonIndex:
	ld a, [wPokedexStatus]
	inc a
	ld [wPokedexStatus], a
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
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_GRASS_JOHTO
	jr nz, .chk_kanto
	ld de, String_johto_text
	jr .title_done
.chk_kanto
	ld de, String_kanto_text
.title_done
	ld hl, .grass_walk_text
	call Print_Category_text

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
	ld b, 0
	ld c, GRASS_WILDDATA_LENGTH
	add hl, bc
	; check to see if there is a next entry
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; hl is preserved
	pop bc ; line counter in c
	cp -1 ; if we've printed a 3rd entry, this doesn't get checked
	jr z, .reached_end ; end of data table 
	; we dont need to handle having printed all 3 slots if we were at the end of the table
	ld a, c
	cp $6 ; 3 entries, 6 rows
	jr z, .max_print

	call DexArea_IncWildMonIndex
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
	; call DexArea_IncWildMonIndex
	call DexEntry_IncPageNum
	; page number is currently in a
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

.grass_walk_text:
	db " GRASS   @"

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
	push hl ; pointing to next index's first entry byte: map group/num
	push de
	push bc

.landmark_loop
	call DexArea_IncWildMonIndex
	ld bc, 6
	add hl, bc
	push hl ; now pointing to species
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
	pop hl ; now pointing to species
	and a
	jr nz, .entries_remaining
	ld a, e
	and a
	jr nz, .entries_remaining
	ld a, d
	and a
	jr nz, .entries_remaining

	ld b, 0
	ld c, GRASS_WILDDATA_LENGTH - 6 ; to be at the right pointer to read the -1 if it's there, aka the mapgroup/num ptr
	add hl, bc ; increment index without touching our wram index
	; check to see if we've reached the end of the wild data file, -1
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; hl is preserved
	cp -1
	jr nz, .landmark_loop
	xor a ; ret with 0 means none left, shift to next area category
.done
	pop bc
	pop de
	pop hl
	ret

.entries_remaining
; since we've been incrementing the index, it now doesn't have to do so much searching to "find" this pointer again
	ld a, 1 ; if a is not 0 when we return, it means that the pokemon is ahead in an upcoming entry, increment page and index
	jr .done

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
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_SURF_JOHTO
	jr nz, .chk_kanto
	ld de, String_johto_text
	jr .title_done
.chk_kanto
	ld de, String_kanto_text
.title_done
	ld hl, .surfing_text
	call Print_Category_text

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
	ld b, 0
	ld c, WATER_WILDDATA_LENGTH
	add hl, bc
	; check to see if there is a next entry
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte ; hl is preserved
	pop bc ; line counter in c
	cp -1 ; if we've printed a 3rd entry, this doesn't get checked
	jr z, .reached_end ; end of data table 
	; we dont need to handle having printed all 3 slots if we were at the end of the table
	ld a, c
	cp $6 ; 3 entries, 6 rows
	jr z, .max_print

	call DexArea_IncWildMonIndex
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
	call DexArea_IncWildMonIndex
	call DexEntry_IncPageNum
	; page number is currently in a
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

.surfing_text:
	db " SURFING @"

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
	call DexArea_IncWildMonIndex
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
	call DexArea_IncWildMonIndex
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

Pokedex_DetailedArea_rods:
	ld a, [wPokedexStatus] ; wildmon entry index, 0 we haven't started yet, 1 is old-shore, 2 is good-shore, 3 is super-shore, 4 is old-ocean, etc
	and a
	; if not zero, we know that there are Fishing entries
	jr nz, .auto_cont

	ld hl, FishGroups ; we want to start at the beginning
	call Dex_Check_Fishing ; from prev category, we automatically roll into this category, we need to check if there's even anything there for us, so we use same func as first pass/check
	and a ; if a is 0, means species was found somewhere
	jp nz, Pokedex_Skip_Empty_Area_Category

.auto_cont
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a

	; print the title, FISHING RODS
	ld de, .fishing_text
	ld hl, .rods_text
	call Print_Category_text
	; calculate where we left off

	call Fishing_MonIndex_Addr ; clobbers bc, return addr in hl
	ld bc, 0 ; printed line count
	push bc ; printed line count
	; push hl ; points to fishgroup, specific rod ptr
.landmark_loop
	call Check_this_rod
	pop bc ; line counter
	ld a, [wPokedexEvoStage2] ; day and morn
	and a
	jr nz, .print
	ld a, [wPokedexEvoStage3] ; nite
	and a
	jp z, .prep_loop
.print
	; when we arrive here, we are printing our first rod for this Fishing Group, could be any
	; print the first rod, then check if we're super, if not, inc Index and check
	; again, check if we're super, if we ARE, check and inc
	push bc ; line counter, rod in b, maps in c
	pop bc ; line counter, rod in b, maps in c
	; push hl ; points to fishgroup, specific rod ptr
	ld a, [wPokedexStatus] ; fish group starting at bit 3

	call Fishing_Print_Rod
	push bc ; line counter, rod in b, maps in c, b has been inc'd
	; zero the cumulative bytes
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a

	ld a, [wPokedexStatus] ; fish group starting at bit 3
	and 3 ; rod type mask, first 2 bits
	cp 2 ; did we just print a super rod?
	jr z, .print_rods_done ; we do not inc the index, prep loop will, and calcs new hl
	cp 1 ; did we just print a good rod?
	jr z, .good2super ; we just printed a good rod, inc index and check, print if not 0
	; now we can assume we are an old rod
	call Fishing_Inc_Index ; we are now indexed on the good rod
	call Fishing_MonIndex_Addr
	call Check_this_rod
	and a
	jr z, .good2super ; since we're on the good rod, we still need to check the super rod entry	
	ld a, [wPokedexStatus] ; fish group starting at bit 3
	pop bc ; line counter, rod in b, maps in c
	call Fishing_Print_Rod
	push bc ; line counter, rod in b, maps in c, now has been inc'd
	; zero the cumulative bytes
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a
.good2super
	call Fishing_Inc_Index ; we are now indexed on the super rod
	call Fishing_MonIndex_Addr
	call Check_this_rod
	and a
	jr z, .print_rods_done
	ld a, [wPokedexStatus] ; fish group starting at bit 3
	pop bc ; line counter, rod in b, maps in c
	call Fishing_Print_Rod
	push bc ; line counter, rod in b, maps in c, now has been inc'd
	; zero the cumulative bytes
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a
	; do we fall through to prep loop or skip directly to max print?
	; should probably fall through, so double check we don't double inc
.print_rods_done
	; since we will be exiting since we printed a rod and finished checking the group
	pop bc ; line counter, rod in b, maps in c
; map name
	ld hl, FishGroups_Names
	push bc ; line counter, rod in b, maps in c
	ld a, [wPokedexStatus]
	sra a
	sra a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld a, BANK(FishGroups_Names)
	call GetFarWord
	ld d, h 
	ld e, l
	ld a, BANK(FishGroups_Names)
	hlcoord 8 , 9 ; we want allllll the chars we can have
	pop bc ; line counter, rod in b, maps in c
	push bc
	call PlaceFarString
	pop bc
	inc c ; since we printed a map name
	push bc
	push de
	push hl
	hlcoord 2, 9
	ld de, .group_text
	call PlaceString
	pop hl
	pop de

	ld c, 4
	call DelayFrames

	pop bc ; line counter

.prep_loop
	; increment wildmon index, if end is 2, zero, inc fish group
	push bc
	call Fishing_Inc_Index
	pop bc
	; check if we've finished all FishingGroups
	ld a, [wPokedexStatus] ; fishgroup in bit 3
	sra a
	sra a
	cp NUM_FISHGROUPS ; + 1
	jr z, .reached_end
	
	ld a, b ; number of rods printed, anything over 0 means we want a new page
	and a
	jr nz, .max_print

	push bc ; print counter
	jp .landmark_loop

.reached_end
	xor a
	ld [wPokedexStatus], a ; wildmon entry index
	ld [wPokedexEntryPageNum], a ; page num
	ld a, [wPokedexEntryType] ; johto, janto, swarm
	inc a
	call DexEntry_NextCategory
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

.max_print
	call Fishing_MonIndex_Addr
	call Rods_check_any_remaining ; if entries remaining for this species, will return 0
	and a
	jr nz, .reached_end ; no more remaining entries for this species, do not increment page

	call DexEntry_IncPageNum
	; page number is currently in a
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

.fishing_text:
	db "FISHING    @"
.rods_text:
	db " RODS    @"
.group_text:
	db "GROUP:@"

Fishing_Print_Rod:
	; day (e) /nite (d) encounter rates
	ld a, [wPokedexEvoStage3]
	ld d, a
	ld a, [wPokedexEvoStage2]
	call Adjust_percent_fish
	ld e, a
	ld a, d
	call Adjust_percent_fish
	ld d, a

	push bc ; b has rods printed, c is current maps printed
	push de ; day (e) /nite (d) encounter rates

; time of day icons
	hlcoord 9, 11 ; same position regardless
	call FishEntry_adjusthlcoord_rod ; current print line needs to be in c
	ld [hl], $6b ; day icon tile
	ld de, 6
	add hl, de
	ld [hl], $6c ; nite icon tile 
; % char
	hlcoord 13, 11
	call FishEntry_adjusthlcoord_rod ; current print line needs to be in c
	ld [hl], "<%>"
	ld de, 6 ; de should still be 6 since we push/pop de in adjust, check this
	add hl, de
	ld [hl], "<%>"

	pop de ; nite encounter % in d, day in e
	pop bc
	push bc ; probably uneccessary but will check later
	push de
; encounter % for nite
	ld a, d
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 16, 11
	call FishEntry_adjusthlcoord_rod ; current print line needs to be in b
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
	call FishEntry_adjusthlcoord_rod ; current print line needs to be in b
	lb bc, 1, 3
	call PrintNum
	; Rod Name
	pop bc
	push bc
	; Print Rod based on Index
	ld a, [wPokedexStatus]
	and 3 ; bit mask for rod type, first 2 bits
	ld de, oldrod_text
	and a
	jr z, .printrod
	ld de, goodrod_text
	cp 1
	jr z, .printrod
	ld de, superrod_text
.printrod
	hlcoord 1 , 10
	call FishEntry_adjusthlcoord_rod ; current print line needs to be in b
	call PlaceString

	ld c, 4
	call DelayFrames

	pop bc ; line counter
	inc b ; we've printed one rod
	ret

oldrod_text:
	db "  OLD ROD@"
goodrod_text:
	db "  GOOD ROD@"
superrod_text:
	db "  SUPER ROD@"
oddrod_text:
	db "  ODD ROD@"

FishEntry_adjusthlcoord_rod:
	; NOTE, preserve bc before calling this
	push bc
	ld c, b
	; given: current printed map lines in c, rod lines in b
	push af
	push de
	ld a, 20
	; the num of moves already printed should still be in bc
	call SimpleMultiply ; uses c as the other number
	; result in a
	ld d, 0
	ld e, a
	add hl, de ; allows us to print on the proper row
	add hl, de ; allows us to print on the proper row
	pop de
	pop af
	pop bc
	ret

Dex_Check_Fishing:
	; ld hl, FishGroups
	ld bc, 0 ; NUM_FISHGROUPS set up for mainloop
	ld a, [wPokedexStatus]
	and a
	jr z, .mainloop
	sra a
	sra a ; get fishing group, so we can properly calc to the last fishing group
	ld c, a
.mainloop
	push bc ; NUM_FISHGROUPS
	push hl ; FishGroups + FISHGROUP_DATA_LENGTH * n
	inc hl ; skip fishing group's bite rate
	call Check_Rods
	and a
	jr z, .found
	pop hl ; FishGroups + FISHGROUP_DATA_LENGTH * n
	ld bc, FISHGROUP_DATA_LENGTH
	add hl, bc ; FishGroups + FISHGROUP_DATA_LENGTH * n
	pop bc ; FISH GROUP #
	inc c ; FISH GROUP #

	ld a, NUM_FISHGROUPS
	cp c
	ret z ; not found
	jr .mainloop

.found
	pop hl
	pop bc
	xor a
	ret

Check_Rods: 
	; looks for first instance of Species, starting with Old Rod
 	; Get encounter data by rod:
	ld bc, 0 ; rod
.rod_loop
	push bc
	push hl
 	; 0: Old
 	; 1: Good
 	; 2: Super
	; inc hl
	add hl, bc
	add hl, bc
	; set b to 0?
	ld b, 0
	call Check_this_rod
	; if a = 0, no match, done
	; if a not 0, accumulate %
	; b will now be this entry's coded %
	push af
	pop af
	and a
	jr z, .notfound ; check next rod type
.found
	pop hl
	pop bc
	xor a
	ret

.notfound
	; zero the cumulative bytes
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a
	call Fishing_Inc_Index
	pop hl
	pop bc
	inc c ; 0 -> 1, good rod, 1 -> 2 super rod
	ld a, 3
	cp c
	ret z ; means we've checked 3rd rod, super rod, done, no match
	jr .rod_loop

Check_this_rod:
; day cumulative encounter %: ldh [hMultiplier], a
; nite cumulative encounter %: ldh [hMultiplicand],
	push hl
	ld a, BANK(FishGroups)
	call GetFarWord	
.loop
	; check for 100% aka 255. In table, probability is not percentage (out of 100)
	; the probabilities add up to 255. So need to cross multiply to get % T.T
	ld a, BANK(FishGroups)
	call GetFarByte ; index? this is the probability

	ld c, a ; current entry %, b has prev entry %, or 0 if first entry
	sub b ; actual cumulative encounter % is difference between entry's % and prev entry's %, now in a
	; push af ; if this table entry is a match, we will need this value, accumulate based on species match
	ld b, c ; for the next entry's calculation, need raw % not the calculated difference
	ld c, a ; adjusted %
	
	inc hl
	ld a, BANK(FishGroups)
	call GetFarByte ; successfuly gets the Species in the Rod table
	ld d, a
	ld e, a
	and a
	call z, Dex_FishTimeGroupsGet ; if zero, not the species, 
	; looks at Daytime table to determine the species
	ld a, [wCurSpecies]
	; we cannot assume we didn't call the ToD table, which can hold two species, so check both d and e
	cp d
	jr z, .found
	cp e
	jr z, .found
	; pop af ; don't need this value (diff of entry %), clean stack
.resume
	ld a, b
	cp 255 ; this is how we tell if we are looking at the last entry of the table (FF)
	jr z, .end
	; we have not reached the end, increment to next entry % loop
	inc hl ; species
	inc hl ; encounter level
	jr .loop

.found
	; return true flag for match, plus %
	; b has adjusted %
	; a is species rn, use to determine day/nite
	cp d
	jr nz, .trynite
	push af ; species
	ld a, [wPokedexEvoStage2]
	add c
	ld [wPokedexEvoStage2], a
	pop af ; species
.trynite
	cp e
	jr nz, .resume
	ld a, [wPokedexEvoStage3]
	add c
	ld [wPokedexEvoStage3], a
	jr .resume

.end
	pop hl
	; call Fishing_Inc_Index
	ld a, [wPokedexEvoStage2]
	and a
	ret nz
	ld a, [wPokedexEvoStage3] ; will ret correct value if 0 or not
	; and a
	; ret nz
	; xor a
	; b should be this entry's percentage still, regardless of match or not
	ret

Dex_FishTimeGroupsGet:
	push hl
	push bc
	push af
	inc hl
	ld a, BANK(FishGroups)
	call GetFarByte ; index
	; a is the index
	ld hl, TimeFishGroups
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, BANK(TimeFishGroups)
	call GetFarByte
	ld d, a ; species 1
	inc hl
	inc hl
	ld a, BANK(TimeFishGroups)
	call GetFarByte
	ld e, a ; species 2
.done	
	pop af
	pop bc
	pop hl
	ret

Adjust_percent_fish:
	; hMultiplicand 
	; hMultiplier. Result in hProduct.
	push hl
	push bc
	push de
	ldh [hMultiplicand], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	; Divide hDividend length b (max 4 bytes) by hDivisor. Result in hQuotient.
	; All values are big endian.
	ld b, 2
	ld a, 255
	ldh [hDivisor], a
	call Divide
	pop de
	pop bc
	pop hl
	ldh a, [hQuotient + 3]
	cp 100
	ret z
	cp 0
	ret z
	inc a
	ret

Fishing_MonIndex_Addr:
	; clobbers bc and de
	; return addr in hl
	; given: Wildmon Index (Fishing Group in bits 3+, rod type in bits 1&2)
	ld a, [wPokedexStatus] ; wildmon index, will be zero if we are here for the first time
	and 3 ; masks the rod value
	push af ; rod value
	ld a, [wPokedexStatus]
	sra a ; , 2 ; fish group #
	sra a
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
	ld a, FISHGROUP_DATA_LENGTH
	ldh [hMultiplier], a
	call Multiply ; wildmon entry index
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	ld c, a ; result of simple multiply in a
	ld hl, FishGroups
	add hl, bc ; pointing to fishgroup bite rate
	pop af ; 0 = old rod, 1 = good rod, 2 = super rod
	inc hl ; skip the bite rate byte
	add a ; double the value since the rod's are pointers/words
	ld de, 0
	ld e, a
	add hl, de
	ret

Rods_check_any_remaining:
	; given: hl is addr of next rod, already adjusted for prev rod type and/or new fishing group
	; step 1, depending on this new rod type, if not old rod, check_this_rod individually until next fish group
	ld a, [wPokedexStatus]
	and 3 ; rod type mask for first 2 bits
	jr z, .check_rods
	cp 2 ; super rod
	jr z, .super
	; we are at good rod rn
	call Check_this_rod ; 0 means not found
	and a
	jr nz, .found
	call Fishing_Inc_Index
	; check_this_rod calls inc_index which auto incs hl depending on rod type
.super
	call Check_this_rod ; 0 means not found
	and a
	jr nz, .found
	call Fishing_Inc_Index
.check_rods
	; hl was already set properly to beginning of Fish group when this func is called
	dec hl ; Dex_Check_Fishing assumed you haven't already accounted for Fishing Group's bite rate bit
	call Dex_Check_Fishing ; 0 means found
	; and a
	; jr z, .found
	ret

.found
	xor a
	ret
	; call Dex_Check_Fishing with hl aligned to new fish group old rod
	; we are about to exit so we don't need to align the hl addr with new incremented Wildmon index
	; when we come back, will auto calculate new Wildmon Index addr

Fishing_Inc_Index:
	; given hl if using it
	ld a, [wPokedexStatus] ; wildmon index
	and 3 ; mask for first 2 bits
	inc a
	cp 3
	jr z, .incfishgrp
	; no new fish grp needed yet
	ld a, [wPokedexStatus] ; wildmon index
	inc a
	ld [wPokedexStatus], a ; wildmon index
	inc hl
	inc hl ; two bytes to next ptr in fishgrp
	ret

.incfishgrp
	ld a, [wPokedexStatus] ; wildmon index
	sra a
	sra a
	inc a
	sla a
	sla a
	ld [wPokedexStatus], a ; wildmon index, also zeros the rod type
	inc hl
	inc hl
	inc hl ; need to skip extra byte for fishgrp bite rate
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
	ld a, DEXENTRY_AREA_TREES_COMMON
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
; check for matching mons in TreeMons
; return zero in 'a' if found, else 1 in 'a'
	ld hl, TreeMons ; table of pointers, NUM_TREEMON_SETS
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
	hlcoord 2, 9
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld a, BANK(MapGroupNum_Names)
	call PlaceFarString

	hlcoord 2, 10 ; same position regardless
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a	
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], $65 ; morn icon tile
	ld de, 6
	add hl, de
	ld [hl], $6b ; day icon tile
	add hl, de
	ld [hl], $6c ; nite icon tile 
	hlcoord 6, 10
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
	hlcoord 3, 10
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a	
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum

	hlcoord 9, 10
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a		
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	call PrintNum

	hlcoord 15, 10
	ld a, [wPokedexEvoStage2] ; lines printed
	ld c, a		
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	lb bc, 1, 3
	jp PrintNum

Print_TreeTitle:
	ld a, [wPokedexEntryType]
	cp DEXENTRY_AREA_TREES_COMMON
	jr z, .common
	ld de, .headbutt_tree_rare_text
	jr .print
.common
	ld de, .headbutt_tree_common_text
.print	
	ld hl, .trees_text
	jp Print_Category_text

.headbutt_tree_common_text:
	db "COMMON     @"
.headbutt_tree_rare_text:
	db "RARE       @"
.trees_text:	
	db " TREES   @"

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
	ld hl, .rocksmash_text2
	ld de, .rocksmash_text1
	call Print_Category_text
	; using wPokedexStatus/RockMonMaps entry index, calculate ptr
.map_loop
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

.rocksmash_text1:
	db "ROCK      @"
.rocksmash_text2:	
	db " SMASH   @"

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

	; print the title
	ld de, .bugcontest_text
	ld hl, .contest_text
	call Print_Category_text

	hlcoord 1, 9
	ld de, .park_text
	call PlaceString
	hlcoord 2, 10
	ld de, .String_Tuesday
	call PlaceString
	hlcoord 2, 11
	ld de, .String_Thursday
	call PlaceString
	hlcoord 2, 12
	ld de, .String_Saturday
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
	db "BUG       @"
.contest_text:
	db " CONTEST @"
.park_text:
	db "NATIONAL PARK@"
.String_Tuesday:
	db "Tuesdays@"
.String_Thursday:
	db "Thursdays@"
.String_Saturday:
	db "Saturdays@"

BugContest_Print:
	ld b, e ; encounter %
	hlcoord 2, 14 ; same position regardless
	ld [hl], $65 ; morn icon tile
	ld de, 6
	add hl, de
	ld [hl], $6b ; day icon tile
	add hl, de
	ld [hl], $6c ; nite icon tile 
	hlcoord 6, 14
	ld [hl], "<%>"
	ld de, 6
	add hl, de
	ld [hl], "<%>"
	add hl, de
	ld [hl], "<%>"
	ld a, b ; encounter %
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 15, 14
	lb bc, 1, 3
	call PrintNum
	hlcoord 9, 14
	call PrintNum
	hlcoord 3, 14
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
	ld de, .roaming_text
	ld hl, String_pokemon
	call Print_Category_text

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
	db "ROAMING   @"

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
	hlcoord 2, 9
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld a, BANK(MapGroupNum_Names)
	push bc ; current print line in c
	call PlaceFarString
	pop bc ; current print line in c

	; print roamer's lvl	
	ld a, [wPokedexEvoStage2]
	cp 100
	jr nz, .two_digits
	hlcoord 4, 10
	jr .lvl_spot_decided
.two_digits
	hlcoord 3, 10
.lvl_spot_decided
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	push bc ; current print line in c
	lb bc, 1, 3 ; num of bytes of the number, max digits
	ld de, wPokedexEvoStage2 ; roamer's LVL
	call PrintNum
	pop bc ; current print line in c
	; print lvl symbol
	hlcoord 3, 10
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], "<DEX_LV>" ; lvl symbol

; if HP is 0, means the DVs haven't been init'd yet upon seeing it in battle for the first time
; if HP is 0, don't print
	push bc ; current print line in c
	ld a, [wPokedexEvoStage3] ; Roamer's HP
	and a
	jr z, .not_initd
; HP string and /
	hlcoord 8, 10
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld de, .hp_text
	call PlaceString
	pop bc ; current print line in c
	; current HP
	
	hlcoord 12, 10
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
	jr nc, .not_shiny
	pop bc ; current print line in c
	push bc ; current print line in c
	hlcoord 1, 10
	call DexEntry_adjusthlcoord ; current print line needs to be in c
	ld [hl], "<DEX_⁂>"
; shiny check done
.not_shiny
	pop bc ; line counter in c
	inc c ; for next print, in case there are mult roamers of same species
	inc c
	ret

.hp_text:
	db "HP:@"
 
Dex_Check_eventmons:
; EventWildMons in 'hl'
; return zero in 'a' if found, else 1 in 'a'
	; species, EVENT_FLAG, map_id, blurb string ptr
	; ends with -1
.loop
	ld a, BANK(EventWildMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the % chance to encounter
	cp -1
	jr z, .notfound
	; we aren't at the end yet, so this byte is the species
	ld c, a ; pokemon species of entry in EventWildMons
	ld a, [wCurSpecies] ; current pokedex entry species
	cp c
	jr z, .found
	; species didn't match, inc hl by 7, need to check for -1
	ld de, 7 ; size of specialencounter entry, 7 bytes
	add hl, de
	jr .loop

.found
	xor a
	ret

.notfound
	ld a, 1
	ret

Pokedex_DetailedArea_eventmons:
	; 'hl' is EventWildMons
	ld c, 7 ; specialencounter is 7 bytes, need to check for -1
	ld a, [wPokedexStatus] ; wildmon index
	call AddNTimes
.loop	
	ld a, BANK(EventWildMons)
	call GetFarByte ; will be -1 at the end, otherwise it's the species
	cp -1
	jr z, .donedone

	ld c, a ; pokemon species of entry in EventWildMons/GiftMons
	ld a, [wCurSpecies] ; current pokedex entry species
	cp c
	jr z, .found
.notfound	
	; species didn't match, inc hl by 7, need to check for -1
	ld de, 7 ; size of specialencounter entry, 7 bytes
	add hl, de ; pointing to next species byte
	call DexArea_IncWildMonIndex
	jr .loop

.found
	; check event flag
	inc hl ; now pointing to event flag
	push hl ; pointing to event flag constant
	ld a, BANK(EventWildMons)
	call GetFarWord ; event flag constant in 'hl'
	
	ld d, h ; event flag
	ld e, l ; event flag
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop hl ; pointing to event flag constant
	and a

	; get map name
	inc hl
	inc hl ; now pointing to map_id
	push hl ; pointing to map_id
	ld a, BANK(EventWildMons)
	call GetFarWord ; map_id in 'hl'	
	ld d, h 
	ld e, l
	pop hl ; pointing to map_id
	
	; get blurb str
	inc hl
	inc hl ; now pointing to hint blurb str double ptr
	push hl ; pointing to hint blurb str double ptr
	ld a, BANK(EventWildMons)
	call GetFarWord ; blurb hint ptr in 'hl'
	call Dex_Print_EventMon_Info
	pop hl ; pointing to hint blurb str double ptr

	; check any remaining
	inc hl
	inc hl ; now pointing to next species index
	call Dex_Check_eventmons ; 0 means found
	and a
	jr z, .inc_page

.donedone
	ld a, [wPokedexEntryType] ; event mon
	inc a
	jp DexEntry_NextCategory

.inc_page
	call DexArea_IncWildMonIndex
	call DexEntry_IncPageNum
	; page number is currently in a
	xor a ; to ensure a isn't actually returned at -1. 0 is for normal
	ret

Dex_Print_EventMon_Info:
	push hl ; blurb/hint str ptr

	farcall GetMapGroupNum_Name ; map info in 'de'
	; map name ptr is in de
	hlcoord 2 , 9
	ld a, BANK(MapGroupNum_Names)
	call PlaceFarString

	pop de ; blurb/hint str ptr
	hlcoord 2 , 11
	ld a, BANK(EventWildMons)
	jp PlaceFarString	

Pokedex_DetailedArea_eventwildmons:
	ld hl, EventWildMons
	call Dex_Check_eventmons
	and a
	jp nz, Pokedex_Skip_Empty_Area_Category
	
	xor a
	ld [wPokedexEvoStage2], a
	ld [wPokedexEvoStage3], a

	; print the title, SPECIAL ENCOUNTER
	ld de, .eventwildmon_text
	ld hl, .eventwildmon_text2
	call Print_Category_text	

	ld hl, EventWildMons
	jp Pokedex_DetailedArea_eventmons
	
.eventwildmon_text:
	db "SPECIAL   @"
.eventwildmon_text2:
	db "ENCOUNTER@"
