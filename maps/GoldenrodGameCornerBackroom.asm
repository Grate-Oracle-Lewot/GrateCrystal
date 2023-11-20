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

TrainerGamblerLucky:
	trainer GAMBLER, LUCKY, EVENT_BEAT_GAMBLER_LUCKY, GamblerLuckySeenText, GamblerLuckyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerLuckyAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerHarvey:
	trainer GAMBLER, HARVEY, EVENT_BEAT_GAMBLER_HARVEY, GamblerHarveySeenText, GamblerHarveyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerHarveyAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerAce:
	trainer GAMBLER, ACE, EVENT_BEAT_GAMBLER_ACE, GamblerAceSeenText, GamblerAceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerAceAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerHuck:
	trainer GAMBLER, HUCK, EVENT_BEAT_GAMBLER_HUCK, GamblerHuckSeenText, GamblerHuckBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerHuckAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerThoreau:
	trainer GAMBLER, THOREAU, EVENT_BEAT_GAMBLER_THOREAU, GamblerThoreauSeenText, GamblerThoreauBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerThoreauAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerPT:
	trainer GAMBLER, P_T, EVENT_BEAT_GAMBLER_P_T, GamblerPTSeenText, GamblerPTBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GamblerPTAfterBattleText
	waitbutton
	closetext
	end

TrainerGamblerLiuHai:
	trainer GAMBLER, LIU_HAI, EVENT_BEAT_GAMBLER_LIU_HAI, GamblerLiuHaiSeenText, GamblerLiuHaiBeatenText, 0, .Script

.Script:
	opentext
	checkevent EVENT_GOT_SURF_PIKACHU_DOLL_FROM_GAMBLER
	iftrue .GotSurfPikachuDoll
	writetext GamblerLiuHaiSurfPikachuText
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	playsound SFX_GET_EGG_UNUSED
	waitsfx
	writetext GamblerLiuHaiDecorationText
	setevent EVENT_GOT_SURF_PIKACHU_DOLL_FROM_GAMBLER
	sjump .LiuHaiEnd

.GotSurfPikachuDoll:
	writetext GamblerLiuHaiAfterBattleText
.LiuHaiEnd:
	waitbutton
	closetext
	end

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

GamblerLiuHaiSurfPikachuText:
	text "The luck of the"
	line "draw favors you,"
	cont "it seems…"

	para "You deserve this."

	para "<PLAYER> received"
	line "SURF PIKACHU DOLL!"
	done

GamblerLiuHaiDecorationText:
	text "<PLAYER> sent the"
	line "decoration home."
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
	object_event  1,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, TrainerGamblerLucky, -1
	object_event  2,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, TrainerGamblerHarvey, -1
	object_event  4,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, TrainerGamblerAce, -1
	object_event  5,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, TrainerGamblerHuck, -1
	object_event  7,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, TrainerGamblerThoreau, -1
	object_event  8,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 0, TrainerGamblerPT, -1
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerGamblerLiuHai, -1
