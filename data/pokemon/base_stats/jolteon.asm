	db DEX_JOLTEON ; pokedex id

	db  75,  55,  70, 130, 115 ; 560
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBack

	db TACKLE, TAIL_WHIP, THUNDERSHOCK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     PAY_DAY,      THUNDERBOLT,  THUNDER,      DIG,          \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      SWIFT,        \
	     SKULL_BASH,   REST,         THUNDER_WAVE, SUBSTITUTE,   SHADOW_BALL,  \
		 SHOCK_WAVE,   STRENGTH,     FLASH
	; end

	db 0 ; padding
