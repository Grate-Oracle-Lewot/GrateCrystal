	object_const_def
	const ROUTE2SOUTH_FRUIT_TREE

Route2South_MapScripts:
	def_scene_scripts

	def_callbacks

Route2SouthSign:
	jumptext Route2SouthSignText

Route2SouthFruitTree:
	fruittree FRUITTREE_ROUTE_2

Route2SouthSignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "VIRIDIAN FOREST -"
	cont "PEWTER CITY"
	done

Route2South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  5, ROUTE_2_SOUTH_GATE, 1

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, Route2SouthSign

	def_object_events
	object_event 18,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2SouthFruitTree, -1
