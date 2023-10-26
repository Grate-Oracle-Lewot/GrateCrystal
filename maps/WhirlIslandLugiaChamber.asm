	object_const_def
	const WHIRLISLANDLUGIACHAMBER_LUGIA
	const WHIRLISLANDLUGIACHAMBER_SLOWKING

WhirlIslandLugiaChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Lugia

.Lugia:
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .NoAppear
	checkitem SILVER_WING
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear WHIRLISLANDLUGIACHAMBER_LUGIA
	endcallback

.NoAppear:
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	endcallback

Lugia:
	faceplayer
	opentext
	writetext LugiaText
	cry LUGIA
	pause 15
	closetext
	setevent EVENT_FOUGHT_LUGIA
	takeitem SILVER_WING
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon LUGIA, 64
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	reloadmapafterbattle
	end

WhirlIslandLugiaChamberSlowkingScript:
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .AfterLugiaScript
	checkitem SILVER_WING
	iftrue .DuringLugiaScript
	jumptext WhirlIslandLugiaChamberSlowkingBeforeText

.DuringLugiaScript
	jumptext WhirlIslandLugiaChamberSlowkingDuringText

.AfterLugiaScript
	jumptext WhirlIslandLugiaChamberSlowkingAfterText

LugiaText:
	text "Gyaaas!"
	done

WhirlIslandLugiaChamberSlowkingBeforeText:
	text "SLOWKING: …"

	para "The master of the"
	line "legendary birds,"
	cont "LUGIA…"

	para "…"

	para "It dwells here…"
	line "But it will only"

	para "appear before you"
	line "if you have some-"
	cont "thing with its"
	cont "scent…"

	para "…"

	para "You may not find"
	line "such a thing in"
	cont "this region…"
	done

WhirlIslandLugiaChamberSlowkingDuringText:
	text "SLOWKING: …"

	para "The master of the"
	line "legendary birds,"
	cont "LUGIA…"

	para "…"

	para "It has appeared"
	line "here for you…"

	para "…"

	para "Do as you will…"
	done

WhirlIslandLugiaChamberSlowkingAfterText:
	text "SLOWKING: …"

	para "I lost big at the"
	line "GAME CORNER, so"

	para "I'm hiding out"
	line "here…"

	para "…"

	para "Please don't tell…"
	done

WhirlIslandLugiaChamberSlowkingRareCandySellText:
	text "SLOWKING: …"

	para "Hey, uh, could you"
	line "do me a favor…?"

	para "…"

	para "If you give me"
	line "¥999999, I'll give"
	cont "you 99 RARE"
	cont "CANDIES…"

	para "…"

	para "What do you say?"
	done

WhirlIslandLugiaChamberSlowkingRareCandyRefusedText:
	text "…Oh… okay…"
	done

WhirlIslandLugiaChamberSlowkingRareCandyNoRoomText:
	text "…Oh… you can't"
	line "carry them…"
	done

WhirlIslandLugiaChamberSlowkingRareCandyBoughtText:
	text "…Thanks, kid…"
	done

WhirlIslandLugiaChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, WHIRL_ISLAND_B2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  5, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	object_event 11, 12, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WhirlIslandLugiaChamberSlowkingScript, -1
