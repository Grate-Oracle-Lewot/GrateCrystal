LewotPhoneCalleeScript:
	farwritetext LewotPhoneGreetingText
	promptbutton
	random 7
	ifequal 0, .Zigg
	ifequal 1, .Water
	ifequal 2, .Gen
	ifequal 3, .IceSculpture
	ifequal 4, .Pikmin
	ifequal 5, .CoinFlip

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
