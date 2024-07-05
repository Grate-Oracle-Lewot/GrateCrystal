	object_const_def
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3
	const ICEPATH1F_BEAUTY
	const ICEPATH1F_ROCKER
	const ICEPATH1F_DRAGONITE
	const ICEPATH1F_FISHER

IcePath1F_MapScripts:
	def_scene_scripts

	def_callbacks

IcePath1FHMWaterfall:
	itemball HM_WATERFALL

IcePath1FPPUp:
	itemball PP_UP

IcePath1FProtein:
	itemball PROTEIN

TrainerSkierSkye:
	trainer SKIER, SKYE, EVENT_BEAT_SKIER_SKYE, SkierSkyeSeenText, SkierSkyeBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SkierSkyeAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderSvlad:
	trainer BOARDER, SVLAD, EVENT_BEAT_BOARDER_SVLAD, BoarderSvladSeenText, BoarderSvladBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BoarderSvladAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherSven:
	trainer FIREBREATHER, SVEN, EVENT_BEAT_FIREBREATHER_SVEN, FirebreatherSvenSeenText, FirebreatherSvenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherSvenAfterBattleText
	waitbutton
	closetext
	end

IcePath1FDragoniteScript:
	faceplayer
	opentext
	cry DRAGONITE
	writetext IcePath1FDragoniteText
	yesorno
	iftrue .ReadNote
	closetext
	end

.ReadNote:
	writetext IcePath1FDragoniteNoteText
	waitbutton
	closetext
	end

SkierSkyeSeenText:
	text "Here comes the"
	line "welcome wagon!"
	done

SkierSkyeBeatenText:
	text "I'm shook!"
	done

SkierSkyeAfterBattleText:
	text "I hope you're not"
	line "a double agent…"
	done

BoarderSvladSeenText:
	text "Watch me do a"
	line "360!"
	done

BoarderSvladBeatenText:
	text "Wipeout!"
	done

BoarderSvladAfterBattleText:
	text "In a place like"
	line "this, the one"

	para "thing you don't"
	line "want to do is"
	cont "yodel."
	done

FirebreatherSvenSeenText:
	text "Let me light up"
	line "your life!"
	done

FirebreatherSvenBeatenText:
	text "You set my heart"
	line "ablaze!"
	done

FirebreatherSvenAfterBattleText:
	text "I could go for a"
	line "hot cup of cocoa."
	done

IcePath1FDragoniteText:
	text "DRAGONITE blocks"
	line "the way."

	para "It's holding a"
	line "note. Read it?"
	done

IcePath1FDragoniteNoteText:
	text "Dear <PLAYER>,"

	para "I've paid this"
	line "DRAGONITE to stand"

	para "here until you"
	line "have 7 BADGES."

	para "Sincerely, CLAIR"
	done

IcePath1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 19, ROUTE_44, 1
	warp_event 36, 27, BLACKTHORN_CITY, 7
	warp_event 37,  5, ICE_PATH_B1F, 1
	warp_event 37, 13, ICE_PATH_B1F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 31,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_GREEN, OBJECTTYPE_ITEMBALL, 0, IcePath1FHMWaterfall, EVENT_GOT_HM07_WATERFALL
	object_event 32, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPPUp, EVENT_ICE_PATH_1F_PP_UP
	object_event 35,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FProtein, EVENT_ICE_PATH_1F_PROTEIN
	object_event 11, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSkierSkye, -1
	object_event 21,  4, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBoarderSvlad, -1
	object_event 15, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath1FDragoniteScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event 34, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherSven, -1
