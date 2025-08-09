IsMailEuropean:
; return 1 if French
; return 2 if German
; return 3 if Italian
; return 4 if Spanish
; return 0 if none of the above
	ld c, $0
	ld hl, sPartyMon1MailNationality - sPartyMon1Mail
	add hl, de
	ld a, [hli]
	cp "E"
	ret nz
	ld a, [hli]
	inc c
	cp "F"
	ret z
	inc c
	cp "G"
	ret z
	inc c
	cp "I"
	ret z
	inc c
	cp "S"
	ret z
	ld c, $0
	ret

; The regular font.
StandardEnglishFont:
if DEF(_ADD_MISSINGNO) || DEF(_MISSINGNO_STARTERS) || DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS) || DEF(_METRONOME_ONLY)
INCBIN "gfx/font/font_heart.1bpp"
else
INCBIN "gfx/font/font.1bpp"
endc

; An extended font.
FrenchGermanFont:
if DEF(_ADD_MISSINGNO) || DEF(_MISSINGNO_STARTERS) || DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS) || DEF(_METRONOME_ONLY)
INCBIN "gfx/font/french_german_heart.1bpp"
else
INCBIN "gfx/font/french_german.1bpp"
endc

; An even more extended font.
SpanishItalianFont:
if DEF(_ADD_MISSINGNO) || DEF(_MISSINGNO_STARTERS) || DEF(_ADD_TURBIN) || DEF(_TURBIN_STARTERS) || DEF(_METRONOME_ONLY)
INCBIN "gfx/font/spanish_italian_heart.1bpp"
else
INCBIN "gfx/font/spanish_italian.1bpp"
endc

ConvertFrenchGermanMailToEnglish:
; Called if mail is French or German
; Converts 's 't 'v from French/German character set to English
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp $dc ; 's in French/German font
	jr nz, .check_intermediate_chars
	ld a, "'s"
	jr .replace

.check_intermediate_chars
	sub "'s"
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add $cd

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertEnglishMailToFrenchGerman:
; Called if mail is English and game is French or German
; Converts 's 't 'v from English character set to French/German
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp "'s"
	jr nz, .check_intermediate_chars
	ld a, $dc ; 's in French/German font
	jr .replace

.check_intermediate_chars
	sub $cd
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add "'s"

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret

ConvertSpanishItalianMailToEnglish:
; Called if mail is Spanish or Italian
; Converts 'd 'l 'm 'r 's 't 'v from Spanish/Italian character set to English
ConvertEnglishMailToSpanishItalian:
; Called if mail is English and game is Spanish or Italian
; Converts 'd 'l 'm 'r 's 't 'v from English character set to Spanish/Italian
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	and $f0
	cp $d0
	jr nz, .dont_replace
	ld a, [hl]
	add $8
	and $f
	or $d0
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret
