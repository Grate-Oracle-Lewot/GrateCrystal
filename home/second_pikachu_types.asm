SecondPikachuTypes::
; entries correspond to PIKACHU_* constants
  table_width 1, SecondPikachuTypes
  db ELECTRIC ; PIKACHU_RETRO
  db NORMAL   ; PIKACHU_SILVER
  db FAIRY    ; PIKACHU_CRYSTAL
  db FIGHTING ; PIKACHU_FIGHTING
  db WATER    ; PIKACHU_SURFING
  db FLYING   ; PIKACHU_FLYING
  assert_table_length NUM_PIKACHU_FORMS

GetSecondPikachuType::
; must be called when [wCurPartySpecies] = PIKACHU
	; we want to get the [wPikachuForm]th entry from the SecondPikachuTypes table
	ld a, [wPikachuForm]
	dec a ; is evidently necessary
	ld hl, SecondPikachuTypes

	; add a to hl, efficiently: https://github.com/pret/pokecrystal/wiki/Optimizing-assembly-code#add-a-to-a-16-bit-register
	add l
	ld l, a
	adc h
	sub l
	ld h, a

	; get the form and return it in a
	ld a, [hl]
	ret
