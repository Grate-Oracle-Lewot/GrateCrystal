	object_const_def
	const ROUTE2NORTH_POKE_BALL
	const ROUTE2SOUTH_FRUIT_TREE

Route2North_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NorthSign:
	jumptext Route2NorthSignText

Route2NorthDiglettsCaveSign:
	jumptext Route2NorthDiglettsCaveSignText

Route2SouthSign:
	jumptext Route2SouthSignText

Route2SouthFruitTree:
	fruittree FRUITTREE_ROUTE_2

Route2NorthDireHit:
	itemball DIRE_HIT

Route2NorthHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2SouthHiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

Route2NorthSignText:
	text "ROUTE 2"

	para "PEWTER CITY -"
	line "VIRIDIAN FOREST -"
	cont "VIRIDIAN CITY"
	done

Route2NorthDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route2SouthSignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "VIRIDIAN FOREST -"
	cont "PEWTER CITY"
	done

Route2North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 16, ROUTE_2_NORTH_GATE, 3
	warp_event  6, 17, ROUTE_2_NORTH_GATE, 4
	warp_event  6, 33, ROUTE_2_SOUTH_GATE, 3
	warp_event 12,  7, DIGLETTS_CAVE, 3
	warp_event 11, 15, ROUTE_2_NUGGET_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  7, 13, BGEVENT_READ, Route2NorthSign
	bg_event  3, 35, BGEVENT_READ, Route2SouthSign
	bg_event 11,  9, BGEVENT_READ, Route2NorthDiglettsCaveSign
	bg_event 16, 13, BGEVENT_ITEM, Route2NorthHiddenFullHeal
	bg_event  6, 37, BGEVENT_ITEM, Route2SouthHiddenRevive

	def_object_events
	object_event 11,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2NorthDireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event 18, 36, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2SouthFruitTree, -1
