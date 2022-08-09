	object_const_def

SilphCo7F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo7FSign:
	jumptext SilphCo7FSignText

SilphCo7FSignText:
	text "SILPH CO. 7F"
	done

SilphCo7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  2, SILPH_CO_6F, 2
	warp_event 17,  2, SILPH_CO_8F, 1
	warp_event 21, 15, SILPH_CO_5F, 5
	warp_event  5,  3, SILPH_CO_3F, 9
	warp_event  5,  7, SILPH_CO_11F, 2

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo7FSign

	def_object_events
