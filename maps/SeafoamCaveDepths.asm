	object_const_def
	const SEAFOAMCAVEDEPTHS_LEWOT
	const SEAFOAMCAVEDEPTHS_MONSTER
	const SEAFOAMCAVEDEPTHS_POKE_BALL
	const SEAFOAMCAVEDEPTHS_OAK1
	const SEAFOAMCAVEDEPTHS_OAK2

SeafoamCaveDepths_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Setup

.Setup:
	disappear SEAFOAMCAVEDEPTHS_OAK1
	disappear SEAFOAMCAVEDEPTHS_OAK2
	appear SEAFOAMCAVEDEPTHS_MONSTER
	endcallback

SeafoamCaveDepthsLewotScript:
	faceplayer
	checkevent EVENT_BEAT_RED
	iftrue .AfterRedScript
	showemote EMOTE_SLEEP, SEAFOAMCAVEDEPTHS_LEWOT, 30
	opentext
	writetext SeafoamCaveDepthsLewotEarlyText
	waitbutton
	closetext
	end

.AfterRedScript:
	opentext
	writetext SeafoamCaveDepthsLewotBattleText
	waitbutton
	closetext
	winlosstext SeafoamCaveDepthsLewotWinText, 0
	loadtrainer GRATE_ORACLE, LEWOT2
	startbattle
	disappear SEAFOAMCAVEDEPTHS_MONSTER
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext SeafoamCaveDepthsLewotThanksForPlayingText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, SEAFOAMCAVEDEPTHS_LEWOT, 10
	playmusic MUSIC_PROF_OAK
	appear SEAFOAMCAVEDEPTHS_OAK1
	applymovement SEAFOAMCAVEDEPTHS_OAK1, SeafoamCaveDepthsMovementData_OakWalksUp
	turnobject PLAYER, RIGHT
	opentext
	writetext SeafoamCaveDepthsOakCongratulationsText
	waitbutton
	closetext
	special FadeOutMusic
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 10
	appear SEAFOAMCAVEDEPTHS_OAK2
	playsound SFX_PSYBEAM
	waitsfx
	special FadeInQuickly
	turnobject SEAFOAMCAVEDEPTHS_OAK1, DOWN
	turnobject PLAYER, DOWN
	opentext
	writetext SeafoamCaveDepthsOakWhoAreYouText
	waitbutton
	writetext SeafoamCaveDepthsPoisonOakFufuText
	waitbutton
	writetext SeafoamCaveDepthsOakItCantBeText
	waitbutton
	writetext SeafoamCaveDepthsPoisonOakGivePokemonText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SEAFOAMCAVEDEPTHS_OAK1, 5
	showemote EMOTE_SHOCK, SEAFOAMCAVEDEPTHS_LEWOT, 10
	opentext
	writetext SeafoamCaveDepthsLewotCutOutOfScriptText
	waitbutton
	writetext SeafoamCaveDepthsPoisonOakButYouDidntText
	waitbutton
	closetext
	applymovement SEAFOAMCAVEDEPTHS_OAK2, SeafoamCaveDepthsMovementData_PoisonOak
	opentext
	writetext SeafoamCaveDepthsPoisonOakChampionText
	waitbutton
	closetext
	turnobject SEAFOAMCAVEDEPTHS_OAK1, LEFT
	opentext
	writetext SeafoamCaveDepthsOakBlitherText
	waitbutton
	writetext SeafoamCaveDepthsLewotUpToYouText
	waitbutton
	writetext SeafoamCaveDepthsPoisonOakBattleText
	waitbutton
	closetext
	winlosstext SeafoamCaveDepthsPoisonOakWinText, 0
	loadtrainer POKEMON_PROF, POKEMON_PROF2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext SeafoamCaveDepthsPoisonOakNoText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SEAFOAMCAVEDEPTHS_OAK2
	playsound SFX_WARP_TO
	waitsfx
	special FadeInQuickly
	pause 42
	opentext
	writetext SeafoamCaveDepthsLewotThatWasWeirdText
	waitbutton
	closetext
	opentext
	writetext SeafoamCaveDepthsOakApologizeText
	waitbutton
	closetext
	opentext
	writetext SeafoamCaveDepthsLewotCreditsText
	waitbutton
	checkcellnum PHONE_GRATE_ORACLE_LEWOT
	iftrue .SkipPhone
	callasm .PhoneAsm
	ifequal PHONE_CONTACTS_FULL, .SkipPhone
	writetext SeafoamCaveDepthsPhoneText
	addcellnum PHONE_GRATE_ORACLE_LEWOT
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
.SkipPhone:
	closetext
