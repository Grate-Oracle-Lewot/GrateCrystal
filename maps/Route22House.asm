	object_const_def

Route22House_MapScripts:
	def_scene_scripts

	def_callbacks

Route22HouseRadio:
	jumpstd Radio1Script

Route22House_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, ROUTE_22, 2
	warp_event  7,  7, ROUTE_22, 2

	def_coord_events

	def_bg_events
	bg_event  3,  1, BGEVENT_READ, Route22HouseRadio

	def_object_events
