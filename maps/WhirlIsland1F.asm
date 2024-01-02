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
	warp_event  5,  7, ROUTE_41, 1           ;  1 ; NW 1
	warp_event  5,  3, WHIRL_ISLAND_B1F, 1   ;  2 ; NW 2
	warp_event  3, 15, WHIRL_ISLAND_1F, 11   ;  3 ; NW 3
	warp_event  7, 15, WHIRL_ISLAND_1F, 16   ;  4 ; NW 4
	warp_event 17, 13, ROUTE_41, 2           ;  5 ; NE 1
	warp_event 31,  3, WHIRL_ISLAND_B1F, 2   ;  6 ; NE 2
	warp_event 27, 11, WHIRL_ISLAND_B1F, 3   ;  7 ; NE 3
	warp_event  5, 27, ROUTE_41, 3           ;  8 ; SW 1
	warp_event 17, 23, WHIRL_ISLAND_B1F, 5   ;  9 ; SW 2
	warp_event  3, 23, WHIRL_ISLAND_B1F, 4   ; 10 ; SW 3
	warp_event  3, 35, WHIRL_ISLAND_1F, 3    ; 11 ; SW 4
	warp_event 17, 35, WHIRL_ISLAND_B2F, 4   ; 12 ; SW 5
	warp_event 31, 39, ROUTE_41, 4           ; 13 ; SE 1
	warp_event 31, 29, WHIRL_ISLAND_B1F, 6   ; 14 ; SE 2
	warp_event  7, 45, WHIRL_ISLAND_B1F, 9   ; 15 ; CAVE 1
	warp_event  3, 53, WHIRL_ISLAND_1F, 4    ; 16 ; CAVE 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 25, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
	object_event 15, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSWUltraBall, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
