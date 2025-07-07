	db DEX_WEEPINBELL ; pokedex id

	db  75, 110,  55,  75,  70 ; 455
	;   hp  atk  def  spd  spc

	db GRASS, DARK ; type
	db 120 ; catch rate
	db 151 ; base exp

	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
	dw WeepinbellPicFront, WeepinbellPicBack

	db VINE_WHIP, GROWTH, WRAP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  MEGA_DRAIN,   \
		 SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      REST,         \
		 SUBSTITUTE,   SLUDGE_BOMB,  GIGA_DRAIN,   POISON_JAB,   DARK_PULSE,   \
		 CUT,          FLASH
	; end

	db 0 ; padding
