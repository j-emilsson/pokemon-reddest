	db DEX_MUK ; pokedex id

	db 110, 120,  75,  50,  90 ; 535
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db 75 ; catch rate
	db 157 ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBack

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   TOXIC,        BODY_SLAM,    HYPER_BEAM,   \
	     MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  SELFDESTRUCT, FIRE_BLAST,   REST,         \
		 EXPLOSION,    ROCK_SLIDE,   SUBSTITUTE,   SLUDGE_BOMB,  SHADOW_BALL,  \
		 GIGA_DRAIN,   POISON_JAB,   DARK_PULSE,   STRENGTH
	; end

	db 0 ; padding
