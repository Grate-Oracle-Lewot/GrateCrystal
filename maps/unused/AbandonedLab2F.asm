	object_const_def
	const ABANDONEDLAB2F_POKEDEX

AbandonedLab2F_MapScripts:
	def_scene_scripts

	def_callbacks

AbandonedLab2FJournal:
	jumptext AbandonedLab2FJournalText

AbandonedLab2FHiddenXSpDefend:
	hiddenitem X_SP_DEFEND, EVENT_ABANDONED_LAB_2F_HIDDEN_X_SP_DEFEND

AbandonedLab2FJournalText:
	text "It's full of comp-"
	line "licated scientific"
	cont "research."

	para "It seems to show"
	line "an incomplete gene"

	para "sequence that had"
	line "the gaps filled."

	para "And there's a pic-"
	line "ture of…"

	para "A stone eyebrow?"
	done

AbandonedLab2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25, 24, ABANDONED_LAB_1F, 3
	warp_event 19,  8, ABANDONED_LAB_ROOF, 1
	warp_event  5, 21, ABANDONED_LAB_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event 18, 13, BGEVENT_ITEM, AbandonedLab2FHiddenXSpDefend

	def_object_events
	object_event  8,  7, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_SCRIPT, 0, AbandonedLab2FJournal, -1
