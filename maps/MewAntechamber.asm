	object_const_def
	const MEWANTECHAMBER_BOULDER
	const MEWANTECHAMBER_POKE_BALL1
	const MEWANTECHAMBER_POKE_BALL2

MewAntechamber_MapScripts:
	def_scene_scripts

	def_callbacks

MewAntechamberBoulder:
	jumpstd StrengthBoulderScript

MewAntechamberVoltorbScript:
	waitsfx
	cry VOLTORB
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon VOLTORB, 25
	startbattle
	disappear MEWANTECHAMBER_POKE_BALL1
	reloadmapafterbattle
	end

MewAntechamberTMDarkPulse:
	itemball TM_DARK_PULSE

MewAntechamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, TOHJO_FALLS, 3
	warp_event  6, 17, TOHJO_FALLS, 3
	warp_event  4,  3, MEW_CHAMBER, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MewAntechamberBoulder, -1
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MewAntechamberVoltorbScript, EVENT_MEW_ANTECHAMBER_VOLTORB
	object_event 11,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, MewAntechamberTMDarkPulse, EVENT_MEW_ANTECHAMBER_TM_DARK_PULSE
