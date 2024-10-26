time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod, odd rod
	db \1
	dw \2, \3, \4, \5
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super,            .Shore_Odd
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super,            .Ocean_Odd
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super,             .Lake_Odd
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super,             .Pond_Odd
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super,          .Dratini_Odd
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super,         .Gyarados_Odd
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super,        .Dratini_2_Odd
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super,     .WhirlIslands_Odd
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super,         .Qwilfish_Odd
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super,         .Remoraid_Odd
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     KRABBY,      8
.Shore_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     KRABBY,     19
	db  75 percent + 1, KRABBY,     21
	db 100 percent,     time_group 0
.Shore_Super:
	db  25 percent,     KRABBY,     40
	db  50 percent,     time_group 1
	db  75 percent + 1, DONPHAN,    40
	db 100 percent,     KINGLER,    40
.Shore_Odd:
	db  25 percent,     time_group 0
	db  50 percent,     CHINCHOU,   21
	db  75 percent + 1, OMANYTE,    21
	db 100 percent,     KABUTO,     21

.Ocean_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     TENTACOOL,   8
.Ocean_Good:
	db  25 percent,     CASTAWEIGH, 19
	db  50 percent,     TENTACOOL,  19
	db  75 percent + 1, CHINCHOU,   19
	db 100 percent,     time_group 2
.Ocean_Super:
	db  25 percent,     CASTAWEIGH, 40
	db  50 percent,     time_group 3
	db  75 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40
.Ocean_Odd:
	db  25 percent,     SLOWBRO,    28
	db  50 percent,     SLOWKING,   28
	db  75 percent + 1, OMANYTE,    28
	db 100 percent,     KABUTO,     28

.Lake_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     GOLDEEN,     8
.Lake_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     GOLDEEN,    19
	db  75 percent + 1, GOLDEEN,    21
	db 100 percent,     time_group 4
.Lake_Super:
	db  25 percent,     GOLDEEN,    40
	db  50 percent,     time_group 5
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     SEAKING,    40
.Lake_Odd:
	db  40 percent,     SLOWPOKE,   23
	db  80 percent,     PSYDUCK,    23
	db  90 percent + 1, FARFETCH_D, 23
	db 100 percent,     CROCONAW,   23

.Pond_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     POLIWAG,     8
.Pond_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     POLIWAG,    19
	db  75 percent + 1, POLIWAG,    21
	db 100 percent,     time_group 6
.Pond_Super:
	db  25 percent,     POLIWAG,    40
	db  50 percent,     time_group 7
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     POLIWAG,    42
.Pond_Odd:
	db  40 percent,     WOOPER,     21
	db  80 percent,     PSYDUCK,    21
	db  90 percent + 1, FARFETCH_D, 21
	db 100 percent,     WARTORTLE,  21

.Dratini_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Dratini_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     MAGIKARP,   21
	db  75 percent + 1, GYARADOS,   19
	db 100 percent,     time_group 8
.Dratini_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 9
	db  75 percent + 1, GYARADOS,   40
	db 100 percent,     DRAGONAIR,  40
.Dratini_Odd:
	db  50 percent + 1, POLITOED,   21
	db  75 percent + 1, DRATINI,    21
	db 100 percent,     DRAGONAIR,  21

.Gyarados_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     MAGIKARP,   20
	db  75 percent + 1, MAGIKARP,   21
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 15
	db  75 percent + 1, MAGIKARP,   42
	db 100 percent,     MAGIKARP,   37
.Gyarados_Odd:
	db  50 percent + 1, GYARADOS,   19
	db  75 percent + 1, GYARADOS,   20
	db 100 percent,     GYARADOS,   21

.Dratini_2_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     MAGIKARP,   20
	db  75 percent + 1, MAGIKARP,   21
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 17
	db  75 percent + 1, MAGIKARP,   42
	db 100 percent,     DRAGONAIR,  40
.Dratini_2_Odd:
	db  25 percent,     OCTILLERY,  23
	db  50 percent,     CASTAWEIGH, 23
	db  75 percent + 1, DRATINI,    23
	db 100 percent,     DRAGONAIR,  23

.WhirlIslands_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, CASTAWEIGH,  8
	db 100 percent,     KRABBY,      8
.WhirlIslands_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     KRABBY,     19
	db  75 percent + 1, CASTAWEIGH, 19
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  25 percent,     KINGLER,    40
	db  50 percent,     time_group 19
	db  75 percent + 1, CASTAWEIGH, 40
	db 100 percent,     SEADRA,     40
