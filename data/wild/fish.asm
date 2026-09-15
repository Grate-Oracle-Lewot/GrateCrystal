time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod, odd rod
	db \1
	dw \2, \3, \4, \5
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .BugContest_Old,       .BugContest_Good,       .BugContest_Super,       .BugContest_Odd
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super,             .Pond_Odd
	fishgroup 50 percent + 1, .Lagoon_Old,           .Lagoon_Good,           .Lagoon_Super,           .Lagoon_Odd
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super,             .Lake_Odd
	fishgroup 50 percent + 1, .Stream_Old,           .Stream_Good,           .Stream_Super,           .Stream_Odd
	fishgroup 50 percent + 1, .River_Old,            .River_Good,            .River_Super,            .River_Odd
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super,            .Shore_Odd
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super,            .Ocean_Odd
	fishgroup 50 percent + 1, .Cove_Old,             .Cove_Good,             .Cove_Super,             .Cove_Odd
	fishgroup 50 percent + 1, .Spring_Old,           .Spring_Good,           .Spring_Super,           .Spring_Odd
	fishgroup 50 percent + 1, .Cenote_Old,           .Cenote_Good,           .Cenote_Super,           .Cenote_Odd
	assert_table_length NUM_FISHGROUPS

.BugContest_Old:
.BugContest_Good:
.BugContest_Super:
	db  40 percent,     KRABBY,      5
	db  80 percent,     KRABBY,     10
	db  90 percent + 1, KRABBY,     15
	db 100 percent,     SHUCKLE,    15

.BugContest_Odd:
	db  40 percent,     KABUTO,      8
	db  80 percent,     KABUTO,     15
	db  90 percent + 1, PINECO,      8
	db 100 percent,     PINECO,     15

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
if DEF(_LITTLE_CUP)
	db  90 percent + 1, PSYDUCK,    21
	db 100 percent,     SQUIRTLE,   21
else
	db  90 percent + 1, FARFETCH_D, 21
	db 100 percent,     WARTORTLE,  21
endc

.Lagoon_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     GOLDEEN,     8
.Lagoon_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     GOLDEEN,    19
	db  75 percent + 1, GOLDEEN,    21
	db 100 percent,     time_group 4
.Lagoon_Super:
	db  25 percent,     GOLDEEN,    40
	db  50 percent,     time_group 5
	db  75 percent + 1, MAGIKARP,   40
if DEF(_LITTLE_CUP)
	db 100 percent,     GOLDEEN,    40
else
	db 100 percent,     SEAKING,    40
endc
.Lagoon_Odd:
	db  40 percent,     SLOWPOKE,   23
	db  80 percent,     PSYDUCK,    23
if DEF(_LITTLE_CUP)
	db  90 percent + 1, PSYDUCK,    23
	db 100 percent,     TOTODILE,   23
else
	db  90 percent + 1, FARFETCH_D, 23
	db 100 percent,     CROCONAW,   23
endc

.Lake_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Lake_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     MAGIKARP,   20
	db  75 percent + 1, MAGIKARP,   21
	db 100 percent,     time_group 10
.Lake_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 11
	db  75 percent + 1, MAGIKARP,   42
	db 100 percent,     MAGIKARP,   37
.Lake_Odd:
if DEF(_LITTLE_CUP)
	db  50 percent + 1, MAGIKARP,   19
	db  75 percent + 1, MAGIKARP,   20
	db 100 percent,     MAGIKARP,   21
else
	db  50 percent + 1, GYARADOS,   19
	db  75 percent + 1, GYARADOS,   20
	db 100 percent,     GYARADOS,   21
endc

.Stream_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     POLIWAG,     8
.Stream_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     POLIWAG,    19
	db  75 percent + 1, POLIWAG,    21
	db 100 percent,     time_group 6
.Sream_Super:
	db  25 percent,     POLIWAG,    40
	db  50 percent,     time_group 7
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     REMORAID,   40
.Stream_Odd:
	db  50 percent + 1, REMORAID,   21
if DEF(_LITTLE_CUP)
	db  75 percent + 1, REMORAID,   21
	db 100 percent,     WOOPER,     21
else
	db  75 percent + 1, OCTILLERY,  21
	db 100 percent,     QUAGSIRE,   21
endc

.River_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     TENTACOOL,   8
.River_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     TENTACOOL,  19
	db  75 percent + 1, TENTACOOL,  21
	db 100 percent,     time_group 16
.River_Super:
	db  25 percent,     TENTACOOL,  40
	db  50 percent,     time_group 17
	db  75 percent + 1, MAGIKARP,   40
