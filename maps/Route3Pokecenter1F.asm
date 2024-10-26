	object_const_def
	const ROUTE3POKECENTER1F_NURSE
	const ROUTE3POKECENTER1F_CHANSEY
	const ROUTE3POKECENTER1F_GAMEBOY_KID
	const ROUTE3POKECENTER1F_LASS

Route3Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_MT_MOON
	endcallback

Route3Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route3Pokecenter1FChanseyScript:
	jumpstd PokecenterChanseyScript

Route3Pokecenter1FGameboyKidScript:
	faceplayer
	opentext
	writetext Route3Pokecenter1FGameboyKidText
	waitbutton
	closetext
	turnobject ROUTE3POKECENTER1F_GAMEBOY_KID, DOWN
	end

Route3Pokecenter1FLassScript:
	jumptextfaceplayer Route3Pokecenter1FLassText

Route3Pokecenter1FGameboyKidText:
	text "I'm trying to make"
	line "my own hack."

	para "But it's really"
	line "hard…"
	done

Route3Pokecenter1FLassText:
	text "This #MON CEN-"
	line "TER got rebuilt"
	cont "recently."

	para "It's got that new"
	line "building smell!"
	done

Route3Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_3, 2
	warp_event  4,  7, ROUTE_3, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FNurseScript, -1
	object_event  4,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FChanseyScript, -1
	object_event  7,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FGameboyKidScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FLassScript, -1
