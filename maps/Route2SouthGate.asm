	object_const_def
	const ROUTE2SOUTHGATE_OFFICER

Route2SouthGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2SouthGateOfficerScript:
	jumptextfaceplayer Route2SouthGateOfficerText

Route2SouthGateOfficerText:
	text "VIRIDIAN FOREST"
	line "has been spruced"

	para "up as something of"
	line "a park."

	para "But there are"
	line "still wild #MON"

	para "in there, so be"
	line "careful."
	done

Route2SouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, VIRIDIAN_FOREST, 3
	warp_event  5,  0, VIRIDIAN_FOREST, 4
	warp_event  4,  7, ROUTE_2_SOUTH, 1
	warp_event  5,  7, ROUTE_2_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2SouthGateOfficerScript, -1
