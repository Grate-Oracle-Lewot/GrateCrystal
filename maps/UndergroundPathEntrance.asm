	object_const_def

UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

UndergroundPathEntranceRoute5Sign:
  jumptext UndergroundPathEntranceRoute5SignText

UndergroundPathEntranceRoute6Sign:
  jumptext UndergroundPathEntranceRoute6SignText

UndergroundPathEntranceRoute5SignText:
  text "UNDERGROUND PATH"

  para "CERULEAN CITY -"
  line "VERMILION CITY"
  done

UndergroundPathEntranceRoute6SignText:
  text "UNDERGROUND PATH"

  para "VERMILION CITY -"
  line "CERULEAN CITY"
  done

UndergroundPathEntrance_MapEvents:
	def_warp_events
	warp_event  3,  7, ROUTE_5, 1
	warp_event  4,  7, ROUTE_5, 1
	warp_event  4,  3, UNDERGROUND_PATH, 1
	warp_event  3, 23, ROUTE_6, 1
	warp_event  4, 23, ROUTE_6, 1
	warp_event  4, 19, UNDERGROUND_PATH, 2

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, UndergroundPathEntranceRoute5Sign
	bg_event  4, 16, BGEVENT_READ, UndergroundPathEntranceRoute6Sign

	def_object_events
