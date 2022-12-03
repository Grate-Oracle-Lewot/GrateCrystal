	object_const_def
	const ICEPATHARTICUNOCHAMBER_POKE_BALL
	const ICEPATHARTICUNOCHAMBER_SLOWKING
	const ICEPATHARTICUNOCHAMBER_ARTICUNO

IcePathArticunoChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Articuno

.Articuno:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .NoAppear
	endcallback

.NoAppear:
	disappear ICEPATHARTICUNOCHAMBER_SLOWKING
	disappear ICEPATHARTICUNOCHAMBER_ARTICUNO
	endcallback

IcePathArticunoChamberBrightpowder:
	itemball BRIGHTPOWDER

IcePathArticunoChamberSlowkingScript:
	jumptext IcePathArticunoChamberSlowkingText

IcePathArticunoChamberArticunoScript:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon ARTICUNO, 40
	startbattle
	disappear ICEPATHARTICUNOCHAMBER_SLOWKING
	disappear ICEPATHARTICUNOCHAMBER_ARTICUNO
	reloadmapafterbattle
	end

IcePathArticunoChamberSlowkingText:
	text "SLOWKING: …"

	para "Do you know PRYCE,"
	line "the MAHOGANY GYM"
	cont "LEADER?"

	para "…"

	para "In his youth, he"
	line "sought the"

	para "legendary bird of"
	line "ice, ARTICUNO…"

	para "…"

	para "The legendary"
	line "birds only appear"

	para "before a worthy"
	line "trainer…"

	para "…"

	para "PRYCE could not"
	line "accept that he was"

	para "unworthy, so he"
	line "stopped coming"
	cont "here…"

	para "…"

	para "…Remember to save"
	line "your game before"
	cont "facing it…"
	done

ArticunoText:
	text "Shoommmmm-nnnnn!"
	done

IcePathArticunoChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  3, ICE_PATH_B3F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathArticunoChamberBrightpowder, EVENT_ICE_PATH_ARTICUNO_CHAMBER_BRIGHTPOWDER
	object_event 15,  1, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IcePathArticunoChamberSlowkingScript, EVENT_ICE_PATH_ARTICUNO_CHAMBER_ARTICUNO
	object_event  9,  7, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IcePathArticunoChamberArticunoScript, EVENT_ICE_PATH_ARTICUNO_CHAMBER_ARTICUNO
