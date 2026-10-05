	object_const_def
	const SEAFOAMCAVELOWERFLOORS_BOULDER1
	const SEAFOAMCAVELOWERFLOORS_BOULDER2
	const SEAFOAMCAVELOWERFLOORS_BOULDER3
	const SEAFOAMCAVELOWERFLOORS_BOULDER4
	const SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER1
	const SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER2
	const SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER3
	const SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER4

SeafoamCaveLowerFloors_MapScripts:
	def_scene_scripts
	scene_script .DummyScene
	scene_script .DummyScene

	def_callbacks
	callback MAPCALLBACK_TILES, .WaterCurrents
	callback MAPCALLBACK_OBJECTS, .BlockingBoulders
	callback MAPCALLBACK_STONETABLE, .SetUpStoneTable

.DummyScene:
	end

.WaterCurrents:
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1
	iffalse .Check2ndPair
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2
	iffalse .Check2ndPair
	changeblock 20,  4, $0f ; water, no current
	changeblock 22,  4, $0f ; water, no current
	changeblock 24,  4, $0f ; water, no current
	changeblock 24,  6, $0f ; water, no current
	changeblock 24,  8, $0f ; water, no current
	changeblock 24, 10, $0f ; water, no current
	changeblock 24, 12, $0f ; water, no current
	changeblock 20, 10, $0f ; water, no current
	changeblock 22, 10, $0f ; water, no current
	changeblock 28, 12, $0f ; water, no current
	changeblock 26, 12, $0f ; water, no current
	changeblock 26, 14, $0f ; water, no current
	changeblock 26, 16, $0f ; water, no current
	changeblock 26, 18, $0f ; water, no current
.Check2ndPair:
	checkevent EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_1
	iffalse .End
	checkevent EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_2
	iffalse .End
	changeblock 16, 28, $0f ; water, no current
	changeblock 16, 30, $0f ; water, no current
	changeblock 16, 32, $0f ; water, no current
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1
	iffalse .End
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2
	iffalse .End
	changeblock 26, 28, $0f ; water, no current
	changeblock 26, 30, $0f ; water, no current
	changeblock 26, 32, $0f ; water, no current
	changeblock 24, 32, $0f ; water, no current
	changeblock 22, 32, $0f ; water, no current
	changeblock 20, 32, $0f ; water, no current
	changeblock 18, 32, $0f ; water, no current
	changeblock 18, 34, $0f ; water, no current
	changeblock 18, 36, $0f ; water, no current
	changeblock 18, 38, $0f ; water, no current
	changeblock 18, 40, $0f ; water, no current
	changeblock 18, 42, $0f ; water, no current
	changeblock 18, 44, $0f ; water, no current
	changeblock 20, 40, $0f ; water, no current
	changeblock 22, 40, $0f ; water, no current
.End:
	endcallback

.BlockingBoulders:
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_1
	iftrue .AppearBlock1
.Check2:
	checkevent EVENT_SEAFOAM_CAVE_UPPER_FLOORS_BOULDER_2
	iftrue .AppearBlock2
.Check3:
	checkevent EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_1
	iftrue .AppearBlock3
.Check4:
	checkevent EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_2
	iftrue .AppearBlock4
	endcallback

.AppearBlock1:
	appear SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER1
	sjump .Check2

.AppearBlock2:
	appear SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER2
	sjump .Check3

.AppearBlock3:
	appear SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER3
	sjump .Check4

.AppearBlock4:
	appear SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER4
	endcallback

.SetUpStoneTable:
	usestonetable .StoneTable
 	endcallback

.StoneTable:
	stonetable 11, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_1, .Boulder1
	stonetable 12, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_2, .Boulder2
	db -1 ; end

.Boulder1:
	disappear EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_1
	appear SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER3
	sjump .Fall

.Boulder2:
	disappear EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_2
	appear SEAFOAMCAVELOWERFLOORS_BLOCKINGBOULDER4
.Fall:
	pause 30
	playsound SFX_HYDRO_PUMP
	earthquake 80
	opentext
	writetext SeafoamCaveUpperFloorsBoulderFallText
	waitbutton
	closetext
	end

