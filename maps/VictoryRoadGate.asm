	object_const_def
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_BLACK_BELT1
	const VICTORYROADGATE_BLACK_BELT2

VictoryRoadGate_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.DummyScene:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	sjump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	checkevent EVENT_GOT_RED_CARPET_FROM_VICTORY_ROAD
	iftrue .GotRedCarpet
	writetext VictoryRoadGateOfficerText
	promptbutton
	readvar VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	setevent EVENT_DECO_CARPET_1
	playsound SFX_2ND_PLACE
	waitsfx
	writetext VictoryRoadGateDecorationText
	waitbutton
	closetext
	setevent EVENT_GOT_RED_CARPET_FROM_VICTORY_ROAD
	setscene SCENE_FINISHED
	end

.GotRedCarpet
	writetext VictoryRoadGateAfterText
	waitbutton
	closetext
	end

VictoryRoadGateLeftBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateLeftBlackBeltText

VictoryRoadGateRightBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateRightBlackBeltText

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end

VictoryRoadGateOfficerText:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "You don't have all"
	line "the GYM BADGES of"
	cont "JOHTO."

	para "I'm sorry, but I"
	line "can't let you go"
	cont "through."
	done

VictoryRoadGateEightBadgesText:
	text "Oh! The eight"
	line "BADGES of JOHTO!"

	para "Please, accept"
	line "this gift!"

	para "<PLAYER> received"
	line "RED CARPET!"
	done

VictoryRoadGateDecorationText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

VictoryRoadGateAfterText:
	text "Ahead is VICTORY"
	line "ROAD."

	para "Beware the SAND-"
	line "STORMS inside."
	done

VictoryRoadGateLeftBlackBeltText:
	text "This way leads to"
	line "MT.SILVER."

	para "You'll see scary-"
	line "strong #MON out"
	cont "there."

	para "I can't let you"
	line "through without"

	para "permission from"
	line "PROF.OAK."
	done

VictoryRoadGateRightBlackBeltText:
	text "PROF.OAK paid me"
	line "to stand here"

	para "until you find out"
	line "how to enter the"

	para "doorway down the"
	line "hall behind me."
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  7, ROUTE_22, 1
	warp_event 18,  7, ROUTE_22, 1
	warp_event  9, 17, ROUTE_26, 1
	warp_event 10, 17, ROUTE_26, 1
	warp_event  9,  0, VICTORY_ROAD, 1
	warp_event 10,  0, VICTORY_ROAD, 1
	warp_event  1,  7, ROUTE_28, 2
	warp_event  2,  7, ROUTE_28, 2

	def_coord_events
	coord_event 10, 11, SCENE_DEFAULT, VictoryRoadGateBadgeCheckScene

	def_bg_events

	def_object_events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateLeftBlackBeltScript, EVENT_OPENED_MT_SILVER
	object_event 12,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateRightBlackBeltScript, EVENT_FOUGHT_SNORLAX
