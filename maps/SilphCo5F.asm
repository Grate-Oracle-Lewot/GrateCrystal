	object_const_def
	const SILPHCO5F_CLERK

SilphCo5F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo5FClerkScript:
	jumptextfaceplayer SilphCo5FClerkText

SilphCo5FSign:
	jumptext SilphCo5FSignText

SilphCo5FClerkText:
	text "Ghost #MON have"
	line "stopped obscuring"

	para "themselves ever"
	line "since our SILPH"
	cont "SCOPE came out…"

	para "It's a real kick"
	line "in the profit"
	cont "margin."
	done

SilphCo5FSignText:
	text "SILPH CO. 5F"
	done

SilphCo5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, SILPH_CO_4F, 2
	warp_event 23,  2, SILPH_CO_6F, 1
	warp_event 11,  5, SILPH_CO_3F, 4
	warp_event  3, 15, SILPH_CO_3F, 5
	warp_event 27,  3, SILPH_CO_7F, 3
	warp_event  9, 15, SILPH_CO_9F, 3

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo5FSign

	def_object_events
	object_event 12,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo5FClerkScript, -1
