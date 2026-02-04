	object_const_def
	const DARKCAVE2F_BLACK_BELT1
	const DARKCAVE2F_BLACK_BELT2
	const DARKCAVE2F_POKE_BALL

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

DarkCave2FHiddenAmuletCoin:
	hiddenitem AMULET_COIN, EVENT_DARK_CAVE_2F_HIDDEN_AMULET_COIN

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
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 3
	warp_event 10,  7, DARK_CAVE_BLACKTHORN_ENTRANCE, 4

	def_coord_events

	def_bg_events
  bg_event 17,  3, BGEVENT_ITEM, DarkCave2FHiddenAmuletCoin

	def_object_events
	object_event 15,  7, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltJackie, -1
	object_event 12,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltBruce, -1
	object_event  6,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave2FFocusBand, EVENT_DARK_CAVE_2F_FOCUS_BAND
