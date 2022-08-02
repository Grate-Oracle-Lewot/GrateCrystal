	object_const_def
	const ROUTE2NORTH_POKE_BALL

Route2North_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NorthSign:
	jumptext Route2NorthSignText

Route2NorthDiglettsCaveSign:
	jumptext Route2NorthDiglettsCaveSignText

Route2NorthDireHit:
	itemball DIRE_HIT

Route2NorthHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2NorthSignText:
	text "ROUTE 2"

	para "PEWTER CITY -"
	line "VIRIDIAN FOREST -"
	cont "VIRIDIAN CITY"
	done

Route2NorthDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route2North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 16, ROUTE_2_NORTH_GATE, 3
	warp_event  6, 17, ROUTE_2_NORTH_GATE, 4
	warp_event 12,  7, DIGLETTS_CAVE, 3

	def_coord_events

	def_bg_events
	bg_event  7, 13, BGEVENT_READ, Route2NorthSign
	bg_event 11,  9, BGEVENT_READ, Route2NorthDiglettsCaveSign
	bg_event 16, 13, BGEVENT_ITEM, Route2NorthHiddenFullHeal

	def_object_events
	object_event 11,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2NorthDireHit, EVENT_ROUTE_2_DIRE_HIT
