	db DEX_LAPRAS ; pokedex id

	db 130,  50,  80,  65, 125 ; 575
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp

	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
	dw LaprasPicFront, LaprasPicBack

	db SURF, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     RAGE,         SOLARBEAM,    DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      \
	     FISSURE,      PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SKULL_BASH,   DREAM_EATER,  REST,         PSYWAVE,      \
	     SUBSTITUTE,   OUTRAGE,      DRAGON_BREATH,IRON_HEAD,    DRAGON_PULSE, \
		 SURF,         STRENGTH
	; end

	db 0 ; padding
