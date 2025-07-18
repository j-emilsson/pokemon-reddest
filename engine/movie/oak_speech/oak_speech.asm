SetDefaultNames:
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
IF DEF(_DEBUG)
	ld a, [wd732]
	push af
ENDC
	ld hl, wPlayerName
	ld bc, wBoxDataEnd - wPlayerName
	xor a
	call FillMemory
	ld hl, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	xor a
	call FillMemory
	pop af
IF DEF(_DEBUG)
	ld [wd732], a
	pop af
ENDC
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	ld hl, NintenText
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, SonyText
	ld de, wRivalName
	ld bc, NAME_LENGTH
	jp CopyData

OakSpeech:
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld a, BANK(Music_Routes2)
	ld c, a
	ld a, MUSIC_ROUTES2
	call PlayMusic
	call ClearScreen
	call LoadTextBoxTilePatterns
	call SetDefaultNames
	predef InitPlayerData2
	ld hl, wNumBoxItems
	ld a, POTION
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
	call AddItemToInventory  ; give one potion
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call SpecialWarpIn
	xor a
	ldh [hTileAnimations], a

	; REDDEST intro
/* 	
	; INFERNATOR
	ld de, InfernatorPic
	lb bc, BANK(InfernatorPic), $00
 */

	; INFERNATOR and ONIX
 	ld de, InfernatorOnixPic
	lb bc, BANK(InfernatorOnixPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, InfernatorSpeechText1
	call PrintText
	call ClearScreen

.MenuCursorLoop ; difficulty menu
	ld a, [wSkipPrintDifficultyText]
	and a
	jr nz, .skipPrint

	ld hl, DifficultyText
	call PrintText

.skipPrint
	call DifficultyChoice ; This might change wCurrentMenuItem internally!

	; Was B pressed?
	ldh a, [hJoy5]
	bit 1, a ; B_BUTTON is bit 1
	jr z, .notB

	; B pressed — restore previous selection and skip printing next loop
	ld a, $01
	ld [wSkipPrintDifficultyText], a

	ld a, [wSavedMenuItem]
	ld [wCurrentMenuItem], a
	jp .MenuCursorLoop

.notB
	xor a
	ld [wSkipPrintDifficultyText], a ; reset flag

	; Save selection (0 = HARD, 1 = NORMAL) - update as needed if reversed
	ld a, [wCurrentMenuItem]
	ld [wSavedMenuItem], a
	; Preview text based on choice
	and a
	jr z, .ShowHard
.ShowNormal:
	ld hl, NormalDifficultyText
	call PrintText
	jr .Confirm
.ShowHard:
	ld hl, HardDifficultyText
	call PrintText

.Confirm:
	call YesNoNormalHardChoice

	ld a, [wCurrentMenuItem]
	and a
	jr z, .CommitDifficulty ; if "Yes" selected

	; "No" or B pressed — restore previous selection and retry
	ld a, [wSavedMenuItem]
	ld [wCurrentMenuItem], a
	jp .MenuCursorLoop

.CommitDifficulty:
	; Commit difficulty choice
	ld a, [wSavedMenuItem]
	xor 1 ; flip to desired internal value (0 = hard, 1 = normal internally → 1 = hard mode)
	ld [wDifficulty], a

	; Proceed with intro
	ld de, InfernatorOnixPic
	lb bc, BANK(InfernatorOnixPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, InfernatorSpeechText2
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen ; clear the screen before resuming normal intro

	ld a, [wd732]
	bit 1, a ; possibly a debug mode bit
	jp nz, .skipChoosingNames
	ld de, ProfOakPic
	lb bc, BANK(ProfOakPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, OakSpeechText1
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	ld a, ONIX
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFlippedFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, OakSpeechText2
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	call IntroDisplayPicCenteredOrUpperRight
	call MovePicLeft
	ld hl, IntroducePlayerText
	call PrintText
	call ChoosePlayerName
	call GBFadeOutToWhite
	call ClearScreen
	ld de, Rival1Pic
	lb bc, BANK(Rival1Pic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IntroduceRivalText
	call PrintText
	call ChooseRivalName
.skipChoosingNames
	call GBFadeOutToWhite
	call ClearScreen
	ld de, RedPicFront
	lb bc, BANK(RedPicFront), $00
	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a, [wd72d]
	and a
	jr nz, .next
	ld hl, OakSpeechText3
	call PrintText
.next
	ldh a, [hLoadedROMBank]
	push af
	ld a, SFX_SHRINK
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 4
	call DelayFrames
	ld de, RedSprite
	ld hl, vSprites
	lb bc, BANK(RedSprite), $0C
	call CopyVideoData
	ld de, ShrinkPic1
	lb bc, BANK(ShrinkPic1), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2
	lb bc, BANK(ShrinkPic2), $00
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(Music_PalletTown)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, 10
	ld [wAudioFadeOutControl], a
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 20
	call DelayFrames
	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearScreenArea
	call LoadTextBoxTilePatterns
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld c, 50
	call DelayFrames
	call GBFadeOutToWhite
	jp ClearScreen
InfernatorSpeechText1:
	text_far _InfernatorSpeechText1
	text_end
InfernatorSpeechText2:
	text_far _InfernatorSpeechText2
	text_end
NormalDifficultyText:
	text_far _NormalDifficultyText
	text_end
HardDifficultyText:
	text_far _HardDifficultyText
	text_end
DifficultyText:
	text_far _DifficultyText
	text_end
OakSpeechText1:
	text_far _OakSpeechText1
	text_end
OakSpeechText2:
	text_far _OakSpeechText2A
	sound_cry_onix
	text_far _OakSpeechText2B
	text_end
IntroducePlayerText:
	text_far _IntroducePlayerText
	text_end
IntroduceRivalText:
	text_far _IntroduceRivalText
	text_end
OakSpeechText3:
	text_far _OakSpeechText3
	text_end

FadeInIntroPic:
	ld hl, IntroFadePalettes
	ld b, 6
.next
	ld a, [hli]
	ldh [rBGP], a
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .next
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a, 119
	ldh [rWX], a
	call DelayFrame

	ld a, %11100100
	ldh [rBGP], a
.next
	call DelayFrame
	ldh a, [rWX]
	sub 8
	cp $FF
	ret z
	ldh [rWX], a
	jr .next

DisplayPicCenteredOrUpperRight:
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight:
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a, c
	and a
	hlcoord 15, 1
	jr nz, .next
	hlcoord 6, 4
.next
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

; displays difficulty choice
DifficultyChoice::
	call SaveScreenTilesToBuffer1
	call InitDifficultyTextBoxParameters
	jr DisplayDifficultyChoice

InitDifficultyTextBoxParameters::
  	ld a, DIFFICULTY_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 5, 5
	lb bc, 6, 6 ; Cursor Pos
	ret
	
DisplayDifficultyChoice::
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1

; display yes/no choice
YesNoNormalHardChoice::
	call SaveScreenTilesToBuffer1
	call InitYesNoNormalHardTextBoxParameters
	jr DisplayYesNoNormalHardChoice

InitYesNoNormalHardTextBoxParameters::
  	ld a, YES_NO_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 7, 5
	lb bc, 6, 8 ; Cursor Pos
	ret
	
DisplayYesNoNormalHardChoice::
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1
