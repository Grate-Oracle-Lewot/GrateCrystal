BTTrainerClassTexts:
; entries correspond to trainer classes
	table_width 1, BTTrainerClassGenders
	db FALKNER      ; FALKNER
	db WHITNEY      ; WHITNEY
	db BUGSY        ; BUGSY
	db MORTY        ; MORTY
	db PRYCE        ; PRYCE
	db JASMINE      ; JASMINE
	db CHUCK        ; CHUCK
	db CLAIR        ; CLAIR
	db TRAINER_NONE ; RIVAL1
	db TRAINER_NONE ; POKEMON_PROF
	db WILL         ; WILL
	db TRAINER_NONE ; CAL
	db BRUNO        ; BRUNO
	db KAREN        ; KAREN
	db KOGA         ; KOGA
	db CHAMPION     ; CHAMPION
	db BROCK        ; BROCK
	db MISTY        ; MISTY
	db LT_SURGE     ; LT_SURGE
	db TRAINER_NONE ; SCIENTIST
	db ERIKA        ; ERIKA
	db TRAINER_NONE ; YOUNGSTER
	db TRAINER_NONE ; SCHOOLBOY
	db TRAINER_NONE ; BIRD_KEEPER
	db TRAINER_NONE ; LASS
	db JANINE       ; JANINE
	db TRAINER_NONE ; COOLTRAINERM
	db TRAINER_NONE ; COOLTRAINERF
	db TRAINER_NONE ; BEAUTY
	db TRAINER_NONE ; POKEMANIAC
	db TRAINER_NONE ; GRUNTM
	db TRAINER_NONE ; GENTLEMAN
	db TRAINER_NONE ; SKIER
	db TRAINER_NONE ; TEACHER
	db SABRINA      ; SABRINA
	db TRAINER_NONE ; BUG_CATCHER
	db TRAINER_NONE ; FISHER
	db TRAINER_NONE ; SWIMMERM
	db TRAINER_NONE ; SWIMMERF
	db TRAINER_NONE ; SAILOR
	db TRAINER_NONE ; SUPER_NERD
	db TRAINER_NONE ; RIVAL2
	db TRAINER_NONE ; GUITARIST
	db TRAINER_NONE ; HIKER
	db TRAINER_NONE ; BIKER
	db BLAINE       ; BLAINE
	db TRAINER_NONE ; BURGLAR
	db TRAINER_NONE ; FIREBREATHER
	db TRAINER_NONE ; JUGGLER
	db TRAINER_NONE ; BLACKBELT_T
	db TRAINER_NONE ; EXECUTIVEM
	db TRAINER_NONE ; PSYCHIC_T
	db TRAINER_NONE ; PICNICKER
	db TRAINER_NONE ; CAMPER
	db TRAINER_NONE ; EXECUTIVEF
	db TRAINER_NONE ; SAGE
	db TRAINER_NONE ; MEDIUM
	db TRAINER_NONE ; BOARDER
	db TRAINER_NONE ; POKEFANM
	db TRAINER_NONE ; KIMONO_GIRL
	db TRAINER_NONE ; TWINS
	db TRAINER_NONE ; POKEFANF
	db RED          ; RED
	db BLUE         ; BLUE
	db TRAINER_NONE ; OFFICER
	db TRAINER_NONE ; GRUNTF
	db TRAINER_NONE ; MYSTICALMAN
	db REAL_KAREN   ; REAL_KAREN
	db REAL_KOGA    ; REAL_KOGA
	db TRAINER_NONE ; BOSS
	db TRAINER_NONE ; JESSIE
	db TRAINER_NONE ; AEROBONES
	db TRAINER_NONE ; KABUBONES
	db TRAINER_NONE ; MISSINGNO_T
	db TRAINER_NONE ; GAMBLER
	db TRAINER_NONE ; CAL_F
	db TRAINER_NONE ; OLD
	db TRAINER_NONE ; LORELEI
	db TRAINER_NONE ; AGATHA
	db TRAINER_NONE ; REAL_BRUNO
	db TRAINER_NONE ; REAL_WILL
	db TRAINER_NONE ; ENGINEER
	assert_table_length NUM_TRAINER_CLASSES

