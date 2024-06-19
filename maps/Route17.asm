	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4
	const ROUTE17_BIKER5
	const ROUTE17_BIKER6
	const ROUTE17_CHRIS_BIKE

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike
	callback MAPCALLBACK_OBJECTS, .CheckLucas

.AlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

.CheckLucas:
	disappear ROUTE17_CHRIS_BIKE
	checkevent EVENT_FOUND_LUCAS_ON_CYCLING_ROAD
	iffalse .AppearLucas
	endcallback

.AppearLucas:
	appear ROUTE17_CHRIS_BIKE
	endcallback

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerBenny:
	trainer BIKER, BIKER_BENNY, EVENT_BEAT_BIKER_BENNY, BikerBennySeenText, BikerBennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerKazu:
	trainer BIKER, KAZU, EVENT_BEAT_BIKER_KAZU, BikerKazuSeenText, BikerKazuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerKazuAfterBattleText
	waitbutton
	closetext
	end

Route17KogaScript:
	faceplayer
	opentext
	writetext Route17KogaIntroText
	promptbutton
	checkevent EVENT_FOUND_PERCY_ON_ROUTE_4
	iftrue .FoundPercy
	writetext Route17KogaNoPercyText
	sjump .Continue

.FoundPercy:
	writetext Route17KogaFoundPercyText
.Continue:
	promptbutton
	writetext Route17KogaOutroText
	waitbutton
	closetext
	playsound SFX_EMBER
	applymovement ROUTE17_CHRIS_BIKE, Route17KogaTeleport
	disappear ROUTE17_CHRIS_BIKE
	setevent EVENT_FOUND_LUCAS_ON_CYCLING_ROAD
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

Route17KogaTeleport:
	teleport_from
	step_end

BikerRileySeenText:
	text "Hey, you! You're"
	line "from JOHTO, huh?"
	done

BikerRileyBeatenText:
	text "Whoa, you kick!"
	done

BikerRileyAfterBattleText:
	text "Don't get cocky,"
	line "you JOHTO punk!"
	done

BikerJoelSeenText:
	text "Wow. That's a cool"
	line "BICYCLE!"
	done

BikerJoelBeatenText:
	text "But you don't just"
	line "look cool…"
	done

BikerJoelAfterBattleText:
	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done

BikerGlennSeenText:
	text "Hey! Want to have"
	line "a speed battle?"
	done

BikerGlennBeatenText:
	text "Yikes! You've got"
	line "awesome torque!"
	done

BikerGlennAfterBattleText:
	text "Hands-free riding"
	line "is considered cool"
	cont "on CYCLING ROAD."
	done

BikerCharlesSeenText:
	text "I'm a heartbreak-"
	line "er… My name…"
	cont "CHARLES."

	para "I'm always at full"
	line "throttle."
	done

BikerCharlesBeatenText:
	text "I'm a heartbreak-"
	line "er… My name…"
	cont "CHARLES."
	done

BikerCharlesAfterBattleText:
	text "I'm a heartbreak-"
	line "er… My name…"
	cont "CHARLES."

	para "Riding a bike and"
	line "becoming the wind"

	para "fits a bad boy"
	line "like me."
	done

BikerBennySeenText:
	text "Va-va-va-vroom!"
	done

BikerBennyBeatenText:
	text "Peal out!"
	done

BikerBennyAfterBattleText:
	text "I started out on a"
	line "tricycle."
	done

BikerKazuSeenText:
	text "You should be wea-"
	line "ring a helmet!"
	done

BikerKazuBeatenText:
	text "You popped my"
	line "tire!"
	done

BikerKazuAfterBattleText:
	text "BIKE safety is"
	line "important!"
	done

Route17KogaIntroText:
	text "LUCAS: What's up?"
	done

Route17KogaNoPercyText:
	text "You found me, but"
	line "you still have to"
	cont "find PERCY."

	para "At least, if you"
	line "want to get into"
	cont "that…"
	done

Route17KogaFoundPercyText:
	text "You found both of"
	line "us, so now you can"
	cont "go into that…"
	done

Route17KogaOutroText:
	text "SECRET TUNNEEEEEL!"

	para "…In the SEAFOAM"
	line "ISLANDS."

	para "Rocket bike,"
	line "activate!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	def_object_events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
	object_event 14,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerBenny, -1
	object_event 18, 34, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerKazu, -1
	object_event 18, 10, SPRITE_CHRIS_BIKE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17KogaScript, EVENT_ROUTE_17_LUCAS
