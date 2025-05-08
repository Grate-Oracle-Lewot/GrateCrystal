	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	def_scene_scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	sdefer .WalkUpToElm
.DummyScene:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_QUESTION, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ElmsLab_EndText:
	waitbutton
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	sjump ElmsLab_EndText

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	sjump ElmsLab_EndText

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
if DEF(_KANTO_STARTERS)
	pokepic BULBASAUR
	cry BULBASAUR
else
if DEF(_LETS_GO_STARTERS)
	pokepic PIKACHU
	cry PIKACHU
else
if DEF(_MOUSEKETEERS)
	pokepic PIKACHU
	cry PIKACHU
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	pokepic JYNX
	cry JYNX
else
if DEF(_HITMON_STARTERS)
	pokepic HITMONLEE
	cry HITMONLEE
else
if DEF(_NIDORAN_STARTERS)
	pokepic NIDORAN_F
	cry NIDORAN_F
else
if DEF(_CATTLE_STARTERS)
	pokepic TAUROS
	cry TAUROS
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	pokepic SHUCKLE
	cry SHUCKLE
else
if DEF(_NEWCOMERS1)
	pokepic SNOCONEY
	cry SNOCONEY
else
if DEF(_NEWCOMERS2)
	pokepic COTTONEE
	cry COTTONEE
else
if DEF(_FOSSIL_STARTERS)
	pokepic KABUTO
	cry KABUTO
else
if DEF(_PSEUDO_LEGENDS)
	pokepic DRATINI
	cry DRATINI
else
if DEF(_LEGENDARY_BIRDS)
	pokepic ARTICUNO
	cry ARTICUNO
else
if DEF(_LEGENDARY_BEASTS)
	pokepic RAIKOU
	cry RAIKOU
else
if DEF(_MEW_STARTERS)
	pokepic MEW
	cry MEW
else
if DEF(_HO_OH_LUGIA)
	pokepic HO_OH
	cry HO_OH
else
if DEF(_CELEBI_STARTERS)
	pokepic CELEBI
	cry CELEBI
else
if DEF(_MISSINGNO_STARTERS)
	pokepic MISSINGNO
	cry MISSINGNO
else
	pokepic CHIKORITA
	cry CHIKORITA
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
if DEF(_KANTO_STARTERS)
	getmonname STRING_BUFFER_3, BULBASAUR
else
if DEF(_LETS_GO_STARTERS)
	getmonname STRING_BUFFER_3, PIKACHU
else
if DEF(_MOUSEKETEERS)
	getmonname STRING_BUFFER_3, PIKACHU
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	getmonname STRING_BUFFER_3, JYNX
else
if DEF(_HITMON_STARTERS)
	getmonname STRING_BUFFER_3, HITMONLEE
else
if DEF(_NIDORAN_STARTERS)
	getmonname STRING_BUFFER_3, NIDORAN_F
else
if DEF(_CATTLE_STARTERS)
	getmonname STRING_BUFFER_3, TAUROS
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	getmonname STRING_BUFFER_3, SHUCKLE
else
if DEF(_NEWCOMERS1)
	getmonname STRING_BUFFER_3, SNOCONEY
else
if DEF(_NEWCOMERS2)
	getmonname STRING_BUFFER_3, COTTONEE
else
if DEF(_FOSSIL_STARTERS)
	getmonname STRING_BUFFER_3, KABUTO
else
if DEF(_PSEUDO_LEGENDS)
	getmonname STRING_BUFFER_3, DRATINI
else
if DEF(_LEGENDARY_BIRDS)
	getmonname STRING_BUFFER_3, ARTICUNO
else
if DEF(_LEGENDARY_BEASTS)
	getmonname STRING_BUFFER_3, RAIKOU
else
if DEF(_MEW_STARTERS)
	getmonname STRING_BUFFER_3, MEW
else
if DEF(_HO_OH_LUGIA)
	getmonname STRING_BUFFER_3, HO_OH
else
if DEF(_CELEBI_STARTERS)
	getmonname STRING_BUFFER_3, CELEBI
else
if DEF(_MISSINGNO_STARTERS)
	getmonname STRING_BUFFER_3, MISSINGNO
