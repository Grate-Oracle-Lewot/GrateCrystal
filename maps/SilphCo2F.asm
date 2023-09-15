	object_const_def
	const SILPHCO2F_SCIENTIST
	const SILPHCO2F_RECEPTIONIST
	const SILPHCO2F_POKE_BALL

SilphCo2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistHideo:
	trainer SCIENTIST, HIDEO, EVENT_BEAT_SCIENTIST_HIDEO, ScientistHideoSeenText, ScientistHideoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistHideoAfterBattleText
	waitbutton
	closetext
	end

SilphCo2FReceptionistScript:
	jumptextfaceplayer SilphCo2FReceptionistText

SilphCo2FEviolite:
	itemball EVERSTONE

SilphCo2FSign:
	jumptext SilphCo2FSignText

ScientistHideoSeenText:
	text "What are you doing"
	line "in here?"
	done

ScientistHideoBeatenText:
	text "Oh, whatever."
	done

ScientistHideoAfterBattleText:
	text "Get lost, kid. I'm"
	line "trying to work"
	cont "here."
	done

SilphCo2FReceptionistText:
	text "Don't bug me, kid."
	line "I'm on break."
	done

SilphCo2FSignText:
	text "SILPH CO. 2F"
	done

SilphCo2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  2, SILPH_CO_1F, 3
	warp_event 25,  2, SILPH_CO_3F, 1
	warp_event 13,  3, SILPH_CO_8F, 3
	warp_event 27, 15, SILPH_CO_8F, 4
	warp_event  3,  3, SILPH_CO_3F, 3
	warp_event  9, 15, SILPH_CO_6F, 4

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo2FSign

	def_object_events
	object_event 26, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistHideo, -1
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo2FReceptionistScript, -1
	object_event  1,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo2FEviolite, EVENT_SILPH_CO_2F_EVIOLITE
