FloatMons::
if DEF(_VANILLA_TYPES)
	db BEEDRILL
	db VENOMOTH
	db MAGNEMITE
	db MAGNETON
	db GASTLY
	db HAUNTER
	db GENGAR
	db KOFFING
	db WEEZING
	db MEW
	db MISDREAVUS
	db UNOWN
	db JIRK
	db CELEBI
	db -1 ; end
; buffers for equal data size
	db 0, 0, 0, 0, 0
else
	db BEEDRILL
	db VENOMOTH
	db MAGNEMITE
	db MAGNETON
	db GASTLY
	db HAUNTER
	db GENGAR
	db KOFFING
	db WEEZING
	db MEW
	db LEDYBA
	db LEDIAN
	db MISDREAVUS
	db UNOWN
	db JIRK
	db LUGIA
	db HO_OH
	db CELEBI
	db YANMEGA
	db -1 ; end
endc
