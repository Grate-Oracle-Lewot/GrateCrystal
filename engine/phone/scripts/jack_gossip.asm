JackTriviaScript:
	random 11
	ifequal  0, .DefenseCurl
	ifequal  1, .Solarbeam
	ifequal  2, .Thunder
	ifequal  3, .Stomp
	ifequal  4, .Fly
	ifequal  5, .Dig
	ifequal  6, .Sandstorm
	ifequal  7, .Hail
	ifequal  8, .SunSpeed
	ifequal  9, .SunnyDay
	ifequal 10, .RainDance

.DefenseCurl:
	farwritetext JackDefenseCurlTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Solarbeam:
	farwritetext JackSolarbeamTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Thunder:
	farwritetext JackThunderTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Stomp:
	farwritetext JackStompTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Fly:
	farwritetext JackFlyTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Dig:
	farwritetext JackDigTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Sandstorm:
	farwritetext JackSandstormTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Hail:
	farwritetext JackHailTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.SunSpeed:
	farwritetext JackSunSpeedTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.SunnyDay:
	farwritetext JackSunnyDayTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.RainDance:
	farwritetext JackRainDanceTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male
