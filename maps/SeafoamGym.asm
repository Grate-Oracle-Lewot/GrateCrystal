	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE
	const SEAFOAMGYM_FISHER
	const SEAFOAMGYM_BEAUTY
	const SEAFOAMGYM_PHARMACIST

SeafoamGym_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
.FightDone:
	checkevent EVENT_GOT_TM_FIRE_BLAST_FROM_BLAINE
	iftrue .GotFireBlastTM
	writetext BlaineGiveFireBlastTMText
	promptbutton
	verbosegiveitem TM_FIRE_BLAST
	iffalse .NoRoomForFireBlastTM
	setevent EVENT_GOT_TM_FIRE_BLAST_FROM_BLAINE
	writetext BlaineExplainFireBlastTMText
	setevent EVENT_DECO_CHARMANDER_DOLL
	playsound SFX_2ND_PLACE
	waitsfx
	writetext BlaineCharmanderDollText
	promptbutton
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.GotFireBlastTM:
	writetext BlaineFightDoneText
	waitbutton
.NoRoomForFireBlastTM
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

TrainerFirebreatherIroh:
	trainer FIREBREATHER, IROH, EVENT_BEAT_FIREBREATHER_IROH, FirebreatherIrohSeenText, FirebreatherIrohBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FirebreatherIrohAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierMikaela:
	trainer SKIER, MIKAELA, EVENT_BEAT_SKIER_MIKAELA, SkierMikaelaSeenText, SkierMikaelaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext SkierMikaelaAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarRamon:
	trainer BURGLAR, RAMON, EVENT_BEAT_BURGLAR_RAMON, BurglarRamonSeenText, BurglarRamonBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BurglarRamonAfterBattleText
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaargh!"

	para "My GYM on CINNABAR"
	line "was destroyed by"

	para "some rogue science"
	line "experiment!"

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of that thing!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done

BlaineWinLossText:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE!"
	done

BlaineAfterBattleText:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done

BlaineGiveFireBlastTMText:
	text "BLAINE: Oh,"
	line "before I forget,"
	cont "take this!"
	done

BlaineExplainFireBlastTMText:
	text "BLAINE: That's"
	line "FIRE BLAST."

	para "It's the last copy"
	line "I have left!"

	para "Huh? A DOLL?"

	para "B-but it's my last"
	line "one…"

	para "Alright, alright!"

	para "<PLAYER> received"
	line "CHARMANDER DOLL!"
	done

BlaineCharmanderDollText:
	text "<PLAYER> sent the"
	line "decoration home."
	done

BlaineFightDoneText:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done

SeafoamGymGuideWinText:
	text "Yo!"

	para "… Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "CINNABAR GYM was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
	done

SeafoamGymGuideWinText2:
	text "A #MON GYM can"
	line "be anywhere as"

	para "long as the GYM"
	line "LEADER is there."

	para "There's no need"
	line "for a building."
	done

FirebreatherIrohSeenText:
	text "You can't always"
	line "see the light at"

	para "the end of the"
	line "tunnel, but if you"

	para "just keep moving,"
	line "you will come to a"
	cont "better place."
	done

FirebreatherIrohBeatenText:
	text "Failure is only"
	line "the opportunity to"
	cont "begin again."
	done

FirebreatherIrohAfterBattleText:
	text "You are an excell-"
	line "ent trainer. I"

	para "would love to dis-"
	line "cuss your tactics"

	para "over a cup of"
	line "tea!"
	done

SkierMikaelaSeenText:
	text "It's hot in here,"
	line "but I'm hotter!"
	done

SkierMikaelaBeatenText:
	text "Oop…"
	done

SkierMikaelaAfterBattleText:
	text "It gets cold deep-"
	line "er in the cave."
	done

BurglarRamonSeenText:
	text "Lookin' for loot!"
	done

BurglarRamonBeatenText:
	text "Zow!"
	done

BurglarRamonAfterBattleText:
	text "Maybe you can"
	line "answer this."

	para "Does TM28 contain"
	line "TOMBSTONER?"
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ROUTE_20, 1
	warp_event  9,  1, SEAFOAM_CAVE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  7, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  7, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
	object_event  6,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherIroh, -1
	object_event 11,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSkierMikaela, -1
	object_event  3,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBurglarRamon, -1
