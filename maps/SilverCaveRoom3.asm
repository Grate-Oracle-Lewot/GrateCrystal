	object_const_def
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	checkevent EVENT_BEAT_RED
	iftrue .EndRed
	opentext
	writetext RedSilverTrophyText
	setevent EVENT_DECO_SILVER_TROPHY
	playsound SFX_1ST_PLACE
	waitsfx
	writetext RedDecorationText
	waitbutton
	closetext
	setevent EVENT_BEAT_RED
.EndRed:
	refreshscreen
	credits
	end

RedText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedSilverTrophyText:
	text "<PLAYER> received"
	line "SILVER TROPHY!"
	done

RedDecorationText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
