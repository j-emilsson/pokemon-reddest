	db DEX_FARFETCHD ; pokedex id

	db  90, 130,  80, 120, 80 ; 580
	;   hp  atk  def  spd  spc

	db FLYING, FIGHTING ; type
	db 45 ; catch rate
	db 94 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBack

	db PECK, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
		 RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SWIFT,        SKULL_BASH,   SKY_ATTACK,   REST,         SUBSTITUTE,   \
	     CUT,          FLY
	; end

	db 0 ; padding
