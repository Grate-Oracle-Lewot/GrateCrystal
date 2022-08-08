	object_const_def

SilphCo9F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo9FSign:
	jumptext SilphCo9FSignText

SilphCo9FSignText:
	text "SILPH CO. 9F"
	done

SilphCo9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  2, SILPH_CO_8F, 2
	warp_event 13,  2, SILPH_CO_10F, 1

	def_coord_events

	def_bg_events
	bg_event 18,  1, BGEVENT_READ, SilphCo9FSign

	def_object_events
