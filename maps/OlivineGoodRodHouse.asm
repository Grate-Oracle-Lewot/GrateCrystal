	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	checkflag ENGINE_RADIO_CARD
	iffalse .NoRadioCard
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	showemote EMOTE_FISH, OLIVINEGOODRODHOUSE_FISHING_GURU, 15
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

.NoRadioCard:
	writetext GoodRodNoRadioCardText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "Your #GEAR is"
	line "cool…"

	para "Oh! You have a"
	line "RADIO CARD!"

	para "Have you run acr-"
	line "oss a station"

	para "called the Fish"
	line "Biome Radar?"

	para "It scans the area"
	line "to determine the"

	para "local habitat for"
	line "water-dwelling"
	cont "#MON."

	para "With that kind of"
	line "technology, you"

	para "need a suitable"
	line "ROD to match!"

	para "How would you like"
	line "this GOOD ROD?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "We have ourselves"
	cont "a new angler!"
	done

GaveGoodRodText:
	text "Fish aren't found"
	line "in the sea alone."

	para "They go wherever"
	line "there is water."
	done

DontWantGoodRodText:
	text "Whaaat? You don't"
	line "like to fish!?"
	cont "Incomprehensible!"
	done

HaveGoodRodText:
	text "How are things?"
	line "Land the big one?"
	done

GoodRodNoRadioCardText:
	text "Your #GEAR is"
	line "cool…"

	para "I heard you can"
	line "get a CARD for it"

	para "that lets you lis-"
	line "ten to the radio."
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GoodRodHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GoodRodHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
