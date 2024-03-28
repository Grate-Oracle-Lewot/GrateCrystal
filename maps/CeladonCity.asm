	object_const_def
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRANNY
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityTutorSacredFireScript:
	faceplayer
	opentext
	writetext CeladonCityTutorSacredFireText1
	waitbutton
	checkitem GOLD_LEAF
	iffalse .NoLeaf
	writetext CeladonCityTutorSacredFireText2
	yesorno
	iffalse .TutorRefused
	writebyte SACRED_FIRE
	writetext CeladonCityTutorSacredFireClear
	special MoveTutor
	if_equal $0, .TeachMove

.TutorRefused
	writetext CeladonCityTutorSacredFireRefused
	waitbutton
	closetext
	end

.NoLeaf:
	writetext CeladonCityTutorSacredFireNoLeaf
	waitbutton
	closetext
	end

.TeachMove
	writetext CeladonCityTutorSacredFirePayment
	takeitem GOLD_LEAF
	waitbutton
	writetext CeladonCityTutorSacredFireTaught
	waitbutton
	closetext
	end

CeladonCityTutorAeroblastScript:
	faceplayer
	opentext
	writetext CeladonCityTutorAeroblastText1
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoLeaf
	writetext CeladonCityTutorAeroblastText2
	yesorno
	iffalse .TutorRefused
	writebyte AEROBLAST
	writetext CeladonCityTutorAeroblastClear
	special MoveTutor
	if_equal $0, .TeachMove

.TutorRefused
	writetext CeladonCityTutorAeroblastRefused
	waitbutton
	closetext
	end

.NoLeaf:
	writetext CeladonCityTutorAeroblastNoLeaf
	waitbutton
	closetext
	end

.TeachMove
	writetext CeladonCityTutorAeroblastPayment
	takeitem SILVER_LEAF
	waitbutton
	writetext CeladonCityTutorAeroblastTaught
	waitbutton
	closetext
	end

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd PokecenterSignScript

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityTutorSacredFireText1:
	text "If you bring me a"
	line "GOLD LEAF, I can"

	para "teach one of your"
	line "#MON to use"
	cont "SACRED FIRE."
	done

CeladonCityTutorSacredFireText2:
	text "Ah! A GOLD LEAF!"

	para "How about it"

CeladonCityTutorSacredFireClear:
	text ""
	done

CeladonCityTutorSacredFireRefused:
	text "Oh. Perhaps some"
	line "other time."
	done

CeladonCityTutorSacredFirePayment:
	text "<PLAYER> gave the"
	line "man a GOLD LEAF."
	done

CeladonCityTutorSacredFireTaught:
	text "There you are."

	para "If you want me to"
	line "teach the move"

	para "again, bring me"
	line "another GOLD LEAF."
	done

CeladonCityTutorSacredFireNoLeaf:
	text "You don't have a"
	line "GOLD LEAF on you."

	para "I can tell."

	para "GOLD and SILVER"
	line "LEAVES may fall"

	para "out of small trees"
	line "when you use"
	cont "HEADBUTT."

	para "These trees can"
	line "only be found in"
	cont "JOHTO."
	done

CeladonCityTutorAeroblastText1:
	text "If you bring me a"
	line "SILVER LEAF, I can"

	para "teach one of your"
	line "#MON to use"
	cont "ZEROBLAST."
	done

CeladonCityTutorAeroblastText2:
	text "Oh! A SILVER LEAF!"

	para "May I have it"

CeladonCityTutorAeroblastClear:
	text ""
	done

CeladonCityTutorAeroblastRefused:
	text "Then scram, punk."
	done

CeladonCityTutorAeroblastPayment:
	text "<PLAYER> gave her"
	line "a SILVER LEAF."
	done

CeladonCityTutorAeroblastTaught:
	text "It's done!"

	para "If you want me to"
	line "teach the move"

	para "again, bring me"
	line "another SILVER"
	cont "LEAF."
	done

CeladonCityTutorAeroblastNoLeaf:
	text "You don't have a"
	line "SILVER LEAF."

	para "I'm afraid I don't"
	line "teach the move for"
	cont "free."

	para "Wild CATERPIE or"
	line "COTTONEE may hold"

	para "SILVER or GOLD"
	line "LEAVES. Try using"
	cont "THIEF!"
	done

CeladonCityFisherText:
	text "You can evolve"
	line "POLIWHIRL into"

	para "POLIWRATH using a"
	line "WATER STONE."

	para "It can also become"
	line "POLITOED if it's"
	cont "happy at night."
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Croak!"
	done

CeladonCityTeacher1Text:
	text "I heard that odd"
	line "#MON have been"
	cont "sighted in PALDEA."

	para "They resemble"
	line "familiar #MON"

	para "like DONPHAN and"
	line "JIGGLYPUFF, but"

	para "some look like"
	line "robots and some"
	cont "look prehistoric!"
	done

CeladonCityGramps2Text:
	text "This GYM only"
	line "allows girls"
	cont "inside."

	para "But there must be"
	line "a way for boys to"
	cont "battle the LEADER…"

	para "I think a friend"
	line "of mine has the"
	cont "BADGE…"

	para "I'll ask about it"
	line "while we're trading"
	cont "#MON."
	done

CeladonCityYoungster1Text:
	text "Want to know a"
	line "secret?"

	para "The CONDOS have a"
	line "hidden back door."
	done

CeladonCityYoungster2Text:
	text "They're holding an"
	line "eating contest at"
	cont "the restaurant."

	para "Just watching them"
	line "go at it makes me"
	cont "feel bloated…"
	done

CeladonCityTeacher2Text:
	text "CELADON DEPT.STORE"
	line "has the biggest"

	para "and best selection"
	line "of merchandise."

	para "If you can't get"
	line "it there, you"

	para "can't get it any-"
	line "where."

	para "Gee… I sound like"
	line "a sales clerk."
	done

CeladonCityLassText:
	text "Looking at the"
	line "ground while I was"

	para "walking made me"
	line "dizzy."
	done

CeladonCitySignText:
	text "CELADON CITY"

	para "The City of"
	line "Rainbow Dreams"
	done

CeladonGymSignText:
	text "CELADON CITY"
	line "#MON GYM"
	cont "LEADER: ERIKA"

	para "The Nature-Loving"
	line "Princess"
	done

CeladonCityDeptStoreSignText:
	text "Find What You"
	line "Need at CELADON"
	cont "DEPT.STORE!"
	done

CeladonCityMansionSignText:
	text "CELADON"
	line "CONDOMINIUMS"
	done

CeladonCityGameCornerSignText:
	text "The Game Area for"
	line "Grown-Ups--CELADON"
	cont "GAME CORNER"
	done

CeladonCityTrainerTipsText:
	text "TRAINER TIPS"

	para "GUARD SPEC."
	line "protects #MON"

	para "from having their"
	line "stats lowered."

	para "Get your items at"
	line "CELADON DEPT."
	cont "STORE!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	def_coord_events

	def_bg_events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	def_object_events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 13, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTutorSacredFireScript, -1
	object_event 15, 16, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityTutorAeroblastScript, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
