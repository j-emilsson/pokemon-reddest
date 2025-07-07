	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  30
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp

	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
	dw RhyhornPicFront, RhyhornPicBack

	db HORN_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,           BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	           DIG,          MIMIC,        DOUBLE_TEAM,  \
	     FIRE_BLAST,   SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   \
		 FLASH_CANNON, POISON_JAB,   DRAGON_PULSE, STRENGTH
	; end

	db 0 ; padding
