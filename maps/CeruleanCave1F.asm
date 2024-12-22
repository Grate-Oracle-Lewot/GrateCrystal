	object_const_def
	const CERULEANCAVE1F_POKE_BALL1
	const CERULEANCAVE1F_POKE_BALL2
	const CERULEANCAVE1F_POKE_BALL3

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1FElectrodeScript:
	waitsfx
	cry ELECTRODE
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon ELECTRODE, 42
	startbattle
	disappear CERULEANCAVE1F_POKE_BALL3
	reloadmapafterbattle
	end

CeruleanCave1FSwagBeacon:
	itemball SWAG_BEACON

CeruleanCave1FXSpecial:
	itemball X_SPECIAL

CeruleanCave1FHiddenLuckyPunch:
	hiddenitem LUCKY_PUNCH, EVENT_CERULEAN_CAVE_1F_HIDDEN_LUCKY_PUNCH

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25, 19, CERULEAN_CITY, 7
	warp_event 25,  9, CERULEAN_CAVE_2F, 1
	warp_event 29,  3, CERULEAN_CAVE_2F, 2
	warp_event  9,  3, CERULEAN_CAVE_2F, 3
	warp_event 19, 11, CERULEAN_CAVE_2F, 4
	warp_event  5, 13, CERULEAN_CAVE_2F, 5
	warp_event  3,  5, CERULEAN_CAVE_2F, 6
	warp_event  2,  9, CERULEAN_CAVE_B1F, 1
	warp_event 31, 19, CERULEAN_CAVE_B1F, 2

	def_coord_events

	def_bg_events
	bg_event  4, 11, BGEVENT_ITEM, CeruleanCave1FHiddenLuckyPunch

	def_object_events
	object_event 21,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FSwagBeacon, EVENT_CERULEAN_CAVE_1F_SWAG_BEACON
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FXSpecial, EVENT_CERULEAN_CAVE_1F_X_SPECIAL
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FElectrodeScript, EVENT_CERULEAN_CAVE_1F_ELECTRODE