else
	getmonname STRING_BUFFER_3, CHIKORITA
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
if DEF(_KANTO_STARTERS)
	givepoke BULBASAUR, 5, GOLD_BERRY
else
if DEF(_LETS_GO_STARTERS)
	givepoke PIKACHU, 5, GOLD_BERRY
else
if DEF(_MOUSEKETEERS)
	givepoke PIKACHU, 5, GOLD_BERRY
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	givepoke JYNX, 5, GOLD_BERRY
else
if DEF(_HITMON_STARTERS)
	givepoke HITMONLEE, 5, GOLD_BERRY
else
if DEF(_NIDORAN_STARTERS)
	givepoke NIDORAN_F, 5, GOLD_BERRY
else
if DEF(_CATTLE_STARTERS)
	givepoke TAUROS, 5, GOLD_BERRY
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	givepoke SHUCKLE, 5, BERRY_JUICE
else
if DEF(_NEWCOMERS1)
	givepoke SNOCONEY, 5, GOLD_BERRY
else
if DEF(_NEWCOMERS2)
	givepoke COTTONEE, 5, GOLD_BERRY
else
if DEF(_FOSSIL_STARTERS)
	givepoke KABUTO, 5, GOLD_BERRY
else
if DEF(_PSEUDO_LEGENDS)
	givepoke DRATINI, 5, GOLD_BERRY
else
if DEF(_LEGENDARY_BIRDS)
	givepoke ARTICUNO, 5, GOLD_BERRY
else
if DEF(_LEGENDARY_BEASTS)
	givepoke RAIKOU, 5, GOLD_BERRY
else
if DEF(_MEW_STARTERS)
	givepoke MEW, 5, GOLD_BERRY
else
if DEF(_HO_OH_LUGIA)
	givepoke HO_OH, 5, GOLD_BERRY
else
if DEF(_CELEBI_STARTERS)
	givepoke CELEBI, 5, GOLD_BERRY
else
if DEF(_MISSINGNO_STARTERS)
	givepoke MISSINGNO, 5, GOLD_BERRY
else
	givepoke CHIKORITA, 5, GOLD_BERRY
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
if DEF(_KANTO_STARTERS)
	pokepic CHARMANDER
	cry CHARMANDER
else
if DEF(_MOUSEKETEERS)
	pokepic SANDSHREW
	cry SANDSHREW
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	pokepic MAGMAR
	cry MAGMAR
else
if DEF(_HITMON_STARTERS)
	pokepic HITMONTOP
	cry HITMONTOP
else
if DEF(_NIDORAN_STARTERS)
	pokepic SUNKERN
	cry SUNKERN
else
if DEF(_CATTLE_STARTERS)
	pokepic GIRAFARIG
	cry GIRAFARIG
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	pokepic SMEARGLE
	cry SMEARGLE
else
if DEF(_NEWCOMERS1)
	pokepic FLOGISTAN
	cry FLOGISTAN
else
if DEF(_NEWCOMERS2)
	pokepic JIRK
	cry JIRK
else
if DEF(_FOSSIL_STARTERS)
	pokepic AERODACTYL
	cry AERODACTYL
else
if DEF(_PSEUDO_LEGENDS)
	pokepic LARVITAR
	cry LARVITAR
else
if DEF(_LEGENDARY_BIRDS)
	pokepic MOLTRES
	cry MOLTRES
else
if DEF(_LEGENDARY_BEASTS)
	pokepic ENTEI
	cry ENTEI
else
if DEF(_MEW_STARTERS)
	pokepic DITTO
	cry DITTO
else
if DEF(_HO_OH_LUGIA)
	pokepic MAGIKARP
	cry MAGIKARP
else
if DEF(_CELEBI_STARTERS)
	pokepic WOBBUFFET
	cry WOBBUFFET
else
if DEF(_MISSINGNO_STARTERS)
	pokepic UNOWN
	cry UNOWN
else
	pokepic CYNDAQUIL
	cry CYNDAQUIL
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
if DEF(_KANTO_STARTERS)
	getmonname STRING_BUFFER_3, CHARMANDER
