	db DEX_VENOMOTH ; pokedex id

	db  80,  55,  70, 105, 105 ; 520
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBack

	db TACKLE, DISABLE, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   MEGA_DRAIN,   SOLARBEAM,    PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SWIFT,        REST,         PSYWAVE,      SUBSTITUTE,   SLUDGE_BOMB,  \
		 GIGA_DRAIN,   FLY,          FLASH
	; end

	db 0 ; padding
