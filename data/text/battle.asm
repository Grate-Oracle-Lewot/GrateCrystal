BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> picked up"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	autodone

WildPokemonAppearedText:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "appeared!"
	autodone

HookedPokemonAttackedText:
	text "The hooked"
	line "@"
	text_ram wEnemyMonNickname
	text_start
	scroll "attacked!"
	autodone

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text " fell"
	line "out of the tree!"
	autodone

WildCelebiAppearedText:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "appeared!"
	autodone

WantsToBattleText::
	text "<ENEMY>"
	line "wants to battle!"
	autodone

WantToBattlePluralText::
	text "<ENEMY>"
	line "want to battle!"
	autodone

BattleText_WildFled:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "fled!"
	autodone

BattleText_EnemyFled:
	text "Enemy @"
	text_ram wEnemyMonNickname
	text_start
	line "fled!"
	autodone

HurtByPoisonText:
	text "<USER>"
	line "is hurt by poison!"
	autodone

HurtByBurnText:
	text "<USER>'s"
	line "hurt by its burn!"
	autodone

LeechSeedSapsText:
	text "LEECH SEED saps"
	line "<USER>!"
	autodone

HasANightmareText:
	text "<USER>"
	line "is having a"
	scroll "NIGHTMARE!"
	autodone

AlreadyHasNightmareText:
	text "<TARGET>"
	line "is already having"
	scroll "a NIGHTMARE!"
	autodone

HurtByCurseText:
	text "<USER>'s"
	line "hurt by the CURSE!"
	autodone

SandstormHitsText:
	text "The sandstorm hits"
	line "<USER>!"
	autodone

PerishCountText:
	text "<USER>'s"
	line "PERISH count is @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	autodone

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "recovered with"
	scroll "@"
	text_ram wStringBuffer1
	text "."
	autodone

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "recovered PP using"
	scroll "@"
	text_ram wStringBuffer1
	text "."
	autodone

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "got a blast from"
	scroll "the past!"
	autodone

BattleText_SafeguardFaded:
	text "<USER>'s"
	line "SAFEGUARD faded!"
	autodone

BattleText_MonsLightScreenFell:
	text_ram wStringBuffer1
	text " #MON's"
	line "LIGHT SCREEN fell!"
	autodone

BattleText_MonsReflectFaded:
	text_ram wStringBuffer1
	text " #MON's"
	line "REFLECT faded!"
	autodone

BattleText_RainContinuesToFall:
	text "Rain continues to"
	line "fall."
	autodone

BattleText_TheSunlightIsStrong:
	text "The sunlight is"
	line "strong."
	autodone

BattleText_TheSandstormRages:
	text "The sandstorm"
	line "rages."
	autodone

BattleText_HailContinuesToFall:
	text "Hail hammers down."
	autodone

BattleText_TheRainStopped:
	text "It stopped"
	line "raining."
	autodone

BattleText_TheSunlightFaded:
	text "The sunlight"
	line "faded."
	autodone

BattleText_TheSandstormSubsided:
	text "The sandstorm"
	line "subsided."
	autodone

BattleText_TheHailStopped:
	text "It stopped"
	line "hailing."
	autodone

BattleText_EnemyMonFainted:
	text "Enemy @"
	text_ram wEnemyMonNickname
	text_start
	line "fainted!"
	autodone

GotMoneyForWinningText:
	text "<PLAYER> got ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "for winning!"
	autodone

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "was defeated!"
	autodone

BattleText_PluralEnemyWereDefeated:
	text "<ENEMY>"
	line "were defeated!"
	autodone

TiedAgainstText:
	text "Tied against"
	line "<ENEMY>!"
	autodone

SentSomeToMomText:
	text "<PLAYER> got ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "for winning!"
	scroll "Sent some to MOM!"
	autodone

SentHalfToMomText:
	text "Sent half to MOM!"
	autodone

SentAllToMomText:
	text "Sent all to MOM!"
	autodone

BattleText_MonFainted:
	text_ram wBattleMonNickname
	text_start
	line "fainted!"
	autodone

BattleText_UseNextMon:
	text "Use next #MON?"
	autodone