else
if DEF(_MOUSEKETEERS)
	getmonname STRING_BUFFER_3, SANDSHREW
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	getmonname STRING_BUFFER_3, MAGMAR
else
if DEF(_HITMON_STARTERS)
	getmonname STRING_BUFFER_3, HITMONTOP
else
if DEF(_NIDORAN_STARTERS)
	getmonname STRING_BUFFER_3, SUNKERN
else
if DEF(_CATTLE_STARTERS)
	getmonname STRING_BUFFER_3, GIRAFARIG
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	getmonname STRING_BUFFER_3, SMEARGLE
else
if DEF(_NEWCOMERS1)
	getmonname STRING_BUFFER_3, FLOGISTAN
else
if DEF(_NEWCOMERS2)
	getmonname STRING_BUFFER_3, JIRK
else
if DEF(_FOSSIL_STARTERS)
	getmonname STRING_BUFFER_3, AERODACTYL
else
if DEF(_PSEUDO_LEGENDS)
	getmonname STRING_BUFFER_3, LARVITAR
else
if DEF(_LEGENDARY_BIRDS)
	getmonname STRING_BUFFER_3, MOLTRES
else
if DEF(_LEGENDARY_BEASTS)
	getmonname STRING_BUFFER_3, ENTEI
else
if DEF(_MEW_STARTERS)
	getmonname STRING_BUFFER_3, DITTO
else
if DEF(_HO_OH_LUGIA)
	getmonname STRING_BUFFER_3, MAGIKARP
else
if DEF(_CELEBI_STARTERS)
	getmonname STRING_BUFFER_3, WOBBUFFET
else
if DEF(_MISSINGNO_STARTERS)
	getmonname STRING_BUFFER_3, UNOWN
else
	getmonname STRING_BUFFER_3, CYNDAQUIL
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
if DEF(_KANTO_STARTERS)
	givepoke CHARMANDER, 5, GOLD_BERRY
else
if DEF(_MOUSEKETEERS)
	givepoke SANDSHREW, 5, GOLD_BERRY
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	givepoke MAGMAR, 5, GOLD_BERRY
else
if DEF(_HITMON_STARTERS)
	givepoke HITMONTOP, 5, GOLD_BERRY
else
if DEF(_NIDORAN_STARTERS)
	givepoke SUNKERN, 5, GOLD_BERRY
else
if DEF(_CATTLE_STARTERS)
	givepoke GIRAFARIG, 5, GOLD_BERRY
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	givepoke SMEARGLE, 5, GOLD_BERRY
else
if DEF(_NEWCOMERS1)
	givepoke FLOGISTAN, 5, GOLD_BERRY
else
if DEF(_NEWCOMERS2)
	givepoke JIRK, 5, GOLD_BERRY
else
if DEF(_FOSSIL_STARTERS)
	givepoke AERODACTYL, 5, GOLD_BERRY
else
if DEF(_PSEUDO_LEGENDS)
	givepoke LARVITAR, 5, GOLD_BERRY
else
if DEF(_LEGENDARY_BIRDS)
	givepoke MOLTRES, 5, GOLD_BERRY
else
if DEF(_LEGENDARY_BEASTS)
	givepoke ENTEI, 5, GOLD_BERRY
else
if DEF(_MEW_STARTERS)
	givepoke DITTO, 5, GOLD_BERRY
else
if DEF(_HO_OH_LUGIA)
	givepoke MAGIKARP, 5, GOLD_BERRY
else
if DEF(_CELEBI_STARTERS)
	givepoke WOBBUFFET, 5, GOLD_BERRY
else
if DEF(_MISSINGNO_STARTERS)
	givepoke UNOWN, 5, GOLD_BERRY
else
	givepoke CYNDAQUIL, 5, GOLD_BERRY
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
if DEF(_KANTO_STARTERS)
	pokepic SQUIRTLE
	cry SQUIRTLE
else
if DEF(_LETS_GO_STARTERS)
	pokepic EEVEE
	cry EEVEE
else
if DEF(_MOUSEKETEERS)
	pokepic MARILL
	cry MARILL
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	pokepic ELECTABUZZ
	cry ELECTABUZZ
else
if DEF(_HITMON_STARTERS)
	pokepic HITMONCHAN
	cry HITMONCHAN
