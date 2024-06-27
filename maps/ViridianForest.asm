	object_const_def
	const ROUTE2_BUG_CATCHER1
	const ROUTE2_BUG_CATCHER2
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_POKE_BALL3
	const ROUTE2_BUG_CATCHER4
	const ROUTE2_LASS

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

ViridianForestBugCatcherScript:
	jumptextfaceplayer ViridianForestBugCatcherText

ViridianForestLassScript:
	jumptextfaceplayer ViridianForestLassText

ViridianForestSign1:
	jumptext ViridianForestSign1Text

ViridianForestSign2:
	jumptext ViridianForestSign2Text

ViridianForestSign3:
	jumptext ViridianForestSign3Text

ViridianForestSign4:
	jumptext ViridianForestSign4Text

ViridianForestSign5:
	jumptext ViridianForestSign5Text

ViridianForestMaxPotion:
	itemball MAX_POTION

ViridianForestCarbos:
	itemball CARBOS

ViridianForestElixer:
	itemball ELIXER

ViridianForestHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

ViridianForestHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

BugCatcherRobSeenText:
	text "My bug #MON are"
	line "tough. Prepare to"
	cont "lose!"
	done

BugCatcherRobBeatenText:
	text "I was whipped…"
	done

BugCatcherRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#MON."
	done

BugCatcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

BugCatcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

BugCatcherEdAfterBattleText:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

ViridianForestBugCatcherText:
	text "PIKACHU is a"
	line "mouse!"

	para "I heard that in"
	line "PALDEA, there's a"

	para "#MON that's two"
	line "mouses! And"

	para "evolves into three"
	line "or four mouses!"
	done

ViridianForestLassText:
	text "Fire burns grass,"
	line "grass absorbs"
	cont "water, and water"
	line "puts out fire."

	para "Oh, you already"
	line "knew that?"

	para "I thought you were"
	line "just starting from"
	cont "PALLET TOWN."
	done

ViridianForestSign1Text:
	text "VIRIDIAN FOREST"
	done

ViridianForestSign2Text:
	text "Please place trash"
	line "in the provided"
	cont "receptacles."
	done

ViridianForestSign3Text:
	text "TRAINER TIPS"

	para "The DUSK BALL is"
	line "for catching #-"
	cont "MON at night."

	para "It also works well"
	line "in caves, since"

	para "they're naturally"
	line "dark."

	para "ILEX FOREST in"
	line "JOHTO is thick"

	para "enough to block"
	line "out the sun, but"

	para "the same isn't the"
	line "case for VIRIDIAN."
	done

ViridianForestSign4Text:
	text "North to PEWTER"
	line "South to VIRIDIAN"
	done

ViridianForestSign5Text:
	text "VIRIDIAN FOREST"
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  4, ROUTE_2_NORTH_GATE, 1
	warp_event  1,  5, ROUTE_2_NORTH_GATE, 2
	warp_event 14, 47, ROUTE_2_SOUTH_GATE, 1
	warp_event 15, 47, ROUTE_2_SOUTH_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 14, 38, BGEVENT_READ, ViridianForestSign1
	bg_event 22, 46, BGEVENT_READ, ViridianForestSign2
	bg_event 25, 23, BGEVENT_READ, ViridianForestSign3
	bg_event  2, 30, BGEVENT_READ, ViridianForestSign4
	bg_event  1,  7, BGEVENT_READ, ViridianForestSign5
	bg_event 18, 46, BGEVENT_ITEM, ViridianForestHiddenMaxEther
	bg_event 10, 34, BGEVENT_ITEM, ViridianForestHiddenFullRestore

	def_object_events
	object_event  1, 11, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherRob, -1
	object_event 12, 24, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherEd, -1
	object_event 28, 30, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherDoug, -1
	object_event  8, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestMaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event  0, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestCarbos, EVENT_ROUTE_2_CARBOS
	object_event 27,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestElixer, EVENT_ROUTE_2_ELIXER
	object_event  5, 47, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianForestBugCatcherScript, -1
	object_event 10, 31, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianForestLassScript, -1
