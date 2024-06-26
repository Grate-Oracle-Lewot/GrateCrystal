	object_const_def
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2
	const LAVRADIOTOWER1F_RECEPTIONIST2

LavRadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .LavRadioTowerOfficerCallback

.LavRadioTowerOfficerCallback:
	appear LAVRADIOTOWER1F_OFFICER
	appear LAVRADIOTOWER1F_SUPER_NERD1
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .NextCheck
	endcallback

.NextCheck:
	checkevent EVENT_FOUGHT_MEWTWO
	iffalse .OfficerMovedUpstairs
	endcallback

.OfficerMovedUpstairs:
	disappear LAVRADIOTOWER1F_OFFICER
	disappear LAVRADIOTOWER1F_SUPER_NERD1
	endcallback

LavRadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .ReceptionistBrainwashed
	sjump .ReceptionistNotBrainwashed

.ReceptionistBrainwashed:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .ReceptionistNotBrainwashed
	writetext LavRadioTower1FMewtwoBrainwashText
	waitbutton
	closetext
	end

.ReceptionistNotBrainwashed:
	writetext LavRadioTower1FReceptionistText
	waitbutton
	closetext
	end

LavRadioTower1FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .OfficerBrainwashed
	writetext LavRadioTower1FOfficerText1
	waitbutton
	closetext
	end

.OfficerBrainwashed:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .OfficerNotBrainwashed
	writetext LavRadioTower1FMewtwoBrainwashText
	waitbutton
	closetext
	end

.OfficerNotBrainwashed:
	writetext LavRadioTower1FOfficerText2
	waitbutton
	closetext
	end

LavRadioTower1FSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .SuperNerd1Brainwashed
	sjump .SuperNerd1NotBrainwashed

.SuperNerd1Brainwashed:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .SuperNerd1NotBrainwashed
	writetext LavRadioTower1FMewtwoBrainwashText
	waitbutton
	closetext
	end

.SuperNerd1NotBrainwashed:
	writetext LavRadioTower1FSuperNerd1Text
	waitbutton
	closetext
	end

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .GentlemanBrainwashed
	sjump .GentlemanNotBrainwashed

.GentlemanBrainwashed:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .GentlemanNotBrainwashed
	writetext LavRadioTower1FMewtwoBrainwashText
	waitbutton
	closetext
	end

.GentlemanNotBrainwashed:
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "EXPN CARD@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .SuperNerd2Brainwashed
	sjump .SuperNerd2NotBrainwashed

.SuperNerd2Brainwashed:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .SuperNerd2NotBrainwashed
	writetext LavRadioTower1FMewtwoBrainwashText
	waitbutton
	closetext
	end

.SuperNerd2NotBrainwashed:
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	iftrue .LavRadioTowerBuenaPrizeReceptionistBrainwashed
	sjump .LavRadioTowerBuenaPrizeReceptionistNotBrainwashed

.LavRadioTowerBuenaPrizeReceptionistBrainwashed:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .LavRadioTowerBuenaPrizeReceptionistNotBrainwashed
	writetext LavRadioTower1FMewtwoBrainwashText
	waitbutton
	closetext
	end

.LavRadioTowerBuenaPrizeReceptionistNotBrainwashed:
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext LavRadioTowerBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext LavRadioTowerBuenaReceptionistNoCardText
	promptbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReceptionistText:
	text "Welcome to the"
	line "LAVENDER RADIO"
	cont "TOWER!"
	done

LavRadioTower1FOfficerText1:
	text "Sorry, but you can"
	line "only tour the"
	cont "ground floor."

	para "Ever since JOHTO's"
	line "RADIO TOWER was"

	para "taken over by a"
	line "criminal gang, we"

	para "have had to step"
	line "up our security."
	done

LavRadioTower1FOfficerText2:
	text "That #MON… It"
	line "took over every-"
	cont "one's minds!"

	para "No one was hurt,"
	line "but I get goose-"
	cont "bumps just think-"
	cont "ing about it…"

	para "Anyway, we had to"
	line "increase security"
	cont "even more!"

	para "So, sorry, but I"
	line "can't let you up."
	done

LavRadioTower1FSuperNerd1Text:
	text "Many people are"
	line "hard at work here"

	para "in the RADIO"
	line "TOWER."

	para "They must be doing"
	line "their best to put"
	cont "on good shows."
	done

LavRadioTower1FGentlemanText:
	text "Oh, no, no, no!"

	para "We've been off the"
	line "air ever since the"

	para "POWER PLANT shut"
	line "down."

	para "All my efforts to"
	line "start this station"

	para "would be wasted if"
	line "I can't broadcast."

	para "I'll be ruined!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "Ah! So you're the"
	line "<PLAY_G> who solved"

	para "the POWER PLANT's"
	line "problem?"

	para "Thanks to you, I"
	line "never lost my job."

	para "I tell you, you're"
	line "a real lifesaver!"

	para "Please take this"
	line "as my thanks."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "With that thing,"
	line "you can tune into"

	para "the radio programs"
	line "here in KANTO."

	para "Gahahahaha!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "Huh? Your #GEAR"
	line "can't tune into my"

	para "music programs."
	line "How unfortunate!"

	para "If you get an EXPN"
	line "CARD upgrade, you"

	para "can tune in. You'd"
	line "better get one!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "I'm responsible"
	line "for the gorgeous"

	para "melodies that go"
	line "out over the air."

	para "Don't be square."
	line "Grab your music"
	cont "off the air!"
	done

LavRadioTowerBuenaReceptionistPointsForPrizesText:
	text "You can cash in"
	line "your saved points"

	para "for a lovely prize"
	line "of your choice!"
	done

LavRadioTowerBuenaReceptionistNoCardText:
	text "You can't trade in"
	line "points without"
	cont "your BLUE CARD."

	para "Don't forget your"
	line "BLUE CARD!"
	done

LavRadioTower1FMewtwoBrainwashText:
	text "…"
	done

LavRadioTower1FDirectoryText:
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

LavRadioTower1FPokeFluteSignText:
	text "Perk Up #MON"
	line "with Mellow Sounds"

	para "of the # FLUTE"
	line "on CHANNEL 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7
	warp_event 15,  0, LAV_RADIO_TOWER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, EVENT_LAV_RADIO_TOWER_1F_OFFICER
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, EVENT_LAV_RADIO_TOWER_1F_WANDERING_SUPER_NERD
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
	object_event 19,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavRadioTowerBuenaPrizeReceptionist, -1
