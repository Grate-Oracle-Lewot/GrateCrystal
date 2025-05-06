	object_const_def
	const BURNEDTOWER1F_ROCK1
	const BURNEDTOWER1F_EUSINE
	const BURNEDTOWER1F_SILVER
	const BURNEDTOWER1F_MORTY
	const BURNEDTOWER1F_POKE_BALL
	const BURNEDTOWER1F_FISHER1
	const BURNEDTOWER1F_FISHER2
	const BURNEDTOWER1F_ROCK2

BurnedTower1F_MapScripts:
	def_scene_scripts
	scene_script .EusineScene ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	scene_script .DummyScene ; SCENE_BURNEDTOWER1F_NOTHING

	def_callbacks
	callback MAPCALLBACK_TILES, .HoleAndLadder

.EusineScene:
	sdefer .MeetEusine
.DummyScene:
	end

.HoleAndLadder:
	checkevent EVENT_HOLE_IN_BURNED_TOWER
	iftrue .KeepHoleOpen
	changeblock 10, 8, $32 ; floor
.KeepHoleOpen:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .HideBasement
	changeblock 6, 14, $09 ; ladder
.HideBasement:
	endcallback

.MeetEusine:
	turnobject BURNEDTOWER1F_EUSINE, DOWN
	showemote EMOTE_QUESTION, BURNEDTOWER1F_EUSINE, 15
	applymovement BURNEDTOWER1F_EUSINE, BurnedTower1FEusineMovement
	opentext
	writetext BurnedTower1FEusineIntroText
	waitbutton
	closetext
	moveobject BURNEDTOWER1F_EUSINE, 9, 14
	setscene SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	end

BurnedTowerRivalBattleScript:
	showemote EMOTE_SHOCK, BURNEDTOWER1F_SILVER, 15
	special FadeOutMusic
	pause 15
	turnobject BURNEDTOWER1F_SILVER, RIGHT
	pause 15
	applymovement PLAYER, BurnedTowerMovement_PlayerWalksToSilver
	applymovement BURNEDTOWER1F_SILVER, BurnedTowerMovement_SilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	winlosstext BurnedTowerSilver_WinText, 0
	setlasttalked BURNEDTOWER1F_SILVER
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .PlayerChoseChikorita
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .PlayerChoseCyndaquil
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	sjump .FinishBattle

.PlayerChoseChikorita:
	loadtrainer RIVAL1, RIVAL1_3_CYNDAQUIL
	sjump .FinishBattle

.PlayerChoseCyndaquil:
	loadtrainer RIVAL1, RIVAL1_3_TOTODILE
.FinishBattle:
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	setscene SCENE_BURNEDTOWER1F_NOTHING
	setevent EVENT_RIVAL_BURNED_TOWER
	special FadeOutMusic
	pause 15
	earthquake 50
	showemote EMOTE_QUESTION, PLAYER, 15
	playsound SFX_ENTER_DOOR
	waitsfx
	changeblock 10, 8, $25 ; hole
	reloadmappart
	pause 15
	applymovement PLAYER, BurnedTower1FMovement_PlayerStartsToFall
	playsound SFX_KINESIS
	showemote EMOTE_SHOCK, BURNEDTOWER1F_SILVER, 20
	opentext
	writetext BurnedTowerSilver_AfterText2
	waitbutton
	closetext
	setevent EVENT_HOLE_IN_BURNED_TOWER
	pause 15
	warpcheck
	end

BurnedTower1FEusineScript:
	jumptextfaceplayer BurnedTower1FEusineText

BurnedTower1FMortyScript:
	jumptextfaceplayer BurnedTower1FMortyText

TrainerFirebreatherDick:
	trainer FIREBREATHER, DICK, EVENT_BEAT_FIREBREATHER_DICK, FirebreatherDickSeenText, FirebreatherDickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherDickAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherNed:
	trainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, FirebreatherNedSeenText, FirebreatherNedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherNedAfterBattleText
	waitbutton
	closetext
	end

BurnedTower1FRock:
	jumpstd SmashRockScript

BurnedTower1FHiddenEther:
	hiddenitem ETHER, EVENT_BURNED_TOWER_1F_HIDDEN_ETHER

BurnedTower1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL

BurnedTower1FHPUp:
	itemball HP_UP