else
if DEF(_NIDORAN_STARTERS)
	pokepic NIDORAN_M
	cry NIDORAN_M
else
if DEF(_CATTLE_STARTERS)
	pokepic MILTANK
	cry MILTANK
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	pokepic DELIBIRD
	cry DELIBIRD
else
if DEF(_NEWCOMERS1)
	pokepic CASTAWEIGH
	cry CASTAWEIGH
else
if DEF(_NEWCOMERS2)
	pokepic YANMA
	cry YANMA
else
if DEF(_FOSSIL_STARTERS)
	pokepic OMANYTE
	cry OMANYTE
else
if DEF(_PSEUDO_LEGENDS)
	pokepic DRATINI
	cry DRATINI
else
if DEF(_LEGENDARY_BIRDS)
	pokepic ZAPDOS
	cry ZAPDOS
else
if DEF(_LEGENDARY_BEASTS)
	pokepic SUICUNE
	cry SUICUNE
else
if DEF(_MEW_STARTERS)
	pokepic MEWTWO
	cry MEWTWO
else
if DEF(_HO_OH_LUGIA)
	pokepic LUGIA
	cry LUGIA
else
if DEF(_CELEBI_STARTERS)
	pokepic FINULL
	cry FINULL
else
if DEF(_MISSINGNO_STARTERS)
	pokepic MISSINGNO
	cry MISSINGNO
else
	pokepic TOTODILE
	cry TOTODILE
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
if DEF(_KANTO_STARTERS)
	getmonname STRING_BUFFER_3, SQUIRTLE
else
if DEF(_LETS_GO_STARTERS)
	getmonname STRING_BUFFER_3, EEVEE
else
if DEF(_MOUSEKETEERS)
	getmonname STRING_BUFFER_3, MARILL
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	getmonname STRING_BUFFER_3, ELECTABUZZ
else
if DEF(_HITMON_STARTERS)
	getmonname STRING_BUFFER_3, HITMONCHAN
else
if DEF(_NIDORAN_STARTERS)
	getmonname STRING_BUFFER_3, NIDORAN_M
else
if DEF(_CATTLE_STARTERS)
	getmonname STRING_BUFFER_3, MILTANK
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	getmonname STRING_BUFFER_3, DELIBIRD
else
if DEF(_NEWCOMERS1)
	getmonname STRING_BUFFER_3, CASTAWEIGH
else
if DEF(_NEWCOMERS2)
	getmonname STRING_BUFFER_3, YANMA
else
if DEF(_FOSSIL_STARTERS)
	getmonname STRING_BUFFER_3, OMANYTE
else
if DEF(_PSEUDO_LEGENDS)
	getmonname STRING_BUFFER_3, DRATINI
else
if DEF(_LEGENDARY_BIRDS)
	getmonname STRING_BUFFER_3, ZAPDOS
else
if DEF(_LEGENDARY_BEASTS)
	getmonname STRING_BUFFER_3, SUICUNE
else
if DEF(_MEW_STARTERS)
	getmonname STRING_BUFFER_3, MEWTWO
else
if DEF(_HO_OH_LUGIA)
	getmonname STRING_BUFFER_3, LUGIA
else
if DEF(_CELEBI_STARTERS)
	getmonname STRING_BUFFER_3, FINULL
else
if DEF(_MISSINGNO_STARTERS)
	getmonname STRING_BUFFER_3, MISSINGNO
else
	getmonname STRING_BUFFER_3, TOTODILE
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
if DEF(_KANTO_STARTERS)
	givepoke SQUIRTLE, 5, GOLD_BERRY
else
if DEF(_LETS_GO_STARTERS)
	givepoke EEVEE, 5, GOLD_BERRY
else
if DEF(_MOUSEKETEERS)
	givepoke MARILL, 5, GOLD_BERRY
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	givepoke ELECTABUZZ, 5, GOLD_BERRY
else
if DEF(_HITMON_STARTERS)
	givepoke HITMONCHAN, 5, GOLD_BERRY
else
if DEF(_NIDORAN_STARTERS)
	givepoke NIDORAN_M, 5, GOLD_BERRY
