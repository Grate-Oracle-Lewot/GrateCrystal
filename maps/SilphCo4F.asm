	object_const_def

SilphCo4F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo4FSign:
	jumptext SilphCo4FSignText

SilphCo4FSignText:
	text "SILPH CO. 4F"
	done

SilphCo4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, SILPH_CO_3F, 2
	warp_event 27,  2, SILPH_CO_5F, 1
	warp_event  3, 15, SILPH_CO_10F, 3
	warp_event 11,  7, SILPH_CO_10F, 4
	warp_event 17, 11, SILPH_CO_10F, 5
	warp_event 17,  3, SILPH_CO_6F, 3

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo4FSign

	def_object_events
