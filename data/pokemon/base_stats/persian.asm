	db DEX_PERSIAN ; pokedex id

	db  75, 105,  70, 125,  75 ; 525
	;   hp  atk  def  spd  spc

	db NORMAL, DARK ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
	dw PersianPicFront, PersianPicBack

	db SCRATCH, GROWL, BITE, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     WATER_GUN,    HYPER_BEAM,   PAY_DAY,      RAGE,         THUNDERBOLT,  \
	     THUNDER,      DIG,          MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKULL_BASH,   DREAM_EATER,  REST,         SUBSTITUTE,   \
		 SHADOW_BALL,  CRUNCH,       HYPER_VOICE,  IRON_HEAD,    POWER_GEM,    \
		 DARK_PULSE,   PLAY_ROUGH,   CUT,          FLASH
	; end

	db 0 ; padding