else
if DEF(_CATTLE_STARTERS)
	givepoke MILTANK, 5, GOLD_BERRY
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	givepoke DELIBIRD, 5, GOLD_BERRY
else
if DEF(_NEWCOMERS1)
	givepoke CASTAWEIGH, 5, GOLD_BERRY
else
if DEF(_NEWCOMERS2)
	givepoke YANMA, 5, GOLD_BERRY
else
if DEF(_FOSSIL_STARTERS)
	givepoke OMANYTE, 5, GOLD_BERRY
else
if DEF(_PSEUDO_LEGENDS)
	givepoke DRATINI, 5, GOLD_BERRY
else
if DEF(_LEGENDARY_BIRDS)
	givepoke ZAPDOS, 5, GOLD_BERRY
else
if DEF(_LEGENDARY_BEASTS)
	givepoke SUICUNE, 5, GOLD_BERRY
else
if DEF(_MEW_STARTERS)
	givepoke MEWTWO, 5, GOLD_BERRY
else
if DEF(_HO_OH_LUGIA)
	givepoke LUGIA, 5, GOLD_BERRY
else
if DEF(_CELEBI_STARTERS)
	givepoke FINULL, 5, GOLD_BERRY
else
if DEF(_MISSINGNO_STARTERS)
	givepoke MISSINGNO, 5, GOLD_BERRY
else
	givepoke TOTODILE, 5, GOLD_BERRY
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	sjump ElmsLab_EndText

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	sjump ElmsLab_EndText

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	sjump ElmsLab_EndText

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	sjump ElmsLab_EndText

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmsLab_EndText
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	sjump ElmsLab_EndText

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	sjump ElmsLab_EndText

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	sjump ElmsLab_EndText

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	sjump ElmsLab_EndText

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	waitsfx
	writetext ReceivedPokeBallsText
	playsound SFX_ITEM
	waitsfx
	giveitem POKE_BALL, 10
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	sjump ElmsLab_EndText

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	sjump ElmsLab_EndText

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	sjump ElmsLab_EndText

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	sjump ElmsLab_EndText

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	sjump ElmsLab_EndText

.Normal:
	writetext ElmsLabWindowText1
	sjump ElmsLab_EndText

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabBookshelf:
	jumpstd DifficultBookshelfScript

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterChikoritaMovement:
	step LEFT
	step UP
	turn_head UP
	step_end


AfterCyndaquilMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I needed your help"
	line "with something."

	para "You see…"

	para "I'm working on a"
	line "meme that I want"

	para "to use to pwn my"
	line "colleagues."

	para "But there are some"
	line "nuances I don't"

	para "quite understand"
	line "yet."

	para "So!"

	para "I'd like you to"
	line "raise a #MON"

	para "and gather infor-"
	line "mation on your"
	cont "journey."
	done

ElmText_Accepted:
	text "Thanks, <PLAY_G>!"

	para "You're a great"
	line "help!"
	done

ElmText_Refused:
	text "…It wasn't a"
	line "question."
	done

ElmText_GotAnEmail:
	text "Oh, something got"
	line "through my spam"
	cont "filter…"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hey, listen."

	para "I have an acquain-"
	line "tance called"
	cont "POKEY MAN."

	para "He keeps finding"
	line "weird things and"

	para "raving about his"
	line "discoveries."

	para "Anyway, I just got"
	line "an e-mail from him"

	para "saying that this"
	line "time it's real."

	para "It is intriguing,"
	line "but it's about"

	para "time for our next"
	line "coffee break…"

	para "Wait!"
	line "I know!"

	para "<PLAY_G>, can you"
	line "go in our place?"
	done

ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAY_G>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "ELM: Wait! Where"
	line "are you going?"
	done

TakeChikoritaText:
	text "ELM: So, you like"
if DEF(_KANTO_STARTERS)
	line "BULBASAUR, the"
	cont "grass #MON?"
else
if DEF(_LETS_GO_STARTERS)
	line "PIKACHU, the"
	cont "electric #MON?"
else
if DEF(_MOUSEKETEERS)
	line "PIKACHU, the"
	cont "electric #MON?"
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	line "JYNX, the ice"
	cont "#MON?"
else
if DEF(_HITMON_STARTERS)
	line "HITMONLEE, the"
	cont "kicking #MON?"
