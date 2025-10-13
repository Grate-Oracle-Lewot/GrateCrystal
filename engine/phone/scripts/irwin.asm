IrwinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	checkflag ENGINE_IRWIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue IrwinRockets
	checkflag ENGINE_IRWIN_SUNDAY_NIGHT
	iftrue .NotSunday
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue IrwinSundayNight

.NotSunday:
	farsjump IrwinRandomTextScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	farsjump IrwinReminderScript

IrwinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_IRWIN_READY_FOR_REMATCH
	iftrue .NoBattle
	checkflag ENGINE_IRWIN_SUNDAY_NIGHT
	iftrue .NoBattle
	farscall PhoneScript_Random3
	ifequal 0, IrwinWantsBattle
	ifequal 1, IrwinWantsBattle

.NoBattle:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue IrwinRockets
	farsjump IrwinRumorScript

IrwinSundayNight:
	setflag ENGINE_IRWIN_SUNDAY_NIGHT

IrwinWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	setflag ENGINE_IRWIN_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

IrwinRockets:
	farsjump IrwinRocketRumorScript
