LewotPhoneCalleeScript:
	farwritetext LewotPhoneGreetingText
	promptbutton
	random 5
	ifequal 0, .Zigg
	ifequal 1, .Water
	ifequal 2, .Gen
	ifequal 3, .IceSculpture

	farwritetext LewotPikmin4Text
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

.hangup
	promptbutton
	farwritetext LewotPhoneHangUpText
	end
