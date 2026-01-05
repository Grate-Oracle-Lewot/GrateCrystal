__trainer_class__ = 0

trainerclass: MACRO
\1 EQU __trainer_class__
__trainer_class__ += 1
	const_def 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
CHRIS EQU __trainer_class__
	trainerclass TRAINER_NONE ; 00
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA
NUM_NONTRAINER_PHONECONTACTS EQU const_value - 1

KRIS EQU __trainer_class__

; Start of Johto Gym Leader music

	trainerclass FALKNER ; 01
	const FALKNER1
	const FALKNER2

	trainerclass BUGSY ; 02
	const BUGSY1
	const BUGSY2

	trainerclass WHITNEY ; 03
	const WHITNEY1
	const WHITNEY2

	trainerclass MORTY ; 04
	const MORTY1
	const MORTY2

	trainerclass CHUCK ; 05
	const CHUCK1
	const CHUCK2

	trainerclass JASMINE ; 06
	const JASMINE1
	const JASMINE2

	trainerclass PRYCE ; 07
	const PRYCE1
	const PRYCE2

	trainerclass CLAIR ; 08
	const CLAIR1

	trainerclass WILL ; 09
	const WILL1

	trainerclass KOGA ; 0a
	const KOGA1

	trainerclass BRUNO ; 0b
	const BRUNO1

	trainerclass KAREN ; 0c
	const KAREN1
	const KAREN2

	trainerclass REAL_KAREN ; 0d
	const REAL_KAREN1

; Start of Kanto Gym Leader Music

	trainerclass BROCK ; 0e
	const BROCK1

	trainerclass MISTY ; 0f
	const MISTY1
	const MISTY2

	trainerclass LT_SURGE ; 10
	const LT_SURGE1
	const LT_SURGE2

	trainerclass ERIKA ; 11
	const ERIKA1
	const ERIKA2

	trainerclass JANINE ; 12
	const JANINE1
	const JANINE2

	trainerclass SABRINA ; 13
	const SABRINA1
	const SABRINA2

	trainerclass BLAINE ; 14
	const BLAINE1
	const BLAINE2

	trainerclass BLUE ; 15
	const BLUE1
	const BLUE2

	trainerclass REAL_KOGA ; 16
	const REAL_KOGA1

; Start of Kanto Champion music

	trainerclass REAL_WILL ; 17
	const REAL_WILL1

	trainerclass REAL_BRUNO ; 18
	const REAL_BRUNO1

	trainerclass LORELEI ; 19
	const LORELEI1

	trainerclass AGATHA ; 1a
	const AGATHA1

; Start of Johto Champion music

	trainerclass CHAMPION ; 1b
	const LANCE
	const LANCE2

	trainerclass POKEMON_PROF ; 1c
	const POKEMON_PROF1
	const POKEMON_PROF2

	trainerclass RED ; 1d
	const RED1
	const RED2

; Start of Rival music
; End of Gym victory music and happiness bonus

	trainerclass RIVAL1 ; 1e
	const RIVAL1_1_CHIKORITA
	const RIVAL1_1_CYNDAQUIL
	const RIVAL1_1_TOTODILE
	const RIVAL1_2_CHIKORITA
	const RIVAL1_2_CYNDAQUIL
	const RIVAL1_2_TOTODILE
	const RIVAL1_3_CHIKORITA
	const RIVAL1_3_CYNDAQUIL
	const RIVAL1_3_TOTODILE
	const RIVAL1_4_CHIKORITA
	const RIVAL1_4_CYNDAQUIL
	const RIVAL1_4_TOTODILE
	const RIVAL1_5_CHIKORITA
	const RIVAL1_5_CYNDAQUIL
	const RIVAL1_5_TOTODILE

	trainerclass RIVAL2 ; 1f
	const RIVAL2_1_CHIKORITA
	const RIVAL2_1_CYNDAQUIL
	const RIVAL2_1_TOTODILE
	const RIVAL2_2_CHIKORITA
	const RIVAL2_2_CYNDAQUIL
	const RIVAL2_2_TOTODILE

; Start of creepy music

	trainerclass AEROBONES ; 25
	const AEROBONES1

	trainerclass KABUBONES ; 26
	const KABUBONES1

	trainerclass MISSINGNO_T ; 27
	const MISSINGNO_T1

