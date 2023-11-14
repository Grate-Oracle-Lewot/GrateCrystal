	object_const_def
	const SILVERCAVEMOLTRESCHAMBER_POKE_BALL
	const SILVERCAVEMOLTRESCHAMBER_SLOWKING
	const SILVERCAVEMOLTRESCHAMBER_MOLTRES

SilverCaveMoltresChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Moltres

.Moltres:
	checkevent EVENT_FOUGHT_MOLTRES
	iftrue .NoAppear
	endcallback

.NoAppear:
	disappear SILVERCAVEMOLTRESCHAMBER_SLOWKING
	disappear SILVERCAVEMOLTRESCHAMBER_MOLTRES
	endcallback

SilverCaveMoltresChamberSacredAsh:
	itemball SACRED_ASH

SilverCaveMoltresChamberSlowkingScript:
	jumptext SilverCaveMoltresChamberSlowkingText

SilverCaveMoltresChamberMoltresScript:
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_FOUGHT_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MOLTRES, 60
	startbattle
	disappear SILVERCAVEMOLTRESCHAMBER_SLOWKING
	disappear SILVERCAVEMOLTRESCHAMBER_MOLTRES
	reloadmapafterbattle
	end

SilverCaveMoltresChamberSlowkingText:
	text "SLOWKING: …"

	para "Do you know BLAINE"
	line "of CINNABAR GYM?"

	para "…"

	para "He once met the"
	line "legendary bird of"
	cont "fire, MOLTRES…"

	para "…"

	para "…That's why he"
	line "doesn't have any"
	cont "hair left…"
	done

MoltresText:
	text "Fwaarsh!"
	done

SilverCaveMoltresChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 35, SILVER_CAVE_ITEM_ROOMS, 3
	warp_event 11, 35, SILVER_CAVE_ITEM_ROOMS, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, SilverCaveMoltresChamberSacredAsh, EVENT_SILVER_CAVE_MOLTRES_CHAMBER_SACRED_ASH
	object_event 10, 23, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilverCaveMoltresChamberSlowkingScript, EVENT_SILVER_CAVE_MOLTRES_CHAMBER_MOLTRES
	object_event  7,  7, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveMoltresChamberMoltresScript, EVENT_SILVER_CAVE_MOLTRES_CHAMBER_MOLTRES
