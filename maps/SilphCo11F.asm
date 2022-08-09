	object_const_def

SilphCo11F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCo11FSign:
	jumptext SilphCo11FSignText

SilphCoChiefsOfficeSign:
  jumptext SilphCoChiefsOfficeSignText

SilphCo11FSignText:
	text "SILPH CO. 11F"
	done

SilphCoChiefsOfficeSignText:
	text "CHIEF's OFFICE"
	done

SilphCo10F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  2, SILPH_CO_10F, 2
	warp_event  3,  3, SILPH_CO_7F, 5

	def_coord_events

	def_bg_events
	bg_event 12,  1, BGEVENT_READ, SilphCo11FSign
  bg_event  6, 13, BGEVENT_READ, SilphCoChiefsOfficeSign

	def_object_events
