	db DEX_TAUROS ; pokedex id

	db  80, 110, 100, 120,  70 ; 550
	;   hp  atk  def  spd  spc

	db NORMAL, STEEL ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
	dw TaurosPicFront, TaurosPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,           BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SOLARBEAM,    \
	     THUNDERBOLT,  THUNDER,      EARTHQUAKE,         MIMIC,        \
	     DOUBLE_TEAM,  FIRE_BLAST,   SKULL_BASH,   REST,         \
	     ROCK_SLIDE,   SUBSTITUTE,   SURF,         STRENGTH
	; end

	db 0 ; padding
