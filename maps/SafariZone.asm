	object_const_def
	const SAFARIZONE_BIRD1
	const SAFARIZONE_BIRD2
	const SAFARIZONE_LAPRAS
	const SAFARIZONE_CHANSEY
	const SAFARIZONE_FLOWER
	const SAFARIZONE_FISH
	const SAFARIZONE_POKE_BALL1
	const SAFARIZONE_POKE_BALL2

SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneAerodactylScript:
	waitsfx
	cry AERODACTYL
	loadwildmon AERODACTYL, 56
	startbattle
	disappear SAFARIZONE_BIRD1
	reloadmapafterbattle
	end

SafariZoneXatuScript:
	waitsfx
	cry XATU
	loadwildmon XATU, 55
	startbattle
	disappear SAFARIZONE_BIRD2
	reloadmapafterbattle
	end

SafariZoneLaprasScript:
	waitsfx
	cry LAPRAS
	loadwildmon LAPRAS, 57
	startbattle
	disappear SAFARIZONE_LAPRAS
	reloadmapafterbattle
	end

SafariZoneBlisseyScript:
	waitsfx
	cry BLISSEY
	loadwildmon BLISSEY, 58
	startbattle
	disappear SAFARIZONE_CHANSEY
	reloadmapafterbattle
	end

SafariZoneSunfloraScript:
	waitsfx
	cry SUNFLORA
	loadwildmon SUNFLORA, 54
	startbattle
	disappear SAFARIZONE_FLOWER
	reloadmapafterbattle
	end

SafariZoneMagikarpScript:
	waitsfx
	cry MAGIKARP
	loadwildmon MAGIKARP, 53
	startbattle
	disappear SAFARIZONE_FISH
	reloadmapafterbattle
	end

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
	object_event  5, 22, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, SafariZoneAerodactylScript, EVENT_SAFARI_ZONE_AERODACTYL
	object_event 32,  6, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneXatuScript, EVENT_SAFARI_ZONE_XATU
	object_event 19,  8, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneLaprasScript, EVENT_SAFARI_ZONE_LAPRAS
	object_event 52, 12, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariZoneBlisseyScript, EVENT_SAFARI_ZONE_BLISSEY
	object_event 11, 31, SPRITE_FLOWER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneSunfloraScript, EVENT_SAFARI_ZONE_SUNFLORA
	object_event 29, 29, SPRITE_FISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneMagikarpScript, EVENT_SAFARI_ZONE_MAGIKARP
	object_event  0, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneThickClub, EVENT_SAFARI_ZONE_THICK_CLUB
	object_event 51, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneGoldTeeth, EVENT_SAFARI_ZONE_GOLD_TEETH
