	object_const_def
	const AZALEATOWN_ROCKET
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_SLOWPOKE1
	const AZALEATOWN_SLOWPOKE2
	const AZALEATOWN_SLOWPOKE3
	const AZALEATOWN_SLOWPOKE4
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_SILVER
	const AZALEATOWN_SLOWPOKE5
	const AZALEATOWN_KURT

AzaleaTown_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_AZALEATOWN_NOTHING
	scene_script .DummyScene ; SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_script .DummyScene ; SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRivalBattleScene1:
	moveobject AZALEATOWN_SILVER, 11, 11
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement1
	turnobject PLAYER, DOWN
	sjump AzaleaTownRivalBattleScript

AzaleaTownRivalBattleScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_SILVER
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleApproachMovement2
	turnobject PLAYER, UP
AzaleaTownRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	winlosstext AzaleaTownRivalWinText, 0
	setlasttalked AZALEATOWN_SILVER
if DEF(_SIX_PIKACHUS)
	checkevent EVENT_LOST_FIRST_RIVAL_BATTLE
	iftrue .Flareon
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	sjump .FinishBattle

.Flareon:
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
else
if DEF(_LETS_GO_STARTERS) || DEF(_SLOW_STARTERS) || DEF(_TURBIN_STARTERS)
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChosePikachu
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	sjump .FinishBattle

.PlayerChosePikachu:
	checkevent EVENT_LOST_FIRST_RIVAL_BATTLE
	iftrue .Flareon
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	sjump .FinishBattle

.Flareon:
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
else
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChoseChikorita
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .PlayerChoseCyndaquil
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	sjump .FinishBattle

.PlayerChoseChikorita:
if DEF(_HITMON_STARTERS) || DEF(_NIDORAN_STARTERS) || DEF(_CATTLE_STARTERS) || DEF(_MEW_STARTERS) || DEF(_HO_OH_LUGIA) || DEF(_CELEBI_STARTERS)
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
else
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
endc
	sjump .FinishBattle

.PlayerChoseCyndaquil:
if DEF(_HITMON_STARTERS) || DEF(_NIDORAN_STARTERS) || DEF(_CATTLE_STARTERS) || DEF(_MEW_STARTERS) || DEF(_HO_OH_LUGIA) || DEF(_CELEBI_STARTERS)
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
else
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
endc
endc
endc
.FinishBattle:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AzaleaTownRivalAfterText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_SILVER, AzaleaTownRivalBattleExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_SILVER
	setscene SCENE_AZALEATOWN_NOTHING
	waitsfx
	playmapmusic
	end

AzaleaTownRocketScript:
	jumptextfaceplayer AzaleaTownRocketText

AzaleaTownSlowkingScript:
	jumptext AzaleaTownSlowkingText

AzaleaTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedWell
	writetext AzaleaTownGrampsTextBefore
	waitbutton
	closetext
	end

.ClearedWell:
	writetext AzaleaTownGrampsTextAfter
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
	opentext
	writetext AzaleaTownSlowpokeText1
	pause 60
	writetext AzaleaTownSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end

AzaleaTownCelebiScene:
	applymovement PLAYER, AzaleaTownPlayerLeavesKurtsHouseMovement
	opentext
	writetext AzaleaTownKurtText1
	promptbutton
	turnobject AZALEATOWN_KURT, RIGHT
	writetext AzaleaTownKurtText2
	promptbutton
	writetext AzaleaTownKurtText3
	waitbutton
	verbosegiveitem GS_BALL
	turnobject AZALEATOWN_KURT, LEFT
	setflag ENGINE_FOREST_IS_RESTLESS
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOTHING
	closetext
	end

AzaleaTownKurtScript:
	faceplayer
	opentext
	writetext AzaleaTownKurtText3
	waitbutton
	turnobject AZALEATOWN_KURT, LEFT
	closetext
	end

AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokecenterSign:
	jumpstd PokecenterSignScript

AzaleaTownMartSign:
	jumpstd MartSignScript

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

AzaleaTownRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

AzaleaTownRivalBattleApproachMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AzaleaTownRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end

AzaleaTownPlayerLeavesKurtsHouseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head LEFT
	step_end

AzaleaTownRivalBeforeText:
	text "A THING TO ASK:IS"
	line "IT REAL THE"
	cont "MISSILE BOMB"
	cont "RELIVES?WHAT,"
	cont "IT'S YOU TO"
	cont "BEAT THEM DOWN,"
	cont "REALLY?"

	para "THEN SHOW OFF YOUR"

	cont "STRENGTH TO SEE."
	done

AzaleaTownRivalWinText:
	text "THE ELF CAN NOT"
	line "BE USED."
	cont "YOU WON IS"
	cont "BECAUSE MY ELF"
	cont "BECOME WEAKER"
	done

