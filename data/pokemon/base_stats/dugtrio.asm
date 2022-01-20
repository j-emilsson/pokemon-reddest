	db DEX_DUGTRIO ; pokedex id

	db  70, 100,  70, 130,  75 ; 520
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
	     RAGE,         EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         REST,         ROCK_SLIDE,   TRI_ATTACK,   \
		 SUBSTITUTE,   SLUDGE_BOMB,  IRON_HEAD,    FLASH_CANNON, EARTH_POWER,  \
		 CUT
	; end

	db 0 ; padding
