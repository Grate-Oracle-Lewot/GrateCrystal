	object_const_def
	const ROUTE24_JESSIE
	const ROUTE24_JAMES

Route24_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .JessieJames

.JessieJames:
	checkevent EVENT_ROUTE_24_ROCKET
	iffalse .Appear
	disappear ROUTE24_JESSIE
	disappear ROUTE24_JAMES
	endcallback

.Appear:
	appear ROUTE24_JESSIE
	appear ROUTE24_JAMES
	endcallback

Route24JessieScript:
	faceplayer
	opentext
	writetext Route24JessieSeen1Text
	waitbutton
	closetext
	applymovement ROUTE24_JESSIE, Movement_JessieJamesSpin
	faceplayer
	variablesprite SPRITE_JESSIE_DISGUISE, SPRITE_JESSIE
	special LoadUsedSpritesGFX
	faceplayer
	applymovement ROUTE24_JAMES, Movement_JessieJamesSpin
	readvar VAR_FACING
	ifequal UP, .facedown1
	ifequal DOWN, .faceup1
	turnobject ROUTE24_JAMES, RIGHT
.finish1
	variablesprite SPRITE_JAMES_DISGUISE, SPRITE_JAMES
	special LoadUsedSpritesGFX
	readvar VAR_FACING
	ifequal UP, .facedown2
	ifequal DOWN, .faceup2
	turnobject ROUTE24_JAMES, RIGHT
.finish2
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	opentext
	writetext Route24JessieSeen2Text
	waitbutton
	closetext
	winlosstext JessieJames3BeatenText, -1
	loadtrainer JESSIE, JAMES3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	opentext
	writetext Route24JessieAfterBattleText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_JAMES
	disappear ROUTE24_JESSIE
	setevent EVENT_CERULEAN_CITY_PERSIAN
	setevent EVENT_ROUTE_24_ROCKET
	pause 10
	playsound SFX_RUN
	waitsfx
	pause 10
	special FadeInQuickly
	playmapmusic
	end

.facedown1
	turnobject ROUTE24_JAMES, DOWN
	sjump .finish1

.faceup1
	turnobject ROUTE24_JAMES, UP
	sjump .finish1

.facedown2
	turnobject ROUTE24_JAMES, DOWN
	sjump .finish2

.faceup2
	turnobject ROUTE24_JAMES, UP
	sjump .finish2

Route24JamesScript:
	faceplayer
	opentext
	writetext Route24JamesSeen1Text
	waitbutton
	closetext
	applymovement ROUTE24_JAMES, Movement_JessieJamesSpin
	faceplayer
	variablesprite SPRITE_JAMES_DISGUISE, SPRITE_JAMES
	special LoadUsedSpritesGFX
	faceplayer
	applymovement ROUTE24_JESSIE, Movement_JessieJamesSpin
	readvar VAR_FACING
	ifequal UP, .facedown1
	ifequal DOWN, .faceup1
	turnobject ROUTE24_JESSIE, RIGHT
.finish1
	variablesprite SPRITE_JESSIE_DISGUISE, SPRITE_JESSIE
	special LoadUsedSpritesGFX
	readvar VAR_FACING
	ifequal UP, .facedown2
	ifequal DOWN, .faceup2
	turnobject ROUTE24_JESSIE, RIGHT
.finish2
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	opentext
	writetext Route24JamesSeen2Text
	waitbutton
	closetext
	winlosstext JessieJames3BeatenText, -1
	loadtrainer JESSIE, JAMES3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	opentext
	writetext Route24JamesAfterBattleText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_JESSIE
	disappear ROUTE24_JAMES
	setevent EVENT_CERULEAN_CITY_PERSIAN
	setevent EVENT_ROUTE_24_ROCKET
	pause 10
	playsound SFX_RUN
	waitsfx
	pause 10
	special FadeInQuickly
	playmapmusic
	end

.facedown1
	turnobject ROUTE24_JESSIE, DOWN
	sjump .finish1

.faceup1
	turnobject ROUTE24_JESSIE, UP
	sjump .finish1

.facedown2
	turnobject ROUTE24_JESSIE, DOWN
	sjump .finish2

.faceup2
	turnobject ROUTE24_JESSIE, UP
	sjump .finish2

Movement_JessieJamesSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Route24JessieSeen1Text:
	text "Hm? What do you"
	line "want?"

	para "It's rude to bother"
	line "people, you know!"

	para "…Huh? TEAM ROCKET?"
	line "Never heard of it!"

	para "… … …"

	para "Oh, forget it!"
	done

Route24JessieSeen2Text:
	text "JESSIE: Fine, you"
	line "little brat!"

	para "If you want a"
	line "battle, you've got"
	cont "one!"
	done

Route24JamesSeen1Text:
	text "Why, hello there!"
	line "Lovely day, isn't"
	cont "it, darling?"

	para "What's that? TEAM"
	line "ROCKET?"

	para "I'm afraid I'm not"
	line "familiar!"

	para "… … …"

	para "…Drat! Jig's up!"
	done

Route24JamesSeen2Text:
	text "JAMES: How did you"
	line "see through our"
	cont "disguises?"

	para "You're too good for"
	line "your own… good!"

	para "I guess it's battle"
	line "time!"
	done

JessieJames3BeatenText:
	text "Looks like we're"
	line "blasting off"
	cont "agaaaaaiiiin!"
	done

Route24JessieAfterBattleText:
	text "JESSIE: Ugh…"

	para "Fine. We hid the"
	line "generator part in"
	cont "CERULEAN GYM."

	para "We thought if we"
	line "caused enough"

	para "chaos, it might"
	line "draw the boss out."

	para "But he's still no-"
	line "where to be found…"

	para "You still haven't"
	line "seen the last of"
	cont "TEAM ROCKET!"

	para "Come on, JAMES!"
	line "We're leaving!"
	done

Route24JamesAfterBattleText:
	text "JAMES: Why do you"
	line "always have to be"
	cont "so harsh?"

	para "We hid that part"
	line "in CERULEAN GYM."

	para "Go find it if you"
	line "want it."

	para "What do we do now,"
	line "JESSIE?"

	para "JESSIE: We keep"
	line "searching for the"
	cont "boss!"

	para "TEAM ROCKET will"
	line "never give up!"

	para "JAMES: If you say"
	line "so…"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_JESSIE_DISGUISE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route24JessieScript, EVENT_ROUTE_24_JESSIE
	object_event  8,  7, SPRITE_JAMES_DISGUISE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24JamesScript, EVENT_ROUTE_24_JAMES
