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

LoungeFalknerScript:
	turnobject LOUNGE1F_FALKNER, RIGHT
	opentext
	writetext LoungeFalknerTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal MONDAY, .OfferRematch
	closetext
	end

.OfferRematch:
	faceplayer
	writetext LoungeFalknerRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeFalknerRefuseText
	waitbutton
	closetext
	turnobject LOUNGE1F_FALKNER, RIGHT
	end

.DoRematch:
	winlosstext LoungeFalknerLossText, 0
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeFalknerAfterText
	waitbutton
	closetext
	turnobject LOUNGE1F_FALKNER, RIGHT
	end

LoungeBrockScript:
	faceplayer
	opentext
	writetext LoungeBrockTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal MONDAY, .OfferRematch
	closetext
	end

.OfferRematch:
	writetext LoungeBrockRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeBrockRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeBrockLossText, 0
	loadtrainer BROCK, BROCK2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeBrockAfterText
	waitbutton
	closetext
	end

LoungeBugsyScript:
	faceplayer
	opentext
	writetext LoungeBugsyTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .OfferRematch
	closetext
	end

.OfferRematch:
	writetext LoungeBugsyRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeBugsyRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeBugsyLossText, 0
	loadtrainer BUGSY, BUGSY2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeBugsyAfterText
	waitbutton
	closetext
	end

LoungeMistyScript:
	faceplayer
	opentext
	writetext LoungeMistyTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .Rematch
	closetext
	end

.Rematch:
	writetext LoungeMistyRematchText
	waitbutton
	closetext
	winlosstext LoungeMistyLossText, 0
	loadtrainer MISTY, MISTY2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeMistyAfterText
	waitbutton
	closetext
	end

LoungeWhitneyScript:
	faceplayer
	opentext
	writetext LoungeWhitneyTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .OfferRematch
	closetext
	end

.OfferRematch:
	writetext LoungeWhitneyRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeWhitneyRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeWhitneyLossText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeWhitneyAfterText
	waitbutton
	closetext
	end

LoungeLtSurgeScript:
	faceplayer
	opentext
	writetext LoungeLtSurgeTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .OfferRematch
	closetext
	end

.OfferRematch:
	writetext LoungeLtSurgeRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeLtSurgeRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeLtSurgeLossText, 0
	loadtrainer LT_SURGE, LT_SURGE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeLtSurgeAfterText
	waitbutton
	closetext
	end

LoungeMortyScript:
	faceplayer
	opentext
	writetext LoungeMortyTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .OfferRematch
	closetext
	end

.OfferRematch:
	writetext LoungeMortyRematchText
	yesorno
	iftrue .DoRematch
	writetext LoungeMortyRefuseText
	waitbutton
	closetext
	end

.DoRematch:
	winlosstext LoungeMortyLossText, 0
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeMortyAfterText
	waitbutton
	closetext
	end

LoungeErikaScript:
	faceplayer
	opentext
	writetext LoungeErikaTalkText
	waitbutton
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .Rematch
	closetext
	end

.Rematch:
	writetext LoungeErikaRematchText
	waitbutton
	closetext
	winlosstext LoungeErikaLossText, 0
	loadtrainer ERIKA, ERIKA2
	startbattle
	reloadmapafterbattle
	opentext
	writetext LoungeErikaAfterText
	waitbutton
	closetext
	end

LoungeClairScript:
	jumptextfaceplayer LoungeClairText

LoungeFalknerTalkText:
	text "Just because rock"
	line "hits hard against"

	para "flying doesn't"
	line "mean it's better!"
	done

LoungeFalknerRematchText:
	text "<PLAYER>!"
	line "Help me show this"

	para "blockhead how"
	line "great sky #MON"
	cont "are!"

	para "Let's battle right"
	line "now!"
	done

LoungeFalknerRefuseText:
	text "Ha! See! Even"
	line "<PLAYER> is"

	para "scared of my dad's"
	line "awesome #MON!"
	done

LoungeFalknerLossText:
	text "Darn it all…"
	done

LoungeFalknerAfterText:
	text "We'll get you next"
	line "time! I promise!"
	done

LoungeBrockTalkText:
	text "This kid really"
	line "has something to"
	cont "prove…"
	done

LoungeBrockRematchText:
	text "Oh, hey, <PLAYER>."
	line "They let you in"
	cont "here, huh?"

	para "You must've gotten"
	line "stronger since we"
	cont "last fought."

	para "What would you say"
	line "to a rematch?"
	done

LoungeBrockRefuseText:
	text "Oh, okay. Maybe"
	line "next time."
	done

LoungeBrockLossText:
	text "You broke through"
	line "my defenses!"
	done

