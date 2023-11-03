	object_const_def
	const BILLSBROTHERSHOUSE_POKEFAN_F
	const BILLSBROTHERSHOUSE_YOUNGSTER

BillsBrothersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillsBrotherScript:
	jumptextfaceplayer BillsBrotherText

BillsBrothersHouseYoungsterScript:
	jumptextfaceplayer BillsBrothersHouseYoungsterText

BillsBrothersHousePhoto:
	jumptext BillsBrothersHousePhotoText

BillsBrotherText:
	text "My grandpa is at "
	line "my brother BILL's"
	cont "on CERULEAN CAPE."

	para "My grandma went to"
	line "train at the cave"
	cont "in MT.SILVER."
	done

BillsBrothersHouseYoungsterText:
	text "You're not allowed"
	line "to walk CYCLING"
	cont "ROAD."

	para "You have to ride a"
	line "bike."
	done

BillsBrothersHousePhotoText:
	text "It's a photo of"
	line "BILL's family."

	para "There are too many"
	line "people to count!"
	done

BillsBrothersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 4
	warp_event  3,  7, FUCHSIA_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, BillsBrothersHousePhoto

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsBrotherScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsBrothersHouseYoungsterScript, -1
