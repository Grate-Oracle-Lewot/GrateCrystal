	object_const_def
	const SILPHCO6F_SCIENTIST
	const SILPHCO6F_CLERK1
	const SILPHCO6F_CLERK2
	const SILPHCO6F_CLERK3
	const SILPHCO6F_RECEPTIONIST1
	const SILPHCO6F_RECEPTIONIST2
	const SILPHCO6F_POKE_BALL1
	const SILPHCO6F_POKE_BALL2

SilphCo6F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerScientistBeau:
	trainer SCIENTIST, BEAU, EVENT_BEAT_SCIENTIST_BEAU, ScientistBeauSeenText, ScientistBeauBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext ScientistBeauAfterBattleText
	waitbutton
	closetext
	end

SilphCo6FClerk1Script:
	jumptextfaceplayer SilphCo6FClerk1Text

SilphCo6FClerk2Script:
	jumptextfaceplayer SilphCo6FClerk2Text

SilphCo6FClerk3Script:
	jumptextfaceplayer SilphCo6FClerk3Text

SilphCo6FReceptionist1Script:
	jumptextfaceplayer SilphCo6FReceptionist1Text

SilphCo6FReceptionist2Script:
	jumptextfaceplayer SilphCo6FReceptionist2Text

SilphCo6FTMMoonblast:
	itemball TM_MOONBLAST, 5

SilphCo6FSwagBeacon:
	itemball SWAG_BEACON

SilphCo6FSign:
	jumptext SilphCo6FSignText

ScientistBeauSeenText:
	text "Who are you?!"
	done

ScientistBeauBeatenText:
	text "What?!"
	done

ScientistBeauAfterBattleText:
	text "Where am I?!"
	done

SilphCo6FClerk1Text:
	text "I've got this"
	line "great idea called"

	para "WONDER TRADING,"
	line "but the higher-ups"
	cont "won't go for it…"
	done

SilphCo6FClerk2Text:
	text "OK, team. We need"
	line "a new product."

	para "Something cheap to"
	line "make, but in high"
	cont "demand!"
	done

SilphCo6FClerk3Text:
	text "Install the warp"
	line "panels, they said…"

	para "It'll make it eas-"
	line "ier to get around,"
	cont "they said…"
	done

SilphCo6FReceptionist1Text:
	text "This guy was such"
	line "a coward when TEAM"

	para "ROCKET took over"
	line "our building."
	done

SilphCo6FReceptionist2Text:
	text "You're a kid."
	line "What are kids into"
	cont "these days?"

	para "C'mon, gimme some-"
	line "thing marketable!"
	done

SilphCo6FSignText:
	text "SILPH CO. 6F"
	done

SilphCo6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  2, SILPH_CO_5F, 2
	warp_event 15,  2, SILPH_CO_7F, 1
	warp_event  3,  3, SILPH_CO_4F, 6
	warp_event 23,  3, SILPH_CO_2F, 6

	def_coord_events

	def_bg_events
	bg_event 18,  1, BGEVENT_READ, SilphCo6FSign

	def_object_events
	object_event  1,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerScientistBeau, -1
	object_event 10,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo6FClerk1Script, -1
	object_event 19,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo6FClerk2Script, -1
	object_event 16, 12, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCo6FClerk3Script, -1
	object_event 18,  8, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo6FReceptionist1Script, -1
	object_event 15,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCo6FReceptionist2Script, -1
	object_event  1,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_ITEMBALL, 0, SilphCo6FTMMoonblast, EVENT_SILPH_CO_6F_TM_MOONBLAST
	object_event  3, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilphCo6FSwagBeacon, EVENT_SILPH_CO_6F_SWAG_BEACON
