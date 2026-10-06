	object_const_def
	const SEAFOAMCAVEUPPERFLOORS_BOULDER1
	const SEAFOAMCAVEUPPERFLOORS_BOULDER2

SeafoamCaveUpperFloors_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .BoulderStartPositions
	callback MAPCALLBACK_STONETABLE, .SetUpStoneTable

.BoulderStartPositions:
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1
	iftrue .Check2
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1B
	iftrue .Move1B
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1A
	iftrue .Move1A
.Check2:
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2
	iftrue .End
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2B
	iftrue .Move2B
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2A
	iftrue .Move2A
.End:
	endcallback

.Move1B:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER1, 18, 48
	sjump .Check2

.Move1A:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER1, 17, 28
	sjump .Check2

.Move2B:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER2, 23, 48
	endcallback

.Move2A:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER2, 24, 28
	endcallback

.SetUpStoneTable:
	usestonetable .StoneTable
 	endcallback

.StoneTable:
	stonetable  6, SEAFOAMCAVEUPPERFLOORS_BOULDER1, .Boulder1
	stonetable  7, SEAFOAMCAVEUPPERFLOORS_BOULDER2, .Boulder2
	stonetable 17, SEAFOAMCAVEUPPERFLOORS_BOULDER1, .Boulder3
	stonetable 18, SEAFOAMCAVEUPPERFLOORS_BOULDER2, .Boulder4
	stonetable 28, SEAFOAMCAVEUPPERFLOORS_BOULDER1, .Boulder5
	stonetable 29, SEAFOAMCAVEUPPERFLOORS_BOULDER2, .Boulder6
	db -1 ; end

.Boulder1:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER1, 17, 28
	setevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1A
	sjump .Fall

.Boulder2:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER2, 24, 28
	setevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2A
	sjump .Fall

.Boulder3:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER1, 18, 48
	setevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1B
	sjump .Fall

.Boulder4:
	moveobject SEAFOAMCAVEUPPERFLOORS_BOULDER2, 23, 48
	setevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2B
.Fall:
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	opentext
	writetext SeafoamCaveUpperFloorsBoulderFellText
	waitbutton
	closetext
	end

.Boulder5:
	disappear SEAFOAMCAVEUPPERFLOORS_BOULDER1
	sjump .Splash

.Boulder6:
	disappear SEAFOAMCAVEUPPERFLOORS_BOULDER2
.Splash:
	pause 30
	playsound SFX_HYDRO_PUMP
	earthquake 80
	opentext
	writetext SeafoamCaveUpperFloorsBoulderSplashText
	waitbutton
	closetext
	end

SeafoamCaveUpperFloorsBoulder:
	jumpstd StrengthBoulderScript

SeafoamCaveUpperFloorsHiddenXSpDefend:
	hiddenitem X_SP_DEFEND, EVENT_SEAFOAM_CAVE_UPPER_FLOORS_HIDDEN_X_SP_DEFEND

SeafoamCaveUpperFloorsBoulderFellText:
	text "Hole in one!"
	done

SeafoamCaveUpperFloorsBoulderSplashText:
	text "Sounds like it"
	line "landed in water…"
	done

SeafoamCaveUpperFloors_MapEvents:
	def_warp_events
	warp_event  3, 13, SEAFOAM_CAVE_PUZZLE_CHAMBER, 3
	warp_event 29, 15, SEAFOAM_GYM, 2
	warp_event  9,  5, SEAFOAM_CAVE_UPPER_FLOORS, 10
	warp_event 27,  3, SEAFOAM_CAVE_UPPER_FLOORS, 11
	warp_event 25, 15, SEAFOAM_CAVE_UPPER_FLOORS, 12
	warp_event 19,  6, SEAFOAM_CAVE_UPPER_FLOORS, 8 ; hole
	warp_event 26,  6, SEAFOAM_CAVE_UPPER_FLOORS, 9 ; hole
	warp_event 18, 29, SEAFOAM_CAVE_UPPER_FLOORS, 6
	warp_event 23, 29, SEAFOAM_CAVE_UPPER_FLOORS, 7
	warp_event  7, 27, SEAFOAM_CAVE_UPPER_FLOORS, 3
	warp_event 25, 25, SEAFOAM_CAVE_UPPER_FLOORS, 4
	warp_event 23, 37, SEAFOAM_CAVE_UPPER_FLOORS, 5
	warp_event  3, 25, SEAFOAM_CAVE_UPPER_FLOORS, 21
	warp_event 13, 27, SEAFOAM_CAVE_UPPER_FLOORS, 22
	warp_event 19, 37, SEAFOAM_CAVE_UPPER_FLOORS, 23
	warp_event 25, 33, SEAFOAM_CAVE_UPPER_FLOORS, 24
	warp_event 18, 28, SEAFOAM_CAVE_UPPER_FLOORS, 19 ; hole
	warp_event 23, 28, SEAFOAM_CAVE_UPPER_FLOORS, 20 ; hole
	warp_event 19, 49, SEAFOAM_CAVE_UPPER_FLOORS, 17
	warp_event 22, 49, SEAFOAM_CAVE_UPPER_FLOORS, 18
	warp_event  5, 45, SEAFOAM_CAVE_UPPER_FLOORS, 13
	warp_event 13, 49, SEAFOAM_CAVE_UPPER_FLOORS, 14
	warp_event 19, 57, SEAFOAM_CAVE_UPPER_FLOORS, 15
	warp_event 25, 53, SEAFOAM_CAVE_UPPER_FLOORS, 16
	warp_event  5, 55, SEAFOAM_CAVE_LOWER_FLOORS, 3
	warp_event 25, 45, SEAFOAM_CAVE_LOWER_FLOORS, 4
	warp_event 25, 55, SEAFOAM_CAVE_LOWER_FLOORS, 5
	warp_event 19, 48, SEAFOAM_CAVE_LOWER_FLOORS, 1 ; hole
	warp_event 22, 48, SEAFOAM_CAVE_LOWER_FLOORS, 1 ; hole

	def_coord_events

	def_bg_events
	bg_event 15, 57, BGEVENT_ITEM, SeafoamCaveUpperFloorsHiddenXSpDefend

	def_object_events
	object_event 20, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveUpperFloorsBoulder, EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1
	object_event 28,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveUpperFloorsBoulder, EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2
