	object_const_def
	const SILPHCO7F_SCIENTIST
	const SILPHCO7F_CLERK1
	const SILPHCO7F_CLERK2
	const SILPHCO7F_CLERK3
	const SILPHCO7F_RECEPTIONIST
	const SILPHCO7F_LAPRAS
	const SILPHCO7F_POKE_BALL

SilphCo7F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistTaylor:
	trainer SCIENTIST, TAYLOR, EVENT_BEAT_SCIENTIST_TAYLOR, ScientistTaylorSeenText, ScientistTaylorBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistTaylorAfterBattleText
	waitbutton
	closetext
	end

SilphCo7FClerk1Script:
	jumptextfaceplayer SilphCo7FClerk1Text

SilphCo7FClerk2Script:
	jumptextfaceplayer SilphCo7FClerk2Text

SilphCo7FClerk3Script:
	jumptextfaceplayer SilphCo7FClerk3Text

SilphCo7FReceptionistScript:
	jumptextfaceplayer SilphCo7FReceptionistText

SilphCo7FLaprasScript:
	faceplayer
	opentext
	writetext SilphCo7FLaprasText
	cry LAPRAS
	waitbutton
	closetext
	end

SilphCo7FLightBall:
	itemball LIGHT_BALL

SilphCo7FSign:
	jumptext SilphCo7FSignText

ScientistTaylorSeenText:
	text "Who brought their"
	line "kid to work?"
	done

ScientistTaylorBeatenText:
	text "I'm not a"
	line "babysitter."
	done

ScientistTaylorAfterBattleText:
	text "Look, just… don't"
	line "cause any trouble,"
	cont "alright?"
	done

SilphCo7FClerk1Text:
	text "This way to the"
	line "CHIEF's OFFICE."
	done

SilphCo7FClerk2Text:
	text "I think we should"
	line "get into the video"
	cont "game business."

	para "We need to compete"
	line "with GAME FREAK in"
	cont "CELADON!"
	done

SilphCo7FClerk3Text:
	text "Must… have…"
	line "coffee…"
	done

SilphCo7FReceptionistText:
	text "These guys are all"
	line "useless."

	para "It's the women who"
	line "hold these big co-"
	cont "mpanies together."
	done

SilphCo7FLaprasText:
	text "LAPRAS: Eeeeooooh!"
	done

SilphCo7FSignText:
	text "SILPH CO. 7F"
	done

SilphCo7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  2, SILPH_CO_6F, 2
	warp_event 17,  2, SILPH_CO_8F, 1
	warp_event 21, 15, SILPH_CO_5F, 5
	warp_event  5,  3, SILPH_CO_3F, 9
	warp_event  5,  7, SILPH_CO_11F, 2

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo7FSign

	def_object_events
	object_event 21,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistTaylor, -1
	object_event  1,  5, SPRITE_CLERK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo7FClerk1Script, -1
	object_event 10, 12, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo7FClerk2Script, -1
	object_event 11, 11, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo7FClerk3Script, -1
	object_event  9,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo7FReceptionistScript, -1
	object_event  1,  4, SPRITE_SURF, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo7FLaprasScript, -1
	object_event 24, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo7FLightBall, EVENT_SILPH_CO_7F_LIGHT_BALL