.End:
	special HealParty
	refreshscreen
	credits
	end

.PhoneAsm:
	ld c, PHONE_GRATE_ORACLE_LEWOT
	farcall AddPhoneNumber
	jr c, .phonefull
	xor a ; PHONE_CONTACT_GOT
	jr .done
.phonefull
	ld a, PHONE_CONTACTS_FULL
.done
	ld [wScriptVar], a
	ret

SeafoamCaveDepthsFeraligatrScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RED
	iftrue .AfterRedScript
	writetext SeafoamCaveDepthsFeraligatrText
	cry FERALIGATR
	waitsfx
	promptbutton
	writetext SeafoamCaveDepthsFeraligatrText2
	waitbutton
	closetext
	end

.AfterRedScript
	writetext SeafoamCaveDepthsFeraligatrText
	cry FERALIGATR
	pause 15
	closetext
	end

SeafoamCaveDepthsSacredAsh:
	itemball SACRED_ASH

SeafoamCaveDepthsHiddenBerryJuice:
	hiddenitem BERRY_JUICE, EVENT_SEAFOAM_CAVE_DEPTHS_HIDDEN_BERRY_JUICE

SeafoamCaveDepthsMovementData_OakWalksUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

SeafoamCaveDepthsMovementData_PoisonOak:
	big_step LEFT
	turn_head UP
	step_end

SeafoamCaveDepthsLewotEarlyText:
	text "He's asleep…"
	done

SeafoamCaveDepthsLewotBattleText:
	text "LEWOT: I love"
	line "snow… I just had"

	para "to use this tile-"
	line "set one more time."

	para "Erm, anyway, you"
	line "beat RED, huh?"

	para "I'll be honest, I"
	line "didn't think any-"
	cont "one would stick"
	cont "around this long."

	para "Hopefully this"
	line "final battle won't"
	cont "disappoint!"

	para "Here we go!"
	done

SeafoamCaveDepthsLewotWinText:
	text "Wow. You did it!"
	done

SeafoamCaveDepthsLewotThanksForPlayingText:
	text "LEWOT: Well. I'm"
	line "not sure what to"
	cont "say."

	para "I put so much work"
	line "into this hack…"

	para "And believe me, it"
	line "wasn't easy."

	para "So the idea that"
	line "anyone would act-"
	cont "ually play it all"
	cont "the way to the"
	cont "end…"

	para "It means a lot to"
	line "me, you know?"

	para "So… Thank you."
	done

SeafoamCaveDepthsOakCongratulationsText:
	text "OAK: <PLAYER>!"

	para "So MARY's scoop"
	line "was correct! You"

	para "came to challenge"
	line "LEWOT at his full"

	para "strength… and you"
	line "won, too!"

	para "That makes you not"
	line "only the CHAMPION,"

	para "but the strongest"
	line "trainer in all of"
	cont "KANTO and JOHTO!"

	para "You're truly"
	line "amazing!"

	para "Cough… pardon me."

	para "I must congratul-"
	line "ate… cough…"

	para "COUGH! HACK!"

	para "Wh-what… What's"
	line "happening?"
	done

SeafoamCaveDepthsOakWhoAreYouText:
	text "OAK: What… what is"
	line "this?!"

	para "Who are you?"
	done

SeafoamCaveDepthsPoisonOakFufuText:
	text "???: Fufufu…"

	para "Do you not recog-"
	line "nize who you see"
	cont "in the mirror?"
	done

