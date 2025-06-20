	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_COOLTRAINER_F
	const VIRIDIANGYM_COOLTRAINER_M
	const VIRIDIANGYM_BEAUTY
	const VIRIDIANGYM_GENTLEMAN
	const VIRIDIANGYM_ROCKER
	const VIRIDIANGYM_SUPER_NERD
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
	verbosegiveitem TM_HYPER_BEAM, 5
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

TrainerCooltrainermTeal:
	trainer COOLTRAINERM, TEAL, EVENT_BEAT_COOLTRAINERM_TEAL, CooltrainermTealSeenText, CooltrainermTealBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext CooltrainermTealAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyBeryl:
	trainer BEAUTY, BERYL, EVENT_BEAT_BEAUTY_BERYL, BeautyBerylSeenText, BeautyBerylBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyBerylAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanNavy:
	trainer GENTLEMAN, NAVY, EVENT_BEAT_GENTLEMAN_NAVY, GentlemanNavySeenText, GentlemanNavyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext GentlemanNavyAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristCobalt:
	trainer GUITARIST, COBALT, EVENT_BEAT_GUITARIST_COBALT, GuitaristCobaltSeenText, GuitaristCobaltBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext GuitaristCobaltAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerCyan:
	trainer JUGGLER, CYAN, EVENT_BEAT_JUGGLER_CYAN, JugglerCyanSeenText, JugglerCyanBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext JugglerCyanAfterBattleText
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
	line "TMs."
	done

LeaderBlueExplainHyperBeamTMText:
	text "BLUE: It's HYPER"
	line "BEAM."

	para "You probably don't"
	line "need me to tell"
	cont "you what it does."

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

CooltrainermTealSeenText:
	text "This GYM's the best"
	line "of the best!"
	done

CooltrainermTealBeatenText:
	text "How?!"
	done

CooltrainermTealAfterBattleText:
	text "You're the best of"
	line "the best!"
	done

BeautyBerylSeenText:
	text "You must be nice"
	line "and burly to"
	cont "challenge us!"
	done

BeautyBerylBeatenText:
	text "Mmmmm, yes…"
	done

BeautyBerylAfterBattleText:
	text "You're a fine spec-"
	line "imen indeed!"
	done

GentlemanNavySeenText:
	text "I'm afraid I've"
	line "been contracted to"
	cont "battle you."
	done

GentlemanNavyBeatenText:
	text "I say!"
	done

GentlemanNavyAfterBattleText:
	text "When's tea time?"
	done

GuitaristCobaltSeenText:
	text "Feel the rhythm!"
	done

GuitaristCobaltBeatenText:
	text "Yowza zowza!"
	done

GuitaristCobaltAfterBattleText:
	text "Just go with the"
	line "flow, man."
	done

JugglerCyanSeenText:
	text "Which way's which?"
	done

JugglerCyanBeatenText:
	text "Done and done."
	done

JugglerCyanAfterBattleText:
	text "Do you know how to"
	line "juggle?"
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
	warp_event 16, 17, VIRIDIAN_CITY, 1
	warp_event 17, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event 15, 15, BGEVENT_READ, ViridianGymStatue
	bg_event 18, 15, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  3,  1, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event 10,  1, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAzure, EVENT_VIRIDIAN_GYM_BLUE
	object_event 13,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermTeal, EVENT_VIRIDIAN_GYM_BLUE
	object_event  3,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyBeryl, EVENT_VIRIDIAN_GYM_BLUE
	object_event  6,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanNavy, EVENT_VIRIDIAN_GYM_BLUE
	object_event  2, 16, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGuitaristCobalt, EVENT_VIRIDIAN_GYM_BLUE
	object_event 10,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerCyan, EVENT_VIRIDIAN_GYM_BLUE
	object_event 16, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
