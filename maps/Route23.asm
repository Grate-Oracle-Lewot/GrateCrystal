	object_const_def
	const ROUTE23_OFFICER

Route23_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	endcallback

Route23OfficerScript:
	jumptextfaceplayer Route23OfficerText

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

LoungeSign:
	jumptext LoungeSignText

Route23OfficerText:
	text "…What? Yes, of"
	line "course I'm being"

	para "paid to stand"
	line "here."

	para "Oh? You have all"
	line "eight badges?"

	para "That's cute."

	para "You'll need more"
	line "than that before I"

	para "can let you in"
	line "here."
	done

IndigoPlateauSignText:
	text "INDIGO PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#MON LEAGUE HQ"
	done

LoungeSignText:
	text "PRIVATE LOUNGE"
	done

Route23_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 10,  5, INDIGO_PLATEAU_POKECENTER_1F, 2
	warp_event  9, 31, VICTORY_ROAD, 10
	warp_event 10, 31, VICTORY_ROAD, 10
	warp_event 15, 21, LOUNGE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, IndigoPlateauSign
	bg_event 13, 21, BGEVENT_READ, LoungeSign

	def_object_events
	object_event 15, 22, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route23OfficerScript, EVENT_OPENED_MT_SILVER