BTBrockGreetingText:
	text "I'm ready to rock"
	line "and roll!"
	done

BTBrockLossText:
	text "Our true-grit"
	line "determination led"
	cont "us to victory!"
	done

BTBrockWinText:
	text "You ground me into"
	line "dust!"
	done

BTMistyGreetingText:
	text "So you're here…"
	line "Alright, give me"
	cont "all you've got!"
	done

BTMistyLossText:
	text "Looks like you got"
	line "washed away!"
	done

BTMistyWinText:
	text "You're such a pest…"
	done

BTLtSurgeGreetingText:
	text "Hey! It's the JOHTO"
	line "tyke!"

	para "Let's light this"
	line "place up!"
	done

BTLtSurgeLossText:
	text "How about that!"
	line "I've still got it!"
	done

BTLtSurgeWinText:
	text "I got steamrolled!"
	line "Impressive!"
	done

BTErikaGreetingText:
	text "The architecture"
	line "here is striking,"

	para "but I find it a"
	line "bit sterile…"
	done

BTErikaLossText:
	text "I'll have to offer"
	line "to grow them some"
	cont "decorative shrubs…"
	done

BTErikaWinText:
	text "Oh my. I was lost"
	line "in thought…"
	done

BTJanineGreetingText:
	text "I'm going to make"
	line "my dad proud!"
	done

BTJanineLossText:
	text "I knew I had it in"
	line "me!"
	done

BTJanineWinText:
	text "I still need more"
	line "training…"
	done

BTSabrinaGreetingText:
	text "Perhaps this will"
	line "be the battle I"
	cont "foresaw…"
	done

BTSabrinaLossText:
	text "Yes… this is what"
	line "I predicted."
	done

BTSabrinaWinText:
	text "No… I still can't"
	line "make my vision a"
	cont "reality."
	done

BTBlaineGreetingText:
	text "BURN HEAL won't"
	line "save you in here!"
	done

BTBlaineLossText:
	text "Hah! I cooked you"
	line "that time!"
	done

BTBlaineWinText:
	text "Hurgh… you're still"
	line "tough."
	done

BTBlueGreetingText:
	text "You again, punk"
	line "CHAMP?"

	para "You'd better make"
	line "this a good one!"
	done

BTBlueLossText:
	text "Heh. Having an off"
	line "day?"
	done

BTBlueWinText:
	text "Tch… Fine, you win"
	line "again."
	done

BTFalknerGreetingText:
	text "It's you…"

	para "I'll show you how"
	line "high I can soar"
	cont "this time!"
	done

BTFalknerLossText:
	text "My dad's #MON"
	line "pulled through!"
	done

BTFalknerWinText:
	text "Darn it all…"

	para "We'll make a come-"
	line "back, I promise!"
	done

BTBugsyGreetingText:
	text "This place is"
	line "great for collect-"
	cont "ing research data!"
	done

BTBugsyLossText:
	text "Yeah! Way to go,"
	line "team!"
	done

BTBugsyWinText:
	text "Crushed underfoot…"
	line "Yikes."
	done

BTWhitneyGreetingText:
	text "Aww, did you come"
	line "in here looking"

	para "for little old me?"
	line "Well, here I am!"
	done

BTWhitneyLossText:
	text "Yeehaw! We did it!"
	done

BTWhitneyWinText:
	text "…"
	line "Waaaaah!"
	done

BTMortyGreetingText:
	text "Hey, <PLAYER>."
	line "Still at it?"

	para "Let's see how much"
	line "we've improved!"
	done

BTMortyLossText:
	text "Just one step"
	line "closer to the top."
	done

