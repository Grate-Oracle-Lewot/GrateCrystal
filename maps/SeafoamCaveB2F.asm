	object_const_def
	const SEAFOAMCAVEB2F_KAREN
	const SEAFOAMCAVEB2F_MONSTER
	const SEAFOAMCAVEB2F_POKE_BALL
	const SEAFOAMCAVEB2F_OAK1
	const SEAFOAMCAVEB2F_OAK2

SeafoamCaveB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Setup

.Setup:
	disappear SEAFOAMCAVEB2F_OAK1
	disappear SEAFOAMCAVEB2F_OAK2
	appear SEAFOAMCAVEB2F_MONSTER
	endcallback

SeafoamCaveB2FKarenScript:
	faceplayer
	checkevent EVENT_BEAT_RED
	iftrue .AfterRedScript
	showemote EMOTE_SLEEP, SEAFOAMCAVEB2F_KAREN, 30
	opentext
	writetext SeafoamCaveB2FKarenEarlyText
	waitbutton
	closetext
	end

.AfterRedScript:
	opentext
	writetext SeafoamCaveB2FKarenBattleText
	waitbutton
	closetext
	winlosstext SeafoamCaveB2FKarenWinText, SeafoamCaveB2FKarenLossText
	loadtrainer KAREN, KAREN2
	startbattle
	disappear SEAFOAMCAVEB2F_MONSTER
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext SeafoamCaveB2FKarenThanksForPlayingText
	waitbutton
	closetext
	showemote EMOTE_QUESTION, SEAFOAMCAVEB2F_KAREN, 10
	playmusic MUSIC_PROF_OAK
	appear SEAFOAMCAVEB2F_OAK1
	applymovement SEAFOAMCAVEB2F_OAK1, SeafoamCaveMovementData_OakWalksUp
	turnobject PLAYER, RIGHT
	opentext
	writetext SeafoamCaveB2FOakCongratulationsText
	waitbutton
	closetext
	special FadeOutMusic
	special FadeBlackQuickly
	pause 10
	special ReloadSpritesNoPalettes
	appear SEAFOAMCAVEB2F_OAK2
	playsound SFX_WARP_TO
	waitsfx
	special FadeInQuickly
	turnobject SEAFOAMCAVEB2F_OAK1, DOWN
	turnobject PLAYER, DOWN
	opentext
	writetext SeafoamCaveB2FOakWhoAreYouText
	waitbutton
	writetext SeafoamCaveB2FPoisonOakFufuText
	waitbutton
	writetext SeafoamCaveB2FOakItCantBeText
	waitbutton
	writetext SeafoamCaveB2FPoisonOakGivePokemonText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SEAFOAMCAVEB2F_OAK1, 5
	showemote EMOTE_SHOCK, SEAFOAMCAVEB2F_KAREN, 10
	opentext
	writetext SeafoamCaveB2FKarenCutOutOfScriptText
	waitbutton
	writetext SeafoamCaveB2FPoisonOakButYouDidntText
	waitbutton
	closetext
	applymovement SEAFOAMCAVEB2F_OAK2, SeafoamCaveMovementData_PoisonOak
	opentext
	writetext SeafoamCaveB2FPoisonOakChampionText
	waitbutton
	closetext
	turnobject SEAFOAMCAVEB2F_OAK1, LEFT
	opentext
	writetext SeafoamCaveB2FOakBlitherText
	waitbutton
	writetext SeafoamCaveB2FKarenUpToYouText
	waitbutton
	writetext SeafoamCaveB2FPoisonOakBattleText
	waitbutton
	closetext
	winlosstext SeafoamCaveB2FPoisonOakWinText, SeafoamCaveB2FPoisonOakLossText
	loadtrainer POKEMON_PROF, POKEMON_PROF2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext SeafoamCaveB2FPoisonOakNoText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SEAFOAMCAVEB2F_OAK2
	playsound SFX_WARP_TO
	waitsfx
	special FadeInQuickly
	pause 42
	opentext
	writetext SeafoamCaveB2FKarenThatWasWeirdText
	waitbutton
	closetext
	opentext
	writetext SeafoamCaveB2FOakApologizeText
	waitbutton
	closetext
	opentext
	writetext SeafoamCaveB2FKarenCreditsText
	waitbutton
	closetext
	special HealParty
	checkevent EVENT_BEAT_FINALE
	iftrue .EndFinale
	opentext
	writetext SeafoamCaveGoldTrophyText
	setevent EVENT_DECO_GOLD_TROPHY
	playsound SFX_GET_EGG_UNUSED
	waitsfx
	writetext SeafoamCaveDecorationText
	waitbutton
	closetext
	setevent EVENT_BEAT_FINALE
.EndFinale:
	refreshscreen
	credits
	end

SeafoamCaveB2FFeraligatrScript:
	faceplayer
	opentext
	writetext SeafoamCaveB2FFeraligatrText
	cry FERALIGATR
	pause 15
	closetext
	end

