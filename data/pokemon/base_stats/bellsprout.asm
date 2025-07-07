	db DEX_BELLSPROUT ; pokedex id

	db  60,  80,  40,  60,  55 ; 350
	;   hp  atk  def  spd  spc

	db GRASS, DARK ; type
	db 255 ; catch rate
	db 84 ; base exp

	INCBIN "gfx/pokemon/front/bellsprout.pic", 0, 1 ; sprite dimensions
	dw BellsproutPicFront, BellsproutPicBack

	db VINE_WHIP, GROWTH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  MEGA_DRAIN, \
	     SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      REST,       \
		 SUBSTITUTE,   SLUDGE_BOMB,  GIGA_DRAIN,   POISON_JAB,   DARK_PULSE, \
		 CUT,          FLASH
	; end

	db 0 ; padding
