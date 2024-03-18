	object_const_def
	const SILPHCO4F_SCIENTIST
	const SILPHCO4F_CLERK

SilphCo4F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistHegel:
	trainer SCIENTIST, HEGEL, EVENT_BEAT_SCIENTIST_HEGEL, ScientistHegelSeenText, ScientistHegelBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistHegelAfterBattleText
	waitbutton
	closetext
	end

SilphCo4FClerkScript:
	jumptextfaceplayer SilphCo4FClerkText

SilphCo4FSign:
	jumptext SilphCo4FSignText

ScientistHegelSeenText:
	text "I'm developing a"
	line "realistic econom-"
	cont "ics system for my"
	cont "tabletop RPG."
	done

ScientistHegelBeatenText:
	text "<INV_EX>Quack?"
	done

ScientistHegelAfterBattleText:
	text "It's too bad"
	line "EMPOLEON isn't in"
	cont "this hack."
	done

SilphCo4FClerkText:
	text "Sorry, we can't"
	line "open any of these"
	cont "shutters for you."

	para "It's all just"
	line "storage space,"
	cont "anyway."
	done

SilphCo4FSignText:
	text "SILPH CO. 4F"
	done

SilphCo4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, SILPH_CO_3F, 2
	warp_event 27,  2, SILPH_CO_5F, 1
	warp_event  3, 15, SILPH_CO_10F, 3
	warp_event 11,  7, SILPH_CO_10F, 4
	warp_event 17, 11, SILPH_CO_10F, 5
	warp_event 17,  3, SILPH_CO_6F, 3

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo4FSign

	def_object_events
	object_event 14,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistHegel, -1
	object_event  6, 13, SPRITE_CLERK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo4FClerkScript, -1
