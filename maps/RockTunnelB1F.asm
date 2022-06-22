	object_const_def
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3
	const ROCKTUNNELB1F_ROCK
	const ROCKTUNNELB1F_YOUNGSTER1
	const ROCKTUNNELB1F_YOUNGSTER2

RockTunnelB1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperThomas:
	trainer CAMPER, THOMAS, EVENT_BEAT_CAMPER_THOMAS, CamperThomasSeenText, CamperThomasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperThomasAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLeroy:
	trainer CAMPER, LEROY, EVENT_BEAT_CAMPER_LEROY, CamperLeroySeenText, CamperLeroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLeroyAfterBattleText
	waitbutton
	closetext
	end

RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_UP

RockTunnelB1FRevive:
	itemball REVIVE

RockTunnelB1FRock:
	jumpstd SmashRockScript

RockTunnelB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

CamperThomasSeenText:
	text "Argh! We're lost!"
	done

CamperThomasBeatenText:
	text "Urgh… This is not"
	line "good…"
	done

CamperThomasAfterBattleText:
	text "This is all"
	line "LEROY's fault…"
	done

CamperLeroySeenText:
	text "ALRIGHT! LET'S DO"
	line "THIS!"
	done

CamperLeroyBeatenText:
	text "AAAAAAAAAAAAAAAAH!"
	done

CamperLeroyAfterBattleText:
	text "AAAAAAAAAAAAAAAAA-"
	line "AAAAAAAAAAAAAAAAH!"
	done

RockTunnelB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROCK_TUNNEL_1F, 6
	warp_event 17,  9, ROCK_TUNNEL_1F, 4
	warp_event 23,  3, ROCK_TUNNEL_1F, 3
	warp_event 25, 23, ROCK_TUNNEL_1F, 5
	warp_event 11, 21, ROCK_TUNNEL_ZAPDOS_CHAMBER, 1

	def_coord_events

	def_bg_events
	bg_event  4, 14, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

	def_object_events
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event  6, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
	object_event 11, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockTunnelB1FRock, -1
	object_event 11,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperThomas, -1
	object_event 10,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperLeroy, -1
