ROUTE43GATE_TOLL EQU 1000

	object_const_def
	const ROUTE43GATE_OFFICER
	const ROUTE43GATE_ROCKET1
	const ROUTE43GATE_ROCKET2

Route43Gate_MapScripts:
	def_scene_scripts
	scene_script .RocketShakedown ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.RocketShakedown:
	sdefer .RocketTakeover
.DummyScene:
	end

.RocketTakeover:
	playmusic MUSIC_ROCKET_ENCOUNTER
	readvar VAR_FACING
	ifequal DOWN, RocketScript_Southbound
	ifequal UP, RocketScript_Northbound
	setscene SCENE_FINISHED
	end

RocketScript_Southbound:
	applymovement PLAYER, PlayerStepsIn
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET2, 15
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_BlocksYouSouth
	turnobject ROUTE43GATE_ROCKET1, UP
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET1, 15
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_BlocksYouSouth
	opentext
	writetext RocketText_TollFee
	promptbutton
	checkmoney YOUR_MONEY, ROUTE43GATE_TOLL - 1
	ifequal HAVE_MORE, RocketScript_TollSouth
	sjump RocketScript_YoureBrokeSouth

RocketScript_TollSouth:
	takemoney YOUR_MONEY, ROUTE43GATE_TOLL
	writetext RocketText_ThankYou
	sjump RocketScript_ShakeDownSouth

RocketScript_YoureBrokeSouth:
	takemoney YOUR_MONEY, ROUTE43GATE_TOLL
	writetext RocketText_AllYouGot
	; fallthrough

RocketScript_ShakeDownSouth:
	promptbutton
	closetext
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_LetsYouPassSouth
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_LetsYouPassSouth
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

RocketScript_Northbound:
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET1, 15
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_BlocksYouNorth
	turnobject ROUTE43GATE_ROCKET2, DOWN
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET2, 15
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_BlocksYouNorth
	opentext
	writetext RocketText_TollFee
	promptbutton
	checkmoney YOUR_MONEY, ROUTE43GATE_TOLL - 1
	ifequal HAVE_MORE, RocketScript_TollNorth
	sjump RocketScript_YoureBrokeNorth

RocketScript_TollNorth:
	takemoney YOUR_MONEY, ROUTE43GATE_TOLL
	writetext RocketText_ThankYou
	sjump RocketScript_ShakeDownNorth

RocketScript_YoureBrokeNorth:
	takemoney YOUR_MONEY, ROUTE43GATE_TOLL
	writetext RocketText_AllYouGot
	; fallthrough

RocketScript_ShakeDownNorth:
	promptbutton
	closetext
	applymovement ROUTE43GATE_ROCKET2, Rocket2Script_LetsYouPassNorth
	applymovement ROUTE43GATE_ROCKET1, Rocket1Script_LetsYouPassNorth
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

RocketScript_MakingABundle:
	jumptextfaceplayer RocketText_MakingABundle

OfficerScript_GuardWithSludgeBomb:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue .GotSludgeBomb
	writetext OfficerText_FoundTM
	promptbutton
	verbosegiveitem TM_SLUDGE_BOMB, 5
	iffalse .NoRoomForSludgeBomb
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	closetext
	end

.GotSludgeBomb:
	writetext OfficerText_AvoidGrass
	waitbutton
.NoRoomForSludgeBomb:
	closetext
	end

PlayerStepsIn:
	step DOWN
	step_end

Rocket1Script_BlocksYouSouth:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	turn_head UP
	step_end

Rocket1Script_LetsYouPassSouth:
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	step_end

Rocket1Script_BlocksYouNorth:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	turn_head DOWN
	step_end

Rocket1Script_LetsYouPassNorth:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

Rocket2Script_BlocksYouSouth:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

Rocket2Script_LetsYouPassSouth:
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	turn_head UP
	step_end

Rocket2Script_BlocksYouNorth:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

Rocket2Script_LetsYouPassNorth:
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

RocketText_TollFee:
	text "Hold it there,"
	line "kiddo!"

	para "The toll is ¥{d:ROUTE43GATE_TOLL}"
	line "to go through."
	done

RocketText_ThankYou:
	text "Thank you very"
	line "much!"
	done

RocketText_AllYouGot:
	text "Then pay what you"
	line "have, please."
	done

RocketText_MakingABundle:
	text "He-he-he. We're"
	line "making a bundle."

	para "Everyone wants to"
	line "see what's going"

	para "on up at the LAKE"
	line "OF RAGE."
	done

OfficerText_FoundTM:
	text "I got chased from"
	line "my post by these"
	cont "thugs in black."

	para "They left these"
	line "TMs behind."

	para "They make me un-"
	line "comfortable."

	para "Could you take"
	cont "them away?"
	done

OfficerText_AvoidGrass:
	text "Use this gate to"
	line "avoid walking in"
	cont "the grass."
	done

Route43Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_43, 4
	warp_event  5,  0, ROUTE_43, 5
	warp_event  4,  7, ROUTE_43, 3
	warp_event  5,  7, ROUTE_43, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OfficerScript_GuardWithSludgeBomb, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  2,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketScript_MakingABundle, EVENT_ROUTE_43_GATE_ROCKETS
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketScript_MakingABundle, EVENT_ROUTE_43_GATE_ROCKETS
