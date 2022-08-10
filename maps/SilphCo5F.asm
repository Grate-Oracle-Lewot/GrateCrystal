	object_const_def
	const SILPHCO5F_SUPER_NERD
	const SILPHCO5F_SCIENTIST
	const SILPHCO5F_CLERK
	const SILPHCO5F_POKE_BALL

SilphCo5F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerJugglerDalton:
	trainer JUGGLER, DALTON, EVENT_BEAT_JUGGLER_DALTON, JugglerDaltonSeenText, JugglerDaltonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext JugglerDaltonAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMendel:
	trainer SCIENTIST, MENDEL, EVENT_BEAT_SCIENTIST_MENDEL, ScientistMendelSeenText, ScientistMendelBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistMendelAfterBattleText
	waitbutton
	closetext
	end

SilphCo5FClerkScript:
	jumptextfaceplayer SilphCo5FClerkText

SilphCo5FScopeLens:
	itemball SCOPE_LENS

SilphCo5FSign:
	jumptext SilphCo5FSignText

JugglerDaltonSeenText:
	text "Hey-ho! SILPH CO.!"
	line "Don'tcha know?"

	para "It's time for my"
	line "show, yo!"
	done

JugglerDaltonBeatenText:
	text "Whoa! You stole"
	line "the show!"
	done

JugglerDaltonAfterBattleText:
	text "I'm the officially"
	line "licensed company"
	cont "entertainment!"

	para "Here's my card!"

	para "…Oops, I'm out."
	done

ScientistMendelSeenText:
	text "I study the genes"
	line "of grass #MON."
	done

ScientistMendelBeatenText:
	text "Win or lose, it's"
	line "useful data."
	done

ScientistMendelAfterBattleText:
	text "We're close to"
	line "growing a PARAS"

	para "without mushrooms"
	line "on its back."

	para "It's going to be"
	line "a pure bug type."
	done

SilphCo5FClerkText:
	text "Ghost #MON have"
	line "stopped obscuring"

	para "themselves ever"
	line "since our SILPH"
	cont "SCOPE came out…"

	para "It's a real kick"
	line "in the profit"
	cont "margin."
	done

SilphCo5FSignText:
	text "SILPH CO. 5F"
	done

SilphCo5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  2, SILPH_CO_4F, 2
	warp_event 23,  2, SILPH_CO_6F, 1
	warp_event 11,  5, SILPH_CO_3F, 4
	warp_event  3, 15, SILPH_CO_3F, 5
	warp_event 27,  3, SILPH_CO_7F, 3
	warp_event  9, 15, SILPH_CO_9F, 3

	def_coord_events

	def_bg_events
	bg_event 20,  1, BGEVENT_READ, SilphCo5FSign

	def_object_events
	object_event 18, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerDalton, -1
	object_event  3,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistMendel, -1
	object_event 12,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo5FClerkScript, -1
	object_event  4, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo5FScopeLens, EVENT_SILPH_CO_5F_SCOPE_LENS
