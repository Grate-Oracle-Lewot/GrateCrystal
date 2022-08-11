	object_const_def
	const SAFARIZONE_POKE_BALL1
	const SAFARIZONE_POKE_BALL2

SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneThickClub:
	itemball THICK_CLUB

SafariZoneGoldTeeth:
	itemball GOLD_TEETH

SafariZoneTrashcan:
	jumpstd TrashCanScript

SafariZone_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 30, 47, SAFARI_ZONE_GATE, 1
	warp_event 31, 47, SAFARI_ZONE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 32, 46, BGEVENT_READ, SafariZoneTrashcan

	def_object_events
	object_event  5, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneThickClub, EVENT_SAFARI_ZONE_THICK_CLUB
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneGoldTeeth, EVENT_SAFARI_ZONE_GOLD_TEETH