.WhirlIslands_Odd:
	db  50 percent + 1, UNOWN,      24
	db  75 percent + 1, MARILL,     21
	db 100 percent,     LAPRAS,     21

.Qwilfish_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     TENTACOOL,   8
.Qwilfish_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     TENTACOOL,  19
	db  75 percent + 1, TENTACOOL,  21
	db 100 percent,     time_group 20
.Qwilfish_Super:
	db  25 percent,     TENTACOOL,  40
	db  50 percent,     time_group 21
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     QWILFISH,   40
.Qwilfish_Odd:
	db  20 percent,     time_group 20
	db 100 percent,     QWILFISH,   21

.Remoraid_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     POLIWAG,     8
.Remoraid_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     POLIWAG,    19
	db  75 percent + 1, POLIWAG,    21
	db 100 percent,     time_group 6
.Remoraid_Super:
	db  25 percent,     POLIWAG,    40
	db  50 percent,     time_group 7
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     REMORAID,   40
.Remoraid_Odd:
	db  50 percent + 1, REMORAID,   21
	db  75 percent + 1, OCTILLERY,  21
	db 100 percent,     QUAGSIRE,   21

TimeFishGroups:
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ;  0
	db CORSOLA,    40,  STARMIE,    40 ;  1
	db SHELLDER,   20,  CLOYSTER,   20 ;  2
	db CLOYSTER,   40,  CASTAWEIGH, 40 ;  3
	db GOLDEEN,    20,  TANGELA,    20 ;  4
	db SEAKING,    40,  TANGELA,    40 ;  5
	db POLIWAG,    20,  GEODUDE,    20 ;  6
	db POLIWHIRL,  40,  POLITOED,   40 ;  7
	db DRATINI,    20,  DRAGONAIR,  20 ;  8
	db DRAGONAIR,  40,  DUNSPARCE,  40 ;  9
	db QWILFISH,   21,  QWILFISH,   19 ; 10
	db QWILFISH,   42,  QWILFISH,   40 ; 11
	db REMORAID,   20,  OCTILLERY,  20 ; 12
	db OCTILLERY,  40,  REMORAID,   40 ; 13
	db GYARADOS,   19,  GYARADOS,   21 ; 14
	db GYARADOS,   40,  GYARADOS,   42 ; 15
	db DRAGONAIR,  20,  DRATINI,    20 ; 16
	db DRATINI,    40,  DUNSPARCE,  40 ; 17
	db HORSEA,     20,  UNOWN,      24 ; 18
	db SEADRA,     40,  KINGDRA,    40 ; 19
	db TENTACOOL,  20,  GRIMER,     20 ; 20
	db TENTACRUEL, 40,  MUK,        40 ; 21

FishGroups_Names::
	table_width 2, FishGroups_Names
	dw Group0_Name
	dw Group1_Name
	dw Group2_Name
	dw Group3_Name
	dw Group4_Name
	dw Group5_Name
	dw Group6_Name
	dw Group7_Name
	dw Group8_Name
	dw Group9_Name
	dw Group10_Name
	assert_table_length NUM_FISHGROUPS + 1 ; to include NONE group

Group0_Name:
	db "NONE@"
Group1_Name:
	db "SHORE@"
Group2_Name:
	db "OCEAN@"
Group3_Name:
	db "LAGOON@"
Group4_Name:
	db "POND@"
Group5_Name:
	db "SPRING@"
Group6_Name:
	db "LAKE@"
Group7_Name:
	db "CENOTE@"
Group8_Name:
	db "COVE@"
Group9_Name:
	db "RIVER@"
Group10_Name:
	db "STREAM@"

GetFishGroupName:
; given fishing group num in 'a'
; return str ptr in 'de'
	add a ; doubles the index since ptrs are 2 bytes
	ld hl, FishGroups_Names
	ld d, 0
	ld e, a
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

GetMapsFishGroup::
	dec d ; map num
	dec e ; map group
	push de
	ld d, 0
	; 'e' is the map group
	ld hl, MapGroupPointers
	add hl, de ; since ptrs are 2 bytes, double the index
	add hl, de
	ld a, BANK(MapGroupPointers)
	call GetFarWord
	pop de
	ld a, d ; map num becomes the index, do the same as map group
	ld bc, MAP_LENGTH
	; hl is pointing to map group ptr
	call AddNTimes ;  Add bc * a to hl.
	; fish group is the very last byte in the entry
	ld bc, MAP_LENGTH - 1
	add hl, bc
	ld a, BANK(MapGroupPointers)
	call GetFarByte
	jp GetFishGroupName
	; ptr to fishgroup name is in de
