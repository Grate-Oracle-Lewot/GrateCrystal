	object_const_def
	const UNDERGROUNDPATH_SUPER_NERD

UndergroundPath_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSupernerdRuss:
	trainer SUPER_NERD, RUSS, EVENT_BEAT_SUPER_NERD_RUSS, SupernerdRussSeenText, SupernerdRussBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdRussAfterBattleText
	waitbutton
	closetext
	end

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL

SupernerdRussSeenText:
	text "Nerr…"
	done

SupernerdRussBeatenText:
	text "Phooey."
	done

SupernerdRussAfterBattleText:
	text "I like being"
	line "alone down here."
	done

UndergroundPath_MapEvents:
	def_warp_events
	warp_event 15,  6, ROUTE_5, 1
	warp_event 16,  6, ROUTE_5, 1
	warp_event 17,  2, UNDERGROUND_PATH, 7
	warp_event 15, 26, ROUTE_6, 1
	warp_event 16, 26, ROUTE_6, 1
	warp_event 17, 22, UNDERGROUND_PATH, 8
	warp_event  3,  2, UNDERGROUND_PATH, 3
	warp_event  1, 26, UNDERGROUND_PATH, 6
	warp_event  3, 13, DIGLETTS_CAVE, 7

	def_coord_events

	def_bg_events
	bg_event  3,  9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event  1, 19, BGEVENT_ITEM, UndergroundPathHiddenXSpecial

	def_object_events
	object_event  2, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdRuss, -1
