	object_const_def

SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneTrashcan:
	jumpstd TrashCanScript

SafariZone_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 30, 47, SAFARI_ZONE_GATE, 1
	warp_event 30, 48, SAFARI_ZONE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 32, 46, BGEVENT_READ, SafariZoneTrashcan

	def_object_events
