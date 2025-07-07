	db DEX_MEOWTH ; pokedex id

	db  50,  75,  45, 100,  50 ; 370
	;   hp  atk  def  spd  spc

	db NORMAL, DARK ; type
	db 255 ; catch rate
	db 69 ; base exp

	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
	dw MeowthPicFront, MeowthPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    PAY_DAY,      THUNDERBOLT,  THUNDER,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  SWIFT,        \
	     SKULL_BASH,   DREAM_EATER,  REST,         SUBSTITUTE,   SHADOW_BALL,  \
		 DARK_PULSE,   CUT,          FLASH
	; end

	db 0 ; padding