else
if DEF(_NIDORAN_STARTERS)
	line "the female"
	cont "NIDORAN?"
else
if DEF(_CATTLE_STARTERS)
	line "TAUROS, the bull"
	cont "#MON?"
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	line "SHUCKLE, the"
	cont "defensive #MON?"
else
if DEF(_NEWCOMERS1)
	line "SNOCONEY, the"
	cont "grass #MON?"
else
if DEF(_NEWCOMERS2)
	line "COTTONEE, the"
	cont "grass #MON?"
else
if DEF(_FOSSIL_STARTERS)
	line "KABUTO, the bug"
	cont "#MON?"
else
if DEF(_PSEUDO_LEGENDS)
	line "DRATINI, the"
	cont "dragon #MON?"
else
if DEF(_LEGENDARY_BIRDS)
	line "ARTICUNO, the ice"
	cont "#MON?"
else
if DEF(_LEGENDARY_BEASTS)
	line "RAIKOU, the"
	cont "electric #MON?"
else
if DEF(_MEW_STARTERS)
	line "MEW, the psychic"
	cont "#MON?"
else
if DEF(_HO_OH_LUGIA)
	line "HO-OH, the fire"
	cont "#MON?"
else
if DEF(_CELEBI_STARTERS)
	line "CELEBI, the grass"
	cont "#MON?"
else
if DEF(_MISSINGNO_STARTERS)
	line "MISSINGNO., the"
	cont "glitch #MON?"
else
	line "CHIKORITA, the"
	cont "grass #MON?"
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	done

TakeCyndaquilText:
	text "ELM: You'll take"
if DEF(_KANTO_STARTERS)
	line "CHARMANDER, the"
	cont "fire #MON?"
else
if DEF(_MOUSEKETEERS)
	line "SANDSHREW, the"
	cont "ground #MON?"
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	line "MAGMAR, the fire"
	cont "#MON?"
else
if DEF(_HITMON_STARTERS)
	line "HITMONTOP, the"
	cont "balanced #MON?"
else
if DEF(_NIDORAN_STARTERS)
	line "SUNKERN, the grass"
	cont "#MON?"
else
if DEF(_CATTLE_STARTERS)
	line "GIRAFARIG, the pa-"
	cont "lindrome #MON?"
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	line "SMEARGLE, the move"
	cont "-copying #MON?"
else
if DEF(_NEWCOMERS1)
	line "FLOGISTAN, the"
	cont "fire #MON?"
else
if DEF(_NEWCOMERS2)
	line "JIRK, the…"
	cont "jerk?"
else
if DEF(_FOSSIL_STARTERS)
	line "AERODACTYL, the"
	cont "flying #MON?"
else
if DEF(_PSEUDO_LEGENDS)
	line "LARVITAR, the rock"
	cont "and dark #MON?"
else
if DEF(_LEGENDARY_BIRDS)
	line "MOLTRES, the fire"
	cont "#MON?"
else
if DEF(_LEGENDARY_BEASTS)
	line "ENTEI, the fire"
	cont "#MON?"
else
if DEF(_MEW_STARTERS)
	line "DITTO, the form-"
	cont "copying #MON?"
else
if DEF(_HO_OH_LUGIA)
	line "MAGIKARP?"
	cont "…Are you sure?"
else
if DEF(_CELEBI_STARTERS)
	line "WOBBUFFET, the"
	cont "knockback #MON?"
else
if DEF(_MISSINGNO_STARTERS)
	line "UNOWN, the"
	cont "alphabet #MON?"
else
	line "CYNDAQUIL, the"
	cont "fire #MON?"
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	done

TakeTotodileText:
	text "ELM: Do you want"
if DEF(_KANTO_STARTERS)
	line "SQUIRTLE, the"
	cont "water #MON?"
else
if DEF(_LETS_GO_STARTERS)
	line "EEVEE, the normal-"
	cont "type #MON?"
else
if DEF(_MOUSEKETEERS)
	line "MARILL, the water"
	cont "#MON?"
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	line "ELECTABUZZ, the"
	cont "electric #MON?"
else
if DEF(_HITMON_STARTERS)
	line "HITMONCHAN, the"
	cont "punching #MON?"
