	object_const_def
	const SILPHCO10F_RECEPTIONIST

SilphCo10F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo10FReceptionistScript:
	jumptextfaceplayer SilphCo10FReceptionistText

SilphCo10FSign:
	jumptext SilphCo10FSignText

SilphCo10FReceptionistText:
	text "We developed the"
	line "MASTER BALL."

	para "If you catch some-"
	line "thing good with"
	cont "it, thank SILPH!"
	done

SilphCo10FSignText:
	text "SILPH CO. 10F"
	done

SilphCo10F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, SILPH_CO_9F, 2
	warp_event  9,  2, SILPH_CO_11F, 1
	warp_event 13, 15, SILPH_CO_4F, 3
	warp_event  9, 11, SILPH_CO_4F, 4
	warp_event 13,  7, SILPH_CO_4F, 5

	def_coord_events

	def_bg_events
	bg_event 12,  1, BGEVENT_READ, SilphCo10FSign

	def_object_events
	object_event  9, 15, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo10FReceptionistScript, -1
