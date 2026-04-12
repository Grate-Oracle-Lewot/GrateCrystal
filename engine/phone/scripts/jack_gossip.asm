JackTriviaScript:
	random 13
	ifequal  0, .Rollout
	ifequal  1, .Solarbeam
	ifequal  2, .Thunder
	ifequal  3, .Stomp
	ifequal  4, .Gust
	ifequal  5, .Twister
	ifequal  6, .FairyWind
	ifequal  7, .Earthquake
	ifequal  8, .Magnitude
	ifequal  9, .Sandstorm
	ifequal 10, .Hail
	ifequal 11, .SunnyDay
	ifequal 12, .RainDance

.Rollout:
	farwritetext JackRolloutTriviaText
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

.Gust:
	farwritetext JackGustTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Twister:
	farwritetext JackTwisterTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.FairyWind:
	farwritetext JackFairyWindTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Earthquake:
	farwritetext JackEarthquakeTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.Magnitude:
	farwritetext JackMagnitudeTriviaText
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

.SunnyDay:
	farwritetext JackSunnyDayTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male

.RainDance:
	farwritetext JackRainDanceTriviaText
	promptbutton
	sjump PhoneScript_HangUpText_Male
