	object_const_def
	const SAFARIZONEN_BIRD
	const SAFARIZONEN_POKE_BALL

SafariZoneN_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneNXatuScript:
	waitsfx
	cry XATU
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon NATU, 55
else
	loadwildmon XATU, 55
endc
	startbattle
	disappear SAFARIZONEN_BIRD
	reloadmapafterbattle
	end

SafariZoneNXEvade:
	itemball X_EVADE

SafariZoneN_MapEvents:
	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 43, 15, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneNXatuScript, EVENT_SAFARI_ZONE_N_XATU
	object_event 15,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneNXEvade, EVENT_SAFARI_ZONE_N_X_EVADE