SeafoamCaveDepthsOakItCantBeText:
	text "OAK: No… it can't"
	line "be!"
	done

SeafoamCaveDepthsPoisonOakGivePokemonText:
	text "???: Of course it"
	line "can, SAMUEL OAK."

	para "I am your truest"
	line "self…"

	para "I am every twisted"
	line "desire you've ever"
	cont "tried to repress…"

	para "And as such… I"
	line "demand! All three"
	cont "of you!"

	para "GIVE ME ALL YOUR"
	line "#MON!!"
	done

SeafoamCaveDepthsLewotCutOutOfScriptText:
	text "LEWOT: Uh… dude,"
	line "you realize I can"

	para "just write you out"
	line "of the script?"
	done

SeafoamCaveDepthsPoisonOakButYouDidntText:
	text "???: Ah, but you"
	line "didn't. Your need"

	para "for an explosive"
	line "finale will be"
	cont "your undoing!"
	done

SeafoamCaveDepthsPoisonOakChampionText:
	text "You, CHAMPION!"
	line "Fork 'em over!"

	para "Every #MON must"
	line "belong to me!"
	done

SeafoamCaveDepthsOakBlitherText:
	text "OAK: Wh-what is…"
	line "I don't… how… wh…"
	done

SeafoamCaveDepthsLewotUpToYouText:
	text "LEWOT: Well,"
	line "<PLAYER>, I'd take"

	para "care of this guy,"
	line "but you just made"

	para "all my #MON"
	line "faint, so…"

	para "I guess it's up to"
	line "you!"
	done

SeafoamCaveDepthsPoisonOakBattleText:
	text "???: You dare to"
	line "challenge fate?"

	para "Fufufu… then let"
	line "it be so!"
	done

SeafoamCaveDepthsPoisonOakWinText:
	text "IMPOSSIBLE!"
	done

SeafoamCaveDepthsPoisonOakNoText:
	text "POISON OAK:"
	line "NOOOOOOOOooooooo…!"
	done

SeafoamCaveDepthsLewotThatWasWeirdText:
	text "LEWOT: Well… that"
	line "was weird."
	done

SeafoamCaveDepthsOakApologizeText:
	text "OAK: I… I"
	line "apologize."
	done

SeafoamCaveDepthsLewotCreditsText:
	text "LEWOT: …"

	para "Let's just cut to"
	line "the credits."
	done

SeafoamCaveDepthsPhoneText:
	text "…Oh, but take my"
	line "number first."

	para "<PLAYER> registered"
	line "LEWOT's number."
	done

SeafoamCaveDepthsFeraligatrText:
	text "FERALIGATR: Zigg!"
	done

SeafoamCaveDepthsFeraligatrText2:
	text "It looks like it's"
	line "saying…"

	para "“You have to beat"
	line "RED first.”"
	done

SeafoamCaveDepths_MapEvents:
	def_warp_events
	warp_event  1,  1, SEAFOAM_CAVE_HIDEOUT, 2
	warp_event  3,  1, SEAFOAM_CAVE_DEPTHS, 3
	warp_event 17,  1, SEAFOAM_CAVE_DEPTHS, 2
	warp_event 15,  1, SEAFOAM_CAVE_DEPTHS, 5
	warp_event  9, 33, SEAFOAM_CAVE_DEPTHS, 4

	def_coord_events

	def_bg_events
	bg_event 17, 13, BGEVENT_ITEM, SeafoamCaveDepthsHiddenBerryJuice

	def_object_events
	object_event  9, 14, SPRITE_LEWOT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamCaveDepthsLewotScript, -1
	object_event 10, 14, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveDepthsFeraligatrScript, EVENT_SEAFOAM_CAVE_DEPTHS_FERALIGATR
	object_event  5,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveB2FSacredAsh, EVENT_SEAFOAM_CAVE_DEPTHS_SACRED_ASH
	object_event 10, 20, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAFOAM_CAVE_DEPTHS_OAK
	object_event 10, 16, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAFOAM_CAVE_DEPTHS_PSN_OAK
