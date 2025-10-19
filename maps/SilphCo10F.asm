	object_const_def
	const SILPHCO10F_SCIENTIST
	const SILPHCO10F_RECEPTIONIST
	const SILPHCO10F_POKE_BALL

SilphCo10F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistSuguru:
	trainer SCIENTIST, SUGURU, EVENT_BEAT_SCIENTIST_SUGURU, ScientistSuguruSeenText, ScientistSuguruBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistSuguruAfterBattleText
	waitbutton
	closetext
	end

SilphCo10FReceptionistScript:
	jumptextfaceplayer SilphCo10FReceptionistText

SilphCo10FXEvade:
	itemball X_EVADE

SilphCo10FSign:
	jumptext SilphCo10FSignText

ScientistSuguruSeenText:
	text "I don't want to"
	line "work here anymore…"
	done

ScientistSuguruBeatenText:
	text "I don't want to"
	line "work anywhere else"
	cont "either…"
	done

ScientistSuguruAfterBattleText:
	text "I don't know what's"
	line "harder, toiling"

	para "under capitalism"
	line "or overthrowing"
	cont "it…"
	done

SilphCo10FReceptionistText:
	text "We developed the"
	line "MASTER BALL."

	para "If you catch some-"
	line "thing good with"
	cont "it, thank SILPH!"
	done

SilphCo10FSignText:
	text "SILPH CO. 10F"
	done

SilphCo10F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  2, SILPH_CO_9F, 2
	warp_event  9,  2, SILPH_CO_11F, 1
	warp_event 13, 15, SILPH_CO_4F, 3
	warp_event  9, 11, SILPH_CO_4F, 4
	warp_event 13,  7, SILPH_CO_4F, 5

	def_coord_events

	def_bg_events
	bg_event 12,  1, BGEVENT_READ, SilphCo10FSign

	def_object_events
	object_event 11, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistSuguru, -1
	object_event  9, 15, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo10FReceptionistScript, -1
	object_event  4, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo10FSign, EVENT_SILPH_CO_10F_X_EVADE
