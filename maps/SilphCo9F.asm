	object_const_def
	const SILPHCO9F_SCIENTIST
	const SILPHCO9F_NURSE

SilphCo9F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistHideki:
	trainer SCIENTIST, HIDEKI, EVENT_BEAT_SCIENTIST_HIDEKI, ScientistHidekiSeenText, ScientistHidekiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistHidekiAfterBattleText
	waitbutton
	closetext
	end

SilphCo9FNurseScript:
	faceplayer
	opentext
	writetext SilphCo9FNurseBeforeText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext SilphCo9FNurseAfterText
	waitbutton
	closetext
	end

SilphCo9FSign:
	jumptext SilphCo9FSignText

ScientistHidekiSeenText:
	text "I'm working on"
	line "something very"
	cont "important!"
	done

ScientistHidekiBeatenText:
	text "Go away."
	done

ScientistHidekiAfterBattleText:
	text "What am I working"
	line "on? It's called a"
	cont "power nap."
	done

SilphCo9FNurseBeforeText:
	text "I'm the on-site"
	line "physician."

	para "Here, let me heal"
	line "your #MON."
	done

SilphCo9FNurseAfterText:
	text "There you are."

	para "Now if only we had"
	line "a better place to"

	para "store all these"
	line "statues…"
	done

SilphCo9FSignText:
	text "SILPH CO. 9F"
	done

SilphCo9F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  2, SILPH_CO_8F, 2
	warp_event 13,  2, SILPH_CO_10F, 1
	warp_event 17, 15, SILPH_CO_5F, 6
	warp_event  9,  3, SILPH_CO_3F, 8

	def_coord_events

	def_bg_events
	bg_event 18,  1, BGEVENT_READ, SilphCo9FSign

	def_object_events
	object_event 19, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistHideki, -1
	object_event  5,  7, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilphCo9FNurseScript, -1
