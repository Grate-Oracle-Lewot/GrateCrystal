POKEDEX_STATSPAGE_MAX_PAGE_NUM EQU 3

String_BASE_text:
	db "BASE       @" ; @ 8, 6
String_STATS_text:
	db " STATS     @" ; @ 8, 7

DisplayDexMonStats::
	ld a, [wTempSpecies]
	ld [wCurSpecies], a

	ld a, DEXENTRY_BASESTATS
	call HandlePageNumReset
	call Pokedex_Clearbox

; place category name
	ld de, String_BASE_text
	ld hl, String_STATS_text
	call Print_Category_text	

	call Pokedex_PrintPageNum ; page num is also returned in a
	and a
	jr z, .print_page1
	cp 1
	jr z, .print_page2
	jr .print_page3

; Base Stats, BST, Catch Rate, Growth rate
.print_page1
	call Pokedex_GBS_Stats ; 4 lines
	call Pokedex_Get_Items ; 3 lines
	jp DexEntry_IncPageNum

.print_page2
	call Pokedex_CatchRate ; 1 line
	call Pokedex_Get_Growth ; 1 lines
	call Pokedex_PrintBaseExp ; 1 line
	call Pokedex_HeightWeight ; 1 line
	jp DexEntry_IncPageNum

.print_page3
	; these ones NEED to be in this order
	call Pokedex_EggG_SetUp ; 3 lines
	call Pokedex_PrintHatchSteps ; 1 line
	call Pokedex_Get_GenderRatio ; 1 line
	xor a
	ld [wPokedexEntryPageNum], a
	ret

Pokedex_GBS_Stats:
	hlcoord 1, 9
	ld de, .String_abbrv_BS_text1
	call PlaceString
	hlcoord 1, 10
	ld de, .String_abbrv_BS_text2
	call PlaceString
	hlcoord 1, 11
	ld de, .String_abbrv_BS_text3
	call PlaceString

	hlcoord 6, 9
	ld de, wBaseHP
	lb bc, 1, 3 ; 1 byte, 3 digits
	call PrintNum
	hlcoord 15, 9
	ld de, wBaseSpeed
	lb bc, 1, 3 ; 1 byte, 3 digits
	call PrintNum

	hlcoord 6, 10
	ld de, wBaseAttack
	lb bc, 1, 3 ; 1 byte, 3 digits
	call PrintNum
	hlcoord 15, 10
	ld de, wBaseDefense
	lb bc, 1, 3 ; 1 byte, 3 digits
	call PrintNum

	hlcoord 6, 11
	ld de, wBaseSpecialAttack
	lb bc, 1, 3 ; 1 byte, 3 digits
	call PrintNum
	hlcoord 15, 11
	ld de, wBaseSpecialDefense
	lb bc, 1, 3 ; 1 byte, 3 digits
	jp PrintNum

.String_abbrv_BS_text1:
	db "  HP      SPE     @"
.String_abbrv_BS_text2:
	db " ATK      DEF     @"
.String_abbrv_BS_text3:
	db " SpA      SpD     @"

Pokedex_BST:
	hlcoord 2, 9
	ld de, .BS_Total_text
	call PlaceString

	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	
	ld h, 0
	ld a, [wBaseHP]
	ld l, a
	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseSpeed]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseAttack]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseDefense]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseSpecialAttack]
	ld l, a
	add hl, bc

	ld b, h
	ld c, l
	ld h, 0
	ld a, [wBaseSpecialDefense]
	ld l, a
	add hl, bc

	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

	hlcoord 15, 9
	ld de, wCurDamage
	lb bc, 2, 3
	call PrintNum

	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ret

.BS_Total_text:
	db "Base Total:@"

Pokedex_Get_Items:
; TODO: Add code to differentiate same items in both entries, special cases
	ld a, [wCurSpecies]
	push af

	hlcoord 2, 13
	ld de, .BS_ITEM_text
	call PlaceString
	hlcoord 2, 14
	ld de, .BS_ITEM1
	call PlaceString
	hlcoord 2, 15
	ld de, .BS_ITEM2
	call PlaceString

.WildHeldItems1:
	ld de, .ThreeDashes
	ld a, [wBaseItem1]
	and a
	jr z, .Item1Done
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
.Item1Done
	hlcoord 7, 14
	call PlaceString
.WildHeldItems2:
	ld de, .ThreeDashes
	ld a, [wBaseItem2]
	and a
	jr z, .Item2Done
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
.Item2Done
	hlcoord 7, 15
	call PlaceString
	pop af
	ld [wCurSpecies], a
	ld [wTempSpecies], a	
	ret

