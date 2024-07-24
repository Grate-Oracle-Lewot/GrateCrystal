	object_const_def
	const MOUNTMOONB2F_ROCK1
	const MOUNTMOONB2F_ROCK2

MountMoonB2F_MapScripts:
	def_scene_scripts

	def_callbacks

MountMoonB2FRock:
	jumpstd SmashRockScript

MountMoonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 25, MOUNT_MOON_B1F, 4
	warp_event 25,  9, MOUNT_MOON_B1F, 5
	warp_event 21, 17, MOUNT_MOON_B1F, 6
	warp_event 29,  3, MOUNT_MOON_B1F, 7
	warp_event 25, 23, MOUNT_MOON_B1F, 8
	warp_event  5,  7, MOUNT_MOON_B1F, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB2FRock, -1
	object_event 14,  5, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonB2FRock, -1
