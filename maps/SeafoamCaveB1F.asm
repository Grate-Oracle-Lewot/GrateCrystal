	object_const_def
	const SEAFOAMCAVEB1F_POKEDEX
	const SEAFOAMCAVEB1F_BOULDER1
	const SEAFOAMCAVEB1F_BOULDER2
	const SEAFOAMCAVEB1F_BOULDER3
	const SEAFOAMCAVEB1F_BOULDER4
	const SEAFOAMCAVEB1F_BOULDER5
	const SEAFOAMCAVEB1F_BOULDER6
	const SEAFOAMCAVEB1F_BOULDER7
	const SEAFOAMCAVEB1F_BOULDER8
	const SEAFOAMCAVEB1F_POKE_BALL

SeafoamCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamCaveRadio:
	jumpstd Radio2Script

SeafoamCaveStatue:
	jumptext SeafoamCaveStatueText

SeafoamCaveBoulder:
	jumpstd StrengthBoulderScript

SeafoamCaveBook:
	opentext
	writetext SeafoamCaveBookText1
	yesorno
	iffalse .Done
	writetext SeafoamCaveBookText2
	yesorno
	iffalse .Done
	writetext SeafoamCaveBookText3
	yesorno
	iffalse .Done
	writetext SeafoamCaveBookText4
	yesorno
	iffalse .Done
	writetext SeafoamCaveBookText5
	yesorno
	iffalse .Done
	writetext SeafoamCaveBookText6
	yesorno
	iffalse .Done
	writetext SeafoamCaveBookText7
	waitbutton
.Done:
	closetext
	end

SeafoamCaveBed:
	opentext
	writetext SeafoamCaveBedText1
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext SeafoamCaveBedText2
	closetext
	end

SeafoamCaveB1FXAccuracy:
	itemball X_ACCURACY

SeafoamCaveB1FHiddenTimerBall:
	hiddenitem TIMER_BALL, EVENT_SEAFOAM_CAVE_B1F_HIDDEN_TIMER_BALL

SeafoamCaveB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SEAFOAM_CAVE_B1F_HIDDEN_MAX_POTION

SeafoamCaveStatueText:
	text "It's a statue of a"
	line "FERALIGATR."
	done

SeafoamCaveBookText1:
	text "It's a book titled"
	line "EVERYTHING YOU"

	para "NEVER WANTED TO"
	line "KNOW ABOUT THE"

	para "GRATE ORACLE"
	line "LEWOT. Read it?"
	done

SeafoamCaveBookText2:
	text "What does it mean"
	line "to be a GRATE"
	cont "ORACLE?"

	para "Simply that my"
	line "psychic powers"

	para "depend on my prox-"
	line "imity to grates."

	para "More candidly, it's"
	line "a self-deprecating"
	cont "joke."

	para "You're supposed to"
	line "hear GREAT but"

	para "then realize it's"
	line "actually GRATE."

	para "That's just my kind"
	line "of humor."

	para "Keep reading?"
	done

SeafoamCaveBookText3:
	text "LEWOT is TOWEL"
	line "spelled backwards."

	para "This is a refer-"
	line "ence to the"

	para "HITCHHIKER'S GUIDE"
	line "TO THE GALAXY."

	para "My name and title"
	line "originate from a"

	para "now-defunct TOWEL"
	line "DAY forum."

	para "TOWEL DAY is a ho-"
	line "liday celebrating"
	cont "the GUIDE."

	para "In my circles, it's"
	line "on May 25th, but"

	para "other dates have"
	line "been proposed."

	para "Keep reading?"
	done

SeafoamCaveBookText4:
	text "My very favorite"
	line "#MON is YANMA."

	para "I like YANMEGA,"
	line "but I like YANMA a"
	cont "bit more."

	para "I like HAUNTER"
	line "more than GENGAR,"

	para "and PICHU more"
	line "than PIKACHU."

	para "I know I took"
	line "PICHU out, but"

	para "hacking is hard,"
	line "okay?"

	para "WHIMSICOTT is"
	line "PERCY's favorite."

	para "I would've put"
	line "JUMPLUFF on my"

	para "team if PERCY"
	line "didn't have it."

	para "Keep reading?"
	done

SeafoamCaveBookText5:
	text "My favorite video"
	line "games of all time"
	cont "are, in order:"

	para "PAPER MARIO, its"
	line "first sequel,"

	para "TEARS OF THE KING-"
	line "DOM, BREATH OF THE"
	cont "WILD, and DONKEY"
	cont "KONG 64."

	para "Obviously, Gen II"
	line "#MON is up"
	cont "there as well."

	para "It's my favorite"
	line "generation, but"

	para "I'm not averse to"
	line "the newer games."

	para "HGSS is peak for"
	line "me, though."

	para "Keep reading?"
	done

SeafoamCaveBookText6:
	text "You're probably"
	line "wondering about"
	cont "that UBEQC thing."

	para "The square is pur-"
	line "ple, and its size"

	para "represents the"
	line "number of good"

	para "people in the"
	line "universe."

	para "The circle's green"
	line "and represents the"

	para "number of evil"
	line "people."

	para "The triangle is"
	line "orange and repre-"
	cont "sents the balanc-"
	cont "ing forces of…"

	para "Let's call it"
	line "chaos."

	para "So it's basically"
	line "my version of a"
	cont "yin-yang."

	para "Keep reading?"
	done

SeafoamCaveBookText7:
	text "What about that"
	line "GOLDGEM on the"
	cont "title screen?"

	para "That stands for"
	line "GRATE ORACLE"
	cont "LEWOT'S DUBIOUS"
	cont "GAMES and EXTRAN-"
	cont "EOUS MERCHANDISE."

	para "It's… not exactly"
	line "a real company."
	done

SeafoamCaveBedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	autodone

SeafoamCaveBedText2:
	text "Ah, refreshed and"
	line "restored!"
	autodone

SeafoamCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 16, SEAFOAM_CAVE_1F, 2
	warp_event  6, 41, SEAFOAM_CAVE_B2F, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, SeafoamCaveRadio
	bg_event 11, 21, BGEVENT_READ, SeafoamCaveStatue
	bg_event 21, 29, BGEVENT_READ, SeafoamCaveStatue
	bg_event 26, 29, BGEVENT_READ, SeafoamCaveStatue
	bg_event 16, 22, BGEVENT_READ, SeafoamCaveBed
	bg_event 16, 23, BGEVENT_READ, SeafoamCaveBed
	bg_event 17, 40, BGEVENT_ITEM, SeafoamCaveB1FHiddenTimerBall
	bg_event 32, 13, BGEVENT_ITEM, SeafoamCaveB1FHiddenMaxPotion

	def_object_events
	object_event  3, 28, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBook, -1
	object_event 22, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 23, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 24, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 25, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 22, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 23, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 24, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event 25, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveBoulder, -1
	object_event  6, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveB1FXAccuracy, EVENT_SEAFOAM_CAVE_B1F_X_ACCURACY
