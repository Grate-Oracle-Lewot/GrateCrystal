	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN
	const BILLSFAMILYSHOUSE_EEVEE1
	const BILLSFAMILYSHOUSE_EEVEE2
	const BILLSFAMILYSHOUSE_EEVEE3

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsFamilysHouseEevee1:
	opentext
	writetext BillsFamilysHouseEevee1Text
	cry EEVEE
	waitbutton
	closetext
	end

BillsFamilysHouseEevee2:
	opentext
	writetext BillsFamilysHouseEevee2Text
	cry EEVEE
	waitbutton
	closetext
	end

BillsFamilysHouseEevee3:
	opentext
	writetext BillsFamilysHouseEevee3Text
	cry EEVEE
	waitbutton
	closetext
	end

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillsFamilysHousePhoto:
	jumptext BillsFamilysHousePhotoText

BillTakeThisEeveeText:
	text "BILL: Hi, <PLAYER>!"
	line "Do us a favor and"
	cont "take this EEVEE."

	para "It may be my favo-"
	line "rite #MON, but"

	para "we've got too many"
	line "of them running"
	cont "around already."

	para "Can I count on you"
	line "to play with it,"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: I knew you'd"
	line "come through!"

	para "Way to go! You're"
	line "the real deal!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done

ReceivedEeveeText:
	text "<PLAYER> received"
	line "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: EEVEE can"
	line "evolve into one of"

	para "five different"
	line "#MON."
	done

BillPartyFullText:
	text "Whoa, your party's"
	line "full."

	para "This is a perfect"
	line "time to try out"

	para "that GAME BOY PC I"
	line "gave you!"
	done

BillNoEeveeText:
	text "Oh… Now what to"
	line "do?"
	done

BillPopWontWorkText:
	text "BILL: My pop, he"
	line "won't work. All he"

	para "does is gamble all"
	line "day long."

	para "He's getting to be"
	line "a real headache…"
	done

BillsMomText_BeforeEcruteak:
	text "Oh, you collect"
	line "#MON? My son"
	cont "BILL is an expert."

	para "He just got called"
	line "to the #MON"

	para "CENTER in ECRUTEAK"
	line "CITY."

	para "My husband went"
	line "off to the GAME"

	para "CORNER, without"
	line "being called…"
	done

BillsMomText_AfterEcruteak:
	text "My husband was"
	line "once known as a"

	para "#MANIAC."
	line "BILL must have"

	para "taken after his"
	line "father."
	done

BillsSisterUsefulNumberText:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

RecordedBillsNumberText:
	text "<PLAYER> recorded"
	line "BILL's number."
	done

BillsSisterRefusedNumberText:
	text "My brother made"
	line "the PC #MON"
	cont "storage system."

	para "I was going to"
	line "give you BILL's"
	cont "number…"
	done

BillsSisterPhoneFullText:
	text "You can't record"
	line "any more numbers."
	done

BillsSisterStorageSystemText:
	text "My big brother"
	line "BILL made the PC"

	para "#MON storage"
	line "system."
	done

BillsFamilysHouseEevee1Text:
	text "EEVEE: Vreevree!"
	done

BillsFamilysHouseEevee2Text:
	text "EEVEE: Eeeeev!"
	done

BillsFamilysHouseEevee3Text:
	text "EEVEE: Eevuh?"
	done

BillsFamilysHousePhotoText:
	text "It's a photo of"
	line "BILL's family."

	para "There are too many"
	line "people to count!"
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio
	bg_event  3,  0, BGEVENT_READ, BillsFamilysHousePhoto

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
	object_event  4,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsFamilysHouseEevee1, -1
	object_event  0,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, BillsFamilysHouseEevee2, -1
	object_event  5,  1, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsFamilysHouseEevee3, -1