if DEF(_LITTLE_CUP)
	db 100 percent,     GEODUDE,    40
else
	db 100 percent,     QWILFISH,   40
endc
.River_Odd:
	db  20 percent,     time_group 16
if DEF(_LITTLE_CUP)
	db 100 percent,     GEODUDE,    21
else
	db 100 percent,     QWILFISH,   21
endc

.Shore_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     KRABBY,      8
.Shore_Good:
	db  25 percent,     SEEL,       19
	db  50 percent,     KRABBY,     19
	db  75 percent + 1, KRABBY,     21
	db 100 percent,     time_group 0
.Shore_Super:
if DEF(_LITTLE_CUP)
	db  25 percent,     SEEL,       40
	db  50 percent,     time_group 1
	db  75 percent + 1, PHANPY,     40
	db 100 percent,     KRABBY,     40
else
	db  25 percent,     DEWGONG,    40
	db  50 percent,     time_group 1
	db  75 percent + 1, DONPHAN,    40
	db 100 percent,     KINGLER,    40
endc
.Shore_Odd:
	db  25 percent,     time_group 0
	db  50 percent,     CHINCHOU,   21
	db  75 percent + 1, OMANYTE,    21
	db 100 percent,     KABUTO,     21

.Ocean_Old:
	db  50 percent + 1, TENTACOOL,   8
	db  75 percent + 1, MAGIKARP,    8
	db 100 percent,     SEEL,        8
.Ocean_Good:
if DEF(_LITTLE_CUP)
	db  25 percent,     MAGIKARP,   19
else
	db  25 percent,     CASTAWEIGH, 19
endc
	db  50 percent,     TENTACOOL,  19
	db  75 percent + 1, CHINCHOU,   19
	db 100 percent,     time_group 2
.Ocean_Super:
if DEF(_LITTLE_CUP)
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 3
	db  75 percent + 1, TENTACOOL,  40
	db 100 percent,     CHINCHOU,   40
else
	db  25 percent,     CASTAWEIGH, 40
	db  50 percent,     time_group 3
	db  75 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40
endc
.Ocean_Odd:
if DEF(_LITTLE_CUP)
	db  25 percent,     SLOWPOKE,   28
	db  50 percent,     SLOWPOKE,   28
else
	db  25 percent,     SLOWBRO,    28
	db  50 percent,     SLOWKING,   28
endc
	db  75 percent + 1, OMANYTE,    28
	db 100 percent,     KABUTO,     28

.Cove_Old:
	db  50 percent + 1, MAGIKARP,    8
if DEF(_LITTLE_CUP)
	db  75 percent + 1, MAGIKARP,    8
else
	db  75 percent + 1, CASTAWEIGH,  8
endc
	db 100 percent,     KRABBY,      8
.Cove_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     KRABBY,     19
if DEF(_LITTLE_CUP)
	db  75 percent + 1, MAGIKARP,   19
else
	db  75 percent + 1, CASTAWEIGH, 19
endc
	db 100 percent,     time_group 14
.Cove_Super:
if DEF(_LITTLE_CUP)
	db  25 percent,     KRABBY,     40
	db  50 percent,     time_group 15
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     HORSEA,     40
else
	db  25 percent,     KINGLER,    40
	db  50 percent,     time_group 15
	db  75 percent + 1, CASTAWEIGH, 40
	db 100 percent,     SEADRA,     40
endc
.Cove_Odd:
if DEF(_LITTLE_CUP)
	db  50 percent + 1, SLOWPOKE,   24
	db  75 percent + 1, MARILL,     21
	db 100 percent,     SEEL,       21
else
	db  50 percent + 1, UNOWN,      24
	db  75 percent + 1, MARILL,     21
	db 100 percent,     LAPRAS,     21
endc

.Spring_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GOLDEEN,     8
	db 100 percent,     MAGIKARP,   10
.Spring_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     GOLDEEN,    19
if DEF(_LITTLE_CUP)
	db  75 percent + 1, MAGIKARP,   19
else
	db  75 percent + 1, GYARADOS,   19
endc
	db 100 percent,     time_group 8
.Spring_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 9
if DEF(_LITTLE_CUP)
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     DRATINI,    40
else
	db  75 percent + 1, GYARADOS,   40
	db 100 percent,     DRAGONAIR,  40
endc
.Spring_Odd:
if DEF(_LITTLE_CUP)
	db  50 percent + 1, POLIWAG,    21
	db  75 percent + 1, DRATINI,    21
	db 100 percent,     DRATINI,    21
