Route1_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route1TrainerHeaders
	ld de, Route1_ScriptPointers
	ld a, [wRoute1CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute1CurScript], a
	ret

Route1_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route1_TextPointers:
	dw Route1Text1
	dw Route1Text2
	dw Route1Text3
	dw Route1Text4

Route1TrainerHeaders:
	def_trainers
Route1TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_0, 4, Route1BattleText1, Route1EndBattleText1, Route1AfterBattleText1
/* Route1TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_1, 6, Route1BattleText2, Route1EndBattleText2, Route1AfterBattleText2 */
	db -1 ; end

Route1Text1:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, Route1ViridianMartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, Route1Text_1cae8
	jr .done
.bag_full
	ld hl, Route1Text_1caf3
	jr .done
.got_item
	ld hl, Route1Text_1caee
.done
	call PrintText
	jp TextScriptEnd

Route1ViridianMartSampleText:
	text_far _Route1ViridianMartSampleText
	text_end

Route1Text_1cae8:
	text_far _Route1Text_1cae8
	sound_get_item_1
	text_end

Route1Text_1caee:
	text_far _Route1Text_1caee
	text_end

Route1Text_1caf3:
	text_far _Route1Text_1caf3
	text_end

Route1Text2:
	text_far _Route1Text2
	text_end

Route1Text3:
	text_far _Route1Text3
	text_end

Route1Text4:
	text_asm
	ld hl, Route1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route1BattleText1:
	text_far _Route1BattleText1
	text_end
	
Route1EndBattleText1_1:
	text_far _Route1EndBattleText1
	text_end

Route1EndBattleText1:
 	text_asm
	ld hl, Route1EndBattleText1_1
	call PrintText
    ld a, HS_ROUTE_1_INFERNO
    ld [wMissableObjectIndex], a
    predef HideObject
	call UpdateSprites
	jp TextScriptEnd

Route1AfterBattleText1:
	text_far _Route1AfterBattleText1
	text_end