	object_const_def
	const SEAFOAMCAVEB1F_POKEDEX
	const SEAFOAMCAVEB1F_POKE_BALL

SeafoamCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamCaveRadio:
	jumpstd Radio2Script

SeafoamCaveStatue:
	jumptext SeafoamCaveStatueText

HitchhikersGuideScript:
	jumptext HitchhikersGuideText

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

HitchhikersGuideText:
	text "It's a big blue"
	line "book called the"

	para "ULTIMATE HITCH-"
	line "HIKER'S GUIDE."

	para "It seems to be a"
	line "collection of five"
	cont "novels."
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
	warp_event 24, 27, SEAFOAM_CAVE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, SeafoamCaveRadio
	bg_event 11, 21, BGEVENT_READ, SeafoamCaveStatue
	bg_event 21, 29, BGEVENT_READ, SeafoamCaveStatue
	bg_event 26, 29, BGEVENT_READ, SeafoamCaveStatue
	bg_event 16, 22, BGEVENT_READ, FastShipBed
	bg_event 16, 23, BGEVENT_READ, FastShipBed
	bg_event 17, 40, BGEVENT_ITEM, SeafoamCaveB1FHiddenTimerBall
	bg_event 32, 13, BGEVENT_ITEM, SeafoamCaveB1FHiddenMaxPotion

	def_object_events
	object_event  3, 28, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HitchhikersGuideScript, -1
	object_event  6, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveB1FXAccuracy, EVENT_SEAFOAM_CAVE_B1F_X_ACCURACY
