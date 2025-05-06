	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_CHERRYGROVECITY_NOTHING
	scene_script .DummyScene ; SCENE_CHERRYGROVECITY_MEET_RIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .NoBalls
	writetext GuideGentMartHasBallsText
	sjump .DoneWithBalls
.NoBalls
	writetext GuideGentMartNoBallsText
.DoneWithBalls
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveSilverSceneSouth:
	moveobject CHERRYGROVECITY_SILVER, 39, 7
CherrygroveSilverSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_QUESTION, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_SILVER
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
if DEF(_LETS_GO_STARTERS)
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChosePikachu
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	sjump .FinishBattle

.PlayerChosePikachu:
	checkevent EVENT_LOST_FIRST_RIVAL_BATTLE
	iftrue .Flareon
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	sjump .FinishBattle

.Flareon:
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
else
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChoseChikorita
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .PlayerChoseCyndaquil
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	sjump .FinishBattle

.PlayerChoseChikorita:
if DEF(_HITMON_STARTERS) || DEF(_NIDORAN_STARTERS) || DEF(_CATTLE_STARTERS) || DEF(_MEW_STARTERS) || DEF(_HO_OH_LUGIA) || DEF(_CELEBI_STARTERS)
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
else
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
endc
	sjump .FinishBattle

.PlayerChoseCyndaquil:
if DEF(_HITMON_STARTERS) || DEF(_NIDORAN_STARTERS) || DEF(_CATTLE_STARTERS) || DEF(_MEW_STARTERS) || DEF(_HO_OH_LUGIA) || DEF(_CELEBI_STARTERS)
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
else
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
endc endc
.FinishBattle:
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	sjump .FinishRival

.AfterYourDefeat:
	setevent EVENT_LOST_FIRST_RIVAL_BATTLE
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
.FinishRival:
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER
	setscene SCENE_CHERRYGROVECITY_NOTHING
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	jumptextfaceplayer CherrygroveTeacherText

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd PokecenterSignScript

CherrygroveCityMartSign:
	jumpstd MartSignScript

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "You're a rookie"
	line "trainer, aren't"
	cont "you? I can tell!"

	para "That's OK! Every-"
	line "one is a rookie"
	cont "at some point!"

	para "If you'd like, I"
	line "can teach you a"
	cont "few things."
	done

GuideGentTourText1:
	text "OK, then!"
	line "Follow me!"
	done

GuideGentPokecenterText:
	text "This is a #MON"
	line "CENTER. They heal"

	para "your #MON in no"
	line "time at all."

	para "You'll be relying"
	line "on them a lot, so"

	para "you'd better get"
	line "familiar."
	done

GuideGentMartNoBallsText:
	text "This is a #MON"
	line "MART, or #MART."

	para "They sell useful"
	line "items, although"

	para "they're currently"
	line "waiting on a fresh"

	para "shipment of #"
	line "BALLS."
	done

GuideGentMartHasBallsText:
	text "This is a #MON"
	line "MART, or #MART."

	para "They sell useful"
	line "items, such as"

	para "BALLS for catching"
	line "#MON."
	done

GuideGentRoute30Text:
	text "ROUTE 30 is out"
	line "this way."

	para "Trainers will be"
	line "battling their"

	para "prized #MON"
	line "there."
	done

GuideGentSeaText:
	text "This is the sea,"
	line "as you can see."

	para "Some #MON are"
	line "found only in"
	cont "water."
	done

GuideGentGiftText:
	text "Here…"

	para "It's my house!"
	line "Thanks for your"
	cont "company."

	para "Let me give you a"
	line "small gift."
	done

GotMapCardText:
	text "<PLAYER>'s #GEAR"
	line "now has a MAP!"
	done

GuideGentPokegearText:
	text "#GEAR becomes"
	line "more useful as you"
	cont "add CARDS."

	para "I wish you luck on"
	line "your journey!"
	done

GuideGentNoText:
	text "Oh… It's something"
	line "I enjoy doing…"
	done

CherrygroveRivalText_Seen:
	text "YOU HAD GAINED"
	line "MONATERS FROM"
	cont "GRADUATE SCHOOL,"
	cont "BUT YOU ARE"
	cont "SO WEAK,"
	cont "IT'S A GREAT PITY."
	cont "WHAT, WHAT DO"
	cont "YOU SAY ME?."
	cont "YOU DON'T KNOW,"
	cont "THERE IS NOTHING"
	cont "TO DO."

	para "I HAVE GOOD"

	cont "MONSTER,WHAT'S"
	cont "THE MATTER"
	cont "I TELL YOU."
	done

SilverCherrygroveWinText:
	text "ARE YOU GLAD"
	line "AFTER WINNING?"
	done

CherrygroveRivalText_YouLost:
	text "I AM. . ."
	line "I AM A MONSTER"
	cont "COACH,"
	cont "THE FIRST MANKIND"
	cont "ALL OVER THE WORLD."
	done

SilverCherrygroveLossText:
	text "IT IS WASTE TIME"
	done

CherrygroveRivalText_YouWon:
	text "I AM. . ."
	line "I AM A MONSTER"
	cont "COACH,"
	cont "THE FIRST MANKIND"
	cont "ALL OVER THE WORLD."
	done

CherrygroveTeacherText:
	text "When you're with"
	line "#MON, going"
	cont "anywhere is fun."
	done

CherrygroveYoungsterText_NoPokedex:
	text "MR.#MON's house"
	line "is still farther"
	cont "up ahead."
	done

CherrygroveYoungsterText_HavePokedex:
	text "Fairy #MON are"
	line "cute, so they must"
	cont "be harmless…"

	para "WRONG!"

	para "They're SO cute,"
	line "your #MON might"

	para "get infatuated by"
	line "making contact!"

	para "But it won't happen"
	line "to dark types…"
	cont "They're too wily."
	done

MysticWaterGuyTextBefore:
	text "I fished an item"
	line "out of the water,"

	para "but I don't need"
	line "it."

	para "Do you want it?"
	done

MysticWaterGuyTextAfter:
	text "They say the HOENN"
	line "region has the"
	cont "most water."
	done

CherrygroveCitySignText:
	text "CHERRYGROVE CITY"

	para "The City of Cute,"
	line "Fragrant Flowers"
	done

GuideGentsHouseSignText:
	text "NOTICE"

	para "The guy who lives"
	line "here will talk"
	cont "your ear off."
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneSouth

	def_bg_events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
