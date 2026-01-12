	object_const_def
	const SAFARIZONEGATE_ROCK1
	const SAFARIZONEGATE_ROCK2

SafariZoneGate_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneGateRock:
	jumpstd SmashRockScript

SafariZoneGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFARI_ZONE, 1
	warp_event  5,  0, SAFARI_ZONE, 2
	warp_event  4,  7, FUCHSIA_CITY, 11
	warp_event  5,  7, FUCHSIA_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateRock, -1
	object_event  5,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateRock, -1
