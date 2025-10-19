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
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	opentext
	writetext Route24JessieSeenText
	waitbutton
	closetext
	winlosstext JessieJames2BeatenText, -1
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
	setevent EVENT_ROUTE_24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

Route24JamesScript:
	faceplayer
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	opentext
	writetext Route24JamesSeenText
	waitbutton
	closetext
	winlosstext JessieJames2BeatenText, -1
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
	setevent EVENT_ROUTE_24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

Route24JessieSeenText:
	text "JESSIE: Ugh! You're"
	line "such a brat!"

	para "Fine! You want a"
	line "battle? Let's go,"
	cont "JAMES!"
	done

Route24JamesSeenText:
	text "JAMES: Oh no!"
	line "JESSIE, the kid"
	cont "found us!"

	para "I guess it's time"
	line "to show what we're"
	cont "made of!"
	done

JessieJames2BeatenText:
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
	object_event  8,  8, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route24JessieScript, EVENT_ROUTE_24_JESSIE
	object_event  8,  7, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24JamesScript, EVENT_ROUTE_24_JAMES
