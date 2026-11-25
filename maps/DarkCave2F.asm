	object_const_def
	const DARKCAVE2F_BLACK_BELT1
	const DARKCAVE2F_BLACK_BELT2
	const DARKCAVE2F_POKE_BALL1
	const DARKCAVE2F_POKE_BALL2

DarkCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBlackbeltJackie:
	trainer BLACKBELT_T, JACKIE, EVENT_BEAT_BLACKBELT_JACKIE, BlackbeltJackieSeenText, BlackbeltJackieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltJackieAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltBruce:
	trainer BLACKBELT_T, BRUCE, EVENT_BEAT_BLACKBELT_BRUCE, BlackbeltBruceSeenText, BlackbeltBruceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltBruceAfterText
	waitbutton
	closetext
	end

DarkCave2FFocusBand:
	itemball FOCUS_BAND

DarkCave2FCakeOfRage:
	itemball CAKE_OF_RAGE

DarkCave2FHiddenAmuletCoin:
	hiddenitem AMULET_COIN, EVENT_DARK_CAVE_2F_HIDDEN_AMULET_COIN
DarkCave2FHiddenBlackbelt:
	hiddenitem BLACKBELT_I, EVENT_DARK_CAVE_2F_HIDDEN_BLACKBELT

BlackbeltJackieSeenText:
	text "How dare you int-"
	line "rude on our secret"
	cont "training area?!"
	done

BlackbeltJackieBeatenText:
	text "Ohhhhh!"
	done

BlackbeltJackieAfterText:
	text "You have proven"
	line "yourself worthy"
	cont "to train here."
	done

BlackbeltBruceSeenText:
	text "You've entered the"
	line "den of the dragon!"
	done

BlackbeltBruceBeatenText:
	text "Aiyeeeah!"
	done

BlackbeltBruceAfterText:
	text "You showed me your"
	line "hidden dragon!"
	done

DarkCave2F_MapEvents:
	def_warp_events
	warp_event 23,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 3
	warp_event 30,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 4
	warp_event  4, 13, DARK_CAVE_VIOLET_ENTRANCE, 7

	def_coord_events

	def_bg_events
	bg_event 37,  3, BGEVENT_ITEM, DarkCave2FHiddenAmuletCoin
	bg_event  6,  5, BGEVENT_ITEM, DarkCave2FHiddenBlackbelt

	def_object_events
	object_event 35,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltJackie, -1
	object_event 20,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltBruce, -1
	object_event 26,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave2FFocusBand, EVENT_DARK_CAVE_2F_FOCUS_BAND
	object_event 19, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave2FCakeOfRage, EVENT_DARK_CAVE_2F_CAKE_OF_RAGE
