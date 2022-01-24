	db DEX_SEADRA ; pokedex id

	db  65,  50,  95, 120, 105 ; 540
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 75 ; catch rate
	db 155 ; base exp

	INCBIN "gfx/pokemon/front/seadra.pic", 0, 1 ; sprite dimensions
	dw SeadraPicFront, SeadraPicBack

	db BUBBLE, SMOKESCREEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   SLUDGE_BOMB,  OUTRAGE,      DRAGON_BREATH,IRON_HEAD,    \
		 FLASH_CANNON, DRAGON_PULSE, SURF
	; end

	db 0 ; padding
