	object_const_def
	const TOHJOFALLS_ROCK1
	const TOHJOFALLS_ROCK2
	const TOHJOFALLS_POKE_BALL

TohjoFalls_MapScripts:
	def_scene_scripts

	def_callbacks

TohjoFallsRock:
	jumpstd SmashRockScript

TohjoFallsMoonStone:
	itemball MOON_STONE

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 17, ROUTE_27, 2
	warp_event 25, 17, ROUTE_27, 3
	warp_event 13,  3, MEW_ANTECHAMBER, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsRock, -1
	object_event 13,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsRock, -1
	object_event  2,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
