	object_const_def
	const SEAFOAMCAVEB1F_KAREN
	const SEAFOAMCAVEB1F_MONSTER
	const SEAFOAMCAVEB1F_POKE_BALL

SeafoamCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamCaveB1FKarenScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RED
	iftrue .AfterRedScript
	writetext SeafoamCaveB1FKarenEarlyText
	waitbutton
	closetext
	end

.AfterRedScript
	writetext SeafoamCaveB1FKarenBattleText
	waitbutton
	closetext
	winlosstext SeafoamCaveB1FKarenWinText, SeafoamCaveB1FKarenLossText
	loadtrainer KAREN, KAREN2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext SeafoamCaveB1FKarenThanksForPlayingText
	waitbutton
	closetext
	pause 42
	special HealParty
	refreshscreen
	credits
	end

SeafoamCaveB1FFeraligatrScript:
	opentext
	writetext SeafoamCaveB1FFeraligatrText
	cry FERALIGATR
	pause 10
	waitbutton
	closetext
	end

SeafoamCaveB1FSacredAsh:
	itemball SACRED_ASH

SeafoamCaveB1FHiddenBerryJuice:
	hiddenitem BERRY_JUICE, EVENT_SEAFOAM_CAVE_B1F_HIDDEN_BERRY_JUICE

SeafoamCaveB1FKarenEarlyText:
	text "Oh, hey. I guess"
	line "you found my sec-"
	cont "ret hangout."

	para "If you're still"
	line "here, you must be"

	para "enjoying the hack,"
	line "which is good."

	para "But if you want to"
	line "face me in the"

	para "true final battle,"
	line "you'll have to"

	para "beat RED at MT."
	line "SILVER first."

	para "'Til then… I'll be"
	line "here."
	done

SeafoamCaveB1FKarenBattleText:
	text "I love snow… I"
	line "just had to use"

	para "this tileset for"
	line "my final location."

	para "Erm, anyway, you"
	line "beat RED, huh?"

	para "I'll be honest, I"
	line "didn't think any-"
	cont "one would stick"
	cont "around this long."

	para "Hopefully this"
	line "final battle won't"
	cont "disappoint!"

	para "Here we go!"
	done

SeafoamCaveB1FKarenWinText:
	text "Wow. You did it!"
	done

SeafoamCaveB1FKarenLossText:
	text "Eh, you'll get me"
	line "next time."
	done

SeafoamCaveB1FKarenThanksForPlayingText:
	text "Well. I'm not sure"
	line "what to say."

	para "I put so much work"
	line "into this hack…"

	para "And believe me, it"
	line "wasn't easy."

	para "So the idea that"
	line "anyone would actu-"
	cont "ally play it all"
	cont "the way to the"
	cont "end…"

	para "It means a lot to"
	line "me, you know?"

	para "So… Thank you."

	para "…"

	para "That's all I've"
	line "got, but you can"

	para "still run around"
	line "if you have more"
	cont "you want to do."

	para "But first… the"
	line "third and final"
	cont "credits roll."

	para "…Seriously,"
	line "thanks."
	done

SeafoamCaveB1FFeraligatrText:
	text "FERALIGATR: Zigg!"
	done

SeafoamCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, SEAFOAM_CAVE_1F, 2
	warp_event  3,  1, SEAFOAM_CAVE_B1F, 3
	warp_event 17,  1, SEAFOAM_CAVE_B1F, 2
	warp_event 15,  1, SEAFOAM_CAVE_B1F, 5
	warp_event  9, 33, SEAFOAM_CAVE_B1F, 4

	def_coord_events

	def_bg_events
	bg_event 17, 13, BGEVENT_ITEM, SeafoamCaveB1FHiddenBerryJuice

	def_object_events
	object_event  9, 15, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamCaveB1FKarenScript, -1
	object_event 10, 15, SPRITE_MONSTER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveB1FFeraligatrScript, -1
	object_event  5,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveB1FSacredAsh, EVENT_SEAFOAM_CAVE_B1F_SACRED_ASH
