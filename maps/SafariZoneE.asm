	object_const_def
	const SAFARIZONEE_BIRD

SafariZoneE_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneEAerodactylScript:
	faceplayer
	waitsfx
	cry AERODACTYL
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon SPEAROW, 56
else
	loadwildmon AERODACTYL, 56
endc
	startbattle
	disappear SAFARIZONEE_BIRD
	reloadmapafterbattle
	end

SafariZoneE_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14, 19, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, NITE_HOUR, MORN_HOUR, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, SafariZoneEAerodactylScript, EVENT_SAFARI_ZONE_E_AERODACTYL
