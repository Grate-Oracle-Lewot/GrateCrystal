	object_const_def
	const CINNABARPOKECENTER1F_NURSE
	const CINNABARPOKECENTER1F_SAILOR

CinnabarPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Sailor

.Sailor:
	disappear CINNABARPOKECENTER1F_SAILOR
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .Done
	checkevent EVENT_GOT_OLD_ROD
	iftrue .CheckBalls
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .CheckBalls
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .CheckBalls
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .CheckBalls
.Appear:
	appear CINNABARPOKECENTER1F_SAILOR
	endcallback

.CheckBalls:
	checkitem MASTER_BALL
	iftrue .Done
	checkitem ULTRA_BALL
	iftrue .Done
	checkitem GREAT_BALL
	iftrue .Done
	checkitem TIMER_BALL
	iftrue .Done
	checkitem DUSK_BALL
	iftrue .Done
	checkitem HEAVY_BALL
	iftrue .Done
	checkitem LEVEL_BALL
	iftrue .Done
	checkitem LURE_BALL
	iftrue .Done
	checkitem FAST_BALL
	iftrue .Done
	checkitem FRIEND_BALL
	iftrue .Done
	checkitem MOON_BALL
	iftrue .Done
	checkitem LOVE_BALL
	iftrue .Done
	checkitem POKE_BALL
	iffalse .Appear
.Done:
	endcallback

CinnabarPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CinnabarPokecenterSailorScript:
	faceplayer
	opentext
	writetext CinnabarPokecenterSailorText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 10
	playsound SFX_CALL
	waitsfx
	playsound SFX_CALL
	waitsfx
	pause 20
	playsound SFX_BOAT
	pause 30
	playsound SFX_ENTER_DOOR
	waitsfx
	pause 10
	warp VERMILION_PORT, 7, 10
	end

CinnabarPokecenterSailorText:
	text "Marooned, are ye?"

	para "I'll call the"
	line "rescue party."
	done

CinnabarPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CINNABAR_ISLAND, 1
	warp_event  4,  7, CINNABAR_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FNurseScript, -1
	object_event  7,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenterSailorScript, EVENT_CINNABAR_POKECENTER_SAILOR
