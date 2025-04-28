_NoPhotoText::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

_EggPhotoText::
	text "An EGG? My talent"
	line "is worth more…"
	done

_NameRaterHelloText::
	text "Hello, hello! I'm"
	line "a NAME RATER."

	para "I rate #MON"
	line "nicknames."

	para "Would you like a"
	line "nickname rated?"
	done

_NameRaterWhichMonText::
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, I think we"
	line "could do better!"

	para "Want to change its"
	line "nickname?"
	done

_NameRaterWhatNameText::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

_NameRaterFinishedText::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	prompt

_NameRaterComeAgainText::
	text "OK, then. Come"
	line "again sometime."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	prompt

_NameRaterEggText::
	text "Whoa… That's just"
	line "an EGG."
	prompt

_NameRaterSameNameText::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	prompt

_NameRaterNamedText::
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

_BoostedExpPointsText::
	text_start
	line "a boosted"
	scroll "@"
	text_decimal wStringBuffer2, 2, 5
	text " EXP. Points!"
	autodone

_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " EXP. Points!"
	autodone

_GoMonText::
	text "Go! @"
	text_end

_DoItMonText::
	text "Do it! @"
	text_end

_GoForItMonText::
	text "Go for it,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " that's"
	line "enough! Come back!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Come back!@"
	text_end

_GoodComeBackText::
	text " good!"
	line "Come back!@"
	text_end

_ComeBackText::
	text " come"
	line "back!"
	done

_BootedTMText::
	text "Booted up a TM."
	prompt

_BootedHMText::
	text "Booted up an HM."
	prompt

_ContainedMoveText::
	text "It contained"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Teach @"
	text_ram wStringBuffer2
	text_start
	line "to a #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "You have no room"
	line "for any more"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

_ReceivedTMHMText::
	text "You received"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "The link has been"
	line "cancelled."
	prompt

_MysteryGiftCommErrorText::
	text "Communication"
	line "error."
	prompt

_RetrieveMysteryGiftText::
	text "Must retrieve GIFT"
	line "at #MON CENTER."
	prompt

_YourFriendIsNotReadyText::
	text "Your friend isn't"
	line "ready."
	prompt

_MysteryGiftFiveADayText::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

_MysteryGiftOneADayText::
	text "Sorry. One GIFT"
	line "a day per person."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "to @"
	text_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

_NameCardReceivedCardText::
	text "Received"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "'s CARD."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "The CARD was not"
	line "registered."
	prompt

_NameCardLinkCancelledText::
	text "The link has been"
	line "cancelled."
	prompt

_NameCardLinkCommErrorText::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Sorry! A new BADGE"
	line "is required."
	prompt

_CantUseItemText::
	text "Can't use that"
	line "here."
	prompt

_UseCutText::
	text "A swath was cut!"
	autodone

_CutNothingText::
	text "There's nothing to"
	line "cut here."
	prompt

_BlindingFlashText::
	text "A blinding flash"
	line "lights the area!@"
	text_promptbutton
	text_end

_UsedSurfText::
	text "Cowabunga!"
	done

_CantSurfText::
	text "You can't use that"
	line "here."
	prompt

_AlreadySurfingText::
	text "You're already on"
	line "the water."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Want to surf?"
	done

_UseWaterfallText::
	text "Going uuup!"
	autodone

_HugeWaterfallText::
	text "It's a roaring"
	line "waterfall!"
	done

_AskWaterfallText::
	text "Want to climb the"
	line "waterfall?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "DIG!"
	autodone

_UseEscapeRopeText::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	autodone

_CantUseDigText::
	text "Can't use that"
	line "here."
	done

_TeleportReturnText::
	text "Return to the last"
	line "#MON CENTER."
	done

_CantUseTeleportText::
	text "Can't use that"
	line "here."

	para ""
	done

_AlreadyUsingStrengthText::
	text "THE FORCE is with"
	line "you already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "THE FORCE!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

_AskStrengthText::
	text "This boulder may"
	line "be movable."

	para "Want to use"
	line "THE FORCE?"
	done

_BouldersMoveText::
	text "Boulders may now"
	line "be moved!"
	autodone

