	object_const_def
	const VICTORYROAD_SILVER
	const VICTORYROAD_GUITARIST
	const VICTORYROAD_GRANNY
	const VICTORYROAD_SCIENTIST
	const VICTORYROAD_COOLTRAINER_M
	const VOCTORYROAD_BOULDER
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5

VictoryRoad_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.DummyScene:
	end

VictoryRoadRivalLeft:
	moveobject VICTORYROAD_SILVER, 18, 11
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD_SILVER
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleApproachMovement1
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD_SILVER
	setscene SCENE_FINISHED
	playmapmusic
	end

VictoryRoadRivalRight:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD_SILVER
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleApproachMovement2
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_SILVER, VictoryRoadRivalBattleExitMovement2
	disappear VICTORYROAD_SILVER
	setscene SCENE_FINISHED
	playmapmusic
	end

VictoryRoadRivalNext:
	turnobject PLAYER, DOWN
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VictoryRoadRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_VICTORY_ROAD
	winlosstext VictoryRoadRivalDefeatText, 0
	setlasttalked VICTORYROAD_SILVER
if DEF(_LETS_GO_STARTERS) || (_SLOW_STARTERS)
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChosePikachu
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	sjump .FinishBattle

.PlayerChosePikachu:
	checkevent EVENT_LOST_FIRST_RIVAL_BATTLE
	iftrue .Flareon
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	sjump .FinishBattle

.Flareon:
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
else
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChoseChikorita
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .PlayerChoseCyndaquil
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	sjump .FinishBattle

.PlayerChoseChikorita:
if DEF(_HITMON_STARTERS) || DEF(_NIDORAN_STARTERS) || DEF(_CATTLE_STARTERS) || DEF(_MEW_STARTERS) || DEF(_HO_OH_LUGIA) || DEF(_CELEBI_STARTERS)
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
else
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
endc
	sjump .FinishBattle

.PlayerChoseCyndaquil:
if DEF(_HITMON_STARTERS) || DEF(_NIDORAN_STARTERS) || DEF(_CATTLE_STARTERS) || DEF(_MEW_STARTERS) || DEF(_HO_OH_LUGIA) || DEF(_CELEBI_STARTERS)
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
else
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
endc
endc
.FinishBattle:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext VictoryRoadRivalAfterText
	waitbutton
	closetext
	end

TrainerGuitaristCasey:
	trainer GUITARIST, CASEY, EVENT_BEAT_GUITARIST_CASEY, GuitaristCaseySeenText, GuitaristCaseyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext GuitaristCaseyAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumChell:
	trainer MEDIUM, CHELL, EVENT_BEAT_MEDIUM_CHELL, MediumChellText, MediumChellText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MediumChellText
	waitbutton
	closetext
	end

TrainerScientistHeinz:
	trainer SCIENTIST, HEINZ, EVENT_BEAT_SCIENTIST_HEINZ, ScientistHeinzSeenText, ScientistHeinzBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistHeinzAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermSteve:
	trainer COOLTRAINERM, STEVE, EVENT_BEAT_COOLTRAINERM_STEVE, CooltrainermSteveSeenText, CooltrainermSteveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSteveAfterBattleText
	waitbutton
	closetext
	end

VictoryRoadBoulder:
	jumpstd StrengthBoulderScript

VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

VictoryRoadHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_VICTORY_ROAD_HIDDEN_MAX_ELIXER

VictoryRoadRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBattleApproachMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBattleExitMovement1:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VictoryRoadRivalBattleExitMovement2:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

VictoryRoadRivalBeforeText:
	text "WAIT"
	line "NOW YOU GO TO"
	cont "DON'T EXCESSIVELY,"
	cont "HOW ARE YOU"
	cont "MY OPPONENT?"
	cont "I AM NOT THE PAST"
	cont "ONE.NOW I HAVE"
	cont "THE STRONGEST"
	cont "MONSTER,EVERYONE"
	cont "CANN'T WIN"
	cont "CONQUER ME."
	cont "COME TO COMPETE"
	cont "WITH ME"
	done

VictoryRoadRivalDefeatText:
	text "LOST,THOUTH EFFORT"
	line "NOW I SEE"
	cont "WHY TO USE DRAGON"
	done

VictoryRoadRivalAfterText:
	text "I DON'T GIVE UP"
	line "THE WISH TO BE"
	cont "A STRONGEST COACH."
	cont "I WILL FIND MY"
	cont "LACK,THEN BECOME"
	cont "STRONGERTO CHALLENGE"
	line "YOU.UP TO THAT"
	cont "TIME,I WILL"
	cont "TRY MY BEST TO"
	cont "FIGHT WITH YOU."
	cont "EN TO TRY"
	cont "HARD IS GOOD"
	done

GuitaristCaseySeenText:
	text "This'll be the day"
	line "we've waited for!"
	done

GuitaristCaseyBeatenText:
	text "Every nightmare"
	line "just discloses…"
	done

GuitaristCaseyAfterBattleText:
	text "Boop."
	done

MediumChellText:
	text "…"
	done

ScientistHeinzSeenText:
	text "Your timing is"
	line "exquisite… And by"

	para "that I mean COMPL-"
	line "ETELY QUISITE!"
	done

ScientistHeinzBeatenText:
	text "Curse you <PLAYER>"
	line "the <PKMN> trainer!"
	done

ScientistHeinzAfterBattleText:
	text "If I had a nickel"
	line "for every time I'd"

	para "been doomed by a"
	line "kid in a cave…"

	para "Actually, I don't"
	line "want to finish"
	cont "that thought."
	done

CooltrainermSteveSeenText:
	text "This is it, baby!"
	line "The #MON"
	cont "LEAGUE!"
	done

CooltrainermSteveBeatenText:
	text "Aww, man…"
	done

CooltrainermSteveAfterBattleText:
	text "INDIGO PLATEAU is"
	line "such a cool name."
	done

VictoryRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 67, VICTORY_ROAD_GATE, 5
	warp_event  1, 49, VICTORY_ROAD, 3
	warp_event  1, 35, VICTORY_ROAD, 2
	warp_event 13, 31, VICTORY_ROAD, 5
	warp_event 13, 17, VICTORY_ROAD, 4
	warp_event 17, 33, VICTORY_ROAD, 7
	warp_event 17, 19, VICTORY_ROAD, 6
	warp_event  0, 11, VICTORY_ROAD, 9
	warp_event  0, 27, VICTORY_ROAD, 8
	warp_event 13,  5, ROUTE_23, 3

	def_coord_events
	coord_event 12,  8, SCENE_DEFAULT, VictoryRoadRivalLeft
	coord_event 13,  8, SCENE_DEFAULT, VictoryRoadRivalRight

	def_bg_events
	bg_event  3, 29, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, VictoryRoadHiddenFullHeal
	bg_event 10, 50, BGEVENT_ITEM, VictoryRoadHiddenMaxElixer

	def_object_events
	object_event 18, 13, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event  6, 51, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerGuitaristCasey, -1
	object_event 13, 35, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumChell, -1
	object_event 13, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistHeinz, -1
	object_event  4, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermSteve, -1
	object_event 14, 50, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadBoulder, -1
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
