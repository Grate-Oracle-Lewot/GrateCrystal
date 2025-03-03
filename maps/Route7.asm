	object_const_def
	const ROUTE7_OFFICER

Route7_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerOfficerDisher:
	faceplayer
	opentext
	checktime NITE
	iffalse .AfterBattle
	checkevent EVENT_BEAT_OFFICER_DISHER
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDisherSeenText
	waitbutton
	closetext
	winlosstext OfficerDisherBeatenText, 0
	loadtrainer OFFICER, DISHER
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DISHER
	closetext
	end

.AfterBattle:
	writetext OfficerDisherAfterBattleText
	waitbutton
	closetext
	end

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

OfficerDisherSeenText:
	text "Stop in the name"
	line "of the law!"
	done

OfficerDisherBeatenText:
	text "You fought the law"
	line "and the law lost."
	done

OfficerDisherAfterBattleText:
	text "The UNDERGROUND"
	line "PATH is closed"

	para "until further"
	line "notice. Sorry."
	done

Route7UndergroundPathSignText:
	text "What's this flyer?"

	para "… Uncouth trainers"
	line "have been holding"

	para "battles in the"
	line "UNDERGROUND PATH."

	para "Because of rising"
	line "complaints by lo-"
	cont "cal residents, the"
	cont "UNDERGROUND PATH"
	cont "has been sealed"
	cont "indefinitely."

	para "CELADON POLICE"
	done

Route7LockedDoorText:
	text "It's locked…"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	def_object_events
	object_event  7, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDisher, -1
