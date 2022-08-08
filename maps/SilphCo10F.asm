	object_const_def

SilphCo10F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo10FSign:
	jumptext SilphCo10FSignText

SilphCo10FSignText:
	text "SILPH CO. 10F"
	done

SilphCo10F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, SILPH_CO_9F, 2
	warp_event  9,  2, SILPH_CO_11F, 1

	def_coord_events

	def_bg_events
	bg_event 12,  1, BGEVENT_READ, SilphCo10FSign

	def_object_events