else
if DEF(_NIDORAN_STARTERS)
	line "the male"
	cont "NIDORAN?"
else
if DEF(_CATTLE_STARTERS)
	line "MILTANK, the cow"
	cont "#MON?"
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	line "DELIBIRD, the"
	cont "CHRISTMAS #MON?"
else
if DEF(_NEWCOMERS1)
	line "CASTAWEIGH, the"
	cont "water #MON?"
else
if DEF(_NEWCOMERS2)
	line "YANMA, the bug"
	cont "#MON?"
else
if DEF(_FOSSIL_STARTERS)
	line "OMANYTE, the water"
	cont "#MON?"
else
if DEF(_PSEUDO_LEGENDS)
	line "DRATINI, the"
	cont "dragon #MON?"
else
if DEF(_LEGENDARY_BIRDS)
	line "ZAPDOS, the"
	cont "electric #MON?"
else
if DEF(_LEGENDARY_BEASTS)
	line "SUICUNE, the water"
	cont "#MON?"
else
if DEF(_MEW_STARTERS)
	line "MEWTWO, the"
	cont "ultimate #MON?"
else
if DEF(_HO_OH_LUGIA)
	line "LUGIA, the ice"
	cont "#MON?"
else
if DEF(_CELEBI_STARTERS)
	line "FINULL, the ghost"
	cont "#MON?"
else
if DEF(_MISSINGNO_STARTERS)
	line "MISSINGNO., the"
	cont "glitch #MON?"
else
	line "TOTODILE, the"
	cont "water #MON?"
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	done

DidntChooseStarterText:
	text "ELM: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "ELM: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "POKEY MAN lives a"
	line "little bit beyond"

	para "CHERRYGROVE, the"
	line "next city over."

	para "It's almost a"
	line "direct route"

	para "there, so you"
	line "can't miss it."

	para "But just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

ElmDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

ElmDirectionsText3:
	text "<PLAY_G>, I'm"
	line "counting on you!"
	done

GotElmsNumberText:
	text "<PLAYER> got ELM's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "POKEY MAN goes"
	line "everywhere and"
	cont "finds rarities."

	para "Too bad they're"
	line "just rare and"
	cont "not very useful…"
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Heal?"
	done

ElmAfterTheftText1:
	text "ELM: <PLAY_G>, this"
	line "is terrible…"

	para "Oh, yes, what was"
	line "POKEY MAN's big"
	cont "discovery?"
	done

ElmAfterTheftText2:
	text "<PLAYER> handed"
	line "the MYSTERY EGG to"
	cont "PROF.ELM."
	done

ElmAfterTheftText3:
	text "ELM: This?!?!?!?!?"
	done

ElmAfterTheftText4:
	text "But… Is it a"
	line "#MON EGG?"

	para "I've never seen one"
	line "quite like it."
	done

ElmAfterTheftText5:
	text "ELM: What?!?!?!?!?"
	line "!?!?!?!?!?!?!?!?!?"

	para "PROF.OAK gave you"
	line "a #DEX?"

	para "<PLAY_G>, is that"
	line "true? Th-that's"
	cont "incredible!"

	para "He is superb at"
	line "seeing the poten-"
	cont "tial of people as"
	cont "trainers."

	para "Wow, <PLAY_G>. You"
	line "may have what it"

	para "takes to become"
	line "the CHAMPION."

	para "You seem to be"
	line "getting on great"
	cont "with #MON too."

	para "You should take"
	line "the #MON GYM"
	cont "challenge."

	para "The closest GYM"
	line "would be the one"
	cont "in VIOLET CITY."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. The"
	line "road to the"

	para "championship will"
	line "be a long one."

	para "Before you leave,"
	line "make sure that you"
	cont "talk to your mom."
	done

ElmStudyingEggText:
	text "ELM: Don't give"
	line "up! I'll call if"

	para "I learn anything"
	line "about that EGG!"
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>?"
	line "Didn't you meet my"
	cont "assistant?"

	para "He should have met"
	line "you with the EGG"

	para "at VIOLET CITY's"
	line "#MON CENTER."

	para "You must have just"
	line "missed him. Try to"
	cont "catch him there."
	done

