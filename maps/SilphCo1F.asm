	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_CLERK

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCo1FClerkScript:
	jumptextfaceplayer SilphCo1FClerkText

SilphCoReceptionistText:
	text "Welcome to SILPH!"

	para "If you need to"
	line "speak to the"

	para "CHIEF, his office"
	line "is on the 11th"
	cont "floor."
	done

SilphCo1FClerkText:
	text "Sorry, the water"
	line "feature is under"
	cont "maintenance."
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, SAFFRON_CITY, 7
	warp_event 11, 17, SAFFRON_CITY, 7
	warp_event 25,  0, SILPH_CO_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 17, 12, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo1FClerkScript, -1
