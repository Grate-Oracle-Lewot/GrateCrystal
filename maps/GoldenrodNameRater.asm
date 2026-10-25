	object_const_def
	const GOLDENRODNAMERATER_NAME_RATER
	const GOLDENRODNAMERATER_GAMEBOY_KID

GoldenrodNameRater_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodNameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end

GoldenrodNameRaterGameBoyKid:
	jumptextfaceplayer GoldenrodNameRaterGameBoyKidText

GoldenrodNameRaterBookshelf:
	jumpstd DifficultBookshelfScript

GoldenrodNameRaterRadio:
	jumpstd Radio2Script

GoldenrodNameRaterGameBoyKidText:
	text "You can't rename a"
	line "#MON that you"
	cont "get in a trade."

	para "Like my RATICATE,"
	line "“SKIDMARK.”"
	done

GoldenrodNameRater_MapEvents:
	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 8
	warp_event  3,  7, GOLDENROD_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GoldenrodNameRaterBookshelf
	bg_event  1,  1, BGEVENT_READ, GoldenrodNameRaterBookshelf
	bg_event  7,  1, BGEVENT_READ, GoldenrodNameRaterRadio

	def_object_events
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodNameRater, -1
	object_event  4,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodNameRaterGameBoyKid, -1
