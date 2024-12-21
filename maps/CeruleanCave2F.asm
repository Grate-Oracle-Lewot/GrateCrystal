	object_const_def
	const CERULEANCAVE2F_ROCK1
	const CERULEANCAVE2F_ROCK2
	const CERULEANCAVE2F_ROCK3

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FRock:
	jumpstd SmashRockScript

CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 11, CERULEAN_CAVE_1F, 2
	warp_event 35,  5, CERULEAN_CAVE_1F, 3
	warp_event 13,  5, CERULEAN_CAVE_1F, 4
	warp_event 25, 13, CERULEAN_CAVE_1F, 5
	warp_event  7, 17, CERULEAN_CAVE_1F, 6
	warp_event  5,  7, CERULEAN_CAVE_1F, 7
	warp_event 30, 19, CERULEAN_CAVE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 28, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 25, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 11, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