LoungeBrockAfterText:
	text "Yep, you're as"
	line "tough as ever!"

	para "I'll rematch you"
	line "any time!"
	done

LoungeBugsyTalkText:
	text "I don't know MISTY"
	line "very well, but she"
	cont "must be cool."

	para "Just look at her--"
	line "she's overcome"

	para "with awe at seeing"
	line "my bug #MON!"
	done

LoungeBugsyRematchText:
	text "Hey, by the way,"
	line "fancy a rematch?"
	done

LoungeBugsyRefuseText:
	text "Oh well. I've"
	line "still got my"
	cont "#MON."
	done

LoungeBugsyLossText:
	text "My research still"
	line "isn't complete."
	done

LoungeBugsyAfterText:
	text "That was a fun"
	line "battle!"

	para "I always learn"
	line "something new from"
	cont "you."
	done

LoungeMistyTalkText:
	text "Ew, ew, EEEWWW!"

	para "That kid's team is"
	line "full of icky,"
	cont "squirmy bugs!"

	para "I can't stand"
	line "bugs!"
	done

LoungeMistyRematchText:
	text "Huh? A rematch?"

	para "Well… I guess it"
	line "might take my mind"
	cont "off things."

	para "Alright, but I"
	line "won't go easy on"
	cont "you!"
	done

LoungeMistyLossText:
	text "You're still a"
	line "pest!"
	done

LoungeMistyAfterText:
	text "Thanks for keeping"
	line "me entertained."

	para "But I'm going to"
	line "beat you next"
	cont "time!"
	done

LoungeWhitneyTalkText:
	text "Howdy! It's been a"
	line "while."

	para "You must've gotten"
	line "really strong if"

	para "they let you in"
	line "here!"
	done

LoungeWhitneyRematchText:
	text "In fact… I'd say"
	line "you look strong"

	para "enough for a re-"
	line "match! C'mon!"
	done

LoungeWhitneyRefuseText:
	text "Aww… whassamatter,"
	line "scared o' li'l old"
	cont "me? Teehee!"
	done

LoungeWhitneyLossText:
	text "Sniff… sob…"
	done

LoungeWhitneyAfterText:
	text "Sniff…"

	para "Waaah!"
	line "Waaah!"

	para "…"

	para "A'ight, pull it"
	line "together, girl."
	done

LoungeLtSurgeTalkText:
	text "That little girl,"
	line "WHITNEY, is wicked"
	cont "strong!"

	para "I was in the army,"
	line "and she scares me!"
	done

LoungeLtSurgeRematchText:
	text "Reminds me of an-"
	line "other strong kid I"
	cont "know!"

	para "It's time, tyke! A"
	line "rematch! You, me!"
	done

LoungeLtSurgeRefuseText:
	text "What? No? Well,"
	line "come back if you"
	cont "change your mind!"
	done

LoungeLtSurgeLossText:
	text "Still tough as"
	line "nails! I like it!"
	done

LoungeLtSurgeAfterText:
	text "You're the real"
	line "deal, <PLAYER>!"
	done

LoungeMortyTalkText:
	text "I'm impressed with"
	line "ERIKA's zen."

	para "She must hold many"
	line "secrets about that"

	para "which can't be"
	line "seen by mortals."
	done

LoungeMortyRematchText:
	text "<PLAYER>…"
	line "You've grown. I"
	cont "can sense it."

	para "I think it would"
	line "benefit us both if"
	cont "we battled again."
	done

LoungeMortyRefuseText:
	text "Hm… Return when"
	line "you are ready."
	done

LoungeMortyLossText:
	text "I see…"
	done

LoungeMortyAfterText:
	text "Thank you for the"
	line "lesson."

	para "I will keep train-"
	line "ing."

	para "And one day…"
	done

LoungeErikaTalkText:
	text "Why, hello there,"
	line "<PLAYER>."

	para "This lounge is so"
	line "cozy, isn't it?"

	para "I get so content"
	line "watching everyone"

	para "enjoy themselves,"
	line "I end up just"
	cont "snoozing…"
	done

LoungeErikaRematchText:
	text "Oh, pardon me. I"
	line "once again mistook"

	para "your intentions"
	line "for small talk."

	para "Let us proceed."
	done

LoungeErikaLossText:
	text "I'm forced to"
	line "concede again."
	done

LoungeErikaAfterText:
	text "You remain very"
	line "talented…"

	para "Here… take this"
	line "RAINBOWBADGE…"

	para "What? We already"
	line "did that?"

	para "Oh my… That's"
	line "embarrassing."
	done

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
	object_event  1,  5, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LoungeLtSurgeScript, -1
	object_event  8,  6, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeMortyScript, -1
	object_event  7,  6, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LoungeErikaScript, -1
	object_event 16, 15, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LoungeClairScript, -1
