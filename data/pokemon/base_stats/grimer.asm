	db DEX_GRIMER ; pokedex id

	db  85,  95,  50,  25,  65 ; 385
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBack

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    MEGA_DRAIN,   THUNDERBOLT,  \
	     THUNDER,      DIG,          MIMIC,        DOUBLE_TEAM,  \
	     SELFDESTRUCT, FIRE_BLAST,   REST,         EXPLOSION,    ROCK_SLIDE,   \
		 SUBSTITUTE,   SLUDGE_BOMB,  SHADOW_BALL,  GIGA_DRAIN,   POISON_JAB,   \
		 STRENGTH
	; end

	db 0 ; padding
