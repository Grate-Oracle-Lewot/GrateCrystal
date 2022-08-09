	object_const_def
	const SILPHCO2F_RECEPTIONIST

SilphCo2F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo2FReceptionistScript:
	jumptextfaceplayer SilphCo2FReceptionistText

SilphCo2FSign:
	jumptext SilphCo2FSignText

SilphCo2FReceptionistText:
	text "Don't bug me, kid."
	line "I'm on break."
	done

SilphCo2FSignText:
	text "SILPH CO. 2F"
	done

SilphCo2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  2, SILPH_CO_1F, 3
	warp_event 25,  2, SILPH_CO_3F, 1
	warp_event 13,  3, SILPH_CO_8F, 3
	warp_event 27, 15, SILPH_CO_8F, 4
	warp_event  3,  3, SILPH_CO_3F, 3
	warp_event  9, 15, SILPH_CO_6F, 4

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo2FSign

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo2FReceptionistScript, -1
