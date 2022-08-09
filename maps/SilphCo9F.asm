	object_const_def
	const SILPHCO9F_RECEPTIONIST

SilphCo9F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo9FReceptionistScript:
	jumptextfaceplayer SilphCo9FReceptionistText

SilphCo9FSign:
	jumptext SilphCo9FSignText

SilphCo9FReceptionistText:
	text "There must be a"
	line "better place to"

	para "store all these"
	line "statues…"
	done

SilphCo9FSignText:
	text "SILPH CO. 9F"
	done

SilphCo9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  2, SILPH_CO_8F, 2
	warp_event 13,  2, SILPH_CO_10F, 1
	warp_event 17, 15, SILPH_CO_5F, 6
	warp_event  9,  3, SILPH_CO_3F, 8

	def_coord_events

	def_bg_events
	bg_event 18,  1, BGEVENT_READ, SilphCo9FSign

	def_object_events
	object_event  5,  7, SPRITE_OLD_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilphCo9FReceptionistScript, -1
