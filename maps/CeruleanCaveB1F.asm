	object_const_def
	const CERULEANCAVEB1F_ROCK1

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCaveB1FRock:
	jumpstd SmashRockScript

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CERULEAN_CAVE_1F, 8
	warp_event 31, 15, CERULEAN_CAVE_1F, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event 19,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCaveB1FRock, -1
