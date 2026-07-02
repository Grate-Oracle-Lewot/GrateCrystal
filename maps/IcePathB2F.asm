	object_const_def
	const ICEPATHB2F_ROCKER
	const ICEPATHB2F_BOULDER1
	const ICEPATHB2F_BOULDER2
	const ICEPATHB2F_BOULDER3
	const ICEPATHB2F_BOULDER4
	const ICEPATHB2F_POKE_BALL1
	const ICEPATHB2F_POKE_BALL2
	const ICEPATHB2F_POKE_BALL3

IcePathB2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBoarderEoin:
	trainer BOARDER, EOIN, EVENT_BEAT_BOARDER_EOIN, BoarderEoinSeenText, BoarderEoinBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BoarderEoinAfterBattleText
	waitbutton
	closetext
	end

IcePathB2FBoulder:
	jumptext IcePathB2FBoulderText

IcePathB2FFullHeal:
	itemball FULL_HEAL

IcePathB2FMaxPotion:
	itemball MAX_POTION

IcePathB2FTMRest:
	itemball TM_REST, 5

IcePathB2FHiddenCarbos:
	hiddenitem CARBOS, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS

IcePathB2FHiddenIceHeal:
	hiddenitem ICE_HEAL, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_HIDDEN_ICE_HEAL

BoarderEoinSeenText:
	text "I'm all about"
	line "shreddin'!"
	done

BoarderEoinBeatenText:
	text "I got shredded!"
	done

BoarderEoinAfterBattleText:
	text "Make sure you"
	line "enjoy life!"
	done

IcePathB2FBoulderText:
	text "It's immovably"
	line "imbedded in ice."
	done

IcePathB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  1, ICE_PATH_B1F, 2
	warp_event  9, 11, ICE_PATH_B3F, 1
	warp_event 11,  4, ICE_PATH_B1F, 3
	warp_event  4,  6, ICE_PATH_B1F, 4
	warp_event  4, 12, ICE_PATH_B1F, 5
	warp_event 12, 12, ICE_PATH_B1F, 6
	warp_event 29, 15, ICE_PATH_B1F, 8
	warp_event 29,  3, ICE_PATH_B3F, 2

	def_coord_events

	def_bg_events
	bg_event  0, 17, BGEVENT_ITEM, IcePathB2FHiddenCarbos
	bg_event 28, 10, BGEVENT_ITEM, IcePathB2FHiddenIceHeal

	def_object_events
	object_event 30,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderEoin, -1
	object_event 11,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_1A
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_2A
	object_event  3, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_3A
	object_event 12, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FBoulder, EVENT_BOULDER_IN_ICE_PATH_4A
	object_event  8,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FFullHeal, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	object_event  0,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMaxPotion, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
	object_event 34, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, IcePathB2FTMRest, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