SeafoamCaveLowerFloorsFakeWarpDownScene:
	playsound SFX_ENTER_DOOR
	applymovement PLAYER, SeafoamCaveLowerFloorsFakeWarpDownMovement1
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, SeafoamCaveLowerFloorsFakeWarpDownMovement2
	end

SeafoamCaveLowerFloorsFakeWarpUpScene:
	playsound SFX_ENTER_DOOR
	applymovement PLAYER, SeafoamCaveLowerFloorsFakeWarpUpMovement1
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, SeafoamCaveLowerFloorsFakeWarpUpMovement2
	end

SeafoamCaveLowerFloorsBoulder:
	jumpstd StrengthBoulderScript

SeafoamCaveLowerFloorsBlockingBoulder:
	jumptext SeafoamCaveLowerFloorsBlockingBoulderText

SeafoamCaveLowerFloorsHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_HIDDEN_MAX_REVIVE

SeafoamCaveLowerFloorsFakeWarpDownMovement1:
	hide_object
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

SeafoamCaveLowerFloorsFakeWarpDownMovement2:
	show_object
	step DOWN
	step_end

SeafoamCaveLowerFloorsFakeWarpUpMovement1:
	hide_object
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

SeafoamCaveLowerFloorsFakeWarpUpMovement2:
	show_object
	step RIGHT
	step_end

SeafoamCaveUpperFloorsBoulderFallText:
	text "Sounds like it"
	line "landed in water…"
	done

SeafoamCaveLowerFloorsBlockingBoulderText:
	text "The boulder is"
	line "blocking the water"
	cont "current."
	done

SeafoamCaveLowerFloors_MapEvents:
	def_warp_events
	warp_event 22, 54, SEAFOAM_CAVE_UPPER_FLOORS, 28
	warp_event 24, 54, SEAFOAM_CAVE_UPPER_FLOORS, 29
	warp_event 11, 13, SEAFOAM_CAVE_UPPER_FLOORS, 25
	warp_event 31,  3, SEAFOAM_CAVE_UPPER_FLOORS, 26
	warp_event 31, 15, SEAFOAM_CAVE_UPPER_FLOORS, 27
	warp_event 23, 29, SEAFOAM_CAVE_LOWER_FLOORS, 7
	warp_event 47,  3, SEAFOAM_CAVE_LOWER_FLOORS, 6
	warp_event 47,  5, SEAFOAM_CAVE_HIDEOUT, 1
	warp_event 15,  9, SEAFOAM_CAVE_LOWER_FLOORS, 13
	warp_event 31,  5, SEAFOAM_CAVE_LOWER_FLOORS, 14
	warp_event  9, 18, SEAFOAM_CAVE_LOWER_FLOORS, 1 ; hole
	warp_event 12, 18, SEAFOAM_CAVE_LOWER_FLOORS, 2 ; hole
	warp_event 25, 35, SEAFOAM_CAVE_LOWER_FLOORS, 9
	warp_event 39, 31, SEAFOAM_CAVE_LOWER_FLOORS, 10

	def_coord_events
	coord_event 23, 43, 0, SeafoamCaveLowerFloorsFakeWarpDownScene
	coord_event 23, 53, 0, SeafoamCaveLowerFloorsFakeWarpUpScene

	def_bg_events
	bg_event 15, 57, BGEVENT_ITEM, SeafoamCaveLowerFloorsHiddenMaxRevive

	def_object_events
	object_event  9, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBoulder, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_1
	object_event 14, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBoulder, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BOULDER_2
	object_event 11, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBoulder, -1
	object_event 15, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBoulder, -1
	object_event 20,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBlockingBoulder, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BLOCKING_BOULDER_1
	object_event 21,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBlockingBoulder, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BLOCKING_BOULDER_2
	object_event 16, 28, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBlockingBoulder, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BLOCKING_BOULDER_3
	object_event 17, 28, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveLowerFloorsBlockingBoulder, EVENT_SEAFOAM_CAVE_LOWER_FLOORS_BLOCKING_BOULDER_4
