	db DEX_DRAGONITE ; pokedex id

	db  90, 140,  80,  90, 100 ; 600
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
	dw DragonitePicFront, DragonitePicBack

	db WRAP, LEER, THUNDER_WAVE, AGILITY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   TOXIC,           BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   SKY_ATTACK,   REST,         \
	     THUNDER_WAVE, ROCK_SLIDE,   SUBSTITUTE,   DRAGON_BREATH,DRAGON_PULSE, \
		 CUT,          FLY,          SURF,         STRENGTH
	; end

	db 0 ; padding
