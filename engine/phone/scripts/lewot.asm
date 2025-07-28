LewotPhoneCalleeScript:
	farwritetext LewotPhoneGreetingText
	promptbutton
	random 6
	ifequal 0, .Zigg
	ifequal 1, .Water
	ifequal 2, .Gen
	ifequal 3, .IceSculpture
	ifequal 4, .Pikmin

; else
	farwritetext LewotPhonePopcornText
	sjump .hangup

.Zigg
	farwritetext LewotPhoneZiggText
	sjump .hangup

.Water
	farwritetext LewotPhoneWaterText
	sjump .hangup

.Water
	farwritetext LewotPhoneGenText
	sjump .hangup

.IceSculpture
	farwritetext LewotPhoneIceSculptureText
	sjump .hangup

.Pikmin
	farwritetext LewotPikminText

.hangup
	promptbutton
	farwritetext LewotPhoneHangUpText
	end
