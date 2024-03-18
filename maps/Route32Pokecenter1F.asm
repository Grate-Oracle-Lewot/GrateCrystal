	object_const_def
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_CHANSEY
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_UNION_CAVE
	endcallback

Route32Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route32Pokecenter1FChanseyScript:
	jumpstd PokecenterChanseyScript

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	checkflag ENGINE_POKEDEX
	iffalse .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	showemote EMOTE_FISH, ROUTE32POKECENTER1F_FISHING_GURU, 15
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "Oh, you have that"
	line "fancy new #DEX"
	cont "of NAYRU's!"

	para "It's convenient how"
	line "it shows detailed"

	para "encounter rates"
	line "for wild #MON…"

	para "But have you"
	line "noticed… It"

	para "doesn't say any-"
	line "thing about what"

	para "kinds of #MON"
	line "you'll catch with"
	cont "fishing rods?"

	para "I guess it can't"
	line "scan underwater."

	para "But you know… that"
	line "makes fishing an"
	cont "exciting mystery!"

	para "Don't you agree?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "That's the spirit!"
	line "I'll give you this!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "Try out that ROD"
	line "in any body of"

	para "water, and see"
	line "what wonderful"

	para "things you fish"
	line "up!"
	done

Route32Pokecenter1FFishingGuruText_No:
	text "Oh. That's rather"
	line "disappointing…"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Yo, kid. How are"
	line "the fish biting?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "What should I make"
	line "my #MON hold?"

	para "Maybe an item that"
	line "increases ATTACK"
	cont "power…"
	done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  4,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FChanseyScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