_BouldersMayMoveText::
	text "This boulder may"
	line "be movable."
	done

_UseWhirlpoolText::
	text "Whiiiiirl!"
	autodone

_MayPassWhirlpoolText::
	text "It's a vicious"
	line "whirlpool!"

	para "There may be some"
	line "way to dispel it."
	done

_AskWhirlpoolText::
	text "A whirlpool is in"
	line "the way."

	para "Want to dispel it?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Nothing…"
	autodone

_AskHeadbuttText::
	text "Something could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

_UseRockSmashText::
	text "Heave ho!"
	autodone

_MaySmashText::
	text "This rock looks"
	line "breakable."
	done

_AskRockSmashText::
	text "This rock looks"
	line "breakable."

	para "Want to smash it?"
	done

_RodBiteText::
	text "Oh!"
	line "A bite!"
	autodone

_RodNothingText::
	text "Not even a nibble!"
	autodone

_PocketPCLoadingText::
	text "Loading…"
	done

_PocketPCNoSignalText::
	text "No signal!"
	done

_CantGetOffBikeText::
	text "You can't get off"
	line "here!"
	done

_GotOnBikeText::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "This tree can be"
	line "cut!"

	para "Want to cut it?"
	done

_CanCutText::
	text "This tree can be"
	line "cut!"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

_WhitedOutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	autopara "<PLAYER> blacked"
	line "out!"
	autodone

_ItemfinderItemNearbyText::
	text "Swag detected!"
	prompt

_ItemfinderNopeText::
	text "No reaction…"
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "fainted!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> blacked"
	line "out!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " used"
	line "SWEET SCENT!"
	autodone

_SweetScentNothingText::
	text "Looks like there's"
	line "nothing here…"
	autodone

_SquirtbottleNothingText::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done

_AnEggCantHoldAnItemText::
	text "An EGG can't hold"
	line "an item."
	prompt

_PackNoItemText::
	text "No items."
	done

_AskThrowAwayText::
	text "Throw away how"
	line "many?"
	done

_AskQuantityThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ThrewAwayText::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: There's a"
	line "time and place for"
	scroll "everything…"
	autodone

_YouDontHaveAMonText::
	text "You don't have a"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "You can't register"
	line "that item."
	prompt

_AskItemMoveText::
	text "Where should this"
	line "be moved to?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "You can't use it"
	line "in a battle."
	autodone

_AreYouABoyOrAreYouAGirlText::
	text "Play as a boy or"
	line "a girl?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>went way up!"
	autodone

_BattleStatWentUpText::
	text " went up!"
	autodone

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>sharply fell!"
	autodone

_BattleStatFellText::
	text " fell!"
	autodone

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	autodone

_BattleTookSunlightText::
	text_start
	line "took in sunlight!"
	autodone

_BattleLoweredHeadText::
	text_start
	line "lowered its head!"
	autodone

_BattleGlowingText::
	text_start
	line "took to the sky!"
	autodone

_BattleFlewText::
	text_start
	line "flew up high!"
	autodone

_BattleDugText::
	text_start
	line "dug a hole!"
	autodone

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMoveText::
	text_start
	line "used @"
	text_end

_UsedInsteadText::
	text "instead,"
	scroll "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text "!"
	autodone

Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " hatched"
	line "from the EGG!@"
	sound_caught_mon
	text_promptbutton
	text_end

_BreedAskNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "It's @"
	text_ram wBreedMon2Nickname
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

_LeftWithDayCareManText::
	text "It's @"
	text_ram wBreedMon1Nickname
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

_BreedBrimmingWithEnergyText::
	text "It's brimming with"
	line "energy."
	prompt

_BreedNoInterestText::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "There's no MAIL"
	line "here."
	prompt

_MailClearedPutAwayText::
	text "The cleared MAIL"
	line "was put away."
	prompt

_MailPackFullText::
	text "The PACK is full."
	prompt

_MailMessageLostText::
	text "The MAIL's message"
	line "will be lost. OK?"
	done

_MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

_MailEggText::
	text "An EGG can't hold"
	line "any MAIL."
	prompt

_MailMovedFromBoxText::
	text "The MAIL was moved"
	line "from the MAILBOX."
	prompt

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " was"
	line "sent to BILL's PC."
	autodone

