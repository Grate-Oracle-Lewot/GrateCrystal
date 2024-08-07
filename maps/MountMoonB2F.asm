	object_const_def
	const MOUNTMOONB2F_SUPER_NERD
	const MOUNTMOONB2F_ROCK1
	const MOUNTMOONB2F_ROCK2
	const MOUNTMOONB2F_POKE_BALL

MountMoonB2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSuperNerdNeil:
	trainer SUPER_NERD, NEIL, EVENT_BEAT_SUPER_NERD_NEIL, SuperNerdNeilSeenText, SuperNerdNeilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdNeilAfterBattleText
	waitbutton
	closetext
	end

MountMoonB2FStarPiece:
	itemball STAR_PIECE

MountMoonB2FRock:
	jumpstd SmashRockScript

SuperNerdNeilSeenText:
	text "You've set off a"
	line "time bomb!"
	done

SuperNerdNeilBeatenText:
	text "Kablooie!"
	done

SuperNerdNeilAfterBattleText:
	text "Sometimes people"
	line "find fossils here."

	para "Try smashing"
	line "rocks!"
	done

MountMoonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19, 29, MOUNT_MOON_B1F, 4
	warp_event 29, 13, MOUNT_MOON_B1F, 5
	warp_event 25, 21, MOUNT_MOON_B1F, 6
	warp_event 33,  7, MOUNT_MOON_B1F, 7
	warp_event 29, 27, MOUNT_MOON_B1F, 8
	warp_event  9, 11, MOUNT_MOON_B1F, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event 15, 22, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSuperNerdNeil, -1
	object_event 17, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB2FRock, -1
	object_event 18, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB2FRock, -1
	object_event 24, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, MountMoonB2FStarPiece, EVENT_MOUNT_MOON_B2F_STAR_PIECE
