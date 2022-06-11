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
	db  75 percent + 1, KRABBY,     20
	db 100 percent,     time_group 0
.Shore_Super:
	db  25 percent,     KRABBY,     40
	db  50 percent,     time_group 1
	db  75 percent + 1, DONPHAN,    40
	db 100 percent,     KINGLER,    40
.Shore_Odd:
	db  25 percent,     time_group 0
	db  50 percent,     CHINCHOU,   19
	db  75 percent,     OMANYTE,    19
	db 100 percent,     KABUTO,     19

.Ocean_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     TENTACOOL,   8
.Ocean_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     TENTACOOL,  19
	db  75 percent + 1, CHINCHOU,   19
	db 100 percent,     time_group 2
.Ocean_Super:
	db  25 percent,     CHINCHOU,   40
	db  50 percent,     time_group 3
	db  75 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40
.Ocean_Odd:
	db  25 percent,     SLOWBRO,    19
	db  50 percent,     SLOWKING,   19
	db  75 percent,     OMANYTE,    19
	db 100 percent,     KABUTO,     19

.Lake_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     GOLDEEN,     8
.Lake_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     GOLDEEN,    19
	db  75 percent + 1, GOLDEEN,    20
	db 100 percent,     time_group 4
.Lake_Super:
	db  25 percent,     GOLDEEN,    40
	db  50 percent,     time_group 5
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     SEAKING,    40
.Lake_Odd:
	db  40 percent,     SLOWPOKE,   19
	db  80 percent,     PSYDUCK,    19
	db  90 percent,     FARFETCH_D, 19
	db 100 percent,     CROCONAW,   19

.Pond_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     POLIWAG,     8
.Pond_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     POLIWAG,    19
	db  75 percent + 1, POLIWAG,    20
	db 100 percent,     time_group 6
.Pond_Super:
	db  25 percent,     POLIWAG,    40
	db  50 percent,     time_group 7
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     POLIWAG,    42
.Pond_Odd:
	db  40 percent,     WOOPER,     19
	db  80 percent,     PSYDUCK,    19
	db  90 percent,     FARFETCH_D, 19
	db 100 percent,     WARTORTLE,  19

.Dratini_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Dratini_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     MAGIKARP,   20
	db  75 percent + 1, GYARADOS,   19
	db 100 percent,     time_group 8
.Dratini_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 9
	db  75 percent + 1, GYARADOS,   40
	db 100 percent,     DRAGONAIR,  40
.Dratini_Odd:
	db  50 percent,     POLITOED,   19
	db  75 percent,     DRATINI,    19
	db 100 percent,     DRAGONAIR,  19

.Gyarados_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good:
	db  25 percent,     MAGIKARP,   18
	db  50 percent,     MAGIKARP,   19
	db  75 percent + 1, MAGIKARP,   20
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 15
	db  75 percent + 1, MAGIKARP,   42
	db 100 percent,     MAGIKARP,   37
.Gyarados_Odd:
	db  50 percent,     GYARADOS,   18
	db  75 percent,     GYARADOS,   19
	db 100 percent,     GYARADOS,   20

.Dratini_2_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good:
	db  25 percent,     MAGIKARP,   18
	db  50 percent,     MAGIKARP,   19
	db  75 percent + 1, MAGIKARP,   20
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  25 percent,     MAGIKARP,   40
	db  50 percent,     time_group 17
	db  75 percent + 1, MAGIKARP,   42
	db 100 percent,     DRAGONAIR,  40
.Dratini_2_Odd:
	db  50 percent,     POLITOED,   19
	db  75 percent,     DRATINI,    19
	db 100 percent,     DRAGONAIR,  19

.WhirlIslands_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, MAGIKARP,    9
	db 100 percent,     KRABBY,      8
.WhirlIslands_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     KRABBY,     19
	db  75 percent + 1, KRABBY,     20
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  25 percent,     KRABBY,     40
	db  50 percent,     time_group 19
	db  75 percent + 1, KINGLER,    40
	db 100 percent,     SEADRA,     40
.WhirlIslands_Odd:
	db  50 percent,     UNOWN,      24
	db  75 percent,     MARILL,     19
	db 100 percent,     LAPRAS,     19

.Qwilfish_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     TENTACOOL,   8
.Qwilfish_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     TENTACOOL,  19
	db  75 percent + 1, TENTACOOL,  20
	db 100 percent,     time_group 20
.Qwilfish_Super:
	db  25 percent,     TENTACOOL,  40
	db  50 percent,     time_group 21
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     QWILFISH,   40
.Qwilfish_Odd:
	db  20 percent,     time_group 20
	db 100 percent,     QWILFISH,   19

.Remoraid_Old:
	db  50 percent + 1, MAGIKARP,    8
	db  75 percent + 1, GEODUDE,     8
	db 100 percent,     POLIWAG,     8
.Remoraid_Good:
	db  25 percent,     MAGIKARP,   19
	db  50 percent,     POLIWAG,    19
	db  75 percent + 1, POLIWAG,    20
	db 100 percent,     time_group 6
.Remoraid_Super:
	db  25 percent,     POLIWAG,    40
	db  50 percent,     time_group 7
	db  75 percent + 1, MAGIKARP,   40
	db 100 percent,     REMORAID,   40
.Remoraid_Odd:
	db  50 percent,     REMORAID,   19
	db  75 percent,     OCTILLERY,  19
	db 100 percent,     QUAGSIRE,   19

TimeFishGroups:
	;  day              nite
	db CORSOLA,    19,  STARYU,     19 ; 0
	db CORSOLA,    40,  STARMIE,    40 ; 1
	db SHELLDER,   19,  CLOYSTER,   19 ; 2
	db CLOYSTER,   40,  SHELLDER,   40 ; 3
	db GOLDEEN,    19,  TANGELA,    19 ; 4
	db SEAKING,    40,  TANGELA,    40 ; 5
	db POLIWAG,    19,  GEODUDE,    19 ; 6
	db POLIWHIRL,  40,  POLITOED,   40 ; 7
	db DRATINI,    19,  DRAGONAIR,  19 ; 8
	db DRAGONAIR,  40,  DUNSPARCE,  40 ; 9
	db QWILFISH,   21,  QWILFISH,   19 ; 10
	db QWILFISH,   42,  QWILFISH,   40 ; 11
	db REMORAID,   19,  OCTILLERY,  19 ; 12
	db OCTILLERY,  40,  REMORAID,   40 ; 13
	db GYARADOS,   19,  GYARADOS,   21 ; 14
	db GYARADOS,   40,  GYARADOS,   42 ; 15
	db DRATINI,    19,  DRAGONAIR,  19 ; 16
	db DRATINI,    40,  DUNSPARCE,  40 ; 17
	db HORSEA,     19,  UNOWN,      24 ; 18
	db SEADRA,     40,  KINGDRA,    40 ; 19
	db TENTACOOL,  19,  GRIMER,     19 ; 20
	db TENTACRUEL, 40,  MUK,        40 ; 21
