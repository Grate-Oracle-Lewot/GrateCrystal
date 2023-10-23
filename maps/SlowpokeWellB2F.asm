	object_const_def
	const SLOWPOKEWELLB2F_GYM_GUIDE
	const SLOWPOKEWELLB2F_POKE_BALL

SlowpokeWellB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellB2FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuideText_GotKingsRock
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

SlowpokeWellB2FGymGuideText:
	text "In this hack,"
	line "SLOWPOKE evolves"
	cont "like TYROGUE."

	para "Higher ATTACK gets"
	line "you a SLOWKING."

	para "Higher DEFENSE, a"
	line "SLOWBRO."

	para "If the two are"
	line "equal, you still"
	cont "get SLOWBRO."

	para "Since I don't need"
	line "this KING'S ROCK,"
	cont "you can have it."
	done

SlowpokeWellB2FGymGuideText_GotKingsRock:
	text "Have a #MON"
	line "hold KING'S ROCK."

	para "The enemy might"
	line "flinch when it's"
	cont "hit!"
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2
	warp_event 13,  5, UNION_CAVE_SLOWPOKE_WELL_LINK, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
