FruitTreeScript::
	callasm GetCurTreeFruit
	opentext
	readmem wCurFruit
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext FruitBearingTreeText
	promptbutton
	callasm TryResetFruitTrees
	callasm CheckFruitTree
	iffalse .fruit
	writetext NothingHereText
	sjump .end1

.fruit
	writetext HeyItsFruitText
	callasm GetFruitTreeCount
	ifequal 2, .try_two
	ifequal 3, .try_three
	ifequal 4, .try_four
	ifequal 5, .try_five
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, 6
	iffalse .try_five
	promptbutton
	writetext Obtained6FruitText
	sjump .continue
.try_five
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, 5
	iffalse .try_four
	promptbutton
	writetext Obtained5FruitText
	sjump .continue
.try_four
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, 4
	iffalse .try_three
	promptbutton
	writetext Obtained4FruitText
	sjump .continue
.try_three
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, 3
	iffalse .try_two
	promptbutton
	writetext Obtained3FruitText
	sjump .continue
.try_two
	readmem wCurFruit
	giveitem ITEM_FROM_MEM, 2
	iffalse .try_one
	promptbutton
	writetext Obtained2FruitText
	sjump .continue
.try_one
	readmem wCurFruit
	giveitem ITEM_FROM_MEM
	iffalse .packisfull
	promptbutton
	writetext ObtainedFruitText
.continue
	callasm PickedFruitTree
	specialsound
	itemnotify
	sjump .end2

.packisfull
	promptbutton
	writetext FruitPackIsFullText
.end1
	waitbutton
.end2
	closetext
	end

GetCurTreeFruit:
	ld a, [wCurFruitTree]
	dec a
	call GetFruitTreeItem
	ld [wCurFruit], a
	ret

TryResetFruitTrees:
	ld hl, wDailyFlags1
	bit DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret nz
	; fallthrough

ResetFruitTrees:
	xor a
	ld hl, wFruitTreeFlags
rept (NUM_FRUIT_TREES + 7) / 8 - 1
	ld [hli], a
endr
	ld [hl], a
	ld hl, wDailyFlags1
	set DAILYFLAGS1_ALL_FRUIT_TREES_F, [hl]
	ret

CheckFruitTree:
	ld b, 2
	call GetFruitTreeFlag
	ld a, c
	ld [wScriptVar], a
	ret

PickedFruitTree:
	farcall StubbedTrainerRankings_FruitPicked
	ld b, 1
	; fallthrough

GetFruitTreeFlag:
	push hl
	push de
	ld a, [wCurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, wFruitTreeFlags
	call FlagAction
	pop de
	pop hl
	ret

GetFruitTreeItem:
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, FruitTreeItems
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

GetFruitTreeCount:
; return 2-6 in a
	ld a, 5
	call RandomRange
	inc a
	inc a
	ld [wScriptVar], a
	ret

INCLUDE "data/items/fruit_trees.asm"

FruitBearingTreeText:
	text_far _FruitBearingTreeText
	text_end

HeyItsFruitText:
	text_far _HeyItsFruitText
	text_end

ObtainedFruitText:
	text_far _ObtainedFruitText
	text_end

Obtained2FruitText:
	text_far _Obtained2FruitText
	text_end

Obtained3FruitText:
	text_far _Obtained3FruitText
	text_end

Obtained4FruitText:
	text_far _Obtained4FruitText
	text_end

Obtained5FruitText:
	text_far _Obtained5FruitText
	text_end

Obtained6FruitText:
	text_far _Obtained6FruitText
	text_end

FruitPackIsFullText:
	text_far _FruitPackIsFullText
	text_end

NothingHereText:
	text_far _NothingHereText
	text_end
