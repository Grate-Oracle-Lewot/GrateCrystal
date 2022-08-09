	object_const_def

SilphCo3F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo3FSign:
	jumptext SilphCo3FSignText

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
