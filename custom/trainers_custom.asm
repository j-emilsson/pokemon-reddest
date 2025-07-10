PlayTrainerMusic_Custom::
    ld a, [wEngagedTrainerClass]
    cp OPP_RIVAL1
    ret z
    cp OPP_RIVAL2
    ret z
    cp OPP_RIVAL3
    ret z
    ld a, [wGymLeaderNo]
    and a
    ret nz
    xor a
    ld [wAudioFadeOutControl], a
    ld a, SFX_STOP_ALL_MUSIC
    call PlaySound
    ld a, BANK(Music_MeetEvilTrainer)
    ld [wAudioROMBank], a
    ld [wAudioSavedROMBank], a
    ld a, [wEngagedTrainerClass]
    ld b, a
    ld hl, EvilTrainerList
.evilTrainerListLoop
    ld a, [hli]
    cp $ff
    jr z, .noEvilTrainer
    cp b
    jr nz, .evilTrainerListLoop
    ld a, MUSIC_MEET_EVIL_TRAINER
    jr .PlaySound
.noEvilTrainer
    ld hl, FemaleTrainerList
.femaleTrainerListLoop
    ld a, [hli]
    cp $ff
    jr z, .maleTrainer
    cp b
    jr nz, .femaleTrainerListLoop
    ld a, MUSIC_MEET_FEMALE_TRAINER
    jr .PlaySound
.maleTrainer
    ld a, MUSIC_MEET_MALE_TRAINER
.PlaySound
    ld [wNewSoundID], a
    jp PlaySound

CheckForEngagingTrainers_Custom::
	xor a
	farcall ReadTrainerHeaderInfo       ; read trainer flag's bit (unused)
	ld d, h                          ; store trainer header address in de
	ld e, l
.trainerLoop
	farcall StoreTrainerHeaderPointer   ; set trainer header pointer to current trainer
	ld a, [de]
	ld [wSpriteIndex], a                     ; store trainer flag's bit
	ld [wTrainerHeaderFlagBit], a
	cp -1
	ret z
	ld a, $2
	farcall ReadTrainerHeaderInfo       ; read trainer flag's byte ptr
	ld b, FLAG_TEST
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	farcall TrainerFlagAction        ; read trainer flag
	ld a, c
	and a ; has the trainer already been defeated?
	jr nz, .continue
	push hl
	push de
	push hl
	xor a
	farcall ReadTrainerHeaderInfo       ; get trainer header pointer
	inc hl
	ld a, [hl]                       ; read trainer engage distance
	pop hl
	ld [wTrainerEngageDistance], a
	ld a, [wSpriteIndex]
	swap a
	ld [wTrainerSpriteOffset], a
	farcall TrainerEngage
	pop de
	pop hl
	ld a, [wTrainerSpriteOffset]
	and a
	ret nz        ; break if the trainer is engaging
.continue
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	jr .trainerLoop

DisplayEnemyTrainerTextAndStartBattle_Custom::
	ld a, [wd730]
	and $8
	jp nz, ResetButtonPressedAndMapScript ; Trainer Fly happened, abort this script
	ld a, [wd730]
	and $1
	ret nz ; return if the enemy trainer hasn't finished walking to the player's sprite
	farcall FaceEnemyTrainer ; face the enemy trainer
	xor a
	ld [wJoyIgnore], a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndexOrTextID], a
	farcall DisplayTextID
	; fall through
    ret

TalkToTrainer_Custom::
	farcall StoreTrainerHeaderPointer
	xor a
	farcall ReadTrainerHeaderInfo     ; read flag's bit
	ld a, $2
	farcall ReadTrainerHeaderInfo     ; read flag's byte ptr
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	ld b, FLAG_TEST
	farcall TrainerFlagAction      ; read trainer's flag
	ld a, c
	and a
	jr z, .trainerNotYetFought     ; test trainer's flag
	ld a, $6
	farcall ReadTrainerHeaderInfo     ; print after battle text
	jp PrintText
.trainerNotYetFought
	ld a, $4
	farcall ReadTrainerHeaderInfo     ; print before battle text
	farcall PrintText
	ld a, $a
	;farcall ReadTrainerHeaderInfo     ; (?) does nothing apparently (maybe bug in ReadTrainerHeaderInfo)
	farcall ReadTrainerHeaderInfo     ; read end battle text (2)
	push de
	ld a, $8
	farcall ReadTrainerHeaderInfo     ; read end battle text
	pop de
	farcall SaveEndBattleTextPointers
	ld hl, wFlags_D733
	set 4, [hl]                    ; activate map script index override (index is set below)
	ld hl, wFlags_0xcd60
	bit 0, [hl]                    ; test if player is already engaging the trainer (because the trainer saw the player)
	ret nz
; if the player talked to the trainer of his own volition
	farcall EngageMapTrainer
	ld hl, wCurMapScript
	inc [hl]      ; increment map script index before StartTrainerBattle increments it again (next script function is usually EndTrainerBattle)
	jp StartTrainerBattle

CheckFightingMapTrainers_Custom::
IF DEF(_DEBUG)
	farcall DebugPressedOrHeldB
	jr nz, .trainerNotEngaging
ENDC
	call CheckForEngagingTrainers_Custom
	ld a, [wSpriteIndex]
	cp $ff
	jr nz, .trainerEngaging
.trainerNotEngaging
	xor a
	ld [wSpriteIndex], a
	ld [wTrainerHeaderFlagBit], a
	ret
.trainerEngaging
	ld hl, wFlags_D733
	set 3, [hl]
	call ClearTrainerPreBattleFlags ; clear pre-battle flags
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	;ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN ; for ignoring user input, to prevent possible interferance
	ld a, $ff
	ld [wJoyIgnore], a
	xor a
	ldh [hJoyHeld], a
	farcall TrainerWalkUpToPlayer_Bank0
	ld hl, wCurMapScript
	inc [hl]      ; increment map script index (next script function is usually DisplayEnemyTrainerTextAndStartBattle)
	ret
