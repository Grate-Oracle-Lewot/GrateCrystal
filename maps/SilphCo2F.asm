	object_const_def

SilphCo2F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo2FSign:
	jumptext SilphCo2FSignText

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

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo2FSign

	def_object_events
