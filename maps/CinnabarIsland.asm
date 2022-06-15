	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "Who are you"
	line "supposed to be?"

	para "…A strong trainer"
	line "from JOHTO? Ha!"

	para "I'll buy the JOHTO"
	line "part, anyway."

	para "Well big shot, I'm"
	line "BLUE, the LEADER"
	cont "of VIRIDIAN GYM."

	para "I'm investigating"
	line "what happened"
	cont "here…"

	para "Word is, the lab"
	line "on CINNABAR had"

	para "created a new"
	line "#MON, but it"

	para "went rogue and"
	line "destroyed the"
	cont "whole town!"

	para "I doubt it's true,"
	line "but either way"

	para "there's not much"
	line "evidence left."

	para "I'm late to the"
	line "party, anyway."

	para "This all went down"
	line "a few years ago,"

	para "shortly after that"
	line "meddling RED"

	para "prematurely ended"
	line "my run as CHAMP."

	para "Look, what say we"
	line "ditch this scene"

	para "and head back to"
	line "my GYM?"

	para "Meet me in VIR-"
	line "IDIAN, and we'll"

	para "find out how"
	line "strong you really"
	cont "are!"
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "CINNABAR GYM has"
	line "relocated to SEA-"
	cont "FOAM ISLANDS."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "CINNABAR ISLAND"

	para "The Fiery Town of"
	line "Burning Desire"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