AzaleaTownRivalAfterText:
	text "I AM VERY"
	line "DISGUSTED"
	cont "WITH THE TRASHY"
	cont "MAN."
	cont "IN SPITE OF"
	cont "THE MONSTER,AND"
	cont "THE COACH,"
	cont "ONLY TRASHY,I"
	cont "WILL BEAT DOWN"
	cont "THEM ALL."
	cont "FOR THIS I MUST"
	cont "STRENGTHEN MYSELF."
	cont "THE MONSTER IS"
	cont "THE SAME TOO,"
	cont "COLLECT ALL THE"
	cont "TRASHY,RIGHTEOUS"
	cont "FELLOW ALL ARE"
	cont "UNPARDONABLE."
	cont "YOU DON'T"
	cont "AFFECT ME."
	cont "THE TRASHY"
	cont "STROLLING"
	cont "IS AN EYESORE."
	done

AzaleaTownRocketText:
	text "It's unsafe to go"
	line "in there, so I'm"
	cont "standing guard."

	para "Aren't I a good"
	line "Samaritan?"
	done

AzaleaTownSlowkingText:
	text "SLOWKING: …"

	para "Do you know of the"
	line "three legendary"
	cont "bird #MON?"

	para "…"

	para "They are called"
	line "ARTICUNO, ZAPDOS,"
	cont "and MOLTRES…"

	para "…"

	para "It is said they"
	line "will only appear"

	para "before a worthy"
	line "trainer…"

	para "…"

	para "If you intend to"
	line "prove yourself"

	para "worthy, you might"
	line "start by aiding my"

	para "brethren in SLOW-"
	line "POKE WELL…"

	para "…"
	done

AzaleaTownGrampsTextBefore:
	text "The SLOWPOKE have"
	line "disappeared from"
	cont "town…"

	para "I heard their"
	line "TAILS are being"
	cont "sold somewhere."
	done

AzaleaTownGrampsTextAfter:
	text "The SLOWPOKE have"
	line "returned."

	para "Knowing them, they"
	line "could've just been"

	para "goofing off some-"
	line "where."
	done

AzaleaTownTeacherText:
	text "Did you come to"
	line "get KURT to make"
	cont "some BALLS?"

	para "A lot of people do"
	line "just that."
	done

AzaleaTownYoungsterText:
	text "Cut through AZALEA"
	line "and you'll be in"
	cont "ILEX FOREST."

	para "But these skinny"
	line "trees make it"

	para "impossible to get"
	line "through."

	para "The CHARCOAL MAN's"
	line "#MON can CUT"
	cont "down trees."
	done

AzaleaTownSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

AzaleaTownSlowpokeText2:
	text "<……> <……>Yawn?"
	done

AzaleaTownKurtText1:
	text "ILEX FOREST is"
	line "restless!"

	para "What is going on?"
	done

AzaleaTownKurtText2:
	text "<PLAYER>, here's"
	line "your GS BALL back!"
	done

AzaleaTownKurtText3:
	text "Could you go see"
	line "why ILEX FOREST is"
	cont "so restless?"
	done

AzaleaTownSignText:
	text "AZALEA TOWN"
	line "Where People and"

	para "#MON Live in"
	line "Happy Harmony"
	done

KurtsHouseSignText:
	text "KURT'S HOUSE"
	done

AzaleaGymSignText:
	text "AZALEA TOWN"
	line "#MON GYM"
	cont "LEADER: BUGSY"

	para "The Walking"
	line "Bug #MON"
	cont "Encyclopedia"
	done

SlowpokeWellSignText:
	text "SLOWPOKE WELL"

	para "Also known as the"
	line "RAINMAKER WELL."

	para "Locals believe"
	line "that a SLOWPOKE's"
	cont "yawn summons rain."

	para "Records show that"
	line "a SLOWPOKE's yawn"

	para "ended a drought"
	line "400 years ago."
	done

CharcoalKilnSignText:
	text "CHARCOAL KILN"
	done

AzaleaTownIlexForestSignText:
	text "ILEX FOREST"

	para "Enter through the"
	line "gate."
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_B1F, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene2
	coord_event  9,  6, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL, AzaleaTownCelebiScene

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, AzaleaTownSign
	bg_event 10,  9, BGEVENT_READ, KurtsHouseSign
	bg_event 14, 15, BGEVENT_READ, AzaleaGymSign
	bg_event 29,  7, BGEVENT_READ, SlowpokeWellSign
	bg_event 19, 13, BGEVENT_READ, CharcoalKilnSign
	bg_event 16,  9, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 22,  5, BGEVENT_READ, AzaleaTownMartSign
	bg_event  3,  9, BGEVENT_READ, AzaleaTownIlextForestSign
	bg_event 31,  6, BGEVENT_ITEM, AzaleaTownHiddenFullHeal

	def_object_events
	object_event 31,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocketScript, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event  8, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 29,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  8,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
	object_event 11, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event 10, 16, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowkingScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6,  5, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