_PCGottaHavePokemonText::
	text "You gotta have"
	line "#MON to call!"
	prompt

_PCWhatText::
	text "What?"
	done

_PCMonHoldingMailText::
	text "There is a #MON"
	line "holding MAIL."

	para "Please remove the"
	line "MAIL."
	prompt

_PCNoSingleMonText::
	text "You don't have a"
	line "single #MON!"
	prompt

_PCCantDepositLastMonText::
	text "You can't deposit"
	line "your last #MON!"
	prompt

_PCCantTakeText::
	text "You can't take any"
	line "more #MON."
	prompt

_ContestCaughtMonText::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	autodone

_ContestAskSwitchText::
	text "Switch #MON?"
	autodone

_ContestAlreadyCaughtText::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_KarpGuruRecordText::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

_LuckyNumberMatchPartyText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your PC BOX."
	prompt

_CaughtAskNicknameText::
	text "Give a nickname to"
	line "the @"
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> booted up"
	line "the home PC."
	autodone

_PlayersPCAskWhatDoText::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

_PlayersPCNoItemsText::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> booted up"
	line "the PC."
	autodone

_PokecenterPCWhoseText::
	text "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link closed…"
	done

_OakPCText1::
	text "Want to get your"
	line "#DEX rated?"
	done

_OakPCText2::
	text "Current #DEX"
	line "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_ram wStringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #MON"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#MON grow, and"

	para "others use the"
	line "effects of STONES."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met KURT?"
	line "His custom BALLS"
	cont "should help."
	done

_OakRating13::
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done

_OakRating14::
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done

_OakRating18::
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The link to PROF."
	line "OAK's PC closed."
	done

_MemoryGameYeahText::
	text " , yeah!"
	done

_MemoryGameDarnText::
	text "Darn…"
	done

_StartMenuContestEndText::
	text "Would you like to"
	line "end the Contest?"
	done

_ItemsTossOutHowManyText::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsDiscardedText::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(S)."
	prompt

_ItemsTooImportantText::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "OAK: There's a"
	line "time and place for"
	scroll "everything…"
	done

_PokemonSwapItemText::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "had it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Had @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Please remove the"
	line "MAIL first."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

_ItemStorageFullText::
	text "Item storage space"
	line "full."
	prompt

_PokemonTookItemText::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

_ItemCantHeldText::
	text "This item can't be"
	line "held."
	prompt

_MailLoseMessageText::
	text "The MAIL will lose"
	line "its message. OK?"
	done

_MailDetachedText::
	text "MAIL detached from"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "There's no space"
	line "for removing MAIL."
	prompt

_MailAskSendToPCText::
	text "Send the removed"
	line "MAIL to your PC?"
	done

_MailboxFullText::
	text "Your PC's MAILBOX"
	line "is full."
	prompt

_MailSentToPCText::
	text "The MAIL was sent"
	line "to your PC."
	prompt

_PokemonNotEnoughHPText::
	text "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "with SELECT."
	done

_OakText1::
	text "Welcome to #MON"
	line "GRATE CRYSTAL, a"

	para "hack by the GRATE"
	line "ORACLE LEWOT."
	cont "(That's me.)"

	para "There's not much"
	line "of a theme here,"

	para "it's just random"
	line "changes that I"
	cont "wanted to make."
	prompt

_OakText2::
	text "WOOPER, why don't"
	line "you explain what"
	cont "all we've changed?"
	text_end

_OakText3::
	text_promptbutton
	text_end

_OakText4::
	text "Thank you, WOOPER."
	line "Now…"

	para "This hack was made"
	line "with github.com."

	para "The pret community"
	line "made a disassembly"

	para "called pokecrystal"
	line "that makes hacks"
	cont "like this easier."

	para "…Emphasis on the"
	line "er."
	prompt

_OakText5::
	text "Really, most of"
	line "the actual game"
	cont "structure is still"
	cont "the same."

	para "So enjoy a famil-"
	line "iar experience…"

	para "with more than a"
	line "few surprises."
	prompt

_CantDepositText::
	text "This item can't be"
	line "deposited."
	prompt