.ThreeDashes:
	db "---@"
.BS_ITEM_text:
	db "Wild Held Items:@"
.BS_ITEM1:
	db "[37<%>]@"
.BS_ITEM2:
	db "[ 5<%>]@"

Pokedex_CatchRate:
	hlcoord 2, 9
	ld de, .BS_Catchrate
	call PlaceString
	hlcoord 15, 9
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	ld de, wBaseCatchRate
	jp PrintNum

.BS_Catchrate:
	db "Catch Rate:@"

Pokedex_PrintBaseExp:
; wBaseExp
	hlcoord 2, 11
	ld de, .Exp_text
	call PlaceString
	hlcoord 14, 11
	ld de, wBaseExp
	lb bc, 1, 3 ; 1 byte, 3 possible digits
	jp PrintNum

.Exp_text:
	db "EXP Yield:@"

Pokedex_Get_Growth::
; Experience growth rate
	ld a, [wBaseGrowthRate]
	ld de, .growth_medfast
	cp GROWTH_MEDIUM_FAST
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_slightfast
	cp GROWTH_SLIGHTLY_FAST
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_slightslow
	cp GROWTH_SLIGHTLY_SLOW
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_medslow
	cp GROWTH_MEDIUM_SLOW
	jr z, .Growth_print
	ld a, [wBaseGrowthRate]
	ld de, .growth_fast
	cp GROWTH_FAST
	jr z, .Growth_print
	ld de, .growth_slow
.Growth_print
	hlcoord 2, 13
	jp PlaceString

.growth_medfast:
	db "Med. Fast Growth@"
.growth_slightfast
	db "Sltly Fast Growth@"
.growth_slightslow
	db "Sltly Slow Growth@"
.growth_medslow
	db "Med. Slow Growth@"
.growth_fast
	db "Fast Growth@"
.growth_slow
	db "Slow Growth@"

Pokedex_EggG_SetUp:
	ld a, [wBaseEggGroups]
	push af
	and $f
	ld b, a
	pop af
	and $f0
	swap a
	ld c, a
	hlcoord 2, 11
	ld de, .BS_Egg_text1
	push bc
	call PlaceString
	pop bc
	call Pokedex_Get_EggGroup
	hlcoord 4, 12
	push bc
	call PlaceString
	pop bc
	ld a, b
	cp c
	ret z
; Print second egg group
	hlcoord 2, 11
	ld de, .BS_Egg_text2
	push bc
	call PlaceString
	pop bc
	ld b, c
	call Pokedex_Get_EggGroup
	hlcoord 4, 13
	jp PlaceString ; no longer need to preserve bc

.BS_Egg_text1:
	db "Breeding Group:@"
.BS_Egg_text2:
	db "Breeding Groups:@"

Pokedex_Get_EggGroup:
; have the fixed group num in 'a' already
; return 'de' as the text for matching group
	ld a, b
	ld de, .EggG_Monster_text
	cp EGG_MONSTER
	ret z
	ld a, b
	ld de, .EggG_Amphibian_text
	cp EGG_WATER_1
	ret z
	ld a, b
	ld de, .EggG_Bug_text
	cp EGG_BUG
	ret z
	ld a, b
	ld de, .EggG_Flying_text
	cp EGG_FLYING
	ret z
	ld a, b
	ld de, .EggG_Field_text
	cp EGG_GROUND
	ret z
	ld a, b
	ld de, .EggG_Fairy_text
	cp EGG_FAIRY
	ret z
	ld a, b
	ld de, .EggG_Grass_text
	cp EGG_PLANT
	ret z
	ld a, b
	ld de, .EggG_HumanLike_text
	cp EGG_HUMANSHAPE
	ret z
	ld a, b
	ld de, .EggG_Invertebrate_text
	cp EGG_WATER_3
	ret z
	ld a, b
	ld de, .EggG_Mineral_text
	cp EGG_MINERAL
	ret z
	ld a, b
	ld de, .EggG_Amorphous_text
	cp EGG_INDETERMINATE
	ret z
	ld a, b
	ld de, .EggG_Fish_text
	cp EGG_WATER_2
	ret z
	ld a, b
	ld de, .EggG_Dragon_text
	cp EGG_DRAGON
	ret z
	ld a, b
	ld de, .EggG_Ditto_text
	cp EGG_DITTO
	ret z
	ld de, DexEntry_NONE_text
	ret

; Egg Groups
.EggG_Monster_text:
	db "Monster@"
.EggG_Amphibian_text:
	db "Amphibian@"
