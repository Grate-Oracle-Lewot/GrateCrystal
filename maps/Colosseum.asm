	object_const_def
	const COLOSSEUM_LINK_TRAINER1
	const COLOSSEUM_LINK_TRAINER2

Colosseum_MapScripts:
	def_scene_scripts
	scene_script .InitializeColosseum ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED
	scene_script .DummyScene ; unused

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichChris
	callback MAPCALLBACK_NEWMAP, .PreparePokecenter2F

.InitializeColosseum:
	sdefer .InitializeAndPreparePokecenter2F
.DummyScene:
	end

.SetWhichChris:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear COLOSSEUM_LINK_TRAINER2
	appear COLOSSEUM_LINK_TRAINER1
	endcallback

.Chris2:
	disappear COLOSSEUM_LINK_TRAINER1
	appear COLOSSEUM_LINK_TRAINER2
	endcallback

.PreparePokecenter2F:
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	endcallback

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	end

ColosseumConsoleScript:
	special Colosseum
	newloadmap MAPSETUP_LINKRETURN
	end

CableClubFriendScript:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

Colosseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, POKECENTER_2F, 3
	warp_event  5,  7, POKECENTER_2F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  4, BGEVENT_RIGHT, ColosseumConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, ColosseumConsoleScript

	def_object_events
	object_event  3,  4, SPRITE_LINK_TRAINER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_LINK_TRAINER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
