	object_const_def
	const SILVERCAVEITEMROOMS_KRIS
	const SILVERCAVEITEMROOMS_POKE_BALL1
	const SILVERCAVEITEMROOMS_POKE_BALL2

SilverCaveItemRooms_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCalla:
	trainer CAL_F, CALLA, EVENT_BEAT_TRAINER_CALLA, TrainerCallaSeenText, TrainerCallaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TrainerCallaAfterBattleText
	waitbutton
	closetext
	end

SilverCaveItemRoomsMaxRevive:
	itemball MAX_REVIVE

SilverCaveItemRoomsFullRestore:
	itemball FULL_RESTORE

TrainerCallaSeenText:
	text "I feel like I've"
	line "seen you before…"
	done

TrainerCallaBeatenText:
	text "That's that."
	done

TrainerCallaAfterBattleText:
	text "Maybe we're long-"
	line "lost relatives."
	done

SilverCaveItemRooms_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  3, SILVER_CAVE_ROOM_2, 3
	warp_event  7, 15, SILVER_CAVE_ROOM_2, 4
	warp_event  5,  9, SILVER_CAVE_MOLTRES_CHAMBER, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 10, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCalla, -1
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsMaxRevive, EVENT_SILVER_CAVE_ITEM_ROOMS_MAX_REVIVE
	object_event 15, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsFullRestore, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
