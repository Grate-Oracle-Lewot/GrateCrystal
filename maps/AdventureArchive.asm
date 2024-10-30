	object_const_def
	const ADVENTUREARCHIVE_SUPER_NERD

AdventureArchive_MapScripts:
	def_scene_scripts

	def_callbacks

AdventureArchiveSuperNerdScript:
	jumptextfaceplayer AdventureArchiveSuperNerdText

AdventureArchive_EndText:
	waitbutton
	closetext
	end

AdventureArchiveMachine1:
	opentext
	writetext AdventureArchiveText1
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine1
	sjump AdventureArchive_EndText

AdventureArchiveMachine2:
	opentext
	writetext AdventureArchiveText2_1
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine2_1
	promptbutton
	writetext AdventureArchiveText2_2
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine2_2
	promptbutton
	writetext AdventureArchiveText2_3
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine2_3
	sjump AdventureArchive_EndText

AdventureArchiveMachine3:
	opentext
	writetext AdventureArchiveText3
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine3
	sjump AdventureArchive_EndText

AdventureArchiveMachine4:
	opentext
	writetext AdventureArchiveText4_1
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine4_1
	promptbutton
	writetext AdventureArchiveText4_2
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine4_2
	promptbutton
	writetext AdventureArchiveText4_3
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine4_3
	sjump AdventureArchive_EndText

AdventureArchiveMachine5:
	opentext
	writetext AdventureArchiveText5
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine5
	sjump AdventureArchive_EndText

AdventureArchiveMachine6:
	opentext
	writetext AdventureArchiveText6
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine6
	sjump AdventureArchive_EndText

AdventureArchiveMachine7:
	opentext
	writetext AdventureArchiveText7
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine7
	sjump AdventureArchive_EndText

AdventureArchiveMachine8:
	opentext
	writetext AdventureArchiveText8
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine8
	sjump AdventureArchive_EndText

AdventureArchiveMachine9:
	opentext
	writetext AdventureArchiveText9
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine9
	sjump AdventureArchive_EndText

AdventureArchiveMachine10:
	opentext
	writetext AdventureArchiveText10
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine10
	sjump AdventureArchive_EndText

AdventureArchiveMachine11:
	opentext
	writetext AdventureArchiveText11
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine11
	sjump AdventureArchive_EndText

AdventureArchiveMachine12:
	opentext
	writetext AdventureArchiveText12
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine12
	sjump AdventureArchive_EndText

AdventureArchiveMachine13:
	opentext
	writetext AdventureArchiveText13
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine13
	sjump AdventureArchive_EndText

AdventureArchiveMachine14:
	opentext
	writetext AdventureArchiveText14
	promptbutton
	writetext AdventureArchive_EmptyText
	callasm AdventureArchive_Machine14
	sjump AdventureArchive_EndText

AdventureArchiveMachine15:
	opentext
	writetext AdventureArchiveText15
	promptbutton
	writetext AdventureArchive_MoneyText
	callasm AdventureArchive_Machine15
	sjump AdventureArchive_EndText

AdventureArchive_Machine1:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingBattleTowerWins
	jp AdventureArchive_Print4Bytes

AdventureArchive_Machine2_1:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingWildBattles
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine2_2:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingTrainerBattles
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine2_3:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingBattles
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine3:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingWildMonsCaught
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine4_1:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingHookedEncounters
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine4_2:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingTreeEncounters
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine4_3:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingRockEncounters
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine5:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingMonsEvolved
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine6:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingEggsHatched
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine7:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingTMsHMsTaught
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine8:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingHealings
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine9:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingWhiteOuts
	; fallthrough

AdventureArchive_Print3Bytes:
	lb bc, 3, 7
	hlcoord 1, 14
	call PrintNum
	jp CloseSRAM

AdventureArchive_Machine10:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingStepCount
	; fallthrough

AdventureArchive_Print4Bytes:
	lb bc, 4, 7
	hlcoord 1, 14
	call PrintNum
	jp CloseSRAM

AdventureArchive_Machine11:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingFly
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine12:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingFruitPicked
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine13:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingSelfdestruct
	jr AdventureArchive_Print3Bytes

AdventureArchive_Machine14:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingBugContestScore
	lb bc, 2, 7
	hlcoord 1, 14
	call PrintNum
	jp CloseSRAM

