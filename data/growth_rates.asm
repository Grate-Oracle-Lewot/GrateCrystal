growth_rate: MACRO
; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 < 0
		db -\3 | $80 ; signed magnitude
	else
		db \3
	endc
	db \4, \5
ENDM

GrowthRates:
; entries correspond to GROWTH_* (see constants/pokemon_data_constants.asm)
	table_width 4, GrowthRates
	growth_rate 4, 5,   0,   0,   0 ; Fast
	growth_rate 1, 1,   0,   0,   0 ; Medium Fast
	growth_rate 3, 4,  10,   0,  30 ; Slightly Fast
	growth_rate 3, 4,  20,   0,  70 ; Slightly Slow
	growth_rate 6, 5, -15, 100, 140 ; Medium Slow
	growth_rate 5, 4,   0,   0,   0 ; Slow
	assert_table_length NUM_GROWTH_RATES - 2 ; exclude Erratic and Fluctuating

ErraticExperience:
	table_width 3, ErraticExperience
	for n, 1, MAX_LEVEL + 1
		if n == 1
			dt 0
		elif n < 50
			dt (n**3 * (100 - n)) / 50
		elif n < 68
			dt (n**3 * (150 - n)) / 100
		elif n < 98
			dt (n**3 * ((1911 - 10 * n) / 3)) / 500
		else
			dt (n**3 * (160 - n)) / 100
		endc
	endr
	assert_table_length MAX_LEVEL

FluctuatingExperience:
	table_width 3, FluctuatingExperience
	for n, 1, MAX_LEVEL + 1
		if n == 1
			dt 0
		elif n < 15
			dt (n**3 * ((n + 1) / 3 + 24)) / 50
		elif n < 36
			dt (n**3 * (n + 14)) / 50
		else
			dt (n**3 * (n / 2 + 32)) / 50
		endc
	endr
	assert_table_length MAX_LEVEL
