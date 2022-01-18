Route2_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route2TrainerHeaders
	ld de, Route2_ScriptPointers
	ld a, [wRoute2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute2CurScript], a
	ret
	
Route2_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route2_TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw Route2Text3
	dw Route2Text4
	dw Route2Text5
	
Route2TrainerHeaders:
	def_trainers
Route2TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_0, 8, Route2BattleText1, Route2EndBattleText1, Route2AfterBattleText1
	db -1 ; end

Route2Text3:
	text_far _Route2Text3
	text_end

Route2Text4:
	text_far _Route2Text4
	text_end
	
Route2Text5:
	text_asm
	ld hl, Route2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route2BattleText1:
	text_far _Route2BattleText1
	text_end
	
Route2EndBattleText2:
	text_far _Route2EndBattleText1
	text_end

Route2EndBattleText1:
	text_asm
	ld hl, Route2EndBattleText2
	call PrintText
    ld a, HS_ROUTE_2_INFERNO
    ld [wMissableObjectIndex], a
    predef HideObject
	call UpdateSprites
	jp TextScriptEnd

Route2AfterBattleText1:
	text_far _Route2AfterBattleText1
	text_end
