	object_const_def
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN
	const ROUTE40BATTLETOWERGATE_OFFICER

Route40BattleTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	endcallback

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

TrainerOfficerTubbs:
	faceplayer
	checktime NITE
	iffalse .AfterBattle
	checkevent EVENT_BEAT_OFFICER_TUBBS
	iftrue .AfterBattle
	showemote EMOTE_SLEEP, ROUTE40BATTLETOWERGATE_OFFICER, 15
	playmusic MUSIC_OFFICER_ENCOUNTER
	opentext
	writetext OfficerTubbsSeenText
	waitbutton
	closetext
	winlosstext OfficerTubbsBeatenText, 0
	loadtrainer OFFICER, TUBBS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_TUBBS
	closetext
	end

.AfterBattle:
	opentext
	writetext OfficerTubbsAfterBattleText
	waitbutton
	closetext
	end

Route40BattleTowerGateRockerText:
	text "Are you going to"
	line "the BATTLE TOWER?"

	para "This is a secret,"
	line "but if you win a"

	para "whole lot, you can"
	line "win special gifts."
	done

Route40BattleTowerGateTwinText:
	text "The levels of the"
	line "#MON I want to"

	para "use are all"
	line "different."

	para "I have to go train"
	line "them now!"
	done

OfficerTubbsSeenText:
	text "WAUGH! I wasn't"
	line "sleeping on the"
	cont "job!"
	done

OfficerTubbsBeatenText:
	text "I need backup over"
	line "here!"
	done

OfficerTubbsAfterBattleText:
	text "I could go for a"
	line "donut…"

	para "…What? Oh, come"
	line "on!"

	para "Everyone loves"
	line "donuts!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
	object_event  6,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerTubbs, -1
