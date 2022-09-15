	object_const_def
	const LOUNGE2F_CHUCK
	const LOUNGE2F_JANINE
	const LOUNGE2F_JASMINE
	const LOUNGE2F_SABRINA
	const LOUNGE2F_PRYCE
	const LOUNGE2F_BLAINE
	const LOUNGE2F_BLUE
	const LOUNGE2F_RED
	const LOUNGE2F_GYM_GUIDE

Lounge2F_MapScripts:
	def_scene_scripts

	def_callbacks



LoungeRedScript:
	jumptextfaceplayer LoungeRedText

LoungeGymGuideScript:
	jumptextfaceplayer LoungeGymGuideText



LoungeRedText:
	text "…"
	line "…"
	done

LoungeGymGuideText:
	text "Yo, CHAMPION!"

	para "Pretty snazzy"
	line "hangout, huh?"

	para "It's a place for"
	line "the GYM LEADERS to"
	cont "relax…"

	para "But I bet you can"
	line "get some rematches"

	para "out of them if you"
	line "try!"
	done

Lounge2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 15, LOUNGE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 17,  3, SPRITE_CHUCK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungeChuckScript, -1
	object_event  5,  9, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeJanineScript, -1
	object_event  3, 10, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungeJasmineScript, -1
	object_event  3,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeSabrinaScript, -1
	object_event 10, 14, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungePryceScript, -1
	object_event  9, 14, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeBlaineScript, -1
	object_event 16,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeBlueScript, -1
	object_event 15,  8, SPRITE_RED, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeRedScript, -1
	object_event  6,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeGymGuideScript, -1