; Start of normal trainer music (region-dependent)

	trainerclass COOLTRAINERM ; 20
	const NICK
	const AARON
	const PAUL
	const CODY
	const MIKE
	const GAVEN1
	const GAVEN2
	const RYAN
	const JAKE
	const GAVEN3
	const BLAKE
	const BRIAN
	const ERICK
	const ANDY
	const TYLER
	const SEAN
	const KEVIN
	const STEVE
	const ALLEN
	const DARIN
	const TEAL
	const BUZZ

	trainerclass COOLTRAINERF ; 21
	const GWEN
	const LOIS
	const FRAN
	const LOLA
	const KATE
	const IRENE
	const KELLY
	const JOYCE
	const BETH1
	const REENA1
	const MEGAN
	const BETH2
	const CAROL
	const QUINN
	const EMMA
	const CYBIL
	const JENN
	const BETH3
	const REENA2
	const REENA3
	const CARA
	const AZURE
	const STELLA

	trainerclass CAL ; 22
	const CAL1 ; party is never read; data read from sMysteryGiftTrainer instead
	const IGGY
	const FRED

	trainerclass CAL_F ; 23
	const CAL_F1 ; unused
	const CALLA

	trainerclass MYSTICALMAN ; 24
	const EUSINE
	const RICO
	const OLIE
	const GROVER

	trainerclass OLD ; 28
	const MAN

	trainerclass YOUNGSTER ; 29
	const JOEY1
	const MIKEY
	const ALBERT
	const GORDON
	const SAMUEL
	const IAN
	const JOEY2
	const JOEY3
	const WARREN
	const JIMMY
	const OWEN
	const JASON
	const JOEY4
	const JOEY5

	trainerclass SCHOOLBOY ; 2a
	const JACK1
	const KIPP
	const ALAN1
	const JOHNNY
	const DANNY
	const TOMMY
	const DUDLEY
	const JOE
	const BILLY
	const CHAD1
	const NATE
	const RICKY
	const JACK2
	const JACK3
	const ALAN2
	const ALAN3
	const CHAD2
	const CHAD3
	const JACK4
	const JACK5
	const ALAN4
	const ALAN5
	const CHAD4
	const CHAD5

	trainerclass BUG_CATCHER ; 2b
	const DON
	const ROB
	const ED
	const WADE1
	const BUG_CATCHER_BENNY
	const AL
	const JOSH
	const ARNIE1
	const KEN
	const WADE2
	const WADE3
	const DOUG
	const ARNIE2
	const ARNIE3
	const WADE4
	const WADE5
	const ARNIE4
	const ARNIE5
	const WAYNE
	const LOUIE

	trainerclass BIRD_KEEPER ; 2c
	const ROD
	const ABE
	const BRYAN
	const THEO
	const TOBY
	const DENIS
	const VANCE1
	const HANK
	const ROY
	const BORIS
	const BOB
	const JOSE1
	const PETER
	const JOSE2
	const PERRY
	const BRET
	const JOSE3
	const VANCE2
	const VANCE3

	trainerclass FISHER ; 2d
	const JUSTIN
	const RALPH1
	const ARNOLD
	const KYLE
	const HENRY
	const MARVIN
	const TULLY1
	const ANDRE
	const RAYMOND
	const WILTON1
	const EDGAR
	const JONAH
	const MARTIN
	const STEPHEN
	const BARNEY
	const RALPH2
	const RALPH3
	const TULLY2
	const TULLY3
	const WILTON2
	const SCOTT
	const WILTON3
	const RALPH4
	const RALPH5
	const TULLY4

	trainerclass HIKER ; 2e
	const ANTHONY1
	const RUSSELL
	const PHILLIP
	const LEONARD
	const ANTHONY2
	const BENJAMIN
	const ERIK
	const MICHAEL
	const PARRY1
	const TIMOTHY
	const BAILEY
	const ANTHONY3
	const TIM
	const NOLAND
	const SIDNEY
	const KENNY
	const JIM
	const DANIEL
	const PARRY2
	const PARRY3
	const ANTHONY4
	const ANTHONY5
	const HOUSTON

	trainerclass BIKER ; 2f
	const BIKER_BENNY
	const KAZU
	const DWAYNE
	const HARRIS
	const ZEKE
	const CHARLES
	const RILEY
	const JOEL
	const GLENN
	const T_BONE

	trainerclass FIREBREATHER ; 30
	const OTIS
	const DICK
	const NED
	const BURT
	const BILL
	const WALT
	const RAY
	const LYLE
	const IROH
	const SVEN

	trainerclass PSYCHIC_T ; 31
	const NATHAN
	const FRANKLIN
	const HERMAN
	const FIDEL
	const GREG
	const NORMAN
	const MARK
	const PHIL
	const RICHARD
	const GILBERT
	const JARED
	const RODNEY
	const MELVIN

	trainerclass BLACKBELT_T ; 32
	const KENJI1
	const YOSHI
	const KENJI2
	const LAO
	const NOB
	const KIYO
	const LUNG
	const KENJI3
	const WAI

	trainerclass SAILOR ; 33
	const EUGENE
	const HUEY1
	const TERRELL
	const KENT
	const ERNEST
	const JEFF
	const GARRETT
	const KENNETH
	const STANLY
	const HARRY
	const HUEY2
	const HUEY3
	const HUEY4

	trainerclass JUGGLER ; 34
	const IRWIN1
	const FRITZ
	const HORTON
	const IRVING
	const DALTON
	const CYAN
	const IRWIN2
	const IRWIN3

	trainerclass SCIENTIST ; 35
	const ROSS
	const MITCH
	const JED
	const MARC
	const RICH
	const HEINZ
	const HIDEO
	const CONNOR
	const HEGEL
	const MENDEL
	const BEAU
	const TAYLOR
	const ELVIN
	const HIDEKI
	const SUGURU
	const TRAVIS

	trainerclass SUPER_NERD ; 36
	const ERIC
	const GREGG
	const JAY
	const DAVE
	const SAM
	const TOM
	const PAT
	const SHAWN
	const TERU
	const RUSS
	const NORTON
	const HUGH
	const MARKUS
	const STAN
	const NEIL

	trainerclass POKEMANIAC ; 37
	const LARRY
	const ANDREW
	const CALVIN
	const SHANE
	const BEN
	const BRENT1
	const RON
	const ETHAN
	const BRENT2
	const BRENT3
	const ISSAC
	const DONALD
	const ZACH
	const BRENT4
	const MILLER
	const TANNER

	trainerclass GENTLEMAN ; 38
	const PRESTON
	const EDWARD
	const GREGORY
	const VIRGIL
	const ALFRED
	const SYLVAIN
	const NAVY

	trainerclass ENGINEER ; 39
	const BAILY
	const BERNIE
	const BRAXTON
	const DYLAN
	const CAMDEN
	const FLINT
	const SMITH
	const ENRIQUE

	trainerclass GUITARIST ; 3a
	const CLYDE
	const VINCENT
	const JULES
	const CASEY
	const COBALT

	trainerclass OFFICER ; 3b
	const KEITH
	const DIRK
	const TUBBS
	const DISHER
	const LASSITER

	trainerclass BURGLAR ; 3c
	const DUNCAN
	const EDDIE
	const COREY
	const FIZBO
	const RAMON

	trainerclass GAMBLER ; 3d
	const LUCKY
	const HARVEY
	const ACE
	const HUCK
	const THOREAU
	const P_T
	const LIU_HAI

	trainerclass LASS ; 3e
	const CARRIE
	const BRIDGET
	const ALICE
	const KRISE
	const CONNIE
	const LINDA
	const LAURA
	const SHANNON
	const MICHELLE
	const DANA1
	const ELLEN
	const DANA2
	const DANA3
	const DANA4
	const DANA5
	const LUNA

	trainerclass TWINS ; 3f
	const AMYANDMAY1
	const ANNANDANNE1
	const ANNANDANNE2
	const AMYANDMAY2
	const JOANDZOE1
	const JOANDZOE2
	const MEGANDPEG1
	const MEGANDPEG2
	const LEAANDPIA1
	const LEAANDPIA2

	trainerclass BEAUTY ; 40
	const VICTORIA
	const SAMANTHA
	const JULIE
	const JACLYN
	const BRENDA
	const CASSIE
	const CAROLINE
	const JULIA
	const THERESA
	const VALERIE
	const OLIVIA
	const MAEVE
	const BERYL

	trainerclass TEACHER ; 41
	const COLETTE
	const HILLARY
	const SHIRLEY
	const FRIZZLE

	trainerclass KIMONO_GIRL ; 42
	const NAOKO
	const SAYO
	const ZUKI
	const KUNI
	const MIKI
	const KYOSHI

	trainerclass CAMPER ; 43
	const ROLAND
	const TODD1
	const IVAN
	const ELLIOT
	const BARRY
	const LLOYD
	const DEAN
	const SID
	const TED
	const TODD2
	const TODD3
	const THOMAS
	const LEROY
	const DAVID
	const JOHN
	const JERRY
	const SPENCER
	const TODD4
	const TODD5
	const QUENTIN

	trainerclass PICNICKER ; 44
	const LIZ1
	const GINA1
	const BROOKE
	const KIM
	const CINDY
	const HOPE
	const SHARON
	const DEBRA
	const GINA2
	const ERIN1
	const LIZ2
	const LIZ3
	const HEIDI
	const EDNA
	const GINA3
	const TIFFANY1
	const TIFFANY2
	const ERIN2
	const TANYA
	const TIFFANY3
	const ERIN3
	const LIZ4
	const LIZ5
	const GINA4
	const GINA5
	const TIFFANY4

	trainerclass POKEFANM ; 45
	const JOSHUA
	const WILLIAM
	const DEREK1
	const ROBERT
	const CARTER
	const TREVOR
	const BRANDON
	const JEREMY
	const COLIN
	const ALEX
	const REX
	const ALLAN
	const DEREK2

	trainerclass POKEFANF ; 46
	const BEVERLY1
	const RUTH
	const GEORGIA
	const JAIME
	const VI

	trainerclass SAGE ; 47
	const CHOW
	const NICO
	const JIN
	const TROY
	const JEFFREY
	const PING
	const EDMOND
	const NEAL
	const LI
	const GAKU
	const MASA
	const KOJI

	trainerclass MEDIUM ; 48
	const MARTHA
	const GRACE
	const REBECCA
	const DORIS
	const CHELL

	trainerclass SWIMMERM ; 49
	const HAROLD
	const SIMON
	const RANDALL
	const CHARLIE
	const GEORGE
	const BERKE
	const KIRK
	const MATHEW
	const JEROME
	const TUCKER
	const CAMERON
	const SETH
	const PARKER
	const PHELPS

	trainerclass SWIMMERF ; 4a
	const ELAINE
	const PAULA
	const KAYLEE
	const SUSIE
	const DENISE
	const KARA
	const WENDY
	const MARY
	const DAWN
	const NICOLE
	const LORI
	const NIKKI
	const DIANA
	const BRIANA
	const BOBBI

	trainerclass BOARDER ; 4b
	const RONALD
	const BRAD
	const DOUGLAS
	const SVLAD

	trainerclass SKIER ; 4c
	const ROXANNE
	const CLARISSA
	const SKYE
	const MIKAELA

