	object_const_def
	const ABANDONEDLAB1F_POKEDEX

AbandonedLab1F_MapScripts:
	def_scene_scripts

	def_callbacks

AbandonedLab1FJournal:
	opentext
	writetext AbandonedLab1FJournalAskText
	yesorno
	iffalse .Done
	writetext AbandonedLab1FJournalReadText
	waitbutton
.Done:
	closetext
	end

AbandonedLab1FBookshelf:
	jumpstd DifficultBookshelfScript

AbandonedLab1FHiddenEverstone:
	hiddenitem EVERSTONE, EVENT_ABANDONED_LAB_1F_HIDDEN_EVERSTONE

AbandonedLab1FJournalAskText:
	text "It's a dusty old"
	line "journal. Read it?"
	done

AbandonedLab1FJournalReadText:
	text "I'm writing this"
	line "in case it finds"
	cont "me…"

	para "Even here, perched"
	line "on a rock off the"

	para "coast of a back-"
	line "water part of"
	cont "another region, I"

	para "can't be sure I'm"
	line "safe."

	para "We created some-"
	line "thing. A #MON."

	para "We meant it to be"
	line "powerful, but we"

	para "didn't realize how"
	line "intelligent it"
	cont "would be."

	para "The whole project"
	line "was a mistake."

	para "Please, if you"
	line "find any of my"

	para "research here,"
	line "don't try to re-"
	cont "create it."
	done

AbandonedLab1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 26, ROUTE_47, 1
	warp_event  5, 26, ROUTE_47, 1
	warp_event 23, 24, ABANDONED_LAB_2F, 1
	warp_event 27, 24, ABANDONED_LAB_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 20,  7, BGEVENT_READ, AbandonedLab1FBookshelf
	bg_event 21,  7, BGEVENT_READ, AbandonedLab1FBookshelf
	bg_event 22,  7, BGEVENT_READ, AbandonedLab1FBookshelf
	bg_event 23,  7, BGEVENT_READ, AbandonedLab1FBookshelf
	bg_event 14,  7, BGEVENT_ITEM, AbandonedLab1FHiddenEverstone

	def_object_events
	object_event 21, 10, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_GREEN, OBJECTTYPE_SCRIPT, 0, AbandonedLab1FJournal, -1
