	object_const_def
	const SEAFOAMCAVEHIDEOUT_POKEDEX
	const SEAFOAMCAVEHIDEOUT_BOULDER1
	const SEAFOAMCAVEHIDEOUT_BOULDER2
	const SEAFOAMCAVEHIDEOUT_BOULDER3
	const SEAFOAMCAVEHIDEOUT_BOULDER4
	const SEAFOAMCAVEHIDEOUT_BOULDER5
	const SEAFOAMCAVEHIDEOUT_BOULDER6
	const SEAFOAMCAVEHIDEOUT_BOULDER7
	const SEAFOAMCAVEHIDEOUT_BOULDER8
	const SEAFOAMCAVEHIDEOUT_POKE_BALL

SeafoamCaveHideout_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamCaveHideoutRadio:
	playsound SFX_WRONG
	waitsfx
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .AlreadyOn
	playmusic MUSIC_LEWOTS_RADIO
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.AlreadyOn:
	special RestartMapMusic
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

SeafoamCaveHideoutStatue:
	jumptext SeafoamCaveHideoutStatueText

SeafoamCaveHideoutBoulder:
	jumpstd StrengthBoulderScript

SeafoamCaveHideoutBook:
	opentext
	writetext SeafoamCaveHideoutBookText1
	yesorno
	iffalse .Done
	writetext SeafoamCaveHideoutBookText2
	yesorno
	iffalse .Done
	writetext SeafoamCaveHideoutBookText3
	yesorno
	iffalse .Done
	writetext SeafoamCaveHideoutBookText4
	yesorno
	iffalse .Done
	writetext SeafoamCaveHideoutBookText5
	yesorno
	iffalse .Done
	writetext SeafoamCaveHideoutBookText6
	yesorno
	iffalse .Done
	writetext SeafoamCaveHideoutBookText7
	waitbutton
.Done:
	closetext
	end

SeafoamCaveHideoutBed:
	opentext
	writetext SeafoamCaveHideoutBedText1
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext SeafoamCaveHideoutBedText2
	closetext
	end

SeafoamCaveHideoutXAccuracy:
	itemball X_ACCURACY

SeafoamCaveHideoutHiddenTimerBall:
	hiddenitem TIMER_BALL, EVENT_SEAFOAM_CAVE_HIDEOUT_HIDDEN_TIMER_BALL

SeafoamCaveHideoutHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SEAFOAM_CAVE_HIDEOUT_HIDDEN_MAX_POTION

SeafoamCaveHideoutHiddenSilverLeaf:
	hiddenitem SILVER_LEAF, EVENT_SEAFOAM_CAVE_HIDEOUT_HIDDEN_SILVER_LEAF

SeafoamCaveHideoutStatueText:
	text "It's a statue of a"
	line "FERALIGATR."
	done

SeafoamCaveHideoutBookText1:
	text "It's a book titled"
	line "EVERYTHING YOU"

	para "NEVER WANTED TO"
	line "KNOW ABOUT THE"

	para "GRATE ORACLE"
	line "LEWOT. Read it?"
	done

SeafoamCaveHideoutBookText2:
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

SeafoamCaveHideoutBookText3:
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

SeafoamCaveHideoutBookText4:
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
	line "PERCY's favorite,"

	para "as you've probably"
	line "guessed."

	para "Keep reading?"
	done

SeafoamCaveHideoutBookText5:
	text "My favorite video"
	line "games of all time"
	cont "are, in order:"

	para "PAPER MARIO, its"
	line "first sequel,"

	para "TEARS OF THE KING-"
	line "DOM, BREATH OF THE"
	cont "WILD, and DONKEY"
	cont "KONG 64."

	para "(I haven't played"
	line "BANANZA yet.)"

	para "Obviously, Gen II"
	line "#MON is up"
	cont "there as well."

	para "When it comes to"
	line "writing, you can't"

	para "beat the PORTAL"
	line "games."

	para "Oh, and YOSHI'S"
	line "STORY has the best"

	para "soundtrack of all"
	line "time. Objectively."

	para "Keep reading?"
	done

SeafoamCaveHideoutBookText6:
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

SeafoamCaveHideoutBookText7:
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

SeafoamCaveHideoutBedText1:
	text "A comfy bed!"
	line "Time to sleep…"
	autodone

SeafoamCaveHideoutBedText2:
	text "Ah, refreshed and"
	line "restored!"
	autodone

SeafoamCaveHideout_MapEvents:
	def_warp_events
	warp_event 11, 16, SEAFOAM_CAVE_1F, 2
	warp_event  6, 41, SEAFOAM_CAVE_DEPTHS, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, SeafoamCaveHideoutRadio
	bg_event 11, 21, BGEVENT_READ, SeafoamCaveHideoutStatue
	bg_event 21, 29, BGEVENT_READ, SeafoamCaveHideoutStatue
	bg_event 26, 29, BGEVENT_READ, SeafoamCaveHideoutStatue
	bg_event 16, 22, BGEVENT_READ, SeafoamCaveHideoutBed
	bg_event 16, 23, BGEVENT_READ, SeafoamCaveHideoutBed
	bg_event 17, 40, BGEVENT_ITEM, SeafoamCaveHideoutHiddenTimerBall
	bg_event 32, 13, BGEVENT_ITEM, SeafoamCaveHideoutHiddenMaxPotion
	bg_event 28, 30, BGEVENT_ITEM, SeafoamCaveHideoutHiddenSilverLeaf

	def_object_events
	object_event  3, 28, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBook, -1
	object_event 22, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 23, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 24, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 25, 34, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 22, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 23, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 24, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event 25, 36, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamCaveHideoutBoulder, -1
	object_event  6, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveHideoutXAccuracy, EVENT_SEAFOAM_CAVE_HIDEOUT_X_ACCURACY
