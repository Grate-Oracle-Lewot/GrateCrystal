	object_const_def
	const GOLDENRODGAMECORNERBACKROOM_GYM_GUIDE
	const GOLDENRODGAMECORNERBACKROOM_SAGE1
	const GOLDENRODGAMECORNERBACKROOM_SAGE2
	const GOLDENRODGAMECORNERBACKROOM_SAGE3
	const GOLDENRODGAMECORNERBACKROOM_SAGE4
	const GOLDENRODGAMECORNERBACKROOM_SAGE5
	const GOLDENRODGAMECORNERBACKROOM_SAGE6
	const GOLDENRODGAMECORNERBACKROOM_SAGE7

GoldenrodGameCornerBackroom_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodGameCornerBackroomGymGuideScript:
	checkevent EVENT_BEAT_GAMBLER_LUCKY
	iftrue .CheckHarvey
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.CheckHarvey:
	checkevent EVENT_BEAT_GAMBLER_HARVEY
	iftrue .CheckAce
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.CheckAce:
	checkevent EVENT_BEAT_GAMBLER_ACE
	iftrue .CheckHuck
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.CheckHuck:
	checkevent EVENT_BEAT_GAMBLER_HUCK
	iftrue .CheckThoreau
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.CheckThoreau:
	checkevent EVENT_BEAT_GAMBLER_THOREAU
	iftrue .CheckPT
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.CheckPT:
	checkevent EVENT_BEAT_GAMBLER_P_T
	iftrue .CheckLiuHai
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.CheckLiuHai:
	checkevent EVENT_BEAT_GAMBLER_LIU_HAI
	iftrue .AfterScript
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideBeforeText

.AfterScript:
	jumptextfaceplayer GoldenrodGameCornerBackroomGymGuideAfterText

GamblersNoCoinCaseScript:
	writetext GamblersNoCoinCaseText
Gamblers_EndText:
	waitbutton
	closetext
	end

GamblersCoinCaseFullScript:
	writetext GamblersCoinCaseFullText
	sjump Gamblers_EndText

GamblersGive500CoinsScript:
	givecoins 500
	getstring STRING_BUFFER_4, Gamblers500CoinsString
	jumpstd ReceiveItemScript

GamblersGive2000CoinsScript:
	givecoins 2000
	getstring STRING_BUFFER_4, Gamblers2000CoinsString
	jumpstd ReceiveItemScript

TrainerGamblerLucky:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_LUCKY
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerLuckySeenText
	waitbutton
	closetext
	winlosstext GamblerLuckyBeatenText, 0
	loadtrainer GAMBLER, LUCKY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_LUCKY
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_LUCKY
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive500CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_LUCKY
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerLuckyAfterBattleText
	sjump Gamblers_EndText

TrainerGamblerHarvey:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_HARVEY
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerHarveySeenText
	waitbutton
	closetext
	winlosstext GamblerHarveyBeatenText, 0
	loadtrainer GAMBLER, HARVEY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_HARVEY
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_HARVEY
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive500CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_HARVEY
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerHarveyAfterBattleText
	sjump Gamblers_EndText

TrainerGamblerAce:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_ACE
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerAceSeenText
	waitbutton
	closetext
	winlosstext GamblerAceBeatenText, 0
	loadtrainer GAMBLER, ACE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_ACE
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_ACE
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive500CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_ACE
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerAceAfterBattleText
	sjump Gamblers_EndText

TrainerGamblerHuck:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_HUCK
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerHuckSeenText
	waitbutton
	closetext
	winlosstext GamblerHuckBeatenText, 0
	loadtrainer GAMBLER, HUCK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_HUCK
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_HUCK
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive500CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_HUCK
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerHuckAfterBattleText
	sjump Gamblers_EndText

TrainerGamblerThoreau:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_THOREAU
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerThoreauSeenText
	waitbutton
	closetext
	winlosstext GamblerThoreauBeatenText, 0
	loadtrainer GAMBLER, THOREAU
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_THOREAU
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_THOREAU
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive500CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_THOREAU
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerThoreauAfterBattleText
	sjump Gamblers_EndText

TrainerGamblerPT:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_P_T
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerPTSeenText
	waitbutton
	closetext
	winlosstext GamblerPTBeatenText, 0
	loadtrainer GAMBLER, P_T
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_P_T
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_P_T
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive500CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_P_T
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerPTAfterBattleText
	sjump Gamblers_EndText

TrainerGamblerLiuHai:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GAMBLER_LIU_HAI
	iftrue .AfterBattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext GamblerLiuHaiSeenText
	waitbutton
	closetext
	winlosstext GamblerLiuHaiBeatenText, 0
	loadtrainer GAMBLER, LIU_HAI
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GAMBLER_LIU_HAI
	opentext
