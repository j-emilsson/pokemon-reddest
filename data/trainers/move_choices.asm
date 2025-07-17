move_choices: MACRO
	IF _NARG
		db \# ; all args
	ENDC
	db 0 ; end
list_index += 1
ENDM

; move choice modification methods that are applied for each trainer class
TrainerClassMoveChoiceModifications:
	list_start TrainerClassMoveChoiceModifications
	move_choices 3       ; YOUNGSTER
	move_choices 3       ; BUG CATCHER
	move_choices 3       ; LASS
	move_choices 3       ; SAILOR
	move_choices 3       ; JR_TRAINER_M
	move_choices 3       ; JR_TRAINER_F
	move_choices 3 		 ; POKEMANIAC
	move_choices 3       ; SUPER_NERD
	move_choices 3       ; HIKER
	move_choices 3       ; BIKER
	move_choices 3       ; BURGLAR
	move_choices 3       ; ENGINEER
	;move_choices 1, 2    ; UNUSED_JUGGLER
	move_choices 3       ; FISHER
	move_choices 3       ; SWIMMER
	move_choices 3       ; CUE_BALL
	move_choices 3       ; GAMBLER
	move_choices 3       ; BEAUTY
	move_choices 3       ; PSYCHIC_TR
	move_choices 3       ; ROCKER
	move_choices 3       ; JUGGLER
	move_choices 3       ; TAMER
	move_choices 3       ; BIRD_KEEPER
	move_choices 3       ; BLACKBELT
	move_choices 3       ; RIVAL1
	move_choices 3       ; PROF_OAK
	;move_choices 1, 2    ; CHIEF
	move_choices 3       ; SCIENTIST
	move_choices 3       ; GIOVANNI
	move_choices 3       ; ROCKET
	move_choices 3       ; COOLTRAINER_M
	move_choices 3       ; COOLTRAINER_F
	move_choices 3       ; BRUNO
	move_choices 3       ; BROCK
	move_choices 3       ; MISTY
	move_choices 3       ; LT_SURGE
	move_choices 3       ; ERIKA
	move_choices 3       ; KOGA
	move_choices 3       ; BLAINE
	move_choices 3       ; SABRINA
	move_choices 3       ; GENTLEMAN
	move_choices 3       ; RIVAL2
	move_choices 3       ; RIVAL3
	move_choices 3       ; LORELEI
	move_choices 3       ; CHANNELER
	move_choices 3       ; AGATHA
	move_choices 3       ; LANCE
	move_choices 3       ; INFERNATOR
	assert_list_length NUM_TRAINERS
