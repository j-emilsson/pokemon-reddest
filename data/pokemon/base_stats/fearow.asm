	db DEX_FEAROW ; pokedex id

	db  90, 125,  65, 115,  65 ; 525
	;   hp  atk  def  spd  spc

	db FLYING, DARK ; type
	db 90 ; catch rate
	db 162 ; base exp

	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
	dw FearowPicFront, FearowPicBack

	db PECK, GROWL, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SWIFT,        SKY_ATTACK,   REST,         TRI_ATTACK,   SUBSTITUTE,   \
		 DARK_PULSE,   FLY
	; end

	db 0 ; padding