; Start of Rocket music

	trainerclass GRUNTM ; 4d
	const GRUNTM_WELL1
	const GRUNTM_WELL2
	const GRUNTM_WELL3
	const GRUNTM_STRAY
	const GRUNTM_SENTRY1
	const GRUNTM_SENTRY2
	const GRUNTM_BASE1_1
	const GRUNTM_BASE1_2
	const GRUNTM_BASE2_1
	const GRUNTM_BASE2_2
	const GRUNTM_BASE2_3
	const GRUNTM_HYUCK1
	const GRUNTM_RADIO1
	const GRUNTM_RADIO2_1
	const GRUNTM_RADIO2_2
	const GRUNTM_SPECIALIST
	const GRUNTM_RADIO3_1
	const GRUNTM_RADIO3_2
	const GRUNTM_RADIO3_3
	const GRUNTM_BOUNCER
	const GRUNTM_UNDER1
	const GRUNTM_UNDER2
	const GRUNTM_UNDER3
	const GRUNTM_WARE1
	const GRUNTM_TRICKSTER
	const GRUNTM_HYUCK2
	const GRUNTM_RADIO4

	trainerclass GRUNTF ; 4f
	const GRUNTF_1
	const GRUNTF_2
	const GRUNTF_3
	const GRUNTF_4
	const GRUNTF_5

	trainerclass JESSIE ; 50
	const JAMES1
	const JAMES2
	const JAMES3

	trainerclass EXECUTIVEM ; 51
	const EXECUTIVEM_1
	const EXECUTIVEM_2
	const EXECUTIVEM_3
	const EXECUTIVEM_4

	trainerclass EXECUTIVEF ; 52
	const EXECUTIVEF_1
	const EXECUTIVEF_2

	trainerclass BOSS ; 53
	const GIOVANNI

NUM_TRAINER_CLASSES EQU __trainer_class__ - 1