LostAgainstText:
	text "Lost against"
	line "<ENEMY>!"
	autodone

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "is about to use"
	scroll "@"
	text_ram wEnemyMonNickname
	text "."

	para "Will <PLAYER>"
	line "change #MON?"
	autodone

BattleText_PluralEnemyAreAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "are about to use"
	scroll "@"
	text_ram wEnemyMonNickname
	text "."

	para "Will <PLAYER>"
	line "change #MON?"
	autodone

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "sent out"
	scroll "@"
	text_ram wEnemyMonNickname
	text "!"
	autodone

BattleText_TheresNoWillToBattle:
	text "There's no will to"
	line "battle!"
	autodone

BattleText_AnEGGCantBattle:
	text "An EGG can't"
	line "battle!"
	autodone

BattleText_TheresNoEscapeFromTrainerBattle:
	text "No! There's no"
	line "running from a"
	scroll "trainer battle!"
	autodone

BattleText_GotAwaySafely:
	text "Got away safely!"
	autodone

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fled using a"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

BattleText_CantEscape:
	text "Can't escape!"
	autodone

BattleText_UserHurtBySpikes:
	text "<USER>'s"
	line "hurt by SPIKES!"
	autodone

RecoveredUsingText:
	text "<TARGET>"
	line "recovered using a"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text_start
	scroll "activated!"
	autodone

BattleText_ItemsCantBeUsedHere:
	text "Items can't be"
	line "used right now."
	autodone

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNickname
	text_start
	line "is already out."
	autodone

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNickname
	text_start
	line "can't be recalled!"
	autodone

BattleText_TheresNoPPLeftForThisMove:
	text "There's no PP left"
	line "for this move!"
	autodone

BattleText_TheMoveIsDisabled:
	text "The move is"
	line "DISABLED!"
	autodone

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNickname
	text_start
	line "has no moves left!"
	autodone

BattleText_TargetsEncoreEnded:
	text "<TARGET>'s"
	line "ENCORE ended!"
	autodone

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_level_up
	text_end

BattleText_WildMonIsEating:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "is eating!"
	autodone

BattleText_WildMonIsAngry:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "is angry!"
	autodone

FastAsleepText:
	text "<USER>"
	line "is fast asleep!"
	autodone

WokeUpText:
	text "<USER>"
	line "woke up!"
	autodone

FrozenSolidText:
	text "<USER>"
	line "is frozen solid!"
	autodone

FlinchedText:
	text "<USER>"
	line "flinched!"
	autodone

MustRechargeText:
	text "<USER>"
	line "must recharge!"
	autodone

DisabledNoMoreText:
	text "<USER>'s"
	line "disabled no more!"
	autodone

IsConfusedText:
	text "<USER>"
	line "is confused!"
	autodone

HurtItselfText:
	text "It hurt itself in"
	line "its confusion!"
	autodone

ConfusedNoMoreText:
	text "<USER>"
	line "snapped out of"
	scroll "confusion!"
	autodone

BecameConfusedText:
	text "<TARGET>"
	line "became confused!"
	autodone

BattleText_ItemHealedConfusion:
	text "A @"
	text_ram wStringBuffer1
	text " rid"
	line "<TARGET>"
	scroll "of its confusion."
	autodone

AlreadyConfusedText:
	text "<TARGET>'s"
	line "already confused!"
	autodone

BattleText_UsersHurtByStringBuffer1:
	text "<USER>'s"
	line "hurt by"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "was released from"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

UsedBindText:
	text "<TARGET>"
	line "was BOUND by"
	scroll "<USER>!"
	autodone

WhirlpoolTrapText:
	text "<TARGET>"
	line "was trapped in the"
	scroll "whirlpool!"
	autodone

FireSpinTrapText:
	text "<TARGET>"
	line "was trapped in the"
	scroll "inferno!"
	autodone

WrappedByText:
	text "<TARGET>"
	line "was WRAPPED by"
	scroll "<USER>!"
	autodone

ClampedByText:
	text "<TARGET>"
	line "was CLAMPED by"
	scroll "<USER>!"
	autodone

