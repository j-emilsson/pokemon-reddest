	db DEX_DIGLETT ; pokedex id

	db  50,  75,  35,  95,  45 ; 345
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 255 ; catch rate
	db 81 ; base exp

	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
	dw DiglettPicFront, DiglettPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     EARTHQUAKE,         DIG,          MIMIC,        DOUBLE_TEAM,  \
	     REST,         ROCK_SLIDE,   SUBSTITUTE,   SLUDGE_BOMB,  \
		 FLASH_CANNON, CUT
	; end

	db 0 ; padding
