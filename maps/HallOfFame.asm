	object_const_def
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	def_scene_scripts
	scene_script .EnterHallOfFame ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.EnterHallOfFame:
	sdefer .EnterHallOfFameScript
.DummyScene:
	end

.EnterHallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_FINISHED
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setmapscene SPROUT_TOWER_3F, SCENE_FINISHED
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
if DEF(_LITTLE_CUP)
	halloffame
	end
else
	setval ARTICUNO
	special MonCheck
	iftrue .SkipArticuno
	clearevent EVENT_FOUGHT_ARTICUNO
	clearevent EVENT_ICE_PATH_ARTICUNO_CHAMBER_ARTICUNO
.SkipArticuno:
	setval ZAPDOS
	special MonCheck
	iftrue .SkipZapdos
	clearevent EVENT_FOUGHT_ZAPDOS
	clearevent EVENT_ROCK_TUNNEL_ZAPDOS_CHAMBER_ZAPDOS
.SkipZapdos:
	setval MOLTRES
	special MonCheck
	iftrue .SkipMoltres
	clearevent EVENT_FOUGHT_MOLTRES
	clearevent EVENT_SILVER_CAVE_MOLTRES_CHAMBER_MOLTRES
.SkipMoltres:
	setval MEW
	special MonCheck
	iftrue .SkipMew
	clearevent EVENT_FOUGHT_MEW
	clearevent EVENT_MEW_CHAMBER_MEW
.SkipMew:
	setval HO_OH
	special MonCheck
	iftrue .SkipHoOh
	clearevent EVENT_FOUGHT_HO_OH
	clearevent EVENT_TIN_TOWER_ROOF_HO_OH
.SkipHoOh:
	setval LUGIA
	special MonCheck
	iftrue .SkipLugia
	clearevent EVENT_FOUGHT_LUGIA
	clearevent EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
.SkipLugia:
	setval MEWTWO
	special MonCheck
	iftrue .SkipMewtwo
	clearevent EVENT_FOUGHT_MEWTWO
	clearevent EVENT_LAV_RADIO_TOWER_2F_MEWTWO
	setevent EVENT_LAV_RADIO_TOWER_TAKEOVER
	setflag ENGINE_MEWTWO_RADIO
.SkipMewtwo:
	setval CELEBI
	special MonCheck
	iftrue .SkipCelebi
	clearevent EVENT_FOUGHT_CELEBI
	setevent EVENT_FOREST_IS_RESTLESS
	setflag ENGINE_FOREST_IS_RESTLESS
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
.SkipCelebi:
if DEF(_ADD_MISSINGNO) || DEF(_MISSINGNO_STARTERS) || DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS)
	; don't bother respawning Finull encounter replacements
	; Missingno can be found elsewhere and Turbin builds just give another Celebi
else
	setval FINULL
	special MonCheck
	iftrue .SkipFinull
	checkevent EVENT_FOUGHT_CELEBI
	iffalse .SkipFinull
	clearevent EVENT_FOUGHT_FINULL
.SkipFinull:
endc
	checkevent EVENT_RELEASED_THE_BEASTS
	iffalse .FinishRespawns
	setval RAIKOU
	special MonCheck
	iftrue .SkipRaikou
	special InitRoamingRaikou
.SkipRaikou:
	setval ENTEI
	special MonCheck
	iftrue .SkipEntei
	special InitRoamingEntei
.SkipEntei:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse .FinishRespawns
	setval SUICUNE
	special MonCheck
	iftrue .FinishRespawns
	special InitRoamingSuicune
.FinishRespawns:
	halloffame
	end
endc

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "LANCE: It's been a"
	line "long time since I"
	cont "last came here."

	para "This is where we"
	line "honor the LEAGUE"

	para "CHAMPIONS for all"
	line "eternity."

	para "Their courageous"
	line "#MON are also"
	cont "inducted."

	para "Here today, we"
	line "witnessed the rise"

	para "of a new LEAGUE"
	line "CHAMPION--a"

	para "trainer who feels"
	line "compassion for,"

	para "and trust toward,"
	line "all #MON."

	para "A trainer who"
	line "succeeded through"

	para "perseverance and"
	line "determination."

	para "The new LEAGUE"
	line "CHAMPION who has"

	para "all the makings"
	line "of greatness!"

	para "<PLAY_G>, allow me"
	line "to register you"

	para "and your partners"
	line "as CHAMPIONS!"
	done

HallOfFame_MapEvents:
	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
