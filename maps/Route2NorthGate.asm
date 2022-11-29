	object_const_def
	const ROUTE2NORTHGATE_BUG_CATCHER

Route2NorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NorthGateBugCatcherScript:
	jumptextfaceplayer Route2NorthGateBugCatcherText

Route2NorthGateBugCatcherText:
	text "Heehee…"

	para "Nobody was here,"
	line "so I snuck behind"
	cont "the counter."

	para "I'm in charge now!"
	done

Route2NorthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, VIRIDIAN_FOREST, 1
	warp_event  0,  5, VIRIDIAN_FOREST, 2
	warp_event  9,  4, ROUTE_2, 1
	warp_event  9,  5, ROUTE_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2NorthGateBugCatcherScript, -1
