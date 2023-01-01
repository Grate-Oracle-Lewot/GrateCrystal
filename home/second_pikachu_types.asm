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
