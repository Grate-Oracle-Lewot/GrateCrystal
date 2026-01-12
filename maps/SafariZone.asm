	object_const_def
	const SAFARIZONE_BIRD1
	const SAFARIZONE_BIRD2
	const SAFARIZONE_LAPRAS
	const SAFARIZONE_CHANSEY
	const SAFARIZONE_FLOWER
	const SAFARIZONE_FISH
	const SAFARIZONE_SUDOWOODO
	const SAFARIZONE_POKE_BALL1
	const SAFARIZONE_POKE_BALL2

SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneAerodactylScript:
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
	disappear SAFARIZONE_BIRD1
	reloadmapafterbattle
	end

SafariZoneXatuScript:
	waitsfx
	cry XATU
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon NATU, 55
else
	loadwildmon XATU, 55
endc
	startbattle
	disappear SAFARIZONE_BIRD2
	reloadmapafterbattle
	end

SafariZoneLaprasScript:
	faceplayer
	waitsfx
	cry LAPRAS
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon SEEL, 57
else
	loadwildmon LAPRAS, 57
endc
	startbattle
	disappear SAFARIZONE_LAPRAS
	reloadmapafterbattle
	end

SafariZoneBlisseyScript:
	waitsfx
	cry BLISSEY
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon CHANSEY, 58
else
	loadwildmon BLISSEY, 58
endc
	startbattle
	disappear SAFARIZONE_CHANSEY
	reloadmapafterbattle
	end

SafariZoneSunfloraScript:
	waitsfx
	cry SUNFLORA
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon SUNKERN, 53
else
	loadwildmon SUNFLORA, 53
endc
	startbattle
	disappear SAFARIZONE_FLOWER
	reloadmapafterbattle
	end

SafariZoneMagikarpScript:
	waitsfx
	cry MAGIKARP
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon MAGIKARP, 52
	startbattle
	disappear SAFARIZONE_FISH
	reloadmapafterbattle
	end

SafariZoneSudowoodoScript:
	waitsfx
	playsound SFX_SANDSTORM
	applymovement SAFARIZONE_SUDOWOODO, SafariZoneShakeMovement
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon GEODUDE, 54
else
	loadwildmon SUDOWOODO, 54
endc
	startbattle
	disappear SAFARIZONE_SUDOWOODO
	reloadmapafterbattle
	end

SafariZoneBone:
	itemball BONE

SafariZoneCalcium:
	itemball CALCIUM

SafariZoneTrashcan:
	jumpstd TrashCanScript

SafariZoneShakeMovement:
	tree_shake
	step_end

SafariZone_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 30, 47, SAFARI_ZONE_GATE, 1
	warp_event 31, 47, SAFARI_ZONE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 32, 46, BGEVENT_READ, SafariZoneTrashcan

	def_object_events
	object_event  5, 22, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, NITE_HOUR, MORN_HOUR, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, SafariZoneAerodactylScript, EVENT_SAFARI_ZONE_AERODACTYL
	object_event 32,  6, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneXatuScript, EVENT_SAFARI_ZONE_XATU
	object_event 19,  8, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, NOON_HOUR, MAX_HOUR, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneLaprasScript, EVENT_SAFARI_ZONE_LAPRAS
	object_event 53, 14, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, 7, 8, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariZoneBlisseyScript, EVENT_SAFARI_ZONE_BLISSEY
	object_event 11, 30, SPRITE_FLOWER, SPRITEMOVEDATA_POKEMON, 0, 0, MORN_HOUR, NITE_HOUR, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneSunfloraScript, EVENT_SAFARI_ZONE_SUNFLORA
	object_event 29, 29, SPRITE_FISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneMagikarpScript, EVENT_SAFARI_ZONE_MAGIKARP
	object_event  2,  2, SPRITE_SUDOWOODO, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneSudowoodoScript, EVENT_SAFARI_ZONE_SUDOWOODO
	object_event  0, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneBone, EVENT_SAFARI_ZONE_BONE
	object_event 53, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneCalcium, EVENT_SAFARI_ZONE_CALCIUM
