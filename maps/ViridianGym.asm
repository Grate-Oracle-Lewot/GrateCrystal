	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_COOLTRAINER_F
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_DARKROOM_GAUNTLET
	setmapscene CIANWOOD_DARKROOM, SCENE_CIANWOODDARKROOM_RESET_GAUNTLET
	setevent EVENT_BEAT_BLUE
	setevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	setflag ENGINE_MEWTWO_RADIO
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	promptbutton
.FightDone:
	checkevent EVENT_GOT_TM_HYPER_BEAM_FROM_BLUE
	iftrue .GotHyperBeamTM
	writetext LeaderBlueGiveHyperBeamTMText
	promptbutton
	verbosegiveitem TM_HYPER_BEAM
	iffalse .NoRoomForHyperBeamTM
	setevent EVENT_GOT_TM_HYPER_BEAM_FROM_BLUE
	writetext LeaderBlueExplainHyperBeamTMText
	setevent EVENT_DECO_CARPET_2
	playsound SFX_2ND_PLACE
	waitsfx
	writetext LeaderBlueDecorationText
	waitbutton
	closetext
	end

.GotHyperBeamTM:
	writetext LeaderBlueEpilogueText
	waitbutton
.NoRoomForHyperBeamTM
	closetext
	end

TrainerCooltrainerfAzure:
	trainer COOLTRAINERF, AZURE, EVENT_BEAT_COOLTRAINER_F_AZURE, CooltrainerfAzureSeenText, CooltrainerfAzureBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext CooltrainerfAzureAfterBattleText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO"
	line "CHAMP?"
	done

LeaderBlueWinText:
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "EARTHBADGE!"
	done

LeaderBlueAfterText:
	text "BLUE: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBlueGiveHyperBeamTMText:
	text "Here, take your"
	line "TM."
	done

LeaderBlueExplainHyperBeamTMText:
	text "BLUE: It's HYPER"
	line "BEAM."

	para "Yeah, I know you"
	line "probably already"

	para "have a copy, but"
	line "it's what you get."

	para "If you want a good"
	line "place to train,"

	para "ask Gramps if he"
	line "can let you into"
	cont "MT.SILVER."

	para "Only the strongest"
	line "trainers go there."

	para "Oh… and I guess"
	line "you get this too."

	para "<PLAYER> received"
	line "BLUE CARPET!"
	done

LeaderBlueDecorationText:
	text "<PLAYER> sent the"
	line "decoration home."

	para "BLUE: It matches"
	line "my name, see?"
	done

LeaderBlueEpilogueText:
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

CooltrainerfAzureSeenText:
	text "BLUE, BLUE, he's"
	line "our man! If he"

	para "can't do it, no"
	line "one can!"
	done

CooltrainerfAzureBeatenText:
	text "Two, four, six,"
	line "eight, who did you"
	cont "humiliate? Me!"
	done

CooltrainerfAzureAfterBattleText:
	text "I can't help but"
	line "cheer for BLUE!"
	done

ViridianGymGuideText:
	text "Yo, CHAMP in"
	line "making!"

	para "The GYM LEADER"
	line "here is PROF.OAK's"
	cont "grandson!"

	para "He doesn't limit"
	line "himself to one"
	cont "type of #MON."

	para "You'll have to be"
	line "flexible to win."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuideWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  3,  1, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event 10,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfAzure, EVENT_VIRIDIAN_GYM_BLUE
	object_event 16, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
