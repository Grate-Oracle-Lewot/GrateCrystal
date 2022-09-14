	object_const_def
	const LOUNGE1F_FALKNER
	const LOUNGE1F_BROCK
	const LOUNGE1F_BUGSY
	const LOUNGE1F_MISTY
	const LOUNGE1F_WHITNEY
	const LOUNGE1F_SURGE
	const LOUNGE1F_MORTY
	const LOUNGE1F_ERIKA
	const LOUNGE1F_CLAIR

Lounge1F_MapScripts:
	def_scene_scripts

	def_callbacks

LoungeClairScript:
	jumptextfaceplayer LoungeClairText

LoungeClairText:
	text "Oh, it's you. I'm"
	line "not surprised that"

	para "you're allowed in"
	line "here now."

	para "Hm? A rematch? No…"
	line "I don't think so."

	para "I've learned my"
	line "lesson. I'm not"

	para "strong enough to"
	line "take you on again"
	cont "yet."

	para "However…"

	para "There's another,"
	line "less official"

	para "building on the"
	line "other side of"

	para "VICTORY ROAD where"
	line "my cousin some-"
	cont "times goes."

	para "If you want a good"
	line "dragon battle, try"
	cont "to catch him"
	cont "there."
	done

Lounge1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, ROUTE_23, 5
	warp_event  9, 17, ROUTE_23, 5
	warp_event  1, 16, LOUNGE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 10, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeFalknerScript, -1
	object_event  8, 10, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungeBrockScript, -1
	object_event 15,  1, SPRITE_BUGSY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LoungeBugsyScript, -1
	object_event 19,  2, SPRITE_MISTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeMistyScript, -1
	object_event  1,  2, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeWhitneyScript, -1
	object_event  1,  5, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LoungeSurgeScript, -1
	object_event  8,  6, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeMortyScript, -1
	object_event  7,  6, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LoungeErikaScript, -1
	object_event 16, 15, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeClairScript, -1
