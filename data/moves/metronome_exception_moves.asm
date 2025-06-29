; Metronome cannot turn into these moves.

MetronomeExcepts:
if DEF(_METRONOME_ONLY)
	db NO_MOVE
	db METRONOME
	db SKETCH
	db COUNTER
	db MIRROR_COAT
	db PROTECT
	db ENDURE
	db DESTINY_BOND
	db SLEEP_TALK
	db STRUGGLE ; -1
else
	db NO_MOVE
	db METRONOME
	db SKETCH
	db COUNTER
	db MIRROR_COAT
	db PROTECT
	db ENDURE
	db DESTINY_BOND
	db SLEEP_TALK
	db THIEF
	db STRUGGLE ; -1
endc
