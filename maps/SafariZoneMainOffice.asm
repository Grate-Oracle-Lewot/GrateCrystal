	object_const_def
	const SAFARIZONEMAINOFFICE_BOULDER1
	const SAFARIZONEMAINOFFICE_BOULDER2
	const SAFARIZONEMAINOFFICE_POKE_BALL

SafariZoneMainOffice_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneMainOfficeBoulder:
	jumpstd StrengthBoulderScript

SafariZoneMainOfficeStick:
	itemball STICK

SafariZoneMainOffice_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 2
	warp_event  3,  7, FUCHSIA_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneMainOfficeBoulder, -1
	object_event  1,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneMainOfficeBoulder, -1
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneMainOfficeStick, EVENT_SAFARI_ZONE_MAIN_OFFICE_STICK
