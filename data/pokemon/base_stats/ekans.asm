	db DEX_EKANS ; pokedex id

	db  45,  70,  45,  95,  50 ; 355
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db 255 ; catch rate
	db 62 ; base exp

	INCBIN "gfx/pokemon/front/ekans.pic", 0, 1 ; sprite dimensions
	dw EkansPicFront, EkansPicBack

	db WRAP, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     MEGA_DRAIN,   EARTHQUAKE,         DIG,          MIMIC,        \
	     DOUBLE_TEAM,  SKULL_BASH,   REST,         ROCK_SLIDE,   \
	     SUBSTITUTE,   SLUDGE_BOMB,  GIGA_DRAIN,   POISON_JAB,   DARK_PULSE,   \
		 STRENGTH
	; end

	db 0 ; padding
