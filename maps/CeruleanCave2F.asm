	object_const_def
	const CERULEANCAVE2F_ROCK1
	const CERULEANCAVE2F_ROCK2
	const CERULEANCAVE2F_ROCK3
	const CERULEANCAVE2F_POKE_BALL1
	const CERULEANCAVE2F_POKE_BALL2
	const CERULEANCAVE2F_POKE_BALL3
	const CERULEANCAVE2F_POKE_BALL4
	const CERULEANCAVE2F_POKE_BALL5

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FRock:
	jumpstd SmashRockScript

CeruleanCave2FTwistedspoon:
	itemball TWISTEDSPOON

CeruleanCave2FIron:
	itemball IRON

CeruleanCave2FProtein:
	itemball PROTEIN

CeruleanCave2FPPUp:
	itemball PP_UP

CeruleanCave2FCalcium:
	itemball CALCIUM

CeruleanCave2FHiddenFiber:
	hiddenitem FIBER, EVENT_CERULEAN_CAVE_2F_HIDDEN_FIBER

CeruleanCave2FHiddenCarbos:
	hiddenitem CARBOS, EVENT_CERULEAN_CAVE_2F_HIDDEN_CARBOS

CeruleanCave2FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_CERULEAN_CAVE_2F_HIDDEN_MAX_REVIVE

CeruleanCave2FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CERULEAN_CAVE_2F_HIDDEN_FULL_RESTORE

CeruleanCave2FHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_CERULEAN_CAVE_2F_HIDDEN_STAR_PIECE

CeruleanCave2FHiddenNugget:
	hiddenitem NUGGET, EVENT_CERULEAN_CAVE_2F_HIDDEN_NUGGET

CeruleanCave2FHiddenDuskBall:
	hiddenitem DUSK_BALL, EVENT_CERULEAN_CAVE_2F_HIDDEN_DUSK_BALL

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
	bg_event 24,  2, BGEVENT_ITEM, CeruleanCave2FHiddenFiber
	bg_event  4,  4, BGEVENT_ITEM, CeruleanCave2FHiddenCarbos
	bg_event 10, 21, BGEVENT_ITEM, CeruleanCave2FHiddenMaxRevive
	bg_event 18, 23, BGEVENT_ITEM, CeruleanCave2FHiddenFullRestore
	bg_event 31, 14, BGEVENT_ITEM, CeruleanCave2FHiddenStarPiece
	bg_event 35, 15, BGEVENT_ITEM, CeruleanCave2FHiddenNugget
	bg_event 15, 21, BGEVENT_ITEM, CeruleanCave2FHiddenDuskBall

	def_object_events
	object_event 28, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 25, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 11, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 37, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FTwistedspoon, EVENT_CERULEAN_CAVE_2F_TWISTEDSPOON
	object_event 22,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FIron, EVENT_CERULEAN_CAVE_2F_IRON
	object_event 13, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FProtein, EVENT_CERULEAN_CAVE_2F_PROTEIN
	object_event 26, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FPPUp, EVENT_CERULEAN_CAVE_2F_PP_UP
	object_event  2, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FCalcium, EVENT_CERULEAN_CAVE_2F_CALCIUM
