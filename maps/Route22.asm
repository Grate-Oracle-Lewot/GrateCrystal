Route22_MapScripts:
	def_scene_scripts
	const ROUTE22_SWIMMER_GIRL
	const ROUTE22_OFFICER

	def_callbacks

TrainerSwimmerfBobbi:
	trainer SWIMMERF, BOBBI, EVENT_BEAT_SWIMMERF_BOBBI, SwimmerfBobbiSeenText, SwimmerfBobbiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBobbiAfterBattleText
	waitbutton
	closetext
	end

OfficerLassiterScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_LASSITER
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerLassiterSeenText
	waitbutton
	closetext
	winlosstext OfficerLassiterBeatenText, 0
	loadtrainer OFFICER, LASSITER
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_LASSITER
	closetext
	end

.AfterScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .FemalePlayer
	writetext OfficerLassiterAfterMaleText
	sjump .WolfMerge

.FemalePlayer
	writetext OfficerLassiterAfterFemaleText
.WolfMerge
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerLassiterDaytimeText
	waitbutton
	closetext
	end

VictoryRoadEntranceSign1:
	jumptext VictoryRoadEntranceSign1Text

VictoryRoadEntranceSign2:
	jumptext VictoryRoadEntranceSign2Text

Route22HiddenTimerBall:
	hiddenitem TIMER_BALL, EVENT_ROUTE_22_HIDDEN_TIMER_BALL

Route22HiddenRagecandybar:
	hiddenitem RAGECANDYBAR, EVENT_ROUTE_22_HIDDEN_RAGECANDYBAR

SwimmerfBobbiSeenText:
	text "I'm bored. Let's"
	line "battle!"
	done

SwimmerfBobbiBeatenText:
	text "Did I bore you?"
	done

SwimmerfBobbiAfterBattleText:
	text "Not a lot of folks"
	line "have been through"
	cont "here lately."
	done

OfficerLassiterDaytimeText:
	text "This way leads to"
	line "VICTORY ROAD."

	para "Make sure you're"
	line "properly prepared."
	done

OfficerLassiterSeenText:
	text "Let me see your"
	line "identification!"
	done

OfficerLassiterBeatenText:
	text "You're good to go"
	line "on through."
	done

OfficerLassiterAfterMaleText:
	text "My apologies, MR."
	line "CHAMPION."
	done

OfficerLassiterAfterFemaleText:
	text "My apologies, MS."
	line "CHAMPION."
	done

VictoryRoadEntranceSign1Text:
	text "ROUTE 22"

	para "VIRIDIAN CITY -"
	line "VICTORY ROAD"
	done

VictoryRoadEntranceSign2Text:
	text "ROUTE 22"

	para "VICTORY ROAD -"
	line "VIRIDIAN CITY"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, VICTORY_ROAD_GATE, 1
	warp_event 20, 67, ROUTE_22_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 85, BGEVENT_READ, VictoryRoadEntranceSign1
	bg_event 11,  7, BGEVENT_READ, VictoryRoadEntranceSign2
	bg_event 26, 80, BGEVENT_ITEM, Route22HiddenTimerBall
	bg_event 14, 47, BGEVENT_ITEM, Route22HiddenRagecandybar

	def_object_events
	object_event  6, 32, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfBobbi, -1
	object_event 12,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerLassiterScript, -1
