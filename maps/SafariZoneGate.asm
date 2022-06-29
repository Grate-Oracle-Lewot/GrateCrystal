	object_const_def

SafariZoneGate_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneGateSign:
	jumptext SafariZoneGateText

SafariZoneGateText:
	text "SAFARI ZONE"
	line "CLOSED"
	done

SafariZoneGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFARI_ZONE, 1
	warp_event  5,  0, SAFARI_ZONE, 2
	warp_event  4,  7, FUCHSIA_CITY, 11
	warp_event  5,  7, FUCHSIA_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_READ, SafariZoneGateSign

	def_object_events
