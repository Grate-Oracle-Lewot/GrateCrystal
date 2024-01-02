	object_const_def
	const WHIRLISLANDNE_POKE_BALL
	const WHIRLISLANDSW_POKE_BALL

WhirlIsland1F_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

WhirlIslandSWUltraBall:
	itemball ULTRA_BALL

WhirlIsland1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
; NW
	warp_event  5,  7, ROUTE_41, 1
	warp_event  5,  3, WHIRL_ISLAND_B1F, 1
	warp_event  3, 15, WHIRL_ISLAND_SW, 4
	warp_event  7, 15, WHIRL_ISLAND_CAVE, 2
; NE
	warp_event 17, 13, ROUTE_41, 2
	warp_event 31,  3, WHIRL_ISLAND_B1F, 2
	warp_event 27, 11, WHIRL_ISLAND_B1F, 3
; SW
	warp_event  5, 27, ROUTE_41, 3
	warp_event 17, 23, WHIRL_ISLAND_B1F, 5
	warp_event  3, 23, WHIRL_ISLAND_B1F, 4
	warp_event  3, 35, WHIRL_ISLAND_NW, 3
	warp_event 17, 35, WHIRL_ISLAND_B2F, 4
; SE
	warp_event 31, 39, ROUTE_41, 4
	warp_event 31, 29, WHIRL_ISLAND_B1F, 6
; CAVE
	warp_event  7, 45, WHIRL_ISLAND_B1F, 9
	warp_event  3, 53, WHIRL_ISLAND_NW, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 25, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
	object_event 15, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSWUltraBall, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
