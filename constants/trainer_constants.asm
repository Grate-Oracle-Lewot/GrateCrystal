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

	trainerclass A_D ; 09
	const A_D1

	trainerclass LUCAS ; 0a
	const LUCAS1

	trainerclass PERCY ; 0b
	const PERCY1

	trainerclass GRATE_ORACLE ; 0c
	const LEWOT1
	const LEWOT2

	trainerclass KAREN ; 0d
	const KAREN1

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

	trainerclass KOGA ; 16
	const KOGA1

; Start of Kanto Champion music

	trainerclass WILL ; 17
	const WILL1

	trainerclass BRUNO ; 18
	const BRUNO1

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
; End of boss music for inverse/neutral battles

	trainerclass AEROBONES ; 20
	const AEROBONES1

	trainerclass KABUBONES ; 21
	const KABUBONES1

	trainerclass MISSINGNO_T ; 22
	const MISSINGNO_T1

; Start of normal trainer music (region-dependent)

	trainerclass COOLTRAINERM ; 23
	const NICK
	const GAVEN1
	const GAVEN2
	const GAVEN3
	const ERICK
	const ANDY
	const TYLER
	const AARON
	const ALLEN
	const RYAN
	const PAUL
	const CODY
	const MIKE
	const BLAKE
	const BRIAN
	const JAKE
	const STEVE
	const DARIN
	const SEAN
	const KEVIN
	const BUZZ
	const TEAL

	trainerclass COOLTRAINERF ; 24
	const IRENE
	const JENN
	const KATE
	const REENA1
	const REENA2
	const REENA3
	const BETH1
	const BETH2
	const BETH3
	const LOIS
	const GWEN
	const EMMA
	const CYBIL
	const KELLY
	const LOLA
	const FRAN
	const CARA
	const MEGAN
	const JOYCE
	const CAROL
	const QUINN
	const STELLA
	const AZURE

	trainerclass CAL ; 25
	const CAL1 ; party is never read; data read from sMysteryGiftTrainer instead
	const IGGY
	const FRED

	trainerclass CAL_F ; 26
	const CAL_F1 ; unused
	const CALLA

	trainerclass MYSTIC ; 27
	const EUSINE
	const OLIE
	const RICO
	const GROVER

	trainerclass ELDER ; 28
	const LI

	trainerclass OLD ; 29
	const MAN

	trainerclass YOUNGSTER ; 2a
	const JOEY1
	const JOEY2
	const JOEY3
	const JOEY4
	const JOEY5
	const MIKEY
	const ALBERT
	const GORDON
	const SAMUEL
	const IAN
	const OWEN
	const JASON
	const WARREN
	const JIMMY

	trainerclass SCHOOLBOY ; 2b
	const JACK1
	const JACK2
	const JACK3
	const JACK4
	const JACK5
	const ALAN1
	const ALAN2
	const ALAN3
	const ALAN4
	const ALAN5
	const CHAD1
	const CHAD2
	const CHAD3
	const CHAD4
	const CHAD5
	const KIPP
	const JOHNNY
	const TOMMY
	const BILLY
	const NATE
	const RICKY
	const DUDLEY
	const JOE
	const DANNY

	trainerclass BUG_CATCHER ; 2c
	const WADE1
	const WADE2
	const WADE3
	const WADE4
	const WADE5
	const ARNIE1
	const ARNIE2
	const ARNIE3
	const ARNIE4
	const ARNIE5
	const DON
	const BUG_CATCHER_BENNY
	const AL
	const JOSH
	const WAYNE
	const ROB
	const ED
	const KEN
	const DOUG
	const LOUIE

	trainerclass BIRD_KEEPER ; 2d
	const VANCE1
	const VANCE2
	const VANCE3
	const JOSE1
	const JOSE2
	const JOSE3
	const ABE
	const ROD
	const PETER
	const BRYAN
	const TOBY
	const THEO
	const DENIS
	const PERRY
	const BRET
	const ROY
	const BORIS
	const BOB
	const HANK

	trainerclass FISHER ; 2e
	const RALPH1
	const RALPH2
	const RALPH3
	const RALPH4
	const RALPH5
	const TULLY1
	const TULLY2
	const TULLY3
	const TULLY4
	const WILTON1
	const WILTON2
	const WILTON3
	const JUSTIN
	const HENRY
	const KYLE
	const MARVIN
	const RAYMOND
	const ANDRE
	const EDGAR
	const STEPHEN
	const MARTIN
	const JONAH
	const BARNEY
	const SCOTT
	const ARNOLD

	trainerclass HIKER ; 2f
	const ANTHONY1
	const ANTHONY2
	const ANTHONY3
	const ANTHONY4
	const ANTHONY5
	const PARRY1
	const PARRY2
	const PARRY3
	const DANIEL
	const RUSSELL
	const BAILEY
	const PHILLIP
	const LEONARD
	const BENJAMIN
	const ERIK
	const MICHAEL
	const TIMOTHY
	const NOLAND
	const TIM
	const SIDNEY
	const KENNY
	const JIM
	const HOUSTON

	trainerclass BIKER ; 30
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

	trainerclass FIREBREATHER ; 31
	const BILL
	const RAY
	const WALT
	const DICK
	const NED
	const SVEN
	const LYLE
	const OTIS
	const BURT
	const IROH

	trainerclass PSYCHIC_T ; 32
	const MARK
	const GREG
	const NORMAN
	const NATHAN
	const PHIL
	const MELVIN
	const GILBERT
	const RICHARD
	const FRANKLIN
	const HERMAN
	const FIDEL
	const JARED
	const RODNEY

	trainerclass BLACKBELT_T ; 33
	const KENJI
	const LUNG
	const YOSHI
	const LAO
	const NOB
	const JACKIE
	const BRUCE
	const KIYO
	const WAI

	trainerclass SAILOR ; 34
	const HUEY1
	const HUEY2
	const HUEY3
	const HUEY4
	const HARRY
	const EUGENE
	const TERRELL
	const KENT
	const ERNEST
	const JEFF
	const GARRETT
	const KENNETH
	const STANLY

	trainerclass JUGGLER ; 35
	const IRWIN1
	const IRWIN2
	const IRWIN3
	const FRITZ
	const HORTON
	const IRVING
	const DALTON
	const CYAN

	trainerclass SCIENTIST ; 36
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

	trainerclass SUPER_NERD ; 37
	const ERIC
	const TERU
	const MARKUS
	const GREGG
	const JAY
	const DAVE
	const STAN
	const HUGH
	const NORTON
	const SAM
	const TOM
	const PAT
	const SHAWN
	const RUSS
	const NEIL

	trainerclass POKEMANIAC ; 38
	const BRENT1
	const BRENT2
	const BRENT3
	const BRENT4
	const LARRY
	const ISSAC
	const DONALD
	const MILLER
	const SHANE
	const BEN
	const RON
	const ANDREW
	const CALVIN
	const ZACH
	const ETHAN
	const TANNER

	trainerclass GENTLEMAN ; 39
	const PRESTON
	const ALFRED
	const VIRGIL
	const EDWARD
	const GREGORY
	const SYLVAIN
	const NAVY

	trainerclass ENGINEER ; 3a
	const SMITH
	const BAILY
	const BERNIE
	const BRAXTON
	const DYLAN
	const CAMDEN
	const FLINT
	const ENRIQUE

	trainerclass GUITARIST ; 3b
	const JULES
	const CASEY
	const CLYDE
	const VINCENT
	const COBALT

	trainerclass OFFICER ; 3c
	const KEITH
	const DIRK
	const TUBBS
	const DISHER
	const LASSITER

	trainerclass BURGLAR ; 3d
	const FIZBO
	const DUNCAN
	const EDDIE
	const COREY
	const RAMON

	trainerclass GAMBLER ; 3e
	const LUCKY
	const HARVEY
	const ACE
	const HUCK
	const THOREAU
	const P_T
	const LIU_HAI

	trainerclass LASS ; 3f
	const DANA1
	const DANA2
	const DANA3
	const DANA4
	const DANA5
	const CARRIE
	const BRIDGET
	const KRISE
	const CONNIE
	const SHANNON
	const MICHELLE
	const LINDA
	const ALICE
	const LAURA
	const ELLEN
	const LUNA

	trainerclass TWINS ; 40
	const AMYANDMAY1
	const AMYANDMAY2
	const ANNANDANNE1
	const ANNANDANNE2
	const JOANDZOE1
	const JOANDZOE2
	const MEGANDPEG1
	const MEGANDPEG2
	const LEAANDPIA1
	const LEAANDPIA2

	trainerclass BEAUTY ; 41
	const BRENDA
	const VICTORIA
	const SAMANTHA
	const VALERIE
	const OLIVIA
	const JULIE
	const THERESA
	const JACLYN
	const CAROLINE
	const CASSIE
	const JULIA
	const BERYL
	const MAEVE

	trainerclass TEACHER ; 42
	const FRIZZLE
	const CALYPSO
	const COLETTE
	const HILLARY
	const SHIRLEY

	trainerclass KIMONO_GIRL ; 43
	const NAOKO
	const SAYO
	const ZUKI
	const KUNI
	const MIKI
	const KYOSHI

	trainerclass CAMPER ; 44
	const TODD1
	const TODD2
	const TODD3
	const TODD4
	const TODD5
	const ROLAND
	const IVAN
	const ELLIOT
	const TED
	const SPENCER
	const QUENTIN
	const LLOYD
	const BARRY
	const DEAN
	const SID
	const THOMAS
	const LEROY
	const DAVID
	const JOHN
	const JERRY

	trainerclass PICNICKER ; 45
	const LIZ1
	const LIZ2
	const LIZ3
	const LIZ4
	const LIZ5
	const GINA1
	const GINA2
	const GINA3
	const GINA4
	const GINA5
	const ERIN1
	const ERIN2
	const ERIN3
	const TIFFANY1
	const TIFFANY2
	const TIFFANY3
	const TIFFANY4
	const KIM
	const BROOKE
	const DEBRA
	const HEIDI
	const EDNA
	const TANYA
	const CINDY
	const HOPE
	const SHARON

	trainerclass POKEFANM ; 46
	const DEREK1
	const DEREK2
	const BRANDON
	const WILLIAM
	const REX
	const ALLAN
	const ROBERT
	const JOSHUA
	const ALEX
	const CARTER
	const TREVOR
	const JEREMY
	const COLIN

	trainerclass POKEFANF ; 47
	const BEVERLY
	const RUTH
	const JAIME
	const VI
	const GEORGIA

	trainerclass SAGE ; 48
	const NICO
	const CHOW
	const EDMOND
	const JIN
	const NEAL
	const TROY
	const PING
	const JEFFREY
	const GAKU
	const MASA
	const KOJI

	trainerclass MEDIUM ; 49
	const MARTHA
	const GRACE
	const REBECCA
	const DORIS
	const CHELL

	trainerclass SWIMMERM ; 4a
	const SIMON
	const RANDALL
	const CHARLIE
	const GEORGE
	const BERKE
	const KIRK
	const MATHEW
	const PARKER
	const JEROME
	const TUCKER
	const CAMERON
	const SETH
	const HAROLD
	const PHELPS

	trainerclass SWIMMERF ; 4b
	const ELAINE
	const PAULA
	const KAYLEE
	const SUSIE
	const DENISE
	const KARA
	const WENDY
	const DAWN
	const NICOLE
	const LORI
	const NIKKI
	const DIANA
	const BRIANA
	const BOBBI
	const MARY

	trainerclass BOARDER ; 4c
	const RONALD
	const BRAD
	const DOUGLAS
	const SVLAD

	trainerclass SKIER ; 4d
	const ROXANNE
	const CLARISSA
	const SKYE
	const MIKAELA

; Start of Rocket music

	trainerclass GRUNTM ; 4e
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

	trainerclass OUTLAW ; 53
	const GIOVANNI

NUM_TRAINER_CLASSES EQU __trainer_class__ - 1
