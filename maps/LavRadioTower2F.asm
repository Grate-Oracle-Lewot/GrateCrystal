	object_const_def
	const LAVRADIOTOWER2F_OFFICER
	const LAVRADIOTOWER2F_MEWTWO

LavRadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Mewtwo

.Mewtwo:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .NoAppear
	endcallback

.NoAppear:
	disappear LAVRADIOTOWER2F_MEWTWO
	endcallback

LavRadioTower2FOfficerScript:
	jumptextfaceplayer LavRadioTower2FOfficerText

LavRadioTower2FMewtwoScript:
	faceplayer
	opentext
	writetext LavRadioTower2FMewtwoText
	waitbutton
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	clearflag ENGINE_MEWTWO_RADIO
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MEWTWO, 75
	startbattle
	disappear LAVRADIOTOWER2F_MEWTWO
	reloadmapafterbattle
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp LAVENDER_TOWN, 14, 6
	end

LavRadioTower2FDirectory:
	jumptext LavRadioTower2FDirectoryText

LavRadioTower2FOfficerText:
	text "…"
	done

LavRadioTower2FUnown1Text:
	text "OUR MASTER AWAITS"
	line "YOU HERE"
	done

LavRadioTower2FUnown2Text:
	text "THE HUMANS HERE"
	line "WILL NOT BE HARMED"
	done

LavRadioTower2FUnown3Text:
	text "OUR MASTER WISHES"
	line "TO BATTLE YOU"
	done

LavRadioTower2FUnown4Text:
	text "YOU HAVE BEEN"
	line "CHOSEN BY OUR"
	cont "MASTER"
	done

LavRadioTower2FMewtwoText:
	text "MEWTWO: I've been"
	line "waiting for you."

	para "Through countless"
	line "trials, you have"
	cont "proven your worth."

	para "I was created in"
	line "the laboratory on"

	para "CINNABAR, and have"
	line "struggled to find"
	cont "my purpose."

	para "After how I was"
	line "treated by those"

	para "scientists, I am"
	line "reluctant to sub-"
	cont "mit to a human."

	para "But you have shown"
	line "compassion toward"
	cont "all #MON."

	para "If you can capture"
	line "me, I will accept"
	cont "you as my trainer."

	para "Let us begin."
	done

LavRadioTower2FDirectoryText:
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done

LavRadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  2, LAV_RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  2, BGEVENT_READ, LavRadioTower2FDirectory

	def_object_events
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower2FOfficerScript, -1
	object_event 10,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LavRadioTower2FMewtwoScript, EVENT_LAV_RADIO_TOWER_2F_MEWTWO
