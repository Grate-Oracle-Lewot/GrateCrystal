	object_const_def
	const SILPHCO3F_CLERK

SilphCo3F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo3FClerkScript:
	jumptextfaceplayer SilphCo3FClerkText

SilphCo3FSign:
	jumptext SilphCo3FSignText

SilphCo3FClerkText:
	text "We used to have an"
	line "elevator, but it"

	para "was considered a"
	line "security hazard"

	para "after TEAM ROCKET"
	line "took us over…"

	para "Sigh…"
	done

SilphCo3FSignText:
	text "SILPH CO. 3F"
	done

SilphCo3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, SILPH_CO_2F, 2
	warp_event 23,  2, SILPH_CO_4F, 1
	warp_event 27,  3, SILPH_CO_2F, 5
	warp_event  3,  3, SILPH_CO_5F, 3
	warp_event  3, 15, SILPH_CO_5F, 4
	warp_event 23, 11, SILPH_CO_3F, 7
	warp_event 27, 15, SILPH_CO_3F, 6
	warp_event  3, 11, SILPH_CO_9F, 4
	warp_event 11, 11, SILPH_CO_7F, 4

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo3FSign

	def_object_events
	object_event 26, 20, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo3FClerkScript, -1
