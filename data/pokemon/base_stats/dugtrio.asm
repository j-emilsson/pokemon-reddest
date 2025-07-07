	db DEX_DUGTRIO ; pokedex id

	db  70, 110,  70, 130,  75 ; 530
	;   hp  atk  def  spd  spc

	db GROUND, STEEL ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
	dw DugtrioPicFront, DugtrioPicBack

	db SCRATCH, GROWL, DIG, TRI_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     EARTHQUAKE,         DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REST,         ROCK_SLIDE,   TRI_ATTACK,   \
		 SUBSTITUTE,   SLUDGE_BOMB,  FLASH_CANNON, CUT
	; end

	db 0 ; padding
