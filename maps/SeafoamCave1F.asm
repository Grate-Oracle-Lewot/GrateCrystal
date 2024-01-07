	object_const_def

SeafoamCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamCave1FHiddenXSpDefend:
	hiddenitem X_SP_DEFEND, EVENT_SEAFOAM_CAVE_1F_HIDDEN_X_SP_DEFEND

SeafoamCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, SEAFOAM_CAVE_PUZZLE_CHAMBER, 3
	warp_event  3,  3, SEAFOAM_CAVE_B1F, 1
	warp_event 25,  5, SEAFOAM_GYM, 2

	def_coord_events

	def_bg_events
	bg_event 17,  4, BGEVENT_ITEM, SeafoamCave1FHiddenXSpDefend

	def_object_events

