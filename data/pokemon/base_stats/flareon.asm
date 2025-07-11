	db DEX_FLAREON ; pokedex id

	db  75, 130,  70, 115,  85 ; 560
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp

	INCBIN "gfx/pokemon/front/flareon.pic", 0, 1 ; sprite dimensions
	dw FlareonPicFront, FlareonPicBack

	db TACKLE, TAIL_WHIP, EMBER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   PAY_DAY,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        \
		 SKULL_BASH,   REST,         SUBSTITUTE,   SHADOW_BALL,  STRENGTH
	; end

	db 0 ; padding
