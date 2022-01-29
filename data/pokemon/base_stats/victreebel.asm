	db DEX_VICTREEBEL ; pokedex id

	db  90, 130,  70,  90,  85 ; 550
	;   hp  atk  def  spd  spc

	db GRASS, DARK ; type
	db 45 ; catch rate
	db 191 ; base exp

	INCBIN "gfx/pokemon/front/victreebel.pic", 0, 1 ; sprite dimensions
	dw VictreebelPicFront, VictreebelPicBack

	db SLEEP_POWDER, STUN_SPORE, ACID, RAZOR_LEAF ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         REST,         SUBSTITUTE,   \
	     SLUDGE_BOMB,  CRUNCH,       GIGA_DRAIN,   LEAF_BLADE,   POISON_JAB,   \
		 DARK_PULSE,   CUT,          FLASH
	; end

	db 0 ; padding
