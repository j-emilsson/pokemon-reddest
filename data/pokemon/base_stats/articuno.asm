	db DEX_ARTICUNO ; pokedex id

	db  90,  85, 120,  85, 135 ; 650
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db 3 ; catch rate
	db 215 ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBack

	db GUST, AURORA_BEAM, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
		 WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   MIMIC,        \
		 DOUBLE_TEAM,  REFLECT,      SWIFT,        SKY_ATTACK,   REST,         \
		 SUBSTITUTE,   FLY
	; end

	db 0 ; padding
