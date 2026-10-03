	object_const_def
	const SEAFOAMCAVEUPPERFLOORS_BOULDER1
	const SEAFOAMCAVEUPPERFLOORS_BOULDER2

SeafoamCaveUpperFloors_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamCaveUpperFloorsBoulder:
	jumpstd StrengthBoulderScript

SeafoamCaveUpperFloorsHiddenXSpDefend:
	hiddenitem X_SP_DEFEND, EVENT_SEAFOAM_CAVE_UPPER_FLOORS_HIDDEN_X_SP_DEFEND

SeafoamCaveUpperFloors_MapEvents:
	def_warp_events
	warp_event  3, 13, SEAFOAM_CAVE_PUZZLE_CHAMBER, 3
	warp_event 29, 15, SEAFOAM_GYM, 2
  warp_event  9,  5, SEAFOAM_CAVE_UPPER_FLOORS, 10
  warp_event 27,  3, SEAFOAM_CAVE_UPPER_FLOORS, 11
  warp_event 25, 15, SEAFOAM_CAVE_UPPER_FLOORS, 12
  warp_event 19,  6, SEAFOAM_CAVE_UPPER_FLOORS, 8
  warp_event 26,  6, SEAFOAM_CAVE_UPPER_FLOORS, 9
  warp_event 18, 29, SEAFOAM_CAVE_UPPER_FLOORS, 6
  warp_event 23, 29, SEAFOAM_CAVE_UPPER_FLOORS, 7
  warp_event  7, 27, SEAFOAM_CAVE_UPPER_FLOORS, 3
  warp_event 25, 25, SEAFOAM_CAVE_UPPER_FLOORS, 4
  warp_event 23, 37, SEAFOAM_CAVE_UPPER_FLOORS, 5
  warp_event  3, 25, SEAFOAM_CAVE_UPPER_FLOORS, 21
  warp_event 13, 27, SEAFOAM_CAVE_UPPER_FLOORS, 22
  warp_event 19, 37, SEAFOAM_CAVE_UPPER_FLOORS, 23
  warp_event 25, 33, SEAFOAM_CAVE_UPPER_FLOORS, 24
  warp_event 18, 28, SEAFOAM_CAVE_UPPER_FLOORS, 19
  warp_event 23, 28, SEAFOAM_CAVE_UPPER_FLOORS, 20
  warp_event 19, 49, SEAFOAM_CAVE_UPPER_FLOORS, 17
  warp_event 22, 49, SEAFOAM_CAVE_UPPER_FLOORS, 18
  warp_event  5, 45, SEAFOAM_CAVE_UPPER_FLOORS, 13
  warp_event 13, 49, SEAFOAM_CAVE_UPPER_FLOORS, 14
  warp_event 19, 57, SEAFOAM_CAVE_UPPER_FLOORS, 15
  warp_event 25, 53, SEAFOAM_CAVE_UPPER_FLOORS, 16
  warp_event  5, 55, SEAFOAM_CAVE_LOWER_FLOORS, 3
  warp_event 25, 45, SEAFOAM_CAVE_LOWER_FLOORS, 4
  warp_event 25, 55, SEAFOAM_CAVE_LOWER_FLOORS, 5
  warp_event 19, 48, SEAFOAM_CAVE_LOWER_FLOORS, 1
  warp_event 22, 48, SEAFOAM_CAVE_LOWER_FLOORS, 2

	def_coord_events

	def_bg_events
	bg_event 15, 57, BGEVENT_ITEM, SeafoamCaveUpperFloorsHiddenXSpDefend

	def_object_events
	object_event 20, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveUpperFloorsBoulder, -1
	object_event 28,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveUpperFloorsBoulder, -1
