	db DEX_ONIX ; pokedex id

	db  85, 135, 125, 115,  85 ; 630
	;   hp  atk  def  spd  spc

	db ROCK, DARK ; type
	db 45 ; catch rate
	db 214 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBack

	db ROCK_THROW, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     EARTHQUAKE,         DIG,          MIMIC,        DOUBLE_TEAM,  \
	     SELFDESTRUCT, SKULL_BASH,   REST,         EXPLOSION,    \
	     ROCK_SLIDE,   SUBSTITUTE,   DRAGON_BREATH,FLASH_CANNON, DARK_PULSE,   \
		 DRAGON_PULSE, STRENGTH
	; end

	db 0 ; padding
