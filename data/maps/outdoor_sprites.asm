; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to MAPGROUP_* constants
	table_width 2, OutdoorSprites
	dw CableClubGroupSprites    ;  1
	dw PalletGroupSprites       ;  2
	dw ViridianGroupSprites     ;  3
	dw PewterGroupSprites       ;  4
	dw CeruleanGroupSprites     ;  5
	dw VermilionGroupSprites    ;  6
	dw LavenderGroupSprites     ;  7
	dw CeladonGroupSprites      ;  8
	dw FuchsiaGroupSprites      ;  9
	dw SafariGroupSprites       ; 10
	dw SaffronInnerGroupSprites ; 11
	dw SaffronOuterGroupSprites ; 12
	dw CinnabarGroupSprites     ; 13
	dw IndigoGroupSprites       ; 14
	dw SilverGroupSprites       ; 15
	dw NewBarkGroupSprites      ; 16
	dw CherrygroveGroupSprites  ; 17
	dw VioletGroupSprites       ; 18
	dw AzaleaGroupSprites       ; 19
	dw GoldenrodGroupSprites    ; 20
	dw EcruteakGroupSprites     ; 21
	dw OlivineGroupSprites      ; 22
	dw CianwoodGroupSprites     ; 23
	dw MahoganyGroupSprites     ; 24
	dw LakeOfRageGroupSprites   ; 25
	dw BlackthornGroupSprites   ; 26
	dw FastShipGroupSprites     ; 27
	dw DungeonsGroupSprites     ; 28
	assert_table_length NUM_MAP_GROUPS

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end

; Route1 and ViridianCity are connected
; Route2 and PewterCity are connected
; PalletTown and Route21 are connected
PalletGroupSprites:
; Route1, PalletTown
ViridianGroupSprites:
; Route2, Route22, ViridianCity, ViridianForest
PewterGroupSprites:
; Route3, PewterCity
CinnabarGroupSprites:
; Route19, Route20, Route21, CinnabarIsland
	db SPRITE_FISHING_GURU
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_SAGE
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_LASS
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GUY
	; max 9 of 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_ROCK
	db SPRITE_OFFICER
	db SPRITE_BLUE
	db SPRITE_WILL
	db SPRITE_POKE_BALL
	db 0 ; end

; CeruleanCity and Route5 are connected
CeruleanGroupSprites:
; Route4, Route9, Route10North, Route24, Route25, CeruleanCity
SaffronOuterGroupSprites:
; Route5
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_BUG_CATCHER
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKET
	db SPRITE_MISTY
	; max 9 of 9 walking sprites
	db SPRITE_SLOWPOKE
	db SPRITE_BRUNO
	db SPRITE_POKE_BALL
	db 0 ; end

; Route12 is connected to both Route11 and Route13
VermilionGroupSprites:
; Route6, Route11, VermilionCity
LavenderGroupSprites:
; Route8, Route12, Route10South, LavenderTown
FuchsiaGroupSprites:
; Route13, Route14, Route15, Route18, FuchsiaCity
	db SPRITE_POKEFAN_M
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_BIKER
	db SPRITE_BUG_CATCHER
	db SPRITE_BUGSY
	; 9 of max 9 walking sprites
	db SPRITE_BIG_SNORLAX
	db SPRITE_FRUIT_TREE
	db SPRITE_MACHOP
	db SPRITE_ROCK
	db SPRITE_POKE_BALL
	db 0 ; end

SafariGroupSprites:
; Safari Zone
	db SPRITE_BIRD
	db SPRITE_SURF
	; 2 of max 9 walking sprites
	db SPRITE_CHANSEY
	db SPRITE_FLOWER
	db SPRITE_FISH
	db SPRITE_SUDOWOODO
	db SPRITE_POKE_BALL
	db 0 ; end

SaffronInnerGroupSprites:
; SaffronCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_POKEFAN_M
	db SPRITE_FISHER
	db SPRITE_YELLOW_PIKACHU
	; max 7 of 9 walking sprites
	db 0 ; end

CeladonGroupSprites:
; Route7, Route16, Route17, CeladonCity
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BIKER
	db SPRITE_OFFICER
	db SPRITE_GRANNY
	db SPRITE_CHRIS_BIKE
	; 8 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_POLIWAG
	db SPRITE_POKE_BALL
	db 0 ; end

IndigoGroupSprites:
; Route23
	db SPRITE_BLACK_BELT
	db SPRITE_OFFICER
	; 2 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

