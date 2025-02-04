Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

Route22HiddenTimerBall:
	hiddenitem TIMER_BALL, EVENT_ROUTE_22_HIDDEN_TIMER_BALL

VictoryRoadEntranceSignText:
	text "ROUTE 22"

	para "VIRIDIAN CITY -"
	line "VICTORY ROAD"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1
	warp_event 28, 75, ROUTE_22_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 73, BGEVENT_READ, VictoryRoadEntranceSign
	bg_event 30, 68, BGEVENT_ITEM, Route22HiddenTimerBall

	def_object_events