BTMortyWinText:
	text "Looks like you're"
	line "still ahead of me…"
	done

BTChuckGreetingText:
	text "HWAAAH!"
	line "<PLAYER>!"

	para "Let's make them"
	line "feel our battle in"
	cont "the next room!"
	done

BTChuckLossText:
	text "HYAAH! That's how"
	line "it's done!"
	done

BTChuckWinText:
	text "That was a little"
	line "too hard…"
	done

BTJasmineGreetingText:
	text "Um… It's nice to"
	line "see you again…"

	para "…Shall we begin?"
	done

BTJasmineLossText:
	text "…That's the power"
	line "of cold steel."
	done

BTJasmineWinText:
	text "Um…"
	line "Congratulations…"
	done

BTPryceGreetingText:
	text "<PLAYER>… I've"
	line "trained since we"
	cont "last met."

	para "Let's see if it's"
	line "enough."
	done

BTPryceLossText:
	text "Now it's your turn"
	line "to train more."
	done

BTPryceWinText:
	text "You continue to"
	line "prove yourself…"
	done

BTClairGreetingText:
	text "…You again…"

	para "Let's keep things"
	line "fair this time."
	done

BTClairLossText:
	text "Ha! So you're not"
	line "unbeatable!"
	done

BTClairWinText:
	text "…I'll accept my"
	line "loss with grace."
	done

BTKogaGreetingText:
	text "My daughter speaks"
	line "highly of you."

	para "Can you live up to"
	line "your reputation?"
	done

BTKogaLossText:
	text "Now you know the"
	line "true power of the"
	cont "NINJA!"
	done

BTKogaWinText:
	text "Ah! Impressive."
	done

BTKarenGreetingText:
	text "Can you keep me"
	line "entertained?"
	done

BTKarenLossText:
	text "I am known for my"
	line "overpowering tac-"
	cont "tics. Train more"
	cont "and try again."
	done

BTKarenWinText:
	text "You backed me into"
	line "a corner."
	cont "Well done."
	done

BTADGreetingText:
	text "Huh, you got me."

	para "This shouldn't be"
	line "too hard then."
	done

BTADLossText:
	text "Oh. Uh. Sorry."
	done

BTADWinText:
	text "What'd I tell you?"
	done

BTLucasGreetingText:
	text "It's me again."
	line "Think you can beat"
	cont "me in here?"
	done

BTLucasLossText:
	text "Too bad."
	done

BTLucasWinText:
	text "OBJECTION!"
	done

BTPercyGreetingText:
	text "If there were two"
	line "guys on the moon"

	para "and one of them"
	line "killed the other"

	para "with a rock would"
	line "that be messed up"
	cont "or what?"
	done

BTPercyLossText:
BTPercyWinText:
	text "Oh nooo! Toileeet!"
	done

BTLewotGreetingText:
	text "We meet again. How"
	line "do you like this"

	para "change to the"
	line "BATTLE TOWER?"
	done

BTLewotLossText:
	text "This is where the"
	line "real challenge"
	cont "lies."
	done

BTLewotWinText:
	text "You're going"
	line "places, kid."
	done

BTLanceGreetingText:
	text "CHAMPION <PLAYER>!"

	para "I'm excited to get"
	line "another chance to"
	cont "challenge you!"

	para "I hope you're"
	line "ready!"
	done

BTLanceLossText:
	text "Does this mean I"
	line "win my title back?"
	cont "Haha!"
	done

BTLanceWinText:
	text "You truly are"
	line "remarkable."
	done

BTRedGreetingText:
	text "…"
	line "…"
	done

BTRedLossText:
BTRedWinText:
	text "…"
	done

BTDefaultGreetingText:
	text "I think I'm in the"
	line "wrong room…"
	done

BTDefaultLossText:
	text "Wow! I won?!"
	done

BTDefaultWinText:
	text "That's what I get"
	line "for sneaking in…"
	done
