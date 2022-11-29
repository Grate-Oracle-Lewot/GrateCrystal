	object_const_def
	const DIGLETTSCAVE_POKEFAN_M
	const DIGLETTSCAVE_YOUNGSTER

DiglettsCave_MapScripts:
	def_scene_scripts

	def_callbacks

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

TrainerCamperJohn:
	trainer CAMPER, JOHN, EVENT_BEAT_CAMPER_JOHN, CamperJohnSeenText, CamperJohnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJohnAfterBattleText
	waitbutton
	closetext
	end

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE

DiglettsCavePokefanMText:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

CamperJohnSeenText:
	text "Just because the"
	line "ground type can't"

	para "hit flying #MON"
	line "doesn't mean it's"
	cont "not good!"
	done

CamperJohnBeatenText:
	text "Aw, shoot…"
	done

CamperJohnAfterBattleText:
	text "You can find DIG-"
	line "LETT at many diff-"
	cont "erent levels here."
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 33, VERMILION_CITY, 10
	warp_event  5, 31, DIGLETTS_CAVE, 5
	warp_event 15,  5, ROUTE_2, 4
	warp_event 17,  3, DIGLETTS_CAVE, 6
	warp_event 17, 33, DIGLETTS_CAVE, 2
	warp_event  3,  3, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  6, 11, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	def_object_events
	object_event  3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
	object_event  8, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperJohn, -1
