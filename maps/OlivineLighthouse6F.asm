	object_const_def
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_AMPHY1
	const OLIVINELIGHTHOUSE6F_AMPHY2
	const OLIVINELIGHTHOUSE6F_POKE_BALL

OlivineLighthouse6F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Amphy

.Amphy:
	disappear OLIVINELIGHTHOUSE6F_AMPHY1
	disappear OLIVINELIGHTHOUSE6F_AMPHY2
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .Healed
	appear OLIVINELIGHTHOUSE6F_AMPHY1
	endcallback

.Healed:
	appear OLIVINELIGHTHOUSE6F_AMPHY2
	endcallback

OlivineLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue .ExplainedSickness
	writetext JasmineCianwoodPharmacyText
	promptbutton
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
.ExplainedSickness:
	writetext JasmineGetSomeMedicineText
	waitbutton
	closetext
	end

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .Refused
	writetext PlayerHandedSecretpotionText
	promptbutton
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_AMPHY1, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	appear OLIVINELIGHTHOUSE6F_AMPHY2
	disappear OLIVINELIGHTHOUSE6F_AMPHY1
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	showemote EMOTE_BOLT, OLIVINELIGHTHOUSE6F_AMPHY2, 15
	special FadeOutPalettes
	pause 10
	special FadeInPalettes
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_AMPHY2, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_AMPHY2, LEFT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_AMPHY2, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_AMPHY2, LEFT
	pause 10
	opentext
	writetext JasmineRelievedText
	promptbutton
	readvar VAR_FACING
	ifequal DOWN, .TurnJasmineUp
	ifequal RIGHT, .TurnJasmineLeft
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, DOWN
	sjump .DoneFacing

.TurnJasmineUp:
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, UP
	sjump .DoneFacing

.TurnJasmineLeft:
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, LEFT
.DoneFacing:
	writetext JasmineThankYouText
	setevent EVENT_DECO_CARPET_3
	playsound SFX_2ND_PLACE
	waitsfx
	writetext JasmineYellowCarpetText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	readvar VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesUpMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingDown:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesDownMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesRightMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.Refused:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_AMPHY1, LEFT
	opentext
	writetext JasmineAmphyHangOnText
	waitbutton
	closetext
	end

OlivineLighthouseAmphy:
	faceplayer
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	setval AMPHAROS
	special PlaySlowCry
	showemote EMOTE_SAD, OLIVINELIGHTHOUSE6F_AMPHY1, 15
	opentext
	writetext AmphyPalPalooText
	promptbutton
	writetext AmphyBreathingLaboredText
	waitbutton
	closetext
	end

.HealthyNow:
	cry AMPHAROS
	showemote EMOTE_BOLT, OLIVINELIGHTHOUSE6F_AMPHY2, 15
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

OlivineLighthouseJasmineLeavesUpMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

OlivineLighthouseJasmineLeavesDownMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

OlivineLighthouseJasmineLeavesRightMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

JasmineCianwoodPharmacyText:
	text "JASMINE: …This"
	line "#MON always"

	para "kept the sea lit"
	line "at night."

	para "…But it suddenly"
	line "got sick… It's"
	cont "gasping for air…"

	para "…I understand"
	line "that there is a"

	para "wonderful PHARMACY"
	line "in CIANWOOD…"

	para "But that's across"
	line "the sea…"

	para "And I can't leave"
	line "AMPHY unattended…"
	done

JasmineGetSomeMedicineText:
	text "…May I ask you to"
	line "get some medicine"
	cont "for me? Please?"
	done

JasmineCureAmphyText:
	text "JASMINE: …Will"
	line "that medicine cure"
	cont "AMPHY?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> handed the"
	line "SECRETPOTION to"
	cont "JASMINE."
	done

JasmineDontBeOffendedText:
	text "JASMINE: …Um,"
	line "please don't be"
	cont "offended…"

	para "…AMPHY will not"
	line "take anything from"
	cont "anyone but me…"
	done

JasmineAmphyHowAreYouFeelingText:
	text "JASMINE: …"

	para "AMPHY, how are you"
	line "feeling?"
	done

JasmineRelievedText:
	text "JASMINE: …Oh, I'm"
	line "so relieved…"

	para "This is just so"
	line "wonderful…"
	done

JasmineThankYouText:
	text "Thank you so very,"
	line "very much."

	para "Please, take this…"

	para "<PLAYER> received"
	line "YELLOW CARPET!"
	done

JasmineYellowCarpetText:
	text "<PLAYER> sent the"
	line "decoration home."

	para "JASMINE: …I will"
	line "return to the GYM…"
	done

JasmineISeeText:
	text "JASMINE: …I see…"
	done

JasmineAmphyHangOnText:
	text "…AMPHY, hang on!"
	done

AmphyPalPalooText:
	text "AMPHY: …"
	line "…Pa… paloo…"
	done

AmphyBreathingLaboredText:
	text "Its breathing is"
	line "terribly labored…"
	done

AmphyPaluPaluluText:
	text "AMPHY: Palu!"
	line "Palulu!"
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_5F, 6
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_5F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseJasmine, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, EVENT_OLIVINE_LIGHTHOUSE6F_AMPHY_SICK
	object_event  9,  8, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, EVENT_OLIVINE_LIGHTHOUSE6F_AMPHY_HEALTHY
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
