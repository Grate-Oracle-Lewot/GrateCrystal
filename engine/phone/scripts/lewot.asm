LewotPhoneCalleeScript:
	farwritetext LewotPhoneGreetingText
	promptbutton
	random 8
	ifequal 0, .Zigg
	ifequal 1, .Water
	ifequal 2, .Gen
	ifequal 3, .IceSculpture
	ifequal 4, .Pikmin
	ifequal 5, .CoinFlip
	ifequal 6, .Omastar

; else
	farwritetext LewotPhonePopcornText
	sjump .hangup

.Zigg
	farwritetext LewotPhoneZiggText
	sjump .hangup

.Water
	farwritetext LewotPhoneWaterText
	sjump .hangup

.Gen
	farwritetext LewotPhoneGenText
	sjump .hangup

.IceSculpture
	farwritetext LewotPhoneIceSculptureText
	sjump .hangup

.Pikmin
	farwritetext LewotPhonePikminText
	sjump .hangup

.CoinFlip
	farwritetext LewotPhoneCoinFlipText
	sjump .hangup

.Omastar
	farwritetext LewotPhoneOmastarText

.hangup
	promptbutton
	farwritetext LewotPhoneHangUpText
	end

LewotPhoneCallerScript:
	farwritetext LewotCallerGreetingText
	promptbutton
	farwritetext LewotCallerGlitchesText
	promptbutton
	farwritetext LewotCallerHangUpText
	end
