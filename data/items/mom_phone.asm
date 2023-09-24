momitem: MACRO
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MomItems_1:
	momitem     50,    50, MOM_ITEM, POKE_BALL
	momitem    100,   100, MOM_ITEM, MAX_REPEL
	momitem    500,   500, MOM_ITEM, ULTRA_BALL
	momitem    500,   500, MOM_ITEM, FULL_RESTORE
	momitem   1000,  1000, MOM_ITEM, MAX_REVIVE
.End

MomItems_2:
	momitem   1500,   200, MOM_ITEM, BERRY_JUICE
	momitem   5000,  1000, MOM_DOLL, DECO_VOLTORB_DOLL
	momitem   5000,  1000, MOM_DOLL, DECO_ODDISH_DOLL
	momitem   5000,  1000, MOM_DOLL, DECO_GEODUDE_DOLL
	momitem   7500,  1500, MOM_DOLL, DECO_CLEFAIRY_DOLL
	momitem   7500,  1500, MOM_DOLL, DECO_JIGGLYPUFF_DOLL
	momitem  10000,  5000, MOM_DOLL, DECO_SQUIRTLE_DOLL
	momitem  20000,  5000, MOM_DOLL, DECO_BULBASAUR_DOLL
	momitem  50000, 10000, MOM_DOLL, DECO_UNOWN_DOLL
	momitem 100000, 10000, MOM_DOLL, DECO_BIG_SNORLAX_DOLL
.End

	dt 0 ; unused
