	object_const_def

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks

MoonRockSignScript:
	jumptext MoonRockSignText

MoonRockSignText:
	text "These meteorites"
	line "impacted near MT."

	para "MOON, and have now"
	line "been positively"

	para "identified as MOON"
	line "STONES."

	para "The historic abun-"
	line "dance of MOON"

	para "STONES gave MT."
	line "MOON its name, but"

	para "no explanation has"
	line "yet been found for"

	para "their propensity"
	line "to land there."
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_1F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  5, BGEVENT_READ, MoonRockSignScript

	def_object_events
