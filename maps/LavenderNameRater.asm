	object_const_def
	const LAVENDERNAMERATER_NAME_RATER
	const LAVENDERNAMERATER_SUPER_NERD
	const LAVENDERNAMERATER_TEACHER
	const LAVENDERNAMERATER_GRANNY

LavenderNameRater_MapScripts:
	def_scene_scripts

	def_callbacks

LavNameRater_EndText:
	waitbutton
	closetext
	end

LavenderNameRater:
	faceplayer
	opentext
	special NameRater
	sjump LavNameRater_EndText

LavenderMoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	sjump LavNameRater_EndText

LavenderSeerScript:
	faceplayer
	opentext
	special MoveReminder
	sjump LavNameRater_EndText

LavenderHappinessRater:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext LavenderHappinessRaterText
	promptbutton
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext LavenderHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	showemote EMOTE_HEART, LAVENDERNAMERATER_TEACHER, 10
	end

.ReallyTrustsYou:
	writetext LavenderHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	showemote EMOTE_HAPPY, LAVENDERNAMERATER_TEACHER, 10
	end

.SortOfHappy:
	writetext LavenderHappinessRatingText_SortOfHappy
	sjump LavNameRater_EndText

.QuiteCute:
	writetext LavenderHappinessRatingText_QuiteCute
	sjump LavNameRater_EndText

.NotUsedToYou:
	writetext LavenderHappinessRatingText_NotUsedToYou
	sjump LavNameRater_EndText

.LooksMean:
	writetext LavenderHappinessRatingText_LooksMean
	waitbutton
	closetext
	showemote EMOTE_SAD, LAVENDERNAMERATER_TEACHER, 10
	end

LavenderHappinessRaterText:
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "Oh? Let me see"
	line "your @"
	text_ram wStringBuffer3
	text "…"
	done

LavenderHappinessRatingText_LovesYouALot:
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done

LavenderHappinessRatingText_ReallyTrustsYou:
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done

LavenderHappinessRatingText_SortOfHappy:
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done

LavenderHappinessRatingText_QuiteCute:
	text "It's quite cute."
	done

LavenderHappinessRatingText_NotUsedToYou:
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done

LavenderHappinessRatingText_LooksMean:
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done

LavenderNameRater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 4
	warp_event  3,  7, LAVENDER_TOWN, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderNameRater, -1
	object_event  5,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, LavenderMoveDeleter, -1
	object_event  6,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderHappinessRater, -1
	object_event  0,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderSeerScript, -1
