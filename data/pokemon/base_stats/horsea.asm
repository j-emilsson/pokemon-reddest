	db DEX_HORSEA ; pokedex id

	db  50,  40,  70,  80,  70
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 225 ; catch rate
	db 83 ; base exp

	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
	dw HorseaPicFront, HorseaPicBack

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     MIMIC,        DOUBLE_TEAM,  \
	     SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     SLUDGE_BOMB,  DRAGON_BREATH,FLASH_CANNON, DRAGON_PULSE, SURF
	; end

	db 0 ; padding
