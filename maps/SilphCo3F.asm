	object_const_def
	const SILPHCO3F_SCIENTIST
	const SILPHCO3F_CLERK
	const SILPHCO3F_POKE_BALL

SilphCo3F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistConnor:
	trainer SCIENTIST, CONNOR, EVENT_BEAT_SCIENTIST_CONNOR, ScientistConnorSeenText, ScientistConnorBeatenText, 0, .AfterScript

.AfterScript:
	opentext
	writetext ScientistConnorAfterBattleText
	waitbutton
	closetext
	end

SilphCo3FClerkScript:
	jumptextfaceplayer SilphCo3FClerkText

SilphCo3FCatchCharm:
	itemball CATCH_CHARM

SilphCo3FSign:
	jumptext SilphCo3FSignText

ScientistConnorSeenText:
	text "I'll never spill"
	line "my secrets!"
	done

ScientistConnorBeatenText:
	text "OK, OK, I'll tell!"
	done

ScientistConnorAfterBattleText:
	text "Around three years"
	line "ago, the guys on"

	para "CINNABAR were try-"
	line "ing to create a"

	para "clone of the lege-"
	line "ndary #MON MEW."

	para "Thing is, they"
	line "modified the clone"

	para "to try to make it"
	line "even stronger."

	para "I don't know exac-"
	line "tly what happened,"

	para "but I'm sure it's"
	line "what destroyed the"
	cont "island!"
	done

SilphCo3FClerkText:
	text "We used to have an"
	line "elevator, but it"

	para "was considered a"
	line "security hazard"

	para "after TEAM ROCKET"
	line "took us over…"

	para "Sigh…"
	done

SilphCo3FSignText:
	text "SILPH CO. 3F"
	done

SilphCo3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, SILPH_CO_2F, 2
	warp_event 23,  2, SILPH_CO_4F, 1
	warp_event 27,  3, SILPH_CO_2F, 5
	warp_event  3,  3, SILPH_CO_5F, 3
	warp_event  3, 15, SILPH_CO_5F, 4
	warp_event 23, 11, SILPH_CO_3F, 7
	warp_event 27, 15, SILPH_CO_3F, 6
	warp_event  3, 11, SILPH_CO_9F, 4
	warp_event 11, 11, SILPH_CO_7F, 4

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo3FSign

	def_object_events
	object_event  6,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistConnor, -1
	object_event 14,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo3FClerkScript, -1
	object_event 28,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo3FCatchCharm, EVENT_SILPH_CO_3F_CATCH_CHARM
