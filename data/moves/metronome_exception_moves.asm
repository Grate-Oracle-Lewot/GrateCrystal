; Metronome cannot turn into these moves.

if DEF(_METRONOME_ONLY)
MetronomeExcepts:
MetronomeExcepts_BattleTower:
	db NO_MOVE
	db DISABLE
	db COUNTER
	db METRONOME
	db SKETCH
	db SPITE
	db PROTECT
	db DESTINY_BOND
	db SLEEP_TALK
	db ENCORE
	db MIRROR_COAT
	db -1 ; end
else
MetronomeExcepts:
	db THIEF
MetronomeExcepts_BattleTower:
	db NO_MOVE
	db COUNTER
	db METRONOME
	db SKETCH
	db PROTECT
	db DESTINY_BOND
	db SLEEP_TALK
	db MIRROR_COAT
	db -1 ; end
; buffers for equal data size with Metronome mode
	db NO_MOVE
	db NO_MOVE
endc
