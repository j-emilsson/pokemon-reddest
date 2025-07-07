	db DEX_ARBOK ; pokedex id

	db  75, 105,  70, 125,  75 ; 525
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db 90 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
	dw ArbokPicFront, ArbokPicBack

	db WRAP, LEER, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     MEGA_DRAIN,   EARTHQUAKE,         DIG,          MIMIC,        \
		 DOUBLE_TEAM,  SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
		 SLUDGE_BOMB,  GIGA_DRAIN,   POISON_JAB,   DARK_PULSE,   STRENGTH
	; end

	db 0 ; padding
