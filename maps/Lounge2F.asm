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
	waitbutton
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .OfferRematch
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
	waitbutton
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .OfferRematch
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
	loadtrainer JANINE, JANINE2
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
	waitbutton
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .OfferRematch
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
	waitbutton
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .OfferRematch
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
	loadtrainer SABRINA, SABRINA2
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
	waitbutton
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .OfferRematch
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
	waitbutton
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .OfferRematch
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
	loadtrainer BLAINE, BLAINE2
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
	waitbutton
	checkevent EVENT_BEAT_RED
	iftrue .OfferRematch
	checkflag ENGINE_QWILFISH_SWARM
	iftrue .OfferRematch
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
	loadtrainer BLUE, BLUE2
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
	loadtrainer RED, RED2
	startbattle
	reloadmapafterbattle
.EndConversation:
	end

LoungeGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RED
	iftrue .GiveRareCandies
	writetext LoungeGymGuideBeforeText
	waitbutton
	closetext
	end

.GiveRareCandies
	writetext LoungeGymGuideAfterText
	promptbutton
	giveitem RARE_CANDY, 99
	iffalse .RareCandiesNoRoom
	writetext LoungeReceivedRareCandiesText
	playsound SFX_ITEM
	waitsfx
	writetext LoungePutAwayRareCandiesText
	promptbutton
	writetext LoungeGymGuideMoreText
	waitbutton
	closetext
	end

.RareCandiesNoRoom
	writetext LoungeGymGuideNoRoomText
	waitbutton
	closetext
	end

LoungeChuckTalkText:
	text "One! Two! Three!"
	line "Four!"

	para "Hey, <PLAYER>!"
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

LoungeJasmineTalkText:
	text "Oh, um… hello"
	line "again."

	para "How are you doing"
	line "these days?"
	done

LoungeJasmineRematchText:
	text "I do hope you're"
	line "keeping up with"
	cont "your training…"

	para "May I request a"
	line "rematch with you?"
	done

LoungeJasmineRefuseText:
	text "Oh… um… okay…"
	done

LoungeJasmineLossText:
	text "…Um… Well done."
	done

LoungeJasmineAfterText:
	text "You have once"
	line "again proven your-"
	cont "self a better"
	cont "trainer than me."

	para "Um… keep at it."
	line "I will too."
	done

LoungeSabrinaTalkText:
	text "The mind needs"
	line "rest and even"

	para "entertainment to"
	line "function well."

	para "As in all things,"
	line "balance is key."
	done

LoungeSabrinaRematchText:
	text "…"

	para "I can hear your"
	line "thoughts."

	para "You want to battle"
	line "me again."
	done

LoungeSabrinaRefuseText:
	text "…"

	para "I know when you're"
	line "lying."
	done

LoungeSabrinaLossText:
	text "Still not enough…"
	done

LoungeSabrinaAfterText:
	text "As I predicted,"
	line "you are a true"
	cont "CHAMPION."
	done

LoungePryceTalkText:
	text "Back in my day, we"
	line "didn't need a new-"
	cont "fangled clubhouse."

	para "You played outside"
	line "in the mud and you"
	cont "liked it!"
	done

LoungePryceRematchText:
	text "Bah! Mindless"
	line "prattle."

	para "You're here for a"
	line "rematch, yes?"
	done

LoungePryceRefuseText:
	text "Hm. My mistake."
	done

LoungePryceLossText:
	text "Another winter"
	line "come and gone."
	done

LoungePryceAfterText:
	text "For someone your"
	line "age to have such"
	cont "talent…"

	para "Don't waste it."
	done

LoungeBlaineTalkText:
	text "At least I can"
	line "come here, but I"

	para "need to build a"
	line "real GYM again!"

	para "Maybe in PALLET or"
	line "LAVENDER…"
	done

LoungeBlaineRematchText:
	text "But enough moping!"
	line "I'm still a GYM"
	cont "LEADER!"

	para "<PLAYER>! Let's"
	line "battle again!"
	done

LoungeBlaineRefuseText:
	text "No? Suit yourself."
	done

LoungeBlaineLossText:
	text "Doused like a mere"
	line "campfire…"
	done

LoungeBlaineAfterText:
	text "Do me a favor and"
	line "beat PRYCE here,"
	cont "too."

	para "Then I won't feel"
	line "so bad about it!"
	done

LoungeBlueTalkText:
	text "I'm just saying,"
	line "you got to pick"
	cont "first!"

	para "Whaddid you expect"
	line "me to do, pick the"

	para "one that was weak"
	line "against yours?"
	done

LoungeBlueRematchText:
	text "Oh, it's the JOHTO"
	line "kid."

	para "Hey, how about we"
	line "battle again?"

	para "I need to show RED"
	line "here I can still"
	cont "kick butt!"
	done

LoungeBlueRefuseText:
	text "Heh. I guess I'd"
	line "be scared too."
	done

LoungeBlueLossText:
	text "Man, again? Fine…"
	done

LoungeBlueAfterText:
	text "You just love to"
	line "show me up, huh?"

	para "You remind me of a"
	line "young me."

	para "Smell ya later,"
	line "punk!"
	done

LoungeRedText:
	text "…"
	line "…"
	done

LoungeGymGuideBeforeText:
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

LoungeGymGuideAfterText:
	text "Yo, CHAMP!"
	line "I heard!"

	para "You defeated RED!"

	para "Nobody's done that"
	line "in three years!"

	para "I think that kind"
	line "of accomplishment"

	para "deserves a specta-"
	line "cular reward!"
	done

LoungeReceivedRareCandiesText:
	text "<PLAYER> received"
	line "RARE CANDY ×99!"
	done

LoungePutAwayRareCandiesText:
	text "<PLAYER> put the"
	line "RARE CANDIES in"
	cont "the ITEM POCKET."
	done

LoungeGymGuideMoreText:
	text "And there's more"
	line "where that came"
	cont "from, baby!"
	done

LoungeGymGuideNoRoomText:
	text "Oh, you don't have"
	line "room… Too bad…"
	done

Lounge2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 15, LOUNGE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 17,  3, SPRITE_CHUCK, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungeChuckScript, -1
	object_event  5,  9, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeJanineScript, -1
	object_event  3, 10, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungeJasmineScript, -1
	object_event  3,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeSabrinaScript, -1
	object_event 10, 14, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LoungePryceScript, -1
	object_event  9, 14, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeBlaineScript, -1
	object_event 16,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeBlueScript, -1
	object_event 15,  8, SPRITE_RED, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeRedScript, -1
	object_event  6,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoungeGymGuideScript, -1