BurnedTowerMovement_PlayerWalksToSilver:
	step LEFT
	step_end

BurnedTowerMovement_SilverWalksToPlayer:
	step RIGHT
	step_end

BurnedTower1FMovement_PlayerStartsToFall:
	skyfall_top
	step_end

BurnedTower1FEusineMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

BurnedTowerSilver_BeforeText:
	text "I HEARD YOU"
	line "WERE SLEEPING"
	cont "THERE,"

	para "THE LEGENDARY"

	cont "MONSTER LOOKED"
	cont "FOR YOU SPECIALLY"
	cont "HOW THAT MONSTER"
	cont "MIGHT EXIST!"

	para "I CAME THERE"

	cont "FOR YOU SPECIALLY,"
	cont "DON'T SAY SO!"

	para "DON'T USE"

	cont "THE METHOD!"

	para "IT'S GOOD NOT"

	cont "TO BLAME YOU!"
	done

BurnedTowerSilver_WinText:
	text "HATE TO FIGHT"
	line "WITH THE WEAKERS"
	done

BurnedTowerSilver_AfterText1:
	text "FORGET IT!"
	line "IN ANY CASE YOU"
	cont "WERE NOT GRASPED"
	cont "BY THE LEGENDARY"
	cont "MONSTER."
	done

BurnedTowerSilver_AfterText2:
	text "ER WHICH HOLE?"
	line "WHAT DROPED?"

	para "FAILING THING,"

	cont "SERVE ONE RIGHT!"
	done

BurnedTower1FEusineIntroText:
	text "My name's EUSINE."

	para "I'm on the trail"
	line "of a #MON named"
	cont "SUICUNE."

	para "And you are…?"

	para "<PLAYER>? Glad to"
	line "meet you!"

	para "I heard rumors"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done

BurnedTower1FEusineText:
	text "EUSINE: I heard"
	line "that SUICUNE is in"

	para "this BURNED TOWER,"
	line "so I came to look."

	para "But where exactly"
	line "could it be?"
	done

BurnedTower1FMortyText:
	text "MORTY: ECRUTEAK's"
	line "GYM LEADER has to"

	para "study what are"
	line "said to be the"

	para "legendary #MON"
	line "--SUICUNE, ENTEI"
	cont "and RAIKOU."

	para "EUSINE is here, so"
	line "I've decided to"

	para "investigate the"
	line "TOWER with him."
	done

FirebreatherDickSeenText:
	text "Hey, I'm training"
	line "secretly here!"

	para "Don't embarrass me"
	line "by looking!"
	done

FirebreatherDickBeatenText:
	text "I burned down to"
	line "white ashes…"
	done

FirebreatherDickAfterBattleText:
	text "I was so into my"
	line "training that I"
	cont "burned my shoe…"
	done

FirebreatherNedSeenText:
	text "My soul is on"
	line "fire. I'll show"

	para "you how hot it"
	line "burns!"
	done

FirebreatherNedBeatenText:
	text "Still not hot"
	line "enough…"
	done

FirebreatherNedAfterBattleText:
	text "In the past, there"
	line "were these #MON"

	para "that ran through"
	line "grass at super-"
	cont "high speed."

	para "They say that they"
	line "run like the wind."

	para "If you run into"
	line "one in grass, it"
	cont "will likely bolt."
	done

BurnedTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  9, BURNED_TOWER_B1F, 1
	warp_event  7, 15, BURNED_TOWER_B1F, 2

	def_coord_events
	coord_event 11,  9, SCENE_BURNEDTOWER1F_RIVAL_BATTLE, BurnedTowerRivalBattleScript

	def_bg_events
	bg_event  8,  7, BGEVENT_ITEM, BurnedTower1FHiddenEther
	bg_event 13, 11, BGEVENT_ITEM, BurnedTower1FHiddenUltraBall

	def_object_events
	object_event 15,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FRock, -1
	object_event 12, 12, SPRITE_EUSINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BurnedTower1FEusineScript, EVENT_BURNED_TOWER_1F_EUSINE
	object_event  8,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 14, 14, SPRITE_MORTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BurnedTower1FMortyScript, EVENT_BURNED_TOWER_MORTY
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FHPUp, EVENT_BURNED_TOWER_1F_HP_UP
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherDick, -1
	object_event  7,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherNed, -1
	object_event  3, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FRock, -1
