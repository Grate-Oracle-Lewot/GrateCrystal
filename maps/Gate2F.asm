	object_const_def
	const GATE2F_BUG_CATCHER
	const GATE2F_TWIN
	const GATE2F_YOUNGSTER
	const GATE2F_COOLTRAINER_F
	const GATE2F_COOLTRAINER_M
	const GATE2F_LASS
	const GATE2F_TEACHER
	const GATE2F_POKEFAN_M
	const GATE2F_POKEFAN_F
	const GATE2F_GAMEBOY_KID
	const GATE2F_FISHER
	const GATE2F_GRAMPS
	const GATE2F_GRANNY
	const GATE2F_GENTLEMAN
	const GATE2F_SAGE

Gate2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .People

.People:
	disappear GATE2F_BUG_CATCHER
	disappear GATE2F_TWIN
	disappear GATE2F_YOUNGSTER
	disappear GATE2F_COOLTRAINER_F
	disappear GATE2F_COOLTRAINER_M
	disappear GATE2F_LASS
	disappear GATE2F_TEACHER
	disappear GATE2F_POKEFAN_M
	disappear GATE2F_POKEFAN_F
	disappear GATE2F_GAMEBOY_KID
	disappear GATE2F_FISHER
	disappear GATE2F_GRAMPS
	disappear GATE2F_GRANNY
	disappear GATE2F_GENTLEMAN
	disappear GATE2F_SAGE
	callasm .Randomize
	ifequal  0, .GameBoyKid
	ifequal  1, .BugCatcher
	ifequal  2, .Twin
	ifequal  3, .Youngster
	ifequal  4, .CooltrainerF
	ifequal  5, .CooltrainerM
	ifequal  6, .Lass
	ifequal  7, .Fisher
	ifequal  8, .Teacher
	ifequal  9, .PokefanM
	ifequal 10, .PokefanF
	ifequal 11, .Gramps
	ifequal 12, .Granny
	ifequal 13, .Gentleman
	ifequal 14, .Sage
	endcallback

.GameBoyKid:
	appear GATE2F_GAMEBOY_KID
	endcallback

.BugCatcher:
	appear GATE2F_BUG_CATCHER
	endcallback

.Twin:
	appear GATE2F_TWIN
	endcallback

.Youngster:
	appear GATE2F_YOUNGSTER
	endcallback

.CooltrainerF:
	appear GATE2F_COOLTRAINER_F
	endcallback

.CooltrainerM:
	appear GATE2F_COOLTRAINER_M
	endcallback

.Lass:
	appear GATE2F_LASS
	endcallback

.Fisher:
	appear GATE2F_FISHER
	endcallback

.Teacher:
	appear GATE2F_TEACHER
	endcallback

.PokefanM:
	appear GATE2F_POKEFAN_M
	endcallback

.PokefanF:
	appear GATE2F_POKEFAN_F
	endcallback

.Gramps:
	appear GATE2F_GRAMPS
	endcallback

.Granny:
	appear GATE2F_GRANNY
	endcallback

.Gentleman:
	appear GATE2F_GENTLEMAN
	endcallback

.Sage:
	appear GATE2F_SAGE
	endcallback

.Randomize:
	call Random
	and 15
	ld [wScriptVar], a
	ret

Gate2FLeftBinocularsScript:
	jumptext Gate2FLeftBinocularsText

Gate2FRightBinocularsScript:
	checktime MORN
	iftrue .Morn
	checktime DAY
	iftrue .Day
	checktime NITE
	iftrue .Nite
	sjump Gate2FLeftBinocularsScript

.Morn:
	jumptext Gate2FRightBinocularsMorningText

.Day:
	jumptext Gate2FRightBinocularsDayText

.Nite:
	jumptext Gate2FRightBinocularsNightText

Gate2FGameBoyKidScript:
	jumptextfaceplayer Gate2FGameBoyKidText

Gate2FBugCatcherScript:
	jumptextfaceplayer Gate2FBugCatcherText

Gate2FTwinScript:
	jumptextfaceplayer Gate2FTwinText

Gate2FYoungsterScript:
	jumptextfaceplayer Gate2FYoungsterText

Gate2FCooltrainerFScript:
	jumptextfaceplayer Gate2FCooltrainerFText

Gate2FCooltrainerMScript:
	jumptextfaceplayer Gate2FCooltrainerMText

Gate2FLassScript:
	jumptextfaceplayer Gate2FLassText

Gate2FFisherScript:
	jumptextfaceplayer Gate2FFisherText