SeafoamCaveB2FSacredAsh:
	itemball SACRED_ASH

SeafoamCaveB2FHiddenBerryJuice:
	hiddenitem BERRY_JUICE, EVENT_SEAFOAM_CAVE_B2F_HIDDEN_BERRY_JUICE

SeafoamCaveMovementData_OakWalksUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

SeafoamCaveMovementData_PoisonOak:
	big_step LEFT
	turn_head UP
	step_end

SeafoamCaveB2FKarenEarlyText:
	text "He's asleep…"
	done

SeafoamCaveB2FKarenBattleText:
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

SeafoamCaveB2FKarenWinText:
	text "Wow. You did it!"
	done

SeafoamCaveB2FKarenLossText:
	text "Eh, you'll get me"
	line "next time."
	done

SeafoamCaveB2FKarenThanksForPlayingText:
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

SeafoamCaveB2FOakCongratulationsText:
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

SeafoamCaveB2FOakWhoAreYouText:
	text "OAK: What… what is"
	line "this?!"

	para "Who are you?"
	done

SeafoamCaveB2FPoisonOakFufuText:
	text "???: Fufufu…"

	para "Do you not recog-"
	line "nize who you see"
	cont "in the mirror?"
	done

SeafoamCaveB2FOakItCantBeText:
	text "OAK: No… it can't"
	line "be!"
	done

SeafoamCaveB2FPoisonOakGivePokemonText:
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

SeafoamCaveB2FKarenCutOutOfScriptText:
	text "LEWOT: Uh… dude,"
	line "you realize I can"

	para "just write you out"
	line "of the script?"
	done

SeafoamCaveB2FPoisonOakButYouDidntText:
	text "???: Ah, but you"
	line "didn't. Your need"

	para "for an explosive"
	line "finale will be"
	cont "your undoing!"
	done

SeafoamCaveB2FPoisonOakChampionText:
	text "You, CHAMPION!"
	line "Fork 'em over!"

	para "Every #MON must"
	line "belong to me!"
	done

SeafoamCaveB2FOakBlitherText:
	text "OAK: Wh-what is…"
	line "I don't… how… wh…"
	done

SeafoamCaveB2FKarenUpToYouText:
	text "LEWOT: Well,"
	line "<PLAYER>, I'd take"

	para "care of this guy,"
	line "but you just made"

	para "all my #MON"
	line "faint, so…"

	para "I guess it's up to"
	line "you!"
	done

SeafoamCaveB2FPoisonOakBattleText:
	text "???: You dare to"
	line "challenge fate?"

	para "Fufufu… then let"
	line "it be so!"
	done

SeafoamCaveB2FPoisonOakWinText:
	text "IMPOSSIBLE!"
	done

SeafoamCaveB2FPoisonOakLossText:
	text "The world of"
	line "#MON is mine!"
	done

SeafoamCaveB2FPoisonOakNoText:
	text "POISON OAK:"
	line "NOOOOOOOOooooooo…!"
	done

SeafoamCaveB2FKarenThatWasWeirdText:
	text "LEWOT: Well… that"
	line "was weird."
	done

SeafoamCaveB2FOakApologizeText:
	text "OAK: I… I"
	line "apologize."
	done

SeafoamCaveB2FKarenCreditsText:
	text "LEWOT: …"

	para "Let's just cut to"
	line "the credits."
	done

SeafoamCaveGoldTrophyText:
	text "…Oh, but first,"
	line "take this."

	para "<PLAYER> received"
	line "GOLD TROPHY!"
	done

SeafoamCaveDecorationText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

SeafoamCaveB2FFeraligatrText:
	text "FERALIGATR: Zigg!"
	done

SeafoamCaveB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, SEAFOAM_CAVE_B1F, 2
	warp_event  3,  1, SEAFOAM_CAVE_B2F, 3
	warp_event 17,  1, SEAFOAM_CAVE_B2F, 2
	warp_event 15,  1, SEAFOAM_CAVE_B2F, 5
	warp_event  9, 33, SEAFOAM_CAVE_B2F, 4

	def_coord_events

	def_bg_events
	bg_event 17, 13, BGEVENT_ITEM, SeafoamCaveB2FHiddenBerryJuice

	def_object_events
	object_event  9, 14, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamCaveB2FKarenScript, -1
	object_event 10, 14, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamCaveB2FFeraligatrScript, EVENT_SEAFOAM_CAVE_B2F_FERALIGATR
	object_event  5,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_ITEMBALL, 0, SeafoamCaveB2FSacredAsh, EVENT_SEAFOAM_CAVE_B2F_SACRED_ASH
	object_event 10, 20, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAFOAM_CAVE_B2F_OAK
	object_event 10, 16, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAFOAM_CAVE_B2F_PSN_OAK
