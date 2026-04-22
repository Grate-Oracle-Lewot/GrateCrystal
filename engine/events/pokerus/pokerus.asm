GivePokerusAndConvertBerries::
	call ConvertBerriesToBerryJuice
	call ProduceMooMooMilk
	ld hl, wPartyMon1PokerusStatus
	ld a, [wPartyCount]
	ld b, a
	ld de, PARTYMON_STRUCT_LENGTH
; Check to see if any of your Pokemon already has Pokerus.
; If so, sample its spread through your party.
.loopMons
	ld a, [hl]
	and $f
	jr nz, .TrySpreadPokerus
	add hl, de
	dec b
	jr nz, .loopMons

.de_novo
	call Random
	ldh a, [hRandomAdd]
	and a
	ret nz
	ldh a, [hRandomSub]
	cp 42 ; 42/65536 chance (originally 3/65536)
	ret nc
	ld a, [wPartyCount]
	ld b, a
.randomMonSelectLoop
	call Random
	and $7
	cp b
	jr nc, .randomMonSelectLoop
	ld hl, wPartyMon1PokerusStatus
	call GetPartyLocation ; get pokerus byte of random mon
	ld a, [hl]
	and $f0
	ret nz ; if it already has pokerus, do nothing
.randomPokerusLoop ; Simultaneously sample the strain and duration
	call Random
	and a
	jr z, .randomPokerusLoop
	ld b, a
	and $f0
	jr z, .load_pkrs
	ld a, b
	and $7
	inc a
	ld b, a
.load_pkrs
	swap b
	and $3
	inc a
	add b
	ld [hl], a
	ret

.TrySpreadPokerus:
; only one mon, nothing to do
	ld a, b ; [wPartyCount]
	cp 1
	jr z, .de_novo

; 1/3 chance
	call Random
	cp 33 percent + 1
	jr nc, .de_novo

	ld c, [hl]
	ld a, b
	cp 2
	jr c, .checkPreviousMonsLoop ; no more mons after this one, go backwards

	call Random
	cp 50 percent + 1
	jr c, .checkPreviousMonsLoop ; 1/2 chance, go backwards
.checkFollowingMonsLoop
	add hl, de
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	jr z, .de_novo ; if mon has cured pokerus, stop searching
	dec b ; go on to next mon
	ld a, b
	cp 1
	jr nz, .checkFollowingMonsLoop ; no more mons left
	jr .de_novo

.checkPreviousMonsLoop
	ld a, [wPartyCount]
	cp b
	jr z, .de_novo ; no more mons
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	jr z, .de_novo ; if mon has cured pokerus, stop searching
	inc b ; go on to next mon
	jr .checkPreviousMonsLoop

.infectMon
	ld a, c
	and $f0
	ld b, a
	ld a, c
	swap a
	and $3
	inc a
	add b
	ld [hl], a
	jr .de_novo

ConvertBerriesToBerryJuice:
	call Random
	cp 1 out_of 16 ; 6.25% chance
	ret nc
	ld hl, wPartyMons
	ld a, [wPartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [hl]
	cp SHUCKLE
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp BERRY
	jr z, .convertToJuice

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
	ret

.convertToJuice
	ld a, BERRY_JUICE
	ld [hl], a
	pop hl
	pop af
	ret

ProduceMooMooMilk:
	call Random
	cp 1 out_of 20 ; 5% chance
	ret nc
	ld hl, wPartyMons
	ld a, [wPartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [hl]
	cp MILTANK
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp NO_ITEM
	jr z, .produceMilk

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
	ret

.produceMilk
	ld a, MOOMOO_MILK
	ld [hl], a
	pop hl
	pop af
	ret
