	object_const_def
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	setevent EVENT_DECO_DIGLETT_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext Route2NuggetHouseFisher_DecorationText
	setevent EVENT_GOT_NUGGET_FROM_GUY
	sjump .End

.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
.End:
	waitbutton
	closetext
	end

Route2NuggetHouseFisherText:
	text "Hi! Did you come"
	line "through DIGLETT'S"
	cont "CAVE?"

	para "DIGLETT are cute,"
	line "aren't they?"

	para "Why don't you take"
	line "this as a little"
	cont "present?"

	para "<PLAYER> received"
	line "DIGLETT DOLL!"
	done

Route2NuggetHouseFisher_DecorationText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

Route2NuggetHouseFisherText_GotNugget:
	text "I don't get many"
	line "visitors."

	para "You're the first in"
	line "a while."
	done

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_2, 5
	warp_event  3,  7, ROUTE_2, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
