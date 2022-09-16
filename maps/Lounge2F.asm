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

LoungeChuckScript:
	faceplayer
	opentext
	writetext LoungeChuckTalkText
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	writetext LoungeChuckRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeChuckRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeChuckLossText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeChuckAfterText
	waitbutton
	closetext
	end

LoungeJanineScript:
	faceplayer
	opentext
	writetext LoungeJanineTalkText
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	writetext LoungeJanineRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeJanineRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeJanineLossText, 0
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeJanineAfterText
	waitbutton
	closetext
	end

LoungeJasmineScript:
	faceplayer
	opentext
	writetext LoungeJasmineTalkText
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	writetext LoungeJasmineRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeJasmineRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeJasmineLossText, 0
	loadtrainer JASMINE, JASMINE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeJasmineAfterText
	waitbutton
	closetext
	end

LoungeSabrinaScript:
	faceplayer
	opentext
	writetext LoungeSabrinaTalkText
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	writetext LoungeSabrinaRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeSabrinaRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeSabrinaLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeSabrinaAfterText
	waitbutton
	closetext
	end

LoungePryceScript:
	faceplayer
	opentext
	writetext LoungePryceTalkText
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	writetext LoungePryceRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungePryceRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungePryceLossText, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungePryceAfterText
	waitbutton
	closetext
	end

LoungeBlaineScript:
	faceplayer
	opentext
	writetext LoungeBlaineTalkText
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	writetext LoungeBlaineRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeBlaineRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeBlaineLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeBlaineAfterText
	waitbutton
	closetext
	end

LoungeBlueScript:
	turnobject LOUNGE2F_BLUE, LEFT
	turnobject LOUNGE2F_RED, RIGHT
	opentext
	writetext LoungeBlueTalkText
	checkflag ENGINE_QWILFISH_SWARM
	iftrue .OfferRematch
	waitbutton
	closetext
	end

.OfferRematch:
	faceplayer
	writetext LoungeBlueRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeBlueRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeBlueLossText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeBlueAfterText
	waitbutton
	closetext
	end

LoungeRedScript:
	faceplayer
	opentext
	writetext LoungeRedText
	waitbutton
	closetext
	checkevent EVENT_BEAT_RED
	iffalse .EndConversation
	winlosstext LoungeRedText, 0
	loadtrainer RED, RED1
	startbattle
	reloadmapafterbattle
.EndConversation:
	end

LoungeGymGuideScript:
	jumptextfaceplayer LoungeGymGuideText

LoungeChuckTalkText:
	text "One! Two! Three!"
	line "Four!"

	para "Hey, <PLAY_G>!"
	line "I'm working out!"
	done

LoungeChuckRematchText:
	text "But I guess I"
	line "should be working"

	para "out my #MON!"
	line "Let's battle!"
	done

LoungeChuckRefuseText:
	text "You sure? I'll get"
	line "a few more reps in"

	para "while you think"
	line "about it."
	done

LoungeChuckLossText:
	text "Crushed again!"
	done

LoungeChuckAfterText:
	text "You're seriously"
	line "tough, kid!"
	done

LoungeJanineTalkText:
	text "It's me, JANINE."
	line "Or is it? Haha!"

	para "My dad helped de-"
	line "sign this lounge."

	para "It's functional"
	line "and ergonomic."
	done

LoungeJanineRematchText:
	text "But you didn't"
	line "come here to talk,"
	cont "right?"

	para "Shall we test our"
	line "skills again?"
	done

LoungeJanineRefuseText:
	text "Very well. But a"
	line "true trainer never"

	para "turns down a"
	line "challenge."
	done

LoungeJanineLossText:
	text "I just can't seem"
	line "to win…"
	done

LoungeJanineAfterText:
	text "As the sun rises"
	line "in one region, it"
	cont "sets in another…"
	done

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
