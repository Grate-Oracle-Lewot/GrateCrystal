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

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo4FSign

	def_object_events
