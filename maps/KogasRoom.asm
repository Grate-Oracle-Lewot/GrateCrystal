	object_const_def
	const KOGASROOM_LUCAS

KogasRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .KogasRoomDoors

.LockDoor:
	sdefer .KogasDoorLocksBehindYou
.DummyScene:
	end

.KogasRoomDoors:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

.KogasDoorLocksBehindYou:
	applymovement PLAYER, KogasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

LucasScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue LucasScript_AfterBattle
	writetext LucasScript_LucasBeforeText
	waitbutton
	closetext
	winlosstext LucasScript_LucasBeatenText, 0
	loadtrainer LUCAS, LUCAS1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext LucasScript_LucasDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

LucasScript_AfterBattle:
	writetext LucasScript_LucasDefeatText
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

LucasScript_LucasBeforeText:
	text "Hellooooo…"

	para "I'm LUCAS of the"
	line "ELITE FOUR."

	para "The guy who made"
	line "this hack is my"
	cont "brother."

	para "Oh, and the last"
	line "guy, A.D.? He's"
	cont "our cousin."

	para "Crying nepotism"
	line "won't save you"
	cont "now."

	para "The only way past"
	line "is to beat me!"
	done

LucasScript_LucasBeatenText:
	text "Ravioli, ravioli,"
	line "give me the"
	cont "formuoli!"
	done

LucasScript_LucasDefeatText:
	text "I guess I should"
	line "mention I drew"

	para "the front sprites"
	line "for YANMEGA and"
	cont "WHIMSICOTT."

	para "You'll see both of"
	line "them ahead…"
	cont "Mwahaha…"
	done

KogasRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_LUCAS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LucasScript_Battle, -1
