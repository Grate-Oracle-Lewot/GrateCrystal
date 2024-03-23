	object_const_def
	const CIANWOODPHOTOSTUDIO_FISHING_GURU

CianwoodPhotoStudio_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	writetext CianwoodPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext CianwoodPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext CianwoodPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

CianwoodPhotoStudioSketchbook:
	jumptext CianwoodPhotoStudioSketchbookText

CianwoodPhotoStudioLandscapeShot:
	jumptext CianwoodPhotoStudioLandscapeShotText

CianwoodPhotoStudioFishingGuruText_Question:
	text "You have magnifi-"
	line "cent #MON with"
	cont "you."

	para "How about a photo"
	line "for a souvenir?"
	done

CianwoodPhotoStudioFishingGuruText_Yes:
	text "OK! Big smile now!"
	done

CianwoodPhotoStudioFishingGuruText_No:
	text "Oh, that's too"
	line "bad. I thought it"

	para "would be a great"
	line "memento…"
	done

CianwoodPhotoStudioSketchbookText:
	text "Based on his"
	line "sketches, there's"

	para "a reason he went"
	line "into photography…"
	done

CianwoodPhotoStudioLandscapeShotText:
	text "It's a beautiful"
	line "landscape shot."
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5
	warp_event  0,  2, CIANWOOD_DARKROOM, 1

	def_coord_events

	def_bg_events
	bg_event  3,  4, BGEVENT_READ, CianwoodPhotoStudioSketchbook
	bg_event  3,  0, BGEVENT_READ, CianwoodPhotoStudioLandscapeShot
	bg_event  5,  0, BGEVENT_READ, CianwoodPhotoStudioLandscapeShot

	def_object_events
	object_event  3,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1
