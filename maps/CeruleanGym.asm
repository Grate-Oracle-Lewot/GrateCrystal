	object_const_def
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUIDE
	const CERULEANGYM_JESSIE
	const CERULEANGYM_JAMES

CeruleanGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_CERULEANGYM_NOTHING
	scene_script .GruntRunsOut ; SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .JessieJames

.JessieJames:
	checkevent EVENT_CERULEAN_GYM_ROCKET
	iffalse .Appear
	disappear CERULEANGYM_JESSIE
	disappear CERULEANGYM_JAMES
	endcallback

.Appear:
	appear CERULEANGYM_JESSIE
	appear CERULEANGYM_JAMES
	endcallback

.GruntRunsOut:
	sdefer .GruntRunsOutScript
.DummyScene:
	end

.GruntRunsOutScript:
	applymovement CERULEANGYM_JAMES, CeruleanGymJessieJamesRunDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_JAMES, CeruleanGymJamesRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymJamesText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_JAMES, 15
	opentext
	writetext CeruleanGymJamesText2
	waitbutton
	closetext
	turnobject CERULEANGYM_JAMES, UP
	opentext
	writetext CeruleanGymJamesText3
	waitbutton
	closetext
	applymovement CERULEANGYM_JESSIE, CeruleanGymJessieJamesRunDownMovement
	turnobject CERULEANGYM_JAMES, DOWN
	opentext
	writetext CeruleanGymJessieText
	waitbutton
	closetext
	applymovement CERULEANGYM_JESSIE, CeruleanGymJessieRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_JESSIE
	waitsfx
	applymovement CERULEANGYM_JAMES, CeruleanGymJamesRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_JAMES
	setevent EVENT_CERULEAN_GYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOTHING
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOTHING
	waitsfx
	special RestartMapMusic
	pause 10
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_DARKROOM_GAUNTLET
	setmapscene CIANWOOD_DARKROOM, SCENE_CIANWOODDARKROOM_RESET_GAUNTLET
	setevent EVENT_BEAT_MISTY
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	checkevent EVENT_GOT_TM_BLIZZARD_FROM_MISTY
	iftrue .GotBlizzardTM
	writetext MistyGiveBlizzardTMText
	promptbutton
	verbosegiveitem TM_BLIZZARD, 5
	iffalse .NoRoomForBlizzardTM
	setevent EVENT_GOT_TM_BLIZZARD_FROM_MISTY
	writetext MistyExplainBlizzardTMText
	setevent EVENT_DECO_STARMIE_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext MistyStaryuDollText
	sjump CeruleanGymEndText

.GotBlizzardTM:
	writetext MistyFightDoneText
	waitbutton
.NoRoomForBlizzardTM
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
CeruleanGymEndText:
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	sjump CeruleanGymEndText

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	sjump CeruleanGymEndText

CeruleanGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuideWinScript
	writetext CeruleanGymGuideText
	sjump CeruleanGymEndText

.CeruleanGymGuideWinScript:
	writetext CeruleanGymGuideWinText
	sjump CeruleanGymEndText

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	sjump CeruleanGymEndText

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	sjump CeruleanGymEndText

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd GymStatue2Script

CeruleanGymJessieJamesRunDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymJamesRunsOutMovement:
	big_step RIGHT
CeruleanGymJessieRunsOutMovement:
	big_step DOWN
	step_end

CeruleanGymJamesRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymNote1Text:
	text "Sorry, I'll be out"
	line "for a while."
	cont "MISTY, GYM LEADER"
	done

CeruleanGymNote2Text:
	text "Since MISTY's out,"
	line "we'll be away too."
	cont "GYM TRAINERS"
	done

MistyIntroText:
	text "MISTY: I was ex-"
	line "pecting you, you"
	cont "pest!"

	para "You may have a"
	line "lot of JOHTO GYM"

	para "BADGES, but you'd"
	line "better not take me"
	cont "too lightly."

	para "My water-type"
	line "#MON are tough!"
	done

MistyWinLossText:
	text "MISTY: You really"
	line "are good…"

	para "I'll admit that"
	line "you have skill…"

	para "Here you go. It's"
	line "CASCADEBADGE."
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> received"
	line "CASCADEBADGE!"
	done

MistyGiveBlizzardTMText:
	text "MISTY: And… I"
	line "should give you"
	cont "this, too."
	done

MistyExplainBlizzardTMText:
	text "MISTY: That TM"
	line "contains BLIZZARD."

	para "What? I know it's"
	line "not water-type."
	cont "Stop being a pest!"

	para "Here's a tip: if"
	line "it's hailing,"

	para "BLIZZARD always"
	line "hits."

	para "And I suppose you"
	line "want a DOLL, too."

	para "<PLAYER> received"
	line "STARYU DOLL!"
	done

MistyStaryuDollText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

MistyFightDoneText:
	text "MISTY: Are there"
	line "many strong train-"
	cont "ers in JOHTO? Like"
	cont "you, I mean."

	para "I'm going to"
	line "travel one day, so"

	para "I can battle some"
	line "skilled trainers."
	done

SwimmerfDianaSeenText:
	text "Sorry about being"
	line "away. Let's get on"
	cont "with it!"
	done

SwimmerfDianaBeatenText:
	text "I give up! You're"
	line "the winner!"
	done

SwimmerfDianaAfterBattleText:
	text "I'll be swimming"
	line "quietly."
	done

SwimmerfBrianaSeenText:
	text "Don't let my ele-"
	line "gant swimming un-"
	cont "nerve you."
	done

SwimmerfBrianaBeatenText:
	text "Ooh, you calmly"
	line "disposed of me…"
	done

SwimmerfBrianaAfterBattleText:
	text "Don't be too smug"
	line "about beating me."

	para "MISTY will destroy"
	line "you if you get"
	cont "complacent."
	done

SwimmermParkerSeenText:
	text "Glub…"

	para "I'm first! Come"
	line "and get me!"
	done

SwimmermParkerBeatenText:
	text "This can't be…"
	done

SwimmermParkerAfterBattleText:
	text "MISTY has gotten"
	line "much better in the"
	cont "past few years."

	para "Don't let your"
	line "guard down, or"
	cont "you'll be crushed!"
	done

CeruleanGymGuideText:
	text "Yo! CHAMP in"
	line "making!"

	para "You should know by"
	line "now that water is"

	para "weak to grass and"
	line "electric, and"

	para "strong against"
	line "fire, rock, and"
	cont "ground."

	para "You may not know"
	line "that ice and steel"

	para "are bad against"
	line "water."
	done

CeruleanGymGuideWinText:
	text "Hoo, you showed me"
	line "how tough you are."

	para "As always, that"
	line "was one heck of a"
	cont "great battle!"
	done

CeruleanGymJamesText1:
	text "JAMES: Hey! Watch"
	line "where you're going!"
	done

CeruleanGymJamesText2:
	text "No…"
	done

CeruleanGymJamesText3:
	text "JESSIE, it's that"
	line "twerp from JOHTO!"
	done

CeruleanGymJessieText:
	text "JESSIE: Seriously?"
	line "You followed us"
	cont "all the way here?"

	para "Uh… To protect the"
	line "world from…"

	para "Oh, there's no time"
	line "for that! JAMES,"
	cont "cut and run!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuideScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  5, 10, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_JESSIE
	object_event  4, 10, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_JAMES