StoringEnergyText:
	text "<USER>"
	line "is storing energy!"
	autodone

UnleashedEnergyText:
	text "<USER>"
	line "unleashed energy!"
	autodone

HungOnText:
	text "<TARGET>"
	line "hung on with"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

EnduredText:
	text "<TARGET>"
	line "ENDURED the hit!"
	autodone

InLoveWithText:
	text "<USER>"
	line "is in love with"
	scroll "<TARGET>!"
	autodone

InfatuationText:
	text "<USER>"
	line "couldn't bring"
	scroll "itself to attack!"
	autodone

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text " is"
	scroll "DISABLED!"
	autodone

LoafingAroundText:
	text_ram wBattleMonNickname
	text " is"
	line "loafing around."
	autodone

BeganToNapText:
	text_ram wBattleMonNickname
	text " began"
	line "to nap!"
	autodone

WontObeyText:
	text_ram wBattleMonNickname
	text " won't"
	line "obey!"
	autodone

TurnedAwayText:
	text_ram wBattleMonNickname
	text " turned"
	line "away!"
	autodone

IgnoredOrdersText:
	text_ram wBattleMonNickname
	text " ignored"
	line "orders!"
	autodone

IgnoredSleepingText:
	text_ram wBattleMonNickname
	text " ignored"
	line "orders…sleeping!"
	autodone

NoPPLeftText:
	text "But no PP is left"
	line "for the move!"
	autodone

HasNoPPLeftText:
	text "<USER>"
	line "has no PP left for"
	scroll "@"
	text_ram wStringBuffer2
	text "!"
	autodone

WentToSleepText:
	text "<USER>"
	line "went to sleep!"
	autodone

RegainedHealthText:
	text "<USER>"
	line "regained health!"
	autodone

AttackMissedText:
	text "<USER>'s"
	line "attack missed!"
	autodone

AvoidStatusText:
	text "<TARGET>"
	line "avoided the"
	scroll "attack!"
	autodone

CrashedText:
	text "<USER>"
	line "kept going and"
	scroll "crashed!"
	autodone

UnaffectedText:
	text "<TARGET>'s"
	line "unaffected!"
	autodone

DoesntAffectText:
	text "It doesn't affect"
	line "<TARGET>!"
	autodone

CriticalHitText:
	text "A critical hit!"
	autodone

OneHitKOText:
	text "It's a one-hit KO!"
	autodone

SuperEffectiveText:
	text "It's super-"
	line "effective!"
	autodone

NotVeryEffectiveText:
	text "It's not very"
	line "effective…"
	autodone

TookDownWithItText:
	text "<TARGET>'s"
	line "DESTINY BOND took"

	autopara "<USER>"
	line "down with it!"
	autodone

RageBuildingText:
	text "<USER>'s"
	line "RAGE is building!"
	autodone

RageSpikedText:
	text "<USER>'s"
	line "RAGE spiked!"
	autodone

GotAnEncoreText:
	text "<TARGET>"
	line "got an ENCORE!"
	autodone

TookAimText:
	text "<USER>"
	line "took aim!"
	autodone

SketchedText:
	text "<USER>"
	line "SKETCHED"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

DestinyBondEffectText:
	text "<USER>'s"
	line "trying to take its"
	scroll "foe down with it!"
	autodone

SpiteEffectText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " lost"
	scroll "@"
	text_decimal wTextDecimalByte, 1, 1
	text " PP!"
	autodone

BellChimedText:
	text "A bell chimed!"
	line ""
	autodone

FellAsleepText:
	text "<TARGET>"
	line "fell asleep!"
	autodone

AlreadyAsleepText:
	text "<TARGET>'s"
	line "already asleep!"
	autodone

WasPoisonedText:
	text "<TARGET>"
	line "was poisoned!"
	autodone

BadlyPoisonedText:
	text "<TARGET>'s"
	line "badly poisoned!"
	autodone

AlreadyPoisonedText:
	text "<TARGET>'s"
	line "already poisoned!"
	autodone

AlreadyBurnedText:
	text "<TARGET>'s"
	line "already burned!"
	autodone

