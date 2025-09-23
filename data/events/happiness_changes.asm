HappinessChanges:
; entries correspond to HAPPINESS_* constants
	table_width 3, HappinessChanges
	; change if happiness < 100, change if happiness < 200, change otherwise
	db  +5,  +4,  +3 ; Gained a level
	db  +5,  +4,  +3 ; Vitamin
	db  +3,  +2,  +1 ; X Item
	db  +3,  +2,  +1 ; Battled a Gym Leader
	db  +1,  +1,  +1 ; Learned a move
	db  -1,  -1,  -1 ; Lost to an enemy
	db  -5,  -5,  -5 ; Fainted due to poison
	db  -5,  -5,  -5 ; Lost to a much stronger enemy
	db  +4,  +4,  +4 ; Haircut (older brother) 1
	db  +5,  +5,  +5 ; Haircut (older brother) 2
	db  +6,  +6,  +6 ; Haircut (older brother) 3
	db  +3,  +3,  +3 ; Haircut (younger brother) 1
	db  +4,  +4,  +4 ; Haircut (younger brother) 2
	db +10, +10, +10 ; Haircut (younger brother) 3
	db  -5,  -5,  -5 ; Used Old Gateau or Bugwort (bitter)
	db -10, -10, -10 ; Used Sootfootroot (bitter)
	db -15, -15, -15 ; Used Vivichoke (bitter)
	db  +4,  +4,  +4 ; Grooming
	db +10,  +8,  +6 ; Gained a level in the place where it was caught
	assert_table_length NUM_HAPPINESS_CHANGES
