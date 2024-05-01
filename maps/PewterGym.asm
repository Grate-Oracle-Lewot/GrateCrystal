	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUIDE
	const PEWTERGYM_ROCK1
	const PEWTERGYM_ROCK2
	const PEWTERGYM_ROCK3
	const PEWTERGYM_ROCK4
	const PEWTERGYM_ROCK5
	const PEWTERGYM_ROCK6

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_DARKROOM_GAUNTLET
	setmapscene CIANWOOD_DARKROOM, SCENE_CIANWOODDARKROOM_RESET_GAUNTLET
	setevent EVENT_BEAT_BROCK
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	promptbutton
.FightDone:
	checkevent EVENT_GOT_TM_EARTHQUAKE_FROM_BROCK
	iftrue .GotEarthquakeTM
	writetext BrockGiveEarthquakeTMText
	promptbutton
	verbosegiveitem TM_EARTHQUAKE
	iffalse .NoRoomForEarthquakeTM
	setevent EVENT_GOT_TM_EARTHQUAKE_FROM_BROCK
	writetext BrockExplainEarthquakeTMText
	setevent EVENT_DECO_BIG_ONIX_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext BrockBigOnixDollText
	waitbutton
	closetext
	end

.GotEarthquakeTM:
	writetext BrockFightDoneText
	waitbutton
.NoRoomForEarthquakeTM:
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetext PewterGymGuideText
	waitbutton
	closetext
	end

.PewterGymGuideWinScript:
	writetext PewterGymGuideWinText
	waitbutton
	closetext
	end

PewterGymRock:
	jumpstd SmashRockScript

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "BROCK: Wow, it's"
	line "not often that we"

	para "get a challenger"
	line "from JOHTO."

	para "I'm BROCK, the"
	line "PEWTER GYM LEADER."

	para "I'm an expert on"
	line "rock-type #MON."

	para "My #MON are im-"
	line "pervious to most"

	para "physical attacks."
	line "You'll have a hard"

	para "time inflicting"
	line "any damage."

	para "Come on!"
	done

BrockWinLossText:
	text "BROCK: Your #-"
	line "MON's powerful at-"
	cont "tacks overcame my"
	cont "rock-hard defense…"

	para "You're stronger"
	line "than I expected…"

	para "Go ahead--take"
	line "this BADGE."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> received"
	line "BOULDERBADGE!"
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."
	done

BrockGiveEarthquakeTMText:
	text "BROCK: You should"
	line "take this TM, too."
	done

BrockExplainEarthquakeTMText:
	text "BROCK: It's"
	line "EARTHQUAKE."

	para "Did you know it"
	line "does double damage"

	para "to an enemy who's"
	line "underground from"
	cont "using DIG?"

	para "And, don't forget"
	line "to take this!"

	para "<PLAYER> received"
	line "BIG ONIX DOLL!"
	done

BrockBigOnixDollText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

BrockFightDoneText:
	text "BROCK: The world"
	line "is huge. There are"

	para "still many strong"
	line "trainers like you."

	para "Just wait and see."
	line "I'm going to be-"
	cont "come a lot strong-"
	cont "er too."
	done

CamperJerrySeenText:
	text "The trainers of"
	line "this GYM use rock-"
	cont "type #MON."

	para "The rock-type has"
	line "high DEFENSE."

	para "Battles could end"
	line "up going a long"

	para "time. Are you"
	line "ready for this?"
	done

CamperJerryBeatenText:
	text "I have to win"
	line "these battles…"
	done

CamperJerryAfterBattleText:
	text "Hey, you! Trainer"
	line "from JOHTO! BROCK"

	para "is tough. He'll"
	line "punish you if you"

	para "don't take him"
	line "seriously."
	done

PewterGymGuideText:
	text "Yo! CHAMP in"
	line "making! BROCK"

	para "uses rock #MON."
	line "They're weak to"

	para "grass, fighting,"
	line "water, steel, and"
	cont "ground."

	para "They resist fire,"
	line "poison, flying and"
	cont "normal-type moves."

	para "Rock moves will do"
	line "extra damage to"
	cont "bug or ice-type"
	cont "#MON."
	done

PewterGymGuideWinText:
	text "Yo! CHAMP in"
	line "making! That GYM"

	para "didn't give you"
	line "much trouble."

	para "The way you took"
	line "charge was really"

	para "inspiring. I mean"
	line "that seriously."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  3,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
	object_event  4,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymRock, -1
	object_event  5,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymRock, -1
	object_event  1,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymRock, -1
	object_event  8,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymRock, -1
	object_event  1,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymRock, -1
	object_event  8,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymRock, -1