else
	db  50 percent + 1, POLITOED,   21
	db  75 percent + 1, DRATINI,    21
	db 100 percent,     DRAGONAIR,  21
endc

.Cenote_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, HORSEA,      8
	db 100 percent,     MAGIKARP,   10
.Cenote_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     HORSEA,     19
	db  75 percent + 1, MAGIKARP,   21
	db 100 percent,     time_group 12
.Cenote_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 13
if DEF(_LITTLE_CUP)
	db  75 percent + 1, HORSEA,     40
	db 100 percent,     DRATINI,    40
else
	db  75 percent + 1, SEADRA,     40
	db 100 percent,     DRAGONAIR,  40
endc
.Cenote_Odd:
if DEF(_LITTLE_CUP)
	db  25 percent,     REMORAID,   23
	db  50 percent,     MAGIKARP,   23
	db  75 percent + 1, DRATINI,    23
	db 100 percent,     DRATINI,    23
else
	db  25 percent,     OCTILLERY,  23
	db  50 percent,     CASTAWEIGH, 23
	db  75 percent + 1, DRATINI,    23
	db 100 percent,     DRAGONAIR,  23
endc

TimeFishGroups:
	;  day              nite
if DEF(_LITTLE_CUP)
	db POLIWAG,    20,  GEODUDE,    20 ;  0
	db POLIWAG,    40,  POLIWAG,    40 ;  1
	db GOLDEEN,    20,  SUNKERN,    20 ;  2
	db GOLDEEN,    40,  SUNKERN,    40 ;  3
	db MAGIKARP,   19,  MAGIKARP,   21 ;  4
	db MAGIKARP,   40,  MAGIKARP,   42 ;  5
	db TENTACOOL,  20,  GRIMER,     20 ;  6
	db TENTACOOL,  40,  GRIMER,     40 ;  7
	db GEODUDE,    20,  STARYU,     20 ;  8
	db GEODUDE,    40,  STARYU,     40 ;  9
	db SHELLDER,   20,  SHELLDER,   20 ; 10
	db SHELLDER,   40,  MAGIKARP,   40 ; 11
	db HORSEA,     20,  SLOWPOKE,   24 ; 12
	db HORSEA,     40,  HORSEA,     40 ; 13
	db DRATINI,    20,  DRATINI,    20 ; 14
	db DRATINI,    40,  DRATINI,    40 ; 15
	db DRATINI,    20,  DRATINI,    20 ; 16
	db DRATINI,    40,  DRATINI,    40 ; 17
else
	db POLIWAG,    20,  GEODUDE,    20 ;  0
	db POLIWHIRL,  40,  POLITOED,   40 ;  1
	db GOLDEEN,    20,  TANGELA,    20 ;  2
	db SEAKING,    40,  TANGELA,    40 ;  3
	db GYARADOS,   19,  GYARADOS,   21 ;  4
	db GYARADOS,   40,  GYARADOS,   42 ;  5
	db TENTACOOL,  20,  GRIMER,     20 ;  6
	db TENTACRUEL, 40,  MUK,        40 ;  7
	db CORSOLA,    20,  STARYU,     20 ;  8
	db CORSOLA,    40,  STARMIE,    40 ;  9
	db SHELLDER,   20,  CLOYSTER,   20 ; 10
if DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS)
	db CLOYSTER,   40,  TURBIN,     40 ; 11
else
	db CLOYSTER,   40,  CASTAWEIGH, 40 ; 11
endc
	db HORSEA,     20,  UNOWN,      24 ; 12
	db SEADRA,     40,  KINGDRA,    40 ; 13
	db DRATINI,    20,  DRAGONAIR,  20 ; 14
	db DRAGONAIR,  40,  DUNSPARCE,  40 ; 15
	db DRAGONAIR,  20,  DRATINI,    20 ; 16
	db DRATINI,    40,  DUNSPARCE,  40 ; 17
endc

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
	dw Group11_Name
	assert_table_length NUM_FISHGROUPS + 1 ; to include NONE group

Group0_Name:
	db "NONE@"
Group1_Name:
	db "CONTEST@"
Group2_Name:
	db "POND@"
Group3_Name:
	db "LAGOON@"
Group4_Name:
	db "LAKE@"
Group5_Name:
	db "STREAM@"
Group6_Name:
	db "RIVER@"
Group7_Name:
	db "SHORE@"
Group8_Name:
	db "OCEAN@"
Group9_Name:
	db "COVE@"
Group10_Name:
	db "SPRING@"
Group11_Name:
	db "CENOTE@"

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
	; ptr to fishgroup name is in de

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
