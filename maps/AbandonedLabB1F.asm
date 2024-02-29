	object_const_def
	const ABANDONEDLAB1F_PAPER
	const ABANDONEDLAB1F_POKE_BALL

AbandonedLabB1F_MapScripts:
	def_scene_scripts

	def_callbacks

AbandonedLabB1FUpGrade:
	itemball THICK_CLUB

AbandonedLabB1FPaper:
	jumptext AbandonedLabB1FPaperText

AbandonedLabB1FComputer:
	jumptext AbandonedLabB1FComputerText

AbandonedLabB1FBookshelf:
	jumpstd DifficultBookshelfScript

AbandonedLabB1FHiddenMetalCoat:
	hiddenitem METAL_COAT, EVENT_ABANDONED_LAB_B1F_HIDDEN_METAL_COAT

AbandonedLabB1FPaperText:
	text "It's a building"
	line "contract."

	para "It seems like this"
	line "lab was designed"

	para "to look like an"
	line "ancient tower from"
	cont "the outside."
	done

AbandonedLabB1FComputerText:
	text "It won't turn on…"
	done

AbandonedLabB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 24, ABANDONED_LAB_1F, 4

	def_coord_events

	def_bg_events
	bg_event 13,  1, BGEVENT_READ, AbandonedLabB1FComputer
	bg_event 14,  1, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 15,  1, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event  2,  5, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event  3,  5, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event  4,  5, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event  5,  5, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event  6,  5, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event  7,  5, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 18,  9, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 19,  9, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 20,  9, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 21,  9, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 20, 19, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 21, 19, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 10, 23, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 11, 23, BGEVENT_READ, AbandonedLabB1FBookshelf
	bg_event 14,  7, BGEVENT_ITEM, AbandonedLabB1FHiddenMetalCoat

	def_object_events
	object_event  9, 23, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BROWN, OBJECTTYPE_SCRIPT, 0, AbandonedLabB1FPaper, -1
	object_event  1,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AbandonedLabB1FUpGrade, EVENT_ABANDONED_LAB_B1F_THICK_CLUB
