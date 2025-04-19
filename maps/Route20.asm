	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY
	const ROUTE20_GENTLEMAN

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRocks
	callback MAPCALLBACK_OBJECTS, .CheckAD

.ClearRocks:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

.CheckAD:
	appear ROUTE20_GENTLEMAN
	checkevent EVENT_FOUND_PERCY_ON_ROUTE_4
	iftrue .NextCheck
	endcallback

.NextCheck:
	checkevent EVENT_FOUND_LUCAS_ON_CYCLING_ROAD
	iftrue .DisappearAD
	endcallback

.DisappearAD:
	disappear ROUTE20_GENTLEMAN
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

Route20WillScript:
	faceplayer
	opentext
	checkevent EVENT_ELITE_HIDE_AND_SEEK
	iftrue .After
	writetext Route20WillText1
	waitbutton
	closetext
	setevent EVENT_ELITE_HIDE_AND_SEEK
	end

.After:
	writetext Route20WillText2
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done

Route20WillText1:
	text "Ah, it's you."

	para "I'm A.D. from the"
	line "ELITE FOUR,"
	cont "remember?"

	para "I'm supposed to"
	line "stand here until"

	para "you find LUCAS and"
	line "PERCY hiding some-"
	cont "where in KANTO."

	para "So, uh, you'd"
	line "better go do that,"
	cont "I guess."

	para "And no, rematching"
	line "them at the LEAGUE"
	cont "doesn't count."
	done

Route20WillText2:
	text "A hint? Uhhhh…"

	para "They're hiding, so"
	line "they'll probably go"

	para "to places where"
	line "you wouldn't other-"
	cont "wise have to go,"

	para "if you catch my"
	line "drift."
	done

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1
	warp_event 30,  5, SEAFOAM_CAVE_PUZZLE_CHAMBER, 1

	def_coord_events

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 45, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 12, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
	object_event 30,  6, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route20WillScript, EVENT_ROUTE_20_A_D
