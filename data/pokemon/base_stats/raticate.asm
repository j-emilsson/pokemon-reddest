	db DEX_RATICATE ; pokedex id

	db  90,  95,  95, 110,  65 ; 520
	;   hp  atk  def  spd  spc

	db NORMAL, DARK ; type
	db 90 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, SWORDS_DANCE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     COUNTER,      THUNDERBOLT,  THUNDER,      DIG,          \
	     MIMIC,        DOUBLE_TEAM,  SWIFT,        SKULL_BASH,   \
		 REST,         SUBSTITUTE,   SLUDGE_BOMB,  SHADOW_BALL,  SHOCK_WAVE,   \
		 DARK_PULSE,   CUT,          STRENGTH
	; end

	db 0 ; padding
