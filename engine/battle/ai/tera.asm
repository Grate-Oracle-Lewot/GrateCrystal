CheckEnemyTeraMatchups::
; assumes enemy's Hidden Power type is already calc'd and stored in d
; returns nc if enemy's Tera Orb would improve its type matchup against current player mon

; advantage checks preserve d
  farcall CheckPlayerTypeAdvantage
  jr c, .no
  farcall CheckEnemyTypeAdvantage
  jr nc, .no

  ld a, d
  ld b, a
	farcall AI_CheckEnemyAdvantage
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
  ret

.no
  scf
  ret
