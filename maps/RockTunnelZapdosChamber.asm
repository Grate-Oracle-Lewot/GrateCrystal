	object_const_def
	const ROCKTUNNELZAPDOSCHAMBER_POKE_BALL
	const ROCKTUNNELZAPDOSCHAMBER_SLOWKING
	const ROCKTUNNELZAPDOSCHAMBER_ZAPDOS

RockTunnelZapdosChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppear
	endcallback

.NoAppear:
	disappear ROCKTUNNELZAPDOSCHAMBER_SLOWKING
	disappear ROCKTUNNELZAPDOSCHAMBER_ZAPDOS
	endcallback

RockTunnelZapdosChamberScopeLens:
	itemball SCOPE_LENS

RockTunnelZapdosChamberSlowkingScript:
	jumptext RockTunnelZapdosChamberSlowkingText

RockTunnelZapdosChamberZapdosScript:
	faceplayer
	cry ZAPDOS
	showemote EMOTE_BOLT, ROCKTUNNELZAPDOSCHAMBER_ZAPDOS, 10
	opentext
	writetext ZapdosText
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon ZAPDOS, 50
	startbattle
	disappear ROCKTUNNELZAPDOSCHAMBER_SLOWKING
	disappear ROCKTUNNELZAPDOSCHAMBER_ZAPDOS
	reloadmapafterbattle
	end

RockTunnelZapdosChamberSlowkingText:
	text "SLOWKING: …"

	para "Do you know LT."
	line "SURGE, the LEADER"
	cont "of VERMILION GYM?"

	para "…"

	para "Once, during war,"
	line "he was imprisoned"
	cont "by the enemy…"

	para "…"

	para "When all hope"
	line "seemed lost, a"

	para "lightning bolt"
	line "struck his cell,"
	cont "freeing him…"

	para "…"

	para "On his way out, he"
	line "saw the legendary"

	para "bird of thunder,"
	line "ZAPDOS…"

	para "…"

	para "The bird awaits"
	line "you here…"
	done

ZapdosText:
	text "Burrizoop!"
	done

RockTunnelZapdosChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 29, ROCK_TUNNEL_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelZapdosChamberScopeLens, EVENT_ROCK_TUNNEL_ZAPDOS_CHAMBER_SCOPE_LENS
	object_event 16, 12, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RockTunnelZapdosChamberSlowkingScript, EVENT_ROCK_TUNNEL_ZAPDOS_CHAMBER_ZAPDOS
	object_event 15,  3, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockTunnelZapdosChamberZapdosScript, EVENT_ROCK_TUNNEL_ZAPDOS_CHAMBER_ZAPDOS
