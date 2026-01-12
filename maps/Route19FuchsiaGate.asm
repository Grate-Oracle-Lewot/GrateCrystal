	object_const_def
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FuchsiaGateOfficerText_RocksCleared
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "Three years ago,"
	line "there was a huge"

	para "explosion on"
	line "CINNABAR ISLAND."

	para "It hurled boulders"
	line "that cut off ROUTE"
	cont "19 indefinitely."
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "After three years,"
	line "the rubble from"

	para "that explosion is"
	line "finally gone."

	para "But I wonder what"
	line "caused it in the"
	cont "first place?"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, FUCHSIA_CITY, 9
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  3,  5, ROUTE_19, 1
	warp_event  4,  5, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
