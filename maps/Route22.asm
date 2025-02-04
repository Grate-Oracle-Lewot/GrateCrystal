Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign1:
	jumptext VictoryRoadEntranceSign1Text

VictoryRoadEntranceSign2:
	jumptext VictoryRoadEntranceSign2Text

Route22HiddenTimerBall:
	hiddenitem TIMER_BALL, EVENT_ROUTE_22_HIDDEN_TIMER_BALL

Route22HiddenRagecandybar:
	hiddenitem RAGECANDYBAR, EVENT_ROUTE_22_HIDDEN_RAGECANDYBAR

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
	bg_event 11, 73, BGEVENT_READ, VictoryRoadEntranceSign1
	bg_event 11,  7, BGEVENT_READ, VictoryRoadEntranceSign2
	bg_event 26, 68, BGEVENT_ITEM, Route22HiddenTimerBall
	bg_event 14, 47, BGEVENT_ITEM, Route22HiddenRagecandybar

	def_object_events
