; HM moves can't be forgotten

IsHM::
	cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM:
	and a
	ret

IsHMMove::
	ld hl, .HMMoves
	jp IsInByteArray

.HMMoves:
if DEF(_HM_ITEMS_START)
	db -1 ; end
else
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db FLASH
	db WATERFALL
	db WHIRLPOOL
	db ROCK_SMASH
	db -1 ; end
endc
