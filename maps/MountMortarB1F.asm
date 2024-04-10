	object_const_def
	const MOUNTMORTARB1F_POKE_BALL1
	const MOUNTMORTARB1F_POKE_BALL2
	const MOUNTMORTARB1F_BOULDER
	const MOUNTMORTARB1F_KIYO
	const MOUNTMORTARB1F_POKE_BALL3
	const MOUNTMORTARB1F_POKE_BALL4
	const MOUNTMORTARB1F_POKE_BALL5
	const MOUNTMORTARB1F_POKE_BALL6
	const MOUNTMORTARB1F_SABRINA

MountMortarB1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_MOUNTMORTARB1F_EARLY
	scene_script .DummyScene ; SCENE_MOUNTMORTARB1F_SABRINA
	scene_script .DummyScene ; SCENE_MOUNTMORTARB1F_NOTHING

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Sabrina

.DummyScene:
	end

.Sabrina:
	checkevent EVENT_SABRINA_IN_MOUNT_MORTAR
	iftrue .Disappear
	checkscene
	ifequal SCENE_MOUNTMORTARB1F_SABRINA, .Appear
.Disappear:
	disappear MOUNTMORTARB1F_SABRINA
	end

.Appear:
	appear MOUNTMORTARB1F_SABRINA
	end

MountMortarB1FSabrinaScene:
	checkevent EVENT_SABRINA_IN_MOUNT_MORTAR
	iftrue .AlreadyHappened
	turnobject PLAYER, RIGHT
	opentext
	writetext MountMortarB1FSabrinaText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement MOUNTMORTARB1F_SABRINA, MountMortarB1FSabrinaTeleport
	disappear MOUNTMORTARB1F_SABRINA
.AlreadyHappened:
	setscene SCENE_MOUNTMORTARB1F_NOTHING
	end

MountMortarB1FKiyoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogue
	checkevent EVENT_BEAT_BLACKBELT_KIYO
	iftrue .BeatKiyo
	writetext MountMortarB1FKiyoIntroText
	waitbutton
	closetext
	winlosstext MountMortarB1FKiyoWinText, 0
	loadtrainer BLACKBELT_T, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLACKBELT_KIYO
	opentext
.BeatKiyo:
	writetext MountMortarB1FTyrogueRewardText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext MountMortarB1FReceiveMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
	writetext MountMortarKiyoGiveDollText
	setevent EVENT_DECO_MACHOP_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext MountMortarKiyoExplainDollText
	promptbutton
.GotTyrogue:
	writetext MountMortarB1FKiyoGotTyrogueText
	waitbutton
	closetext
	end

.NoRoom:
	writetext MountMortarB1FKiyoFullPartyText
	waitbutton
	closetext
	end

MountMortarB1FBoulder:
	jumpstd StrengthBoulderScript

MountMortarB1FHyperPotion:
	itemball HYPER_POTION

MountMortarB1FCarbos:
	itemball CARBOS

MountMortarB1FFullRestore:
	itemball FULL_RESTORE

MountMortarB1FMaxEther:
	itemball MAX_ETHER

MountMortarB1FPPUp:
	itemball PP_UP

MountMortarB1FGravityBuoy:
	itemball GRAVITY_BUOY

MountMortarB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

MountMortarB1FSabrinaTeleport:
	teleport_from
	step_end

MountMortarB1FKiyoIntroText:
	text "Hey!"

	para "I am the KARATE"
	line "KING!"

	para "I train alone here"
	line "in the dark!"

	para "You!"
	line "Battle with me!"

	para "Hwaaarggh!"
	done

MountMortarB1FKiyoWinText:
	text "Waaaarggh!"
	line "I'm beaten!"
	done

MountMortarB1FTyrogueRewardText:
	text "I… I'm crushed…"

	para "My training is"
	line "still not enough…"

	para "But a loss is a"
	line "loss. I admit it."

	para "As proof that you"
	line "defeated me, I'll"

	para "give you a rare"
	line "fighting #MON."
	done

MountMortarB1FReceiveMonText:
	text "<PLAYER> received"
	line "TYROGUE!"
	done

MountMortarKiyoGiveDollText:
	text "And I'll also give"
	line "you this."

	para "<PLAYER> received"
	line "MACHOP DOLL!"
	done

MountMortarKiyoExplainDollText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

MountMortarB1FKiyoGotTyrogueText:
	text "TYROGUE is a"
	line "fighting-type."

	para "It evolves into"
	line "one of three other"
	cont "#MON."

	para "Keep up the hard"
	line "work. I'll keep"
	cont "training too."

	para "Farewell!"
	done

MountMortarB1FKiyoFullPartyText:
	text "You have no room"
	line "in your party!"
	done

MountMortarB1FSabrinaText:
	text "SABRINA: …"

	para "How many times"
	line "must we battle"

	para "before you realize"
	line "what it is that"
	cont "you lack?"

	para "KIYO: …Grumble…"

	para "SABRINA: Continue"
	line "your training…"

	para "I must return to"
	line "SAFFRON."

	para "This young chall-"
	line "enger behind us"
	cont "grows impatient."
	done

MountMortarB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	def_coord_events
	coord_event 12,  4, SCENE_MOUNTMORTARB1F_SABRINA, MountMortarB1FSabrinaScene

	def_bg_events
	bg_event  4,  6, BGEVENT_ITEM, MountMortarB1FHiddenMaxRevive

	def_object_events
	object_event 29, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FHyperPotion, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	object_event  4, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FCarbos, EVENT_MOUNT_MORTAR_B1F_CARBOS
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FBoulder, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	object_event 34, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FFullRestore, EVENT_MOUNT_MORTAR_B1F_FULL_RESTORE
	object_event 32,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FMaxEther, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	object_event 21, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FPPUp, EVENT_MOUNT_MORTAR_B1F_PP_UP
	object_event 11,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FGravityBuoy, EVENT_MOUNT_MORTAR_B1F_GRAVITY_BUOY
	object_event 15,  4, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SABRINA_IN_MOUNT_MORTAR