ElmWaitingEggHatchText:
	text "ELM: Hey, has that"
	line "EGG changed any?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? I thought"
	line "the EGG hatched."

	para "Where is the"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, you"
	line "look great!"
	done

ShowElmTogepiText2:
	text "What?!?!?!?!?!?!?!"
	line "That #MON?!?!?!"
	done

ShowElmTogepiText3:
	text "The EGG hatched!"

	para "So, it was a baby"
	line "form of TOGETIC…"

	para "That's an extremely"
	line "rare #MON!"

	para "Wow, there's still"
	line "a lot of research"
	cont "to be done."
	done

ElmGiveEverstoneText1:
	text "Thanks, <PLAY_G>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done

ElmGiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "A #MON that"
	line "holds it will be"

	para "prevented from"
	line "evolving, but will"

	para "have better defen-"
	line "ses in battle."

	para "Give it to a #-"
	line "MON you prefer in"
	cont "its young form."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>, I'll"
	line "call you if any-"
	cont "thing comes up."
	done

AideText_AfterTheft:
	text "…sigh… That"
	line "stolen #MON."

	para "I wonder how it's"
	line "doing."

	para "They say a #MON"
	line "raised by a bad"

	para "person turns bad"
	line "itself."
	done

ElmGiveMasterBallText1:
	text "ELM: Hi, <PLAY_G>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

ElmGiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."

	para "Now you can catch"
	line "#MON in KANTO."
	done

ElmGiveTicketText2:
	text "The ship departs"
	line "from OLIVINE CITY."

	para "But you knew that"
	line "already, <PLAY_G>."

	para "After all, you've"
	line "traveled all over"
	cont "with your #MON."

	para "Give my regards to"
	line "PROF.OAK in KANTO!"
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, I want"
	line "you to have this"
	cont "for your errand."
	done

AideText_AlwaysBusy:
	text "I found it under"
	line "the sink."
	done

AideText_TheftTestimony:
	text "There was a loud"
	line "noise outside…"

	para "When we went to"
	line "look, someone"
	cont "stole a #MON."

	para "It's unbelievable"
	line "that anyone would"
	cont "do that!"
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "If you're going to"
	line "complete your"

	para "#DEX, you'll"
	line "need these to"
	cont "catch #MON!"
	done

ReceivedPokeBallsText:
	text "<PLAYER> received"
	line "# BALL ×10!"
	done

AideText_ExplainBalls:
	text "<PLAYER> put the"
	line "# BALLS in the"
	cont "BALL POCKET."

	para "Throw # BALLS"
	line "at wild #MON"

	para "during battle to"
	line "capture them."
	done

ElmsLabOfficerText1:
	text "I heard a #MON"
	line "was stolen here…"

	para "I was just getting"
	line "some information"
	cont "from PROF.ELM."

	para "Apparently, it was"
	line "a young male with"
	cont "long, red hair…"

	para "What?"

	para "You battled a"
	line "trainer like that?"

	para "Did you happen to"
	line "get his name?"
	done

ElmsLabOfficerText2:
	text "OK! So <RIVAL>"
	line "was his name."

	para "Thanks for helping"
	line "my investigation!"
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Hold the B Button"
	line "and move to run!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press START to"
	cont "sort items."

	para "Press SELECT to"
	line "move an item"
	cont "manually."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.ELM"
	cont "ate is in there…"
	done

ElmsLabPCText:
	text "OBSERVATIONS ON"
	line "#MON EVOLUTION"

	para "…I'm not reading"
	line "the whole thing…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
if DEF(_LETS_GO_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_MOUSEKETEERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_JYNX_MAGMAR_ELECTABUZZ)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_HITMON_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_NIDORAN_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_CATTLE_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_SHUCKLE_SMEARGLE_DELIBIRD)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_NEWCOMERS2)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_FOSSIL_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_PSEUDO_LEGENDS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_LEGENDARY_BIRDS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_LEGENDARY_BEASTS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_MEW_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_HO_OH_LUGIA)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_CELEBI_STARTERS)
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
if DEF(_MISSINGNO_STARTERS)
	object_event  6,  3, SPRITE_GLITCH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_GLITCH, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
else
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
endc
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
