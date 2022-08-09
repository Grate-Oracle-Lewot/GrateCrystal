	object_const_def

SilphCo8F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo8FSign:
	jumptext SilphCo8FSignText

SilphCo8FSignText:
	text "SILPH CO. 8F"
	done

SilphCo8F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  2, SILPH_CO_7F, 2
	warp_event 17,  2, SILPH_CO_9F, 1
	warp_event  3, 15, SILPH_CO_2F, 3
	warp_event 11,  5, SILPH_CO_2F, 4
	warp_event 11,  9, SILPH_CO_8F, 6
	warp_event  3, 11, SILPH_CO_8F, 5

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo8FSign

	def_object_events
