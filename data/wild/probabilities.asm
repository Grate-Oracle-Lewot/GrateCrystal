mon_prob: MACRO
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	table_width 2, GrassMonProbTable
	mon_prob 25,  0 ; 25% chance
	mon_prob 50,  1 ; 25% chance
	mon_prob 60,  2 ; 10% chance
	mon_prob 70,  3 ; 10% chance
	mon_prob 80,  4 ; 10% chance
	mon_prob 90,  5 ; 10% chance
	mon_prob 95,  6 ;  5% chance
	mon_prob 100, 7 ;  5% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 2, WaterMonProbTable
	mon_prob 40,  0 ; 40% chance
	mon_prob 80,  1 ; 40% chance
	mon_prob 90,  2 ; 10% chance
	mon_prob 100, 3 ; 10% chance
	assert_table_length NUM_WATERMON
