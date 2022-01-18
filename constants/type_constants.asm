; ; TypeNames indexes (see data/types/names.asm)
	; const_def ; physical/special split start

; PHYSICAL EQU const_value
	; const NORMAL       ; $00
	; const FIGHTING     ; $01
	; const FLYING       ; $02
	; const POISON       ; $03
	; const GROUND       ; $04
	; const ROCK         ; $05
	; const BIRD         ; $06
	; const BUG          ; $07
	; const GHOST        ; $08
	; const STEEL		 ; $09

	; const_next 20

; SPECIAL EQU const_value
	; const FIRE         ; $14
	; const WATER        ; $15
	; const GRASS        ; $16
	; const ELECTRIC     ; $17
	; const PSYCHIC_TYPE ; $18
	; const ICE          ; $19
	; const DRAGON       ; $1A
	; const DARK		 ; $1B
	; const FAIRY		 ; $1C

; NUM_TYPES EQU const_value

	const_def

TYPES EQU const_value
	const NORMAL   ; $00
	const FIGHTING ; $01
	const FLYING   ; $02
	const POISON   ; $03
	const GROUND   ; $04
	const ROCK     ; $05
	const BUG      ; $07
	const GHOST    ; $08
	const STEEL    ; $09

	const FIRE     ; $14
	const WATER    ; $15
	const GRASS    ; $16
	const ELECTRIC ; $17
	const PSYCHIC  ; $18
	const ICE      ; $19
	const DRAGON   ; $1A
	const DARK     ; $1B
	const FAIRY    ; $1C
	
NUM_TYPES EQU const_value

; These are for the Physical Special split
	const PHYSICAL ; $00
	const SPECIAL  ; $01
	const STATUS   ; $02 ; physical/special split end