SilverGroupSprites:
; Route28, SilverCaveOutside
	db SPRITE_BEAUTY
	db SPRITE_EUSINE
	db SPRITE_BIKER
	db SPRITE_SWIMMER_GIRL
	; 3 of max 9 walking sprites
	db SPRITE_POKE_BALL
	db 0 ; end

; Route29 and CherrygroveCity are connected
NewBarkGroupSprites:
; Route26, Route27, Route29, NewBarkTown
CherrygroveGroupSprites:
; Route30, Route31, CherrygroveCity
	db SPRITE_SILVER
	db SPRITE_TEACHER
	db SPRITE_BEAUTY
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_YOUNGSTER
	db SPRITE_GRAMPS
	db SPRITE_FISHING_GURU
	db SPRITE_LASS
	; max 9 of 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_MONSTER
	db SPRITE_MONSTER_BACK
	db SPRITE_POKE_BALL
	db 0 ; end

; Route37 and EcruteakCity are connected
VioletGroupSprites:
; Route32, Route35, Route36, Route37, VioletCity
EcruteakGroupSprites:
; EcruteakCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_FISHING_GURU
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BUG_CATCHER
	db SPRITE_SUPER_NERD
	db SPRITE_GENTLEMAN
	; 9 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_TWIN
	db SPRITE_OFFICER
	db SPRITE_SUDOWOODO
	db SPRITE_POKE_BALL
	db SPRITE_SUICUNE
	db 0 ; end

AzaleaGroupSprites:
; Route33, AzaleaTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_TEACHER
	db SPRITE_ROCKET
	db SPRITE_SILVER
	db SPRITE_LASS
	db SPRITE_BEAUTY
	; 8 of max 9 walking sprites
	db SPRITE_KURT
	db SPRITE_FRUIT_TREE
	db SPRITE_SLOWPOKE
	db 0 ; end

GoldenrodGroupSprites:
; Route34, GoldenrodCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_OFFICER
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_ROCKET
	db SPRITE_LASS
	db SPRITE_UNUSED_GUY
	; 8 of max 9 walking sprites
	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_POKE_BALL
	db 0 ; end

; OlivineCity and Route40 are connected
OlivineGroupSprites:
; Route38, Route39, OlivineCity
CianwoodGroupSprites:
; Route40, Route41, CianwoodCity, BattleTowerOutside
	db SPRITE_SILVER
	db SPRITE_SWIMMER_GUY
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_BEAUTY
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SAILOR
	db SPRITE_POKEFAN_F
	db SPRITE_EUSINE
	; 9 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_YOUNGSTER
	db SPRITE_BUG_CATCHER
	db SPRITE_TAUROS
	db SPRITE_ROCK
	db SPRITE_POKE_BALL
	db SPRITE_SUICUNE
	db 0 ; end

MahoganyGroupSprites:
; Route42, Route44, MahoganyTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	; 8 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_EKANS
	db SPRITE_POKE_BALL
	db SPRITE_SUICUNE
	db 0 ; end

LakeOfRageGroupSprites:
; Route43, LakeOfRage
	db SPRITE_LANCE
	db SPRITE_GRAMPS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_LASS
	db SPRITE_YOUNGSTER
	; 8 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_GYARADOS
	db SPRITE_POKE_BALL
	db 0 ; end

BlackthornGroupSprites:
; Route45, Route46, BlackthornCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_BLACK_BELT
	db SPRITE_COOLTRAINER_F
	; 8 of max 9 walking sprites
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

FastShipGroupSprites:
; OlivinePort, VermilionPort, MountMoonSquare, TinTowerRoof
	db SPRITE_SAILOR
	db SPRITE_FISHING_GURU
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_FAIRY
	; 6 of max 9 walking sprites
	db SPRITE_ROCK
	db SPRITE_HO_OH
	db 0 ; end

DungeonsGroupSprites:
; NationalPark, NationalParkBugContest, RuinsOfAlphOutside
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	db SPRITE_YOUNGSTER
	db SPRITE_POKEFAN_M
	db SPRITE_SCIENTIST
	db SPRITE_FISHING_GURU
	db SPRITE_COOLTRAINER_F
	db SPRITE_BUG_CATCHER
	; 9 of max 9 walking sprites
	db SPRITE_ROCKER
	db SPRITE_GAMEBOY_KID
	db SPRITE_GROWLITHE
	db SPRITE_POKE_BALL
	db SPRITE_BOULDER
	db 0 ; end
