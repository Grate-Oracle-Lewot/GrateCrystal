	object_const_def

MountMoonB1F_MapScripts:
	def_scene_scripts

	def_callbacks

MountMoonB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  9, MOUNT_MOON_1F, 2
	warp_event 21,  7, MOUNT_MOON_1F, 3
	warp_event  3,  3, MOUNT_MOON_1F, 4
	warp_event 15, 21, MOUNT_MOON_B2F, 1
	warp_event 13,  9, MOUNT_MOON_B2F, 2
	warp_event 19, 15, MOUNT_MOON_B2F, 3
	warp_event 37, 29, MOUNT_MOON_B2F, 4
	warp_event 17, 31, MOUNT_MOON_B2F, 5
	warp_event  5, 31, MOUNT_MOON_B2F, 6
	warp_event 33, 33, MOUNT_MOON_SQUARE, 1
	warp_event 21, 33, MOUNT_MOON_SQUARE, 2
	warp_event  5, 33, ROUTE_4, 1

	def_coord_events

	def_bg_events

	def_object_events
