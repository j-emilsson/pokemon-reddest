farcall: MACRO
	ld b, BANK(\1)
	ld hl, \1
	rst _Bankswitch
ENDM

callfar: MACRO
	ld hl, \1
	ld b, BANK(\1)
	rst _Bankswitch
ENDM

farjp: MACRO
	ld b, BANK(\1)
	ld hl, \1
	jp Bankswitch
ENDM

jpfar: MACRO
	ld hl, \1
	ld b, BANK(\1)
	jp Bankswitch
ENDM

homecall: MACRO
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	call SetCurBank
	call \1
	pop af
	call SetCurBank
ENDM

homecall_sf: MACRO ; homecall but save flags by popping into bc instead of af
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	call SetCurBank
	call \1
	pop bc
	ld a, b
	call SetCurBank
ENDM