.AfterBattle
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_LIU_HAI
	iftrue .AfterCoins
	checkitem COIN_CASE
	iffalse GamblersNoCoinCaseScript
	checkcoins MAX_COINS - 2000
	ifequal HAVE_MORE, GamblersCoinCaseFullScript
	scall GamblersGive2000CoinsScript
	setevent EVENT_GOT_COINS_FROM_GAMBLER_LIU_HAI
	sjump Gamblers_EndText

.AfterCoins
	writetext GamblerLiuHaiAfterBattleText
	sjump Gamblers_EndText

GoldenrodGameCornerBackroomTrashcan:
	jumpstd TrashCanScript

GoldenrodGameCornerBackroomGymGuideBeforeText:
	text "Yo, millionaire in"
	line "making!"

	para "Be careful in this"
	line "room!"

	para "These trainers are"
	line "strong, but they"
	cont "use risky moves."

	para "With the right"
	line "luck, you might"

	para "beat them at a"
	line "lower level for an"

	para "experience point"
	line "jackpot!"

	para "But on the other"
	line "hand, you might go"
	cont "home broke!"

	para "Think carefully"
	line "about what you"
	cont "want to do."
	done

GoldenrodGameCornerBackroomGymGuideAfterText:
	text "Wow, you beat them"
	line "all!"

	para "You're either very"
	line "lucky, very skill-"
	cont "ed, or both!"
	done

GamblerLuckySeenText:
	text "I'm gonna win big!"
	done

GamblerLuckyBeatenText:
	text "I lost big!"
	done

GamblerLuckyAfterBattleText:
	text "You won big!"
	done

GamblerHarveySeenText:
	text "Life's nothing but"
	line "a coin flip."
	done

GamblerHarveyBeatenText:
	text "That coin came up"
	line "tails for me."
	done

GamblerHarveyAfterBattleText:
	text "Don't lose your"
	line "head."
	done

GamblerAceSeenText:
	text "One good roll is"
	line "all I need!"
	done

GamblerAceBeatenText:
	text "Snake eyes!"
	done

GamblerAceAfterBattleText:
	text "That's the way the"
	line "dice tumble."
	done

GamblerHuckSeenText:
	text "Lady Luck will"
	line "smile on me"
	cont "tonight!"
	done

GamblerHuckBeatenText:
	text "Lady Luck, why"
	line "have you forsaken"
	cont "me?!"
	done

GamblerHuckAfterBattleText:
	text "I don't think Lady"
	line "Luck is on my"
	cont "side."
	done

GamblerThoreauSeenText:
	text "It's my lucky day!"
	done

GamblerThoreauBeatenText:
	text "Don't I get a"
	line "saving throw?"
	done

GamblerThoreauAfterBattleText:
	text "It wasn't my lucky"
	line "day after all."
	done

GamblerPTSeenText:
	text "It's all about"
	line "showmanship!"
	done

GamblerPTBeatenText:
	text "Can I convince you"
	line "that I won?"
	done

GamblerPTAfterBattleText:
	text "Your skill over-"
	line "powered my show-"
	cont "manship."
	done

GamblerLiuHaiSeenText:
	text "…"

	para "Some say I'm the"
	line "luckiest one here."

	para "Play your hand and"
	line "we'll find out."
	done

GamblerLiuHaiBeatenText:
	text "I fold."
	done

GamblerLiuHaiAfterBattleText:
	text "The luck of the"
	line "draw favors you,"
	cont "it seems…"
	done

GamblersNoCoinCaseText:
	text "Huh? I can't pay"
	line "you if you don't"
	cont "have a COIN CASE."

	para "Come back with one"
	line "to collect your"
	cont "winnings."
	done

Gamblers500CoinsString:
	db "500 COINS@"

Gamblers2000CoinsString:
	db "2000 COINS@"

GamblersCoinCaseFullText:
	text "Huh? You don't have"
	line "enough room in"

	para "your COIN CASE for"
	line "these winnings."
	done

GoldenrodGameCornerBackroom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_GAME_CORNER, 3
	warp_event  3,  7, GOLDENROD_GAME_CORNER, 3

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, GoldenrodGameCornerBackroomTrashcan
	bg_event  9,  7, BGEVENT_READ, GoldenrodGameCornerBackroomTrashcan

	def_object_events
	object_event  1,  6, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerBackroomGymGuideScript, -1
	object_event  1,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerGamblerLucky, -1
	object_event  2,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerGamblerHarvey, -1
	object_event  4,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerGamblerAce, -1
	object_event  5,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerGamblerHuck, -1
	object_event  7,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerGamblerThoreau, -1
	object_event  8,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TrainerGamblerPT, -1
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerGamblerLiuHai, -1
