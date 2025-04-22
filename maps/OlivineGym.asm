	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_ROCKER
	const OLIVINEGYM_POKEFAN_F
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	setevent EVENT_DECO_SHELLDER_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext Jasmine_ShellderDollText
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerGuitaristJules:
	trainer GUITARIST, JULES, EVENT_BEAT_GUITARIST_JULES, GuitaristJulesSeenText, GuitaristJulesBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext GuitaristJulesAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfVi:
	trainer POKEFANF, VI, EVENT_BEAT_POKEFANF_VI, PokefanfViSeenText, PokefanfViBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokefanfViAfterBattleText
	waitbutton
	closetext
	end

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Thank you for"
	line "your help at the"
	cont "LIGHTHOUSE…"

	para "But this is dif-"
	line "ferent. Please"

	para "allow me to intro-"
	line "duce myself."

	para "I am JASMINE, a"
	line "GYM LEADER. I use"
	cont "the steel-type."

	para "…Do you know about"
	line "the steel-type?"

	para "It's a type that"
	line "was only recently"
	cont "discovered."

	para "…Um… May I begin?"
	done

Jasmine_BetterTrainer:
	text "…You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "MINERALBADGE!"
	done

Jasmine_BadgeSpeech:
	text "With it, #MON"
	line "up to <EVO_LV>50 will"
	cont "obey you…"

	para "Um… Please take"
	line "this too…"
	done

Jasmine_IronTailSpeech:
	text "…You could use"
	line "that TM to teach"
	cont "IRON TAIL."

	para "And… take this."

	para "<PLAYER> received"
	line "SHELLDER DOLL!"
	done

Jasmine_ShellderDollText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

Jasmine_GoodLuck:
	text "Um… I don't know"
	line "how to say this,"
	cont "but good luck…"
	done

GuitaristJulesSeenText:
	text "Dude! You rock!"
	line "You got our GYM"
	cont "LEADER back!"

	para "But that doesn't"
	line "mean we'll go easy"
	cont "on you!"
	done

GuitaristJulesBeatenText:
	text "FLAREON my WAILORD"
	line "son."
	done

GuitaristJulesAfterBattleText:
	text "That was a wicked"
	line "battle, dude!"

	para "Your skills are"
	line "the real deal!"
	done

PokefanfViSeenText:
	text "Steel #MON can"
	line "be cute too, you"
	cont "know!"
	done

PokefanfViBeatenText:
	text "Aww…"
	done

PokefanfViAfterBattleText:
	text "Steel can seem"
	line "overwhelming, but"

	para "if you learn its"
	line "weaknesses, it's"

	para "not so hard to"
	line "deal with."
	done

OlivineGymGuideText:
	text "JASMINE uses the"
	line "steel-type."

	para "It resists almost"
	line "everything!"

	para "But fighting,"
	line "ground, and fire"

	para "are all super"
	line "effective."

	para "Steel is good ag-"
	line "ainst rock, ice,"
	cont "and fairy."

	para "Poison won't do"
	line "anything at all to"
	cont "steel!"
	done

OlivineGymGuideWinText:
	text "That was awesome."
	done

OlivineGymGuidePreText:
	text "JASMINE, the GYM"
	line "LEADER, is at the"
	cont "LIGHTHOUSE."

	para "She's been tending"
	line "to a sick #MON."

	para "A strong trainer"
	line "has to be compas-"
	cont "sionate."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 41, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event 10, 39, BGEVENT_READ, OlivineGymStatue
	bg_event 13, 39, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event 14,  7, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event 10, 23, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristJules, EVENT_OLIVINE_GYM_JASMINE
	object_event 15, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanfVi, EVENT_OLIVINE_GYM_JASMINE
	object_event 14, 39, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
