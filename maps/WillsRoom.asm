	object_const_def
	const WILLSROOM_A_D

WillsRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .WillsRoomDoors

.LockDoor:
	sdefer .WillsDoorLocksBehindYou
.DummyScene:
	end

.WillsRoomDoors:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

.WillsDoorLocksBehindYou:
	applymovement PLAYER, WillsRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

ADScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue ADScript_AfterBattle
	writetext ADScript_ADBeforeText
	waitbutton
	closetext
	winlosstext ADScript_ADBeatenText, 0
	loadtrainer A_D, A_D1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opentext
	writetext ADScript_ADDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	waitsfx
	end

ADScript_AfterBattle:
	writetext ADScript_ADDefeatText
	waitbutton
	closetext
	end

WillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

ADScript_ADBeforeText:
	text "Oh… hey. A"
	line "challenger, huh?"

	para "Call me A.D. I"
	line "like the mystery"
	cont "of initials."

	para "Our ELITE FOUR"
	line "doesn't use type"
	cont "specialties."

	para "You'll have to be"
	line "adaptable to win."

	para "Anyway, buy my"
	line "book, THE CARDS OF"
	cont "CHAOS, on KINDLE."

	para "Hm? Oh, fine, we"
	line "can take care of"
	cont "the battle first."

	para "Um…"
	line "Hiya?"
	done

ADScript_ADBeatenText:
	text "Nice job. Now,"
	line "about my book…"
	done

ADScript_ADDefeatText:
	text "I've got some more"
	line "books in the"

	cont "works, like THE"
	cont "MOON HOUSE and"
	cont "DREAMSEA."

	para "Depending on when"
	line "you're playing"

	para "this, they might"
	line "be out already."

	para "Just remember the"
	line "name: A.D. JANSEN."
	done

WillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_A_D, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ADScript_Battle, -1
