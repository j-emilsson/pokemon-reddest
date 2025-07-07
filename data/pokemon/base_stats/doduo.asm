	db DEX_DODUO ; pokedex id

	db  50,  85,  45,  95,  45
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp

	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
	dw DoduoPicFront, DoduoPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SWIFT,        SKULL_BASH,   SKY_ATTACK,   REST,         \
	     TRI_ATTACK,   SUBSTITUTE,   FLY
	; end

	db 0 ; padding
