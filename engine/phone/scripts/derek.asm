DerekPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	checkflag ENGINE_DEREK_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .Nugget
	checkflag ENGINE_DEREK_SATURDAY_MORNING
	iftrue .NotSaturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue DerekSaturdayMorning

.NotSaturday:
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, DerekContestToday
	ifequal THURSDAY, DerekContestToday
	ifequal SATURDAY, DerekContestToday

.NoContest:
	farsjump DerekHangUpScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump DerekReminderScript

.Nugget:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump DerekComePickUpScript

DerekPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_DEREK_READY_FOR_REMATCH
	iftrue .NoBattle
	checkflag ENGINE_DEREK_SATURDAY_MORNING
	iftrue .NoBattle
	farscall PhoneScript_Random2
	ifequal 0, DerekWantsBattle

.NoBattle:
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, DerekContestToday
	ifequal THURSDAY, DerekContestToday
	ifequal SATURDAY, DerekContestToday

.NoContest:
	farscall PhoneScript_Random4
	ifequal 0, .Nugget
	farsjump Phone_GenericCall_Male

.Nugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump PhoneScript_FoundItem_Male

DerekSaturdayMorning:
	setflag ENGINE_DEREK_SATURDAY_MORNING

DerekWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	setflag ENGINE_DEREK_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

DerekContestToday:
	farsjump PhoneScript_BugCatchingContest