AdventureArchive_Machine15:
	ld a, BANK(sTrainerRankings)
	call OpenSRAM
	ld de, sTrainerRankingTotalBattlePayouts
	lb bc, 4, 7
	hlcoord 2, 14
	call PrintNum
	jp CloseSRAM

AdventureArchiveSuperNerdText:
	text "How do they know"
	line "all this stuff…?"
	done

AdventureArchive_EmptyText:
	text " "
	done

AdventureArchive_MoneyText:
	text "¥"
	done

AdventureArchiveText1:
	text "The number of"
	line "battles you've won"

	para "here at the BATTLE"
	line "TOWER is…"
	done

AdventureArchiveText2_1:
	text "The number of wild"
	line "#MON you've"
	cont "battled is…"
	done

AdventureArchiveText2_2:
	text "The number of"
	line "trainers you've"
	cont "battled is…"
	done

AdventureArchiveText2_3:
	text "The total number"
	line "of battles you've"
	cont "fought is…"
	done

AdventureArchiveText3:
	text "The number of wild"
	line "#MON you've"
	cont "caught is…"
	done

AdventureArchiveText4_1:
	text "The number of"
	line "#MON you've"

	para "hooked with a ROD"
	line "is…"
	done

AdventureArchiveText4_2:
	text "The number of"
	line "#MON you've"

	para "HEADBUTTED out of"
	line "trees is…"
	done

AdventureArchiveText4_3:
	text "The number of"
	line "#MON you've"

	para "found using ROCK"
	line "SMASH is…"
	done

AdventureArchiveText5:
	text "The number of"
	line "#MON you've"
	cont "evolved is…"
	done

AdventureArchiveText6:
	text "The number of EGGS"
	line "you've hatched is…"
	done

AdventureArchiveText7:
	text "The number of"
	line "moves you've taught"
	cont "via TM or HM is…"
	done

AdventureArchiveText8:
	text "The number of"
	line "times you've healed"
	cont "your party is…"
	done

AdventureArchiveText9:
	text "The number of"
	line "times you've"
	cont "blacked out is…"
	done

AdventureArchiveText10:
	text "The total number"
	line "of steps you've"
	cont "walked is…"
	done

AdventureArchiveText11:
	text "The number of"
	line "times you've used"

	para "FLY outside of"
	line "battle is…"
	done

AdventureArchiveText12:
	text "The number of"
	line "times you've picked"

	para "fruit from trees"
	line "is…"
	done

AdventureArchiveText13:
	text "The number of"
	line "times your #MON"

	para "have used SELF-"
	line "DESTRUCT is…"
	done

AdventureArchiveText14:
	text "Your best score in"
	line "the Bug-Catching"
	cont "Contest was…"
	done

AdventureArchiveText15:
	text "The total amount"
	line "of money you've"

	para "won from battles"
	line "is…"
	done

AdventureArchive_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, BATTLE_TOWER_1F, 4
	warp_event  4,  7, BATTLE_TOWER_1F, 4

	def_coord_events

	def_bg_events
	bg_event  2,  4, BGEVENT_READ, AdventureArchiveMachine1
	bg_event  4,  4, BGEVENT_READ, AdventureArchiveMachine2
	bg_event  6,  4, BGEVENT_READ, AdventureArchiveMachine3
	bg_event  8,  4, BGEVENT_READ, AdventureArchiveMachine4
	bg_event 10,  4, BGEVENT_READ, AdventureArchiveMachine5
	bg_event 12,  4, BGEVENT_READ, AdventureArchiveMachine6
	bg_event 14,  4, BGEVENT_READ, AdventureArchiveMachine7
	bg_event 16,  4, BGEVENT_READ, AdventureArchiveMachine8
	bg_event 18,  4, BGEVENT_READ, AdventureArchiveMachine9
	bg_event 20,  4, BGEVENT_READ, AdventureArchiveMachine10
	bg_event 22,  4, BGEVENT_READ, AdventureArchiveMachine11
	bg_event 24,  4, BGEVENT_READ, AdventureArchiveMachine12
	bg_event 26,  4, BGEVENT_READ, AdventureArchiveMachine13
	bg_event 28,  4, BGEVENT_READ, AdventureArchiveMachine14
	bg_event 30,  4, BGEVENT_READ, AdventureArchiveMachine15

	def_object_events
	object_event 29,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AdventureArchiveSuperNerdScript, -1
