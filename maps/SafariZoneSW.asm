	object_const_def
	const SAFARIZONESW_FISH
	const SAFARIZONESW_FLOWER
	const SAFARIZONESW_SUDOWOODO
	const SAFARIZONESW_CHANSEY
	const SAFARIZONESW_MR_MIME
	const SAFARIZONESW_POKE_BALL1
	const SAFARIZONESW_POKE_BALL2

SafariZoneSW_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneSWMagikarpScript:
	waitsfx
	cry MAGIKARP
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon MAGIKARP, 57
	startbattle
	disappear SAFARIZONESW_FISH
	reloadmapafterbattle
	end

SafariZoneSWSunfloraScript:
	waitsfx
	cry SUNFLORA
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon SUNKERN, 53
else
	loadwildmon SUNFLORA, 53
endc
	startbattle
	disappear SAFARIZONESW_FLOWER
	reloadmapafterbattle
	end

SafariZoneSWSudowoodoScript:
	waitsfx
	playsound SFX_SANDSTORM
	applymovement SAFARIZONESW_SUDOWOODO, SafariZoneSWShakeMovement
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon GEODUDE, 54
else
	loadwildmon SUDOWOODO, 54
endc
	startbattle
	disappear SAFARIZONESW_SUDOWOODO
	reloadmapafterbattle
	end

SafariZoneSWBlisseyScript:
	waitsfx
	cry BLISSEY
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon CHANSEY, 58
else
	loadwildmon BLISSEY, 58
endc
	startbattle
	disappear SAFARIZONESW_CHANSEY
	reloadmapafterbattle
	end

SafariZoneSWMrMimeScript:
	waitsfx
	cry MR__MIME
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
if DEF(_LITTLE_CUP)
	loadwildmon ABRA, 52
else
	loadwildmon MR__MIME, 52
endc
	startbattle
	disappear SAFARIZONESW_MR_MIME
	reloadmapafterbattle
	end

SafariZoneSWBone:
	itemball BONE

SafariZoneSWCalcium:
	itemball CALCIUM

SafariZoneSWShakeMovement:
	tree_shake
	step_end

SafariZoneSWTrashcan:
	jumpstd TrashCanScript

SafariZoneSW_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 42, 45, SAFARI_ZONE_GATE, 1
	warp_event 43, 45, SAFARI_ZONE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 44, 44, BGEVENT_READ, SafariZoneSWTrashcan

	def_object_events
	object_event 41, 31, SPRITE_FISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneSWMagikarpScript, EVENT_SAFARI_ZONE_SW_MAGIKARP
	object_event 17, 20, SPRITE_FLOWER, SPRITEMOVEDATA_POKEMON, 0, 0, MORN_HOUR, NITE_HOUR, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneSWSunfloraScript, EVENT_SAFARI_ZONE_SW_SUNFLORA
	object_event 26, 46, SPRITE_SUDOWOODO, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneSWSudowoodoScript, EVENT_SAFARI_ZONE_SW_SUDOWOODO
	object_event 44, 38, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, 7, 8, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariZoneSWBlisseyScript, EVENT_SAFARI_ZONE_SW_BLISSEY
	object_event  9, 17, SPRITE_MR_MIME, SPRITEMOVEDATA_POKEMON, 0, 0, NOON_HOUR, MAX_HOUR, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SafariZoneSWMrMimeScript, EVENT_SAFARI_ZONE_SW_MR_MIME
	object_event  4,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneSWBone, EVENT_SAFARI_ZONE_SW_BONE
	object_event 28, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneSWCalcium, EVENT_SAFARI_ZONE_SW_CALCIUM
