	object_const_def

SilphCo6F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo6FSign:
	jumptext SilphCo6FSignText

SilphCo6FSignText:
	text "SILPH CO. 6F"
	done

SilphCo6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  2, SILPH_CO_5F, 2
	warp_event 15,  2, SILPH_CO_7F, 1
	warp_event  3,  3, SILPH_CO_4F, 6
	warp_event 23,  3, SILPH_CO_2F, 6

	def_coord_events

	def_bg_events
	bg_event 18,  1, BGEVENT_READ, SilphCo6FSign

	def_object_events