AlreadyFrozenText:
	text "<TARGET>'s"
	line "already frozen!"
	autodone

SuckedHealthText:
	text "Sucked health from"
	line "<TARGET>!"
	autodone

DreamEatenText:
	text "<TARGET>'s"
	line "dream was eaten!"
	autodone

WasBurnedText:
	text "<TARGET>"
	line "was burned!"
	autodone

DefrostedOpponentText:
	text "<TARGET>"
	line "was defrosted!"
	autodone

WasFrozenText:
	text "<TARGET>"
	line "was frozen solid!"
	autodone

WontRiseAnymoreText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text " won't"
	scroll "rise anymore!"
	autodone

WontDropAnymoreText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text " won't"
	scroll "drop anymore!"
	autodone

FledFromBattleText::
	text "<USER>"
	line "fled from battle!"
	autodone

FledInFearText:
	text "<TARGET>"
	line "fled in fear!"
	autodone

BlownAwayText:
	text "<TARGET>"
	line "was blown away!"
	autodone

PlayerHitTimesText:
	text "Hit @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " times!"
	autodone

EnemyHitTimesText:
	text "Hit @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " times!"
	autodone

MistText:
	text "<USER>'s"
	line "stats won't fall!"
	autodone

ProtectedByMistText:
	text "<TARGET>'s"
	line "protected by MIST!"
	autodone

GettingPumpedText:
	text_pause
	text "<USER>'s"
	line "critical hit ratio"
	scroll "went up!"
	autodone

RecoilText:
	text "<USER>'s"
	line "hit with recoil!"
	autodone

MadeSubstituteText:
	text "<USER>"
	line "made a SUBSTITUTE!"
	autodone

HasSubstituteText:
	text "<USER>"
	line "has a SUBSTITUTE!"
	autodone

TooWeakSubText:
	text "Not enough HP for"
	line "a SUBSTITUTE!"
	autodone

SubstituteBlockedStatusText:
	text "<TARGET>'s"
	line "SUBSTITUTE blocked"
	scroll "the attack!"
	autodone

SubTookDamageText:
	text "The SUBSTITUTE"
	line "took damage for"
	scroll "<TARGET>!"
	autodone

SubFadedText:
	text "<TARGET>'s"
	line "SUBSTITUTE broke!"
	autodone

MimicLearnedMoveText:
	text "<USER>"
	line "learned"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

WasSeededText:
	text "<TARGET>"
	line "was seeded!"
	autodone

EvadedText:
	text "<TARGET>"
	line "evaded the attack!"
	autodone

WasDisabledText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " was"
	scroll "DISABLED!"
	autodone

CoinsScatteredText:
	text "Money scattered"
	line "everywhere!"
	autodone

TransformedTypeText:
	text "<USER>"
	line "transformed into"
	scroll "the @"
	text_ram wStringBuffer1
	text "-type!"
	autodone

EliminatedStatsText:
	text "All stat changes"
	line "were eliminated!"
	autodone

TransformedText:
	text "<USER>"
	line "TRANSFORMED into"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

LightScreenEffectText:
	text "<USER>"
	line "doubled its team's"
	scroll "SPCL.DEF!"
	autodone

ReflectEffectText:
	text "<USER>"
	line "doubled its team's"
	scroll "DEFENSE!"
	autodone

NothingHappenedText:
	text "But nothing"
	line "happened."
	autodone

ButItFailedText:
	text "But it failed!"
	autodone

ButNobodyJoinedInText:
	text "Nobody joined in…"
	autodone

DidntAffectText:
	text "It didn't affect"
	line "<TARGET>!"
	autodone

HPIsFullText:
	text "<USER>'s"
	line "HP is full!"
	autodone

DraggedOutText:
	text "<USER>"
	line "was dragged out!"
	autodone

ParalyzedText:
	text "<TARGET>'s"
	line "paralyzed! Maybe"
	scroll "it can't attack!"
	autodone

FullyParalyzedText:
	text "<USER>'s"
	line "fully paralyzed!"
	autodone

