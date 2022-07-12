Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

Route22HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_22_HIDDEN_FULL_RESTORE

VictoryRoadEntranceSignText:
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1
	warp_event 28,  9, ROUTE_22_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign
	bg_event 30,  2, BGEVENT_ITEM, Route22HiddenFullRestore

	def_object_events