Gate2FTeacherScript:
	jumptextfaceplayer Gate2FTeacherText

Gate2FPokefanMScript:
	jumptextfaceplayer Gate2FPokefanMText

Gate2FPokefanFScript:
	jumptextfaceplayer Gate2FPokefanFText

Gate2FGrampsScript:
	jumptextfaceplayer Gate2FGrampsText

Gate2FGrannyScript:
	jumptextfaceplayer Gate2FGrannyText

Gate2FGentlemanScript:
	jumptextfaceplayer Gate2FGentlemanText

Gate2FSageScript:
	jumptextfaceplayer Gate2FSageText

Gate2FLeftBinocularsText:
	text "I can see for"
	line "miles!"
	done

Gate2FRightBinocularsMorningText:
	text "The sunrise is"
	line "magnificent!"
	done

Gate2FRightBinocularsDayText:
	text "KANTO is bustling"
	line "during the day!"
	done

Gate2FRightBinocularsNightText:
	text "KANTO looks so"
	line "peaceful at night."
	done

Gate2FGameBoyKidText:
	text "I hope my mom"
	line "doesn't find me"
	cont "up here…"
	done

Gate2FBugCatcherText:
	text "I'm too short for"
	line "the binoculars…"
	done

Gate2FTwinText:
	text "Hi!"
	done

Gate2FYoungsterText:
	text "Have you found any"
	line "cool #MON ar-"
	cont "ound here?"
	done

Gate2FCooltrainerFText:
	text "I'm waiting here"
	line "to meet my true"
	cont "love."

	para "…"

	para "You ain't it."
	done

Gate2FCooltrainerMText:
	text "DITTO won't use"
	line "held X items"

	para "until after it"
	line "TRANSFORMS."

	para "With an X SPEED,"
	line "it can outspeed"

	para "whatever it turns"
	line "into!"
	done

Gate2FLassText:
	text "If SHUCKLE holds a"
	line "BERRY, it might"

	para "turn it into"
	line "BERRY JUICE."
	done

Gate2FFisherText:
	text "They should get a"
	line "couch up here…"
	done

Gate2FTeacherText:
	text "If you have a MIL-"
	line "TANK, check its"

	para "held item every so"
	line "often."

	para "You might get free"
	line "MOOMOO MILK."
	done

Gate2FPokefanMText:
	text "I'm trying to save"
	line "up for an ALOLAN"

	para "vacation, but I"
	line "keep buying more"
	cont "# DOLLS…"
	done

Gate2FPokefanFText:
	text "I'm visiting from"
	line "UNOVA."

	para "Things sure are"
	line "different here."
	done

Gate2FGrampsText:
	text "Hmm… where am I?"
	done

Gate2FGrannyText:
	text "The best thing"
	line "about a #MON"

	para "journey is that it"
	line "never ends."
	done

Gate2FGentlemanText:
	text "What a charming"
	line "viewing platform!"

	para "Perhaps I'll buy"
	line "the building…"
	done

Gate2FSageText:
	text "This is a good"
	line "place to meditate."
	done

Gate2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Gate2FLeftBinocularsScript
	bg_event  6,  2, BGEVENT_UP, Gate2FRightBinocularsScript

	def_object_events
	object_event  3,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FBugCatcherScript, EVENT_GATE_2F_BUG_CATCHER
	object_event  4,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FTwinScript, EVENT_GATE_2F_TWIN
	object_event  3,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FYoungsterScript, EVENT_GATE_2F_YOUNGSTER
	object_event  4,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FCooltrainerFScript, EVENT_GATE_2F_COOLTRAINER_F
	object_event  3,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FCooltrainerMScript, EVENT_GATE_2F_COOLTRAINER_M
	object_event  4,  3, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FLassScript, EVENT_GATE_2F_LASS
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FTeacherScript, EVENT_GATE_2F_TEACHER
	object_event  2,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FPokefanMScript, EVENT_GATE_2F_POKEFAN_M
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FPokefanFScript, EVENT_GATE_2F_POKEFAN_F
	object_event  7,  2, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FGameBoyKidScript, EVENT_GATE_2F_GAMEBOY_KID
	object_event  5,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FFisherScript, EVENT_GATE_2F_FISHER
	object_event  1,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FGrampsScript, EVENT_GATE_2F_GRAMPS
	object_event  6,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FGrannyScript, EVENT_GATE_2F_GRANNY
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FGentlemanScript, EVENT_GATE_2F_GENTLEMAN
	object_event  2,  4, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Gate2FSageScript, EVENT_GATE_2F_SAGE
