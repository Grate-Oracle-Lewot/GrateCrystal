	object_const_def
	const TOHJOFALLS_BOULDER1
	const TOHJOFALLS_BOULDER2
	const TOHJOFALLS_ROCK1
	const TOHJOFALLS_ROCK2
	const TOHJOFALLS_ROCK3
	const TOHJOFALLS_ROCK4
	const TOHJOFALLS_POKE_BALL

TohjoFalls_MapScripts:
	def_scene_scripts

	def_callbacks

TohjoFallsBoulder:
	jumpstd StrengthBoulderScript

TohjoFallsRock:
	jumpstd SmashRockScript

TohjoFallsMoonStone:
	itemball MOON_STONE

TohjoFallsHiddenXSpDefend:
	hiddenitem X_SP_DEFEND, EVENT_TOHJO_FALLS_HIDDEN_X_SP_DEFEND

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 34, ROUTE_27, 2
	warp_event 25, 34, ROUTE_27, 3
	warp_event 35,  1, MEW_ANTECHAMBER, 1

	def_coord_events

	def_bg_events
	bg_event 30, 11, BGEVENT_ITEM, TohjoFallsHiddenXSpDefend

	def_object_events
	object_event 35,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsBoulderBoulder, -1
	object_event 36,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsBoulderBoulder, -1
	object_event 34,  2, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsRock, -1
	object_event 35,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsRock, -1
	object_event 15,  3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsRock, -1
	object_event 18,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TohjoFallsRock, -1
	object_event  2, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
