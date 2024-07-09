	object_const_def
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3
	const SILVERCAVEROOM2_CAL
	const SILVERCAVEROOM2_SUPER_NERD

SilverCaveRoom2_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveRoom2Calcium:
	itemball CALCIUM

SilverCaveRoom2UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom2PPUp:
	itemball PP_UP

TrainerFred:
	trainer CAL, FRED, EVENT_BEAT_TRAINER_FRED, TrainerFredSeenText, TrainerFredBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TrainerFredAfterBattleText
	waitbutton
	closetext
	end

TrainerMysticalmanRico:
	trainer MYSTICALMAN, RICO, EVENT_BEAT_MYSTICALMAN_RICO, MysticalmanRicoSeenText, MysticalmanRicoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MysticalmanRicoAfterBattleText
	waitbutton
	closetext
	end

TrainerMysticalmanGrover:
	trainer MYSTICALMAN, GROVER, EVENT_BEAT_MYSTICALMAN_GROVER, MysticalmanGroverSeenText, MysticalmanGroverBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MysticalmanGroverAfterBattleText
	waitbutton
	closetext
	end

SilverCaveRoom2HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION

TrainerFredSeenText:
	text "Why does everyone"
	line "say my #MON are"
	cont "overpowered?"
	done

TrainerFredBeatenText:
	text "See? They're not"
	line "that strong!"
	done

TrainerFredAfterBattleText:
	text "There's nothing"
	line "wrong with using"
	cont "legendaries."
	done

MysticalmanRicoSeenText:
	text "Some #MON are"
	line "just stronger than"
	cont "others."

	para "I'll show you!"
	done

MysticalmanRicoBeatenText:
	text "Eh… whatever."
	done

MysticalmanRicoAfterBattleText:
	text "I guess all #-"
	line "MON can be strong."
	done

MysticalmanGroverSeenText:
	text "Follow your heart"
	line "to victory!"
	done

MysticalmanGroverBeatenText:
	text "What a marvelous"
	line "performance!"
	done

MysticalmanGroverAfterBattleText:
	text "You can accomplish"
	line "anything!"
	done

SilverCaveRoom2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 31, SILVER_CAVE_ROOM_1, 2
	warp_event 11,  5, SILVER_CAVE_ROOM_3, 1
	warp_event 13, 21, SILVER_CAVE_ITEM_ROOMS, 1
	warp_event 23,  3, SILVER_CAVE_ITEM_ROOMS, 2

	def_coord_events

	def_bg_events
	bg_event 14, 31, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion

	def_object_events
	object_event 24, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
	object_event  9, 16, SPRITE_CAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFred, -1
	object_event 24,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerMysticalmanRico, -1
	object_event  3, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerMysticalmanGrover, -1