.EggG_Bug_text:
	db "Bug@"
.EggG_Flying_text:
	db "Flying@"
.EggG_Field_text:
	db "Field@"
.EggG_Fairy_text:
	db "Fairy@"
.EggG_Grass_text:
	db "Grass@"
.EggG_HumanLike_text:
	db "Human-Like@"
.EggG_Invertebrate_text:
	db "Invertebrate@"
.EggG_Mineral_text:
	db "Mineral@"
.EggG_Amorphous_text:
	db "Amorphous@"
.EggG_Fish_text:
	db "Fish@"
.EggG_Dragon_text:
	db "Dragon@"
.EggG_Ditto_text:
	db "ALL@"

Pokedex_Get_GenderRatio::
	hlcoord 2, 15
	ld de, .GR_Text
	call PlaceString
	ld a, [wBaseGender]
	ld de, .GR_always_fem
	cp GENDER_F100
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_always_male
	cp GENDER_F0
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_QuarterF
	cp GENDER_F25
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_Equal
	cp GENDER_F50
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_QuartM
	cp GENDER_F75
	jr z, .GR_print
	ld a, [wBaseGender]
	ld de, .GR_MostMale
	cp GENDER_F12_5
	jr z, .GR_print
	ld de, .GR_Unknown_text
.GR_print
	hlcoord 10, 15
	jp PlaceString

.GR_Text
	db "Gender:@"
.GR_always_fem:
	db "♀ Only@"
.GR_always_male
	db "♂ Only@"
.GR_QuarterF
	db "1♀:3♂@"
.GR_Equal
	db "1♂:1♀@"
.GR_QuartM
	db "3♀:1♂@"
.GR_MostMale
	db "7♂:1♀@"
.GR_Unknown_text
	db "Unknown@"

Pokedex_PrintHatchSteps:
; wBaseEggSteps
	hlcoord 2, 9
	ld de, .HatchSteps_text
	call PlaceString
	hlcoord 13, 9
	ld de, wBaseEggSteps
	lb bc, 1, 3 ; 1 byte, 3 digits
	jp PrintNum

.HatchSteps_text:
	db "Hatch Rate:@"

Pokedex_HeightWeight:
	push hl
	push bc
	push de
; height string
	hlcoord 2, 15
	ld de, .String_HeightWeight_blank
	call PlaceString

; get pokemon's dex entry ptr in b:de
	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld h, d
	ld l, e
; skip species nickname
.loop1
	ld a, b ; bank
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1

; hl should now be at height
	push hl ; keep the ptr, for weight
	ld a, b ; bank
	push af ; keep bank
	call GetFarWord
	ld a, h
	ld [wPoisonStepCount], a ; weight ptr, 2 bytes
	ld a, l
	ld [wPoisonStepCount + 1], a ; weight ptr, 2 bytes
	ld de, wPoisonStepCount ; weight ptr, 2 bytes
; Print the height, with two of the four digits in front of the decimal point
	hlcoord 4, 15
	lb bc, 2, (2 << 4) | 4
	call PrintNum
	hlcoord 6, 15
	ld [hl], "′"
; get weight
	pop af ; bank
	pop hl ; ptr
	inc hl
	inc hl
	call GetFarWord
	ld a, h
	ld [wPoisonStepCount], a ; weight ptr, 2 bytes
	ld a, l
	ld [wPoisonStepCount + 1], a ; weight ptr, 2 bytes
	ld de, wPoisonStepCount ; weight ptr, 2 bytes
; 2 digit weight (actually 3, but we are cutting off decimal since it's always 0)
	ld a, h
	cp 3
	jr c, .normal_weight
	cp 4
	jr nc, .heavy_weight
	jr z, .heavy_weight
	ld a, l
	cp $e8
	jr c, .normal_weight
.heavy_weight	

	hlcoord 14, 15
	lb bc, 2, (3 << 4) | 4
	call PrintNum

	hlcoord 17, 15
	ld de, .String_pounds
	call PlaceString
	jr .done

; 3 digit weight (actually 4, but we are cutting off decimal since it's always 0)
.normal_weight	
	; Print the weight, with 3 of the 4 digits in front of the decimal point
	hlcoord 13, 15
	lb bc, 2, (3 << 4) | 4
	call PrintNum

	hlcoord 16, 15
	ld de, .String_pounds
	call PlaceString
.done	
	pop de
	pop bc
	pop hl	
	ret

.String_HeightWeight_blank:
	db "HT     ″ WT       @" ; HT  ?'??"
.String_pounds:
	db "lbs@"
