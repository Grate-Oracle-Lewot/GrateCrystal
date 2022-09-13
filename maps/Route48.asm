	object_const_def
	const ROUTE48_POKE_BALL

GlobalTerminalOutside_MapScripts:
	def_scene_scripts

	def_callbacks

Route48WaterStone:
	itemball WATER_STONE

GlobalTerminalOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 17, 11, SPRITE_, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route48WaterStone, EVENT_ROUTE_48_WATER_STONE
