	db DEX_BUTTERFREE ; pokedex id

	db  70,  45,  70,  95, 120 ; 520
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 160 ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBack

	db CONFUSION, GUST, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SWIFT,        DREAM_EATER,  SKY_ATTACK,   REST,         PSYWAVE,      \
		 SHADOW_BALL,  GIGA_DRAIN,   AIR_SLASH,    BUG_BUZZ,     SUBSTITUTE,   \
		 FLY,          FLASH
	; end

	db 0 ; padding
