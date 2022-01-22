	db DEX_ELECTABUZZ ; pokedex id

	db  80, 115, 115, 120,  60 ; 550
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIGHTING ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBack

	db THUNDERSHOCK, QUICK_ATTACK, FIRE_PUNCH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     METRONOME,    SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      ROCK_SLIDE,   SUBSTITUTE,   AURA_SPHERE,  DRAIN_PUNCH,  \
		 EARTH_POWER,  STRENGTH,     FLASH
	; end

	db 0 ; padding
