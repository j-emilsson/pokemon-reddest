	db DEX_RAICHU ; pokedex id

	db  80,  70,  65, 105, 115 ; 550
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
	dw RaichuPicFront, RaichuPicBack

	db THUNDERSHOCK, GROWL, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      SUBMISSION,   SEISMIC_TOSS, \
	     THUNDERBOLT,  THUNDER,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      SWIFT,        SKULL_BASH,   \
	     REST,         THUNDER_WAVE, SUBSTITUTE,   FLY,          SURF,         \
		 STRENGTH,     FLASH
	; end

	db 0 ; padding
