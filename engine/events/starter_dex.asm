; this function temporarily makes the starters (and Ivysaur) seen
; so that the full Pokedex information gets displayed in Oak's lab
StarterDex:
	;ld a, 1 << (DEX_BULBASAUR - 1) | 1 << (DEX_IVYSAUR - 1) | 1 << (DEX_CHARMANDER - 1) | 1 << (DEX_SQUIRTLE - 1)
	;ld [wPokedexOwned], a
	push hl
    ld hl, wPokedexOwned
    ld b, $13 ;default 19 byte (hex $13) length of Pokedexs, set to your actual pokedex data length
    ld a, $ff ; $ff functions to set pokedex the data to fully completed
.again
    ld [hli], a
    dec b
    jr nz, .again
	predef ShowPokedexData
	;xor a
	;ld [wPokedexOwned], a
	ld hl, wPokedexOwned
    ld b, $13 ;default 19 byte (hex $13) length of Pokedexs, set to your actual pokedex data length
    ld a, $0 ; $0 functions to set pokedex the data back to blank
.again2
    ld [hli], a
    dec b
    jr nz, .again2
    pop hl
	ret
