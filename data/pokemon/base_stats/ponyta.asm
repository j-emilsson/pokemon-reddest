	db DEX_PONYTA ; pokedex id

	db  50,  80,  50, 110,  50 ; 390
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 152 ; base exp

	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
	dw PonytaPicFront, PonytaPicBack

	db EMBER, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,           BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
		 SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
