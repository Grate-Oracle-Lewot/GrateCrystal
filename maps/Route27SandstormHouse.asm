	object_const_def
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	writetext SandstormHouseWomanText1
	promptbutton
	special GetFirstPokemonHappiness
	ifgreater 190 - 1, .Loyal
	writetext SandstormHouseWomanDisloyalText
.EndText:
	waitbutton
.Done:
	closetext
	end

.Loyal:
	writetext SandstormHouseWomanLoyalText
	promptbutton
.CheckIcePunch:
	checkevent EVENT_GOT_ICE_PUNCH_FROM_SANDSTORM_LADY
	iftrue .CheckThunderpunch
	verbosegiveitem TM_ICE_PUNCH, 5
	iffalse .CheckThunderpunch
	setevent EVENT_GOT_ICE_PUNCH_FROM_SANDSTORM_LADY
.CheckThunderpunch:
	checkevent EVENT_GOT_THUNDERPUNCH_FROM_SANDSTORM_LADY
	iftrue .CheckFirePunch
	verbosegiveitem TM_THUNDERPUNCH, 5
	iffalse .CheckFirePunch
	setevent EVENT_GOT_THUNDERPUNCH_FROM_SANDSTORM_LADY
.CheckFirePunch:
	checkevent EVENT_GOT_FIRE_PUNCH_FROM_SANDSTORM_LADY
	iftrue .AlreadyGotAllPunches
	verbosegiveitem TM_FIRE_PUNCH, 5
	iffalse .Done
	setevent EVENT_GOT_FIRE_PUNCH_FROM_SANDSTORM_LADY
.AlreadyGotAllPunches:
	writetext SandstormHouseSandstormDescription
	sjump .EndText

SandstormHouseBookshelf:
	jumpstd MagazineBookshelfScript

SandstormHouseWomanText1:
	text "Where are you off"
	line "to with #MON?"

	para "#MON LEAGUE?"

	para "Are your #MON"
	line "loyal enough for"
	cont "you to win?"

	para "Let me see…"
	done

SandstormHouseWomanLoyalText:
	text "Ah! Your #MON"
	line "trusts you very"
	cont "much."

	para "It's nice to see a"
	line "good trainer."

	para "Here. These will"
	line "come in handy."
	done

SandstormHouseSandstormDescription:
	text "The elemental pun-"
	line "ches aren't the"

	para "strongest attacks,"
	line "but they're useful"
	cont "physical coverage."

	para "A trainer like you"
	line "should know what"
	cont "to do with them."
	done

SandstormHouseWomanDisloyalText:
	text "If it doesn't come"
	line "to trust you some"

	para "more, it could be"
	line "tough going."

	para "Trust is the tie"
	line "that binds #MON"
	cont "and trainers."
	done

Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_LOTUS_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
