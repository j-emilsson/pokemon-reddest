	db DEX_ZUBAT ; pokedex id

	db  45,  55,  35,  70,  40 ; 285
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
	dw ZubatPicFront, ZubatPicBack

	db ABSORB, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	              MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,           \
	     SWIFT,        REST,         SUBSTITUTE,   SLUDGE_BOMB,  SHADOW_BALL,  \
		 GIGA_DRAIN,   DARK_PULSE,   FLY
	; end

	db 0 ; padding