AlreadyParalyzedText:
	text "<TARGET>'s"
	line "already paralyzed!"
	autodone

ProtectedByText:
	text "<TARGET>'s"
	line "protected by"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

MirrorMoveFailedText:
	text "But nothing was"
	next "mirrored!"
	autodone

StoleText:
	text "<USER>"
	line "stole @"
	text_ram wStringBuffer1
	text_start
	scroll "from its foe!"
	autodone

CantEscapeNowText:
	text "<TARGET>"
	line "can't escape now!"
	autodone

StartedNightmareText:
	text "<TARGET>"
	line "started to have a"
	scroll "NIGHTMARE!"
	autodone

WasDefrostedText:
	text "<USER>"
	line "was defrosted!"
	autodone

PutACurseText:
	text "<USER>"
	line "cut its own HP and"

	autopara "put a CURSE on"
	line "<TARGET>!"
	autodone

UserProtectedItselfText:
	text "<USER>"
	line "PROTECTED itself!"
	autodone

TargetProtectedItselfText:
	text "<TARGET>"
	line "PROTECTED itself!"
	autodone

SpikesText:
	text "SPIKES scattered"
	line "all around"
	scroll "<TARGET>!"
	autodone

IdentifiedText:
	text "<USER>"
	line "identified"
	scroll "<TARGET>!"
	autodone

StartPerishText:
	text "Both #MON will"
	line "faint in 3 turns!"
	autodone

SandstormBrewedText:
	text "A sandstorm"
	line "brewed!"
	autodone

BracedItselfText:
	text "<USER>"
	line "braced itself!"
	autodone

FellInLoveText:
	text "<TARGET>"
	line "fell in love!"
	autodone

CoveredByVeilText:
	text "<USER>'s"
	line "protected from"
	scroll "status problems!"
	autodone

SafeguardProtectText:
	text "<TARGET>"
	line "is protected by"
	scroll "SAFEGUARD!"
	autodone

MagnitudeText:
	text "Magnitude @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	autodone

ReleasedByText:
	text "<USER>"
	line "was released by"
	scroll "<TARGET>!"
	autodone

ShedLeechSeedText:
	text "<USER>"
	line "shed LEECH SEED!"
	autodone

BlewSpikesText:
	text "<USER>"
	line "blew away SPIKES!"
	autodone

DownpourText:
	text "A downpour"
	line "started!"
	autodone

SunGotBrightText:
	text "The sunlight"
	line "turned harsh!"
	autodone

BellyDrumText:
	text "<USER>"
	line "cut its HP and"
	scroll "maximized ATTACK!"
	autodone

CopiedStatsText:
	text "<USER>"
	line "copied"

	autopara "<TARGET>'s"
	line "stat changes!"
	autodone

ForesawAttackText:
	text "<USER>"
	line "sent an attack"
	scroll "into the future!"
	autodone

BeatUpAttackText:
	text_ram wStringBuffer1
	text "'s"
	line "attack!"
	autodone

PresentFailedText:
	text "<TARGET>"
	line "refused the gift!"
	autodone

IgnoredOrders2Text:
	text "<USER>"
	line "ignored orders!"
	autodone

BattleText_LinkErrorBattleCanceled:
	text "Link error…"

	autopara "The battle has"
	line "been canceled…"
	prompt

ItStartedToHailText:
	text "Hailstones started"
	line "to fall!"
	autodone

PeltedByHailText:
	text "<USER>"
	line "is pelted by hail!"
	autodone

FloatMissText:
	text "<TARGET>'s"
	line "not on the ground!"
	autodone

StaticParalysisText:
	text "<USER>"
	line "was paralyzed by"
	scroll "static shock!"
	autodone

CuteCharmText:
	text "<USER>"
	line "was infatuated by"

	autopara "<TARGET>'s"
	line "cuteness!"
	autodone

StaticPrzcureberryText:
	text "<USER>"
	line "recovered using a"
	scroll "@"
	text_ram wStringBuffer1
	text "!"
	autodone

LiquidOozeText:
	text "<USER>"
	line "absorbed toxins"
	scroll "instead of health!"
	autodone
