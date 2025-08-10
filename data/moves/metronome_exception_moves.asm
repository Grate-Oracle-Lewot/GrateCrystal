; Metronome cannot turn into these moves.

MetronomeExcepts:
if DEF(_METRONOME_ONLY)
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
	db STRUGGLE ; -1
else
	db NO_MOVE
	db COUNTER
	db METRONOME
	db SKETCH
	db THIEF
	db PROTECT
	db DESTINY_BOND
	db SLEEP_TALK
	db MIRROR_COAT
	db STRUGGLE ; -1
; buffers for equal data size with Metronome mode
	db NO_MOVE
	db NO_MOVE
endc
