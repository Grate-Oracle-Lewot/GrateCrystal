	object_const_def
	const PEWTERMUSEUM2F_GRAMPS

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum2FGrampsScript:
	faceplayer
	opentext
	writetext MuseumGrampsMoonText
	waitbutton
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext MuseumGrampsPontificateText
	yesorno
	iffalse .SaidNo
	writetext MuseumGrampsSilverWingText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
.SaidNo:
	writetext MuseumGrampsNoText
	waitbutton
.GotSilverWing:
	closetext
	turnobject PEWTERMUSEUM2F_GRAMPS, UP
	end

MoonRockSignScript:
	jumptext MoonRockSignText

MuseumGrampsMoonText:
	text "July 20th, 1969…"
	line "The day man first"

	para "walked on the"
	line "moon!"

	para "I remember watch-"
	line "ing the broadcast"

	para "in awe, wondering"
	line "if I might one"

	para "day set foot there"
	line "myself…"

	para "You never know!"
	line "I've still got"
	cont "some zip left!"
	done

MuseumGrampsPontificateText:
	text "Oh! Pardon me. I"
	line "don't suppose"

	para "you came here to"
	line "hear an old man"
	cont "pontificate."
	done

MuseumGrampsNoText:
	text "I'll let you alone"
	line "now."
	done

MuseumGrampsSilverWingText:
	text "Oho! You've got"
	line "some wit, I see!"

	para "In that case,"
	line "here's another"
	cont "tale…"

	para "Once as a wee lad,"
	line "I was fishing in a"
	cont "little dinghy…"

	para "I got caught in a"
	line "storm and couldn't"

	para "find my way to"
	line "shore…"

	para "Just as a huge"
	line "wave rose above"

	para "me, a #MON's"
	line "attack came out of"

	para "nowhere and froze"
	line "the wave solid!"

	para "I never saw the"
	line "#MON, but I did"

	para "find a strange"
	line "feather in my boat"

	para "when I made it"
	line "back home."

	para "I've carried that"
	line "feather around to"

	para "this very day. But"
	line "I'd like to keep"

	para "the story going."
	line "So…"

	para "Here you go!"
	done

MoonRockSignText:
	text "These meteorites"
	line "impacted near MT."

	para "MOON, and have now"
	line "been positively"

	para "identified as MOON"
	line "STONES."

	para "The historic abun-"
	line "dance of MOON"

	para "STONES gave MT."
	line "MOON its name, but"

	para "no explanation has"
	line "yet been found for"

	para "their propensity"
	line "to land there."
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_1F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  5, BGEVENT_READ, MoonRockSignScript

	def_object_events
	object_event 11,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FGrampsScript, -1
