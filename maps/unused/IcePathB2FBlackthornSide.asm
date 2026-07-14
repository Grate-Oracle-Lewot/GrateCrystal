	object_const_def
	const ICEPATHB2FBLACKTHORNSIDE_ROCKER
	const ICEPATHB2FBLACKTHORNSIDE_POKE_BALL

IcePathB2FBlackthornSide_MapScripts:
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

IcePathB2FBlackthornSideTMRest:
	itemball TM_REST, 5

IcePathB2FBlackthornSideHiddenIceHeal:
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

IcePathB2FBlackthornSide_MapEvents:
	def_warp_events
	warp_event  3, 15, ICE_PATH_B1F, 8
	warp_event  3,  3, ICE_PATH_B3F, 2

	def_coord_events

	def_bg_events
	bg_event  2, 10, BGEVENT_ITEM, IcePathB2FBlackthornSideHiddenIceHeal

	def_object_events
	object_event  4,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderEoin, -1
	object_event  8, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, IcePathB2FBlackthornSideTMRest, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
