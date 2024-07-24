	object_const_def
	const MOUNTMOON_SILVER

MountMoon_MapScripts:
	def_scene_scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.RivalEncounter:
	sdefer .RivalBattle
	end

.DummyScene:
	end

.RivalBattle:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, 0
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, 0
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, 0
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonSilverMovementBefore:
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonSilverMovementAfter:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MountMoonSilverTextBefore:
	text "DON'T MEET FOR"
	line "A LONG TIME."
	cont "SINCE I WAS"
	cont "DEFEATED BY YOU,"
	cont "I KNEW MY LACK,"
	cont "BUT NOT WHERE"
	cont "IT IS."
	cont "I THOUGHT IT A"
	cont "LONG TIME WITH"
	cont "THEM,"
	cont "FINALLY I FOUND"
	cont "IT.DO YOU WANT"
	cont "TO KNOW?"

	para "I LET YOU"

	para " "
	line "SEE NOW"
	done

MountMoonSilverTextWin:
	text "THE AIM OF"
	line "TRAIN THE ELFS IS"
	cont "TO EXERT THEIR"
	cont "STRENGTH AT MOST,"
	cont "IT SEEM THAT THE"
	cont "TEACHING IS"
	cont "NOT ENOUGH"
	done

MountMoonSilverTextAfter:
	text "ACTUALLY I LOSE,"
	line "I ADMIT IT."
	cont "BUT DON'T FORGET"
	cont "IT SIMPLY."

	para "ONE DAY I WILL"

	para " "
	line "LET YOU KNOW"
	cont "I'M THE STRONGEST"
	cont "COACH,THE FELLOWS"
	cont "WILL CONSORT WITH"
	cont "ME.LISTEN,ONE"
	cont "DAY I WILL BEAT"
	cont "YOU DOWN,"
	cont "AND LET YOU"
	cont "KNOW MY STRENGTH"
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 33, ROUTE_3, 1
	warp_event 25, 15, MOUNT_MOON_B1F, 1
	warp_event 17, 11, MOUNT_MOON_B1F, 2
	warp_event  5,  5, MOUNT_MOON_B1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15, 29, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
