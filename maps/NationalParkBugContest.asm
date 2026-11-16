	object_const_def
	const NATIONALPARKBUGCONTEST_BUG_CATCHER1
	const NATIONALPARKBUGCONTEST_SCHOOLBOY
	const NATIONALPARKBUGCONTEST_YOUNGSTER
	const NATIONALPARKBUGCONTEST_PICNICKER
	const NATIONALPARKBUGCONTEST_CAMPER
	const NATIONALPARKBUGCONTEST_BUG_CATCHER2
	const NATIONALPARKBUGCONTEST_BUG_CATCHER3
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_BUG_CATCHER4
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2

NationalParkBugContest_MapScripts:
	def_scene_scripts

	def_callbacks

BugCatchingContestantDonScript:
	faceplayer
	opentext
	writetext BugCatchingContestantDonText
NationalParkBugContest_EndText:
	waitbutton
	closetext
	end

BugCatchingContestantKippScript:
	faceplayer
	opentext
	writetext BugCatchingContestantKippText
	sjump NationalParkBugContest_EndText

BugCatchingContestantSamuelScript:
	faceplayer
	opentext
	writetext BugCatchingContestantSamuelText
	sjump NationalParkBugContest_EndText

BugCatchingContestantCindyScript:
	faceplayer
	opentext
	writetext BugCatchingContestantCindyText
	sjump NationalParkBugContest_EndText

BugCatchingContestantBarryScript:
	faceplayer
	opentext
	writetext BugCatchingContestantBarryText
	sjump NationalParkBugContest_EndText

BugCatchingContestantBennyScript:
	faceplayer
	opentext
	writetext BugCatchingContestantBennyText
	sjump NationalParkBugContest_EndText

BugCatchingContestantJoshScript:
	faceplayer
	opentext
	writetext BugCatchingContestantJoshText
	sjump NationalParkBugContest_EndText

BugCatchingContestantWilliamScript:
	faceplayer
	opentext
	writetext BugCatchingContestantWilliamText
	sjump NationalParkBugContest_EndText

BugCatchingContestantEdScript:
	faceplayer
	opentext
	writetext BugCatchingContestantEdText
	sjump NationalParkBugContest_EndText

BugCatchingContestantNickScript:
	faceplayer
	opentext
	writetext BugCatchingContestantNickText
	sjump NationalParkBugContest_EndText

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestBattleNoticeSign:
	jumptext NationalParkBugContestBattleNoticeText

NationalParkBugContestTrainerTipsSign:
	jumptext NationalParkBugContestTrainerTipsText

NationalParkBugContestParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkBugContestTMDig:
	itemball TM_DIG, 5

NationalParkBugContestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkBugContestTrashcan:
	jumpstd TrashCanScript

BugCatchingContestantDonText:
	text "DON: I'm going to"
	line "win! Don't bother"
	cont "me."
	done

BugCatchingContestantKippText:
	text "KIPP: I've studied"
	line "about bug #MON"
	cont "a lot."

	para "I'm going to win"
	line "for sure."
	done

BugCatchingContestantSamuelText:
	text "SAMUEL: If you've"
	line "got the time to"

	para "chat, go find some"
	line "bug #MON."
	done

BugCatchingContestantCindyText:
	text "CINDY: I love bug"
	line "#MON."

	para "I guess you must"
	line "like them too."
	done

BugCatchingContestantBarryText:
	text "BARRY: Weakening"
	line "#MON makes them"

	para "easier to catch,"
	line "but you get a"

	para "higher score if"
	line "they have more HP"
	cont "remaining."
	done

BugCatchingContestantBennyText:
	text "BENNY: Ssh! You'll"
	line "scare off SCYTHER."

	para "I'll talk to you"
	line "later."
	done

BugCatchingContestantJoshText:
	text "JOSH: I've been"
	line "collecting bug"

	para "#MON since I"
	line "was just a baby."

	para "There's no way I'm"
	line "going to lose!"
	done

BugCatchingContestantWilliamText:
	text "WILLIAM: I'm not"
	line "concerned about"
	cont "winning."

	para "I'm just looking"
	line "for rare #MON."
	done

BugCatchingContestantEdText:
	text "ED: My PARASECT"
	line "puts #MON to"
	cont "sleep with SPORE."
	done

BugCatchingContestantNickText:
	text "NICK: My #MON's"
	line "job is to take"
	cont "hits, not attack."
	done

NationalParkBugContestRelaxationSquareText:
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done

NationalParkBugContestBattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

NationalParkBugContestTrainerTipsText:
	text "TRAINER TIPS"

	para "Along with having"
	line "types, moves can"

	para "be either PHYSICAL"
	line "or SPECIAL."

	para "Different #MON"
	line "of the same type"

	para "might be better at"
	line "using different"
	cont "kinds of moves."
	done

NationalParkBugContest_MapEvents:
	def_warp_events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 44, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBugContestBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkBugContestTrainerTipsSign
	bg_event 12, 40, BGEVENT_READ, NationalParkBugContestTrashcan
	bg_event 30, 40, BGEVENT_READ, NationalParkBugContestTrashcan

	def_object_events
	object_event 19, 29, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantDonScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 17, 34, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantKippScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantSamuelScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantCindyScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 27, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantBarryScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 23,  9, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantBennyScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event 11, 27, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantJoshScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event  7, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantWilliamScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 28, 22, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantEdScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event  9, 18, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestantNickScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_DIG
