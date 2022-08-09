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

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo3FSign

	def_object_events
