	object_const_def
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText1
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakHistoryBookText2
	waitbutton
	closetext
	end

LugiaSpeechHouseRadio:
	jumpstd Radio2Script

EcruteakLugiaSpeechHouseGrampsText:
	text "This happened when"
	line "I was young."

	para "The sky suddenly"
	line "turned black. A"

	para "giant flying #-"
	line "MON was blocking"
	cont "out the sun."

	para "I wonder what that"
	line "#MON was? "

	para "It was like a bird"
	line "and a dragon."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "You know those"
	line "SWAG BEACONS that"
	cont "find hidden items?"

	para "There used to be"
	line "something called"

	para "an ITEMFINDER that"
	line "did that…"

	para "But then they rea-"
	line "lized they could"

	para "make more money by"
	line "selling disposable"
	cont "versions."
	done

EcruteakHistoryBookText1:
	text "HISTORY OF"
	line "ECRUTEAK CITY"

	para "Read it?"
	done

EcruteakHistoryBookText2:
	text "In ECRUTEAK, there"
	line "were two towers."

	para "Each tower was the"
	line "roost of powerful"
	cont "dragon #MON."

	para "ECRUTEAK was also"
	line "home to three"

	para "#MON that raced"
	line "around the town."

	para "One night, the"
	line "three #MON"

	para "stopped to rest in"
	line "the BRASS TOWER."

	para "But the tower was"
	line "stricken by light-"
	cont "ning and burned to"
	cont "the ground."

	para "The fire was only"
	line "put out by a sudd-"
	cont "en rainstorm."

	para "It's said that the"
	line "TIN TOWER's dragon"
	cont "revived the fallen"
	cont "#MON."

	para "But the two drag-"
	line "ons were never"
	cont "seen again…"
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
