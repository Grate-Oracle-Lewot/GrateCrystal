	object_const_def
	const MOUNTMOON1F_BUG_CATCHER
	const MOUNTMOON1F_LASS
	const MOUNTMOON1F_POKEFAN_M
	const MOUNTMOON1F_COOLTRAINER_M
	const MOUNTMOON1F_COOLTRAINER_F
	const MOUNTMOON_SILVER

MountMoon1F_MapScripts:
	def_scene_scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.RivalEncounter:
	sdefer .RivalBattle
	end

.DummyScene:
	end

.RivalBattle:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, 0
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, 0
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, 0
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

TrainerBugCatcherLouie:
	trainer BUG_CATCHER, LOUIE, EVENT_BEAT_BUG_CATCHER_LOUIE, BugCatcherLouieSeenText, BugCatcherLouieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherLouieAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLuna:
	trainer LASS, LUNA, EVENT_BEAT_LASS_LUNA, LassLunaSeenText, LassLunaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LassLunaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerHouston:
	trainer HIKER, HOUSTON, EVENT_BEAT_HIKER_HOUSTON, HikerHoustonSeenText, HikerHoustonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext HikerHoustonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBuzz:
	trainer COOLTRAINERM, BUZZ, EVENT_BEAT_COOLTRAINERM_BUZZ, CooltrainermBuzzSeenText, CooltrainermBuzzBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainermBuzzAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfStella:
	trainer COOLTRAINERF, STELLA, EVENT_BEAT_COOLTRAINERF_STELLA, CooltrainerfStellaSeenText, CooltrainerfStellaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerfStellaAfterBattleText
	waitbutton
	closetext
	end

MountMoon1FHiddenMoonBall:
	hiddenitem MOON_BALL, EVENT_MOUNT_MOON_1F_HIDDEN_MOON_BALL

MountMoon1FHiddenStardust:
	hiddenitem STARDUST, EVENT_MOUNT_MOON_1F_HIDDEN_STARDUST

MountMoonSilverMovementBefore:
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonSilverMovementAfter:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MountMoonSilverTextBefore:
	text "DON'T MEET FOR"
	line "A LONG TIME."
	cont "SINCE I WAS"
	cont "DEFEATED BY YOU,"
	cont "I KNEW MY LACK,"
	cont "BUT NOT WHERE"
	cont "IT IS."
	cont "I THOUGHT IT A"
	cont "LONG TIME WITH"
	cont "THEM,"
	cont "FINALLY I FOUND"
	cont "IT.DO YOU WANT"
	cont "TO KNOW?"

	para "I LET YOU"

	para " "
	line "SEE NOW"
	done

MountMoonSilverTextWin:
	text "THE AIM OF"
	line "TRAIN THE ELFS IS"
	cont "TO EXERT THEIR"
	cont "STRENGTH AT MOST,"
	cont "IT SEEM THAT THE"
	cont "TEACHING IS"
	cont "NOT ENOUGH"
	done

MountMoonSilverTextAfter:
	text "ACTUALLY I LOSE,"
	line "I ADMIT IT."
	cont "BUT DON'T FORGET"
	cont "IT SIMPLY."

	para "ONE DAY I WILL"

	para " "
	line "LET YOU KNOW"
	cont "I'M THE STRONGEST"
	cont "COACH,THE FELLOWS"
	cont "WILL CONSORT WITH"
	cont "ME.LISTEN,ONE"
	cont "DAY I WILL BEAT"
	cont "YOU DOWN,"
	cont "AND LET YOU"
	cont "KNOW MY STRENGTH"
	done

BugCatcherLouieSeenText:
	text "I'm the king of"
	line "bugs!"
	done

BugCatcherLouieBeatenText:
	text "Long live the"
	line "king."
	done

BugCatcherLouieAfterBattleText:
	text "I'm hungry…"
	done

LassLunaSeenText:
	text "I'll reduce you to"
	line "a crater!"
	done

LassLunaBeatenText:
	text "Never mind…"
	done

LassLunaAfterBattleText:
	text "I'll work on my"
	line "smack talk."
	done

HikerHoustonSeenText:
	text "This cave… is this"
	line "what the surface"

	para "of the moon is"
	line "like?"
	done

HikerHoustonBeatenText:
	text "I got distracted!"
	done

HikerHoustonAfterBattleText:
	text "For hiking, you"
	line "need a good stick."
	done

CooltrainermBuzzSeenText:
	text "This is one small"
	line "step for man…"

	para "One giant leap for"
	line "#MON!"
	done

CooltrainermBuzzBeatenText:
	text "I needed a bigger"
	line "leap."
	done

CooltrainermBuzzAfterBattleText:
	text "I'll follow my"
	line "footprints to find"
	cont "my way out."
	done

CooltrainerfStellaSeenText:
	text "I have a rare and"
	line "mysterious #-"
	cont "MON!"
	done

CooltrainerfStellaBeatenText:
	text "Hmm… didn't cut it."
	done

CooltrainerfStellaAfterBattleText:
	text "There must be a"
	line "rarer #MON than"
	cont "CLEFAIRY here…"
	done

MountMoon1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 33, ROUTE_3, 1
	warp_event 25, 15, MOUNT_MOON_B1F, 1
	warp_event 17, 11, MOUNT_MOON_B1F, 2
	warp_event  5,  5, MOUNT_MOON_B1F, 3

	def_coord_events

	def_bg_events
	bg_event  4, 27, BGEVENT_ITEM, MountMoon1FHiddenMoonBall
	bg_event 20, 33, BGEVENT_ITEM, MountMoon1FHiddenStardust

	def_object_events
	object_event  5, 22, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherLouie, -1
	object_event 30,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLuna, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerHouston, -1
	object_event 30, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermBuzz, -1
	object_event 24, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfStella, -1
	object_event 15, 29, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
