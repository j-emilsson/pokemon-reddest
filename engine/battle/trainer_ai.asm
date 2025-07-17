; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves:
	ld a, $a
	ld hl, wBuffer ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
	ld a, [wEnemyDisabledMove] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, wBuffer
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
	ld hl, TrainerClassMoveChoiceModifications
	ld a, [wTrainerClass]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jp z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp hl         ; execute modification function
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .loopUndoPartialIteration
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	ld a, [de]
	and a
	jr nz, .moveExisting
	ld [hl], a
.moveExisting
	ld a, [hl]
	dec a
	jr z, .slotWithMinimalValue
	xor a
	ld [hli], a     ; disable move slot
	jr .next
.slotWithMinimalValue
	ld a, [de]
	ld [hli], a     ; enable move slot
.next
	inc de
	dec c
	jr nz, .filterMinimalEntries
	ld hl, wBuffer    ; use created temporary array as move set
	ret
.useOriginalMoveSet
	ld hl, wEnemyMonMoves    ; use original move set
	ret

AIMoveChoiceModificationFunctionPointers:
	dw AIMoveChoiceModification1
	dw AIMoveChoiceModification2
	dw AIMoveChoiceModificationNew ; new priority-based AI
	dw AIMoveChoiceModification4 ; unused, does nothing

; discourages moves that cause no damage but only a status ailment if player's mon already has one
AIMoveChoiceModification1:
	ld a, [wBattleMonStatus]
	and a
	ret z ; return if no status ailment on player's mon
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMovePower]
	and a
	jr nz, .nextMove
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
	ld a, [hl]
	add $5 ; heavily discourage move
	ld [hl], a
	jr .nextMove

StatusAilmentMoveEffects:
	db EFFECT_01 ; unused sleep effect
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db POISON_SIDE_EFFECT1
	db POISON_SIDE_EFFECT2
	db POISON_SIDE_EFFECT3
	db BURN_SIDE_EFFECT1
	db BURN_SIDE_EFFECT2
	db FREEZE_SIDE_EFFECT
	db PARALYZE_SIDE_EFFECT1
	db PARALYZE_SIDE_EFFECT2
	db $FF ; end

; slightly encourage moves with specific effects.
; in particular, stat-modifying moves and other move effects
; that fall in-between
AIMoveChoiceModification2:
	ld a, [wAILayer2Encouragement]
	cp $1
	ret nz
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp ATTACK_UP1_EFFECT
	jr c, .nextMove
	cp BIDE_EFFECT
	jr c, .preferMove
	cp ATTACK_UP2_EFFECT
	jr c, .nextMove
	cp POISON_EFFECT
	jr c, .preferMove
	jr .nextMove
.preferMove
	dec [hl] ; slightly encourage this move
	jr .nextMove

; encourages moves that are effective against the player's mon (even if non-damaging).
; discourage damaging moves that are ineffective or not very effective against the player's mon,
; unless there's no damaging move that deals at least neutral damage
AIMoveChoiceModification3:
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	push hl
	push bc
	push de
	callfar AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl
	ld a, [wTypeEffectiveness]
	cp $10
	jr z, .nextMove
	jr c, .notEffectiveMove
	dec [hl] ; slightly encourage this move
	jr .nextMove
.notEffectiveMove ; discourages non-effective moves if better moves are available
	push hl
	push de
	push bc
	ld a, [wEnemyMoveType]
	ld d, a
	ld hl, wEnemyMonMoves  ; enemy moves
	ld b, NUM_MOVES + 1
	ld c, $0
.loopMoves
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SUPER_FANG_EFFECT
	jr z, .betterMoveFound ; Super Fang is considered to be a better move
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .betterMoveFound ; any special damage moves are considered to be better moves
	cp FLY_EFFECT
	jr z, .betterMoveFound ; Fly is considered to be a better move
	ld a, [wEnemyMoveType]
	cp d
	jr z, .loopMoves
	ld a, [wEnemyMovePower]
	and a
	jr nz, .betterMoveFound ; damaging moves of a different type are considered to be better moves
	jr .loopMoves
.betterMoveFound
	ld c, a
.done
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .nextMove
	inc [hl] ; slightly discourage this move
	jr .nextMove

; New priority-based AI system implementing the full specification from CLAUDE.md
; Score Index Priority (lower is better, 0-9 scale):
;  0: 4x SE + STAB           (Best)
;  1: 4x SE + no STAB
;  2: 2x SE + STAB
;  3: 2x SE + no STAB        
;  4: Neutral + STAB         
;  5: Non Ailment Status Move
;  6: Neutral + no STAB
;  7: 0.5x + STAB
;  8: 0.5x + no STAB
;  9: 0x                     (Worst)
; Also implements probabilistic status move selection
AIMoveChoiceModificationNew:
	; Initialize all moves with high scores (will be lowered based on priority)
	ld hl, wBuffer
	ld a, 10   ; start with high score
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	
	; Now check each move individually and assign proper scores
	ld hl, wEnemyMonMoves
	ld de, wBuffer
	ld b, NUM_MOVES
	
.checkMove
	ld a, [hl]
	and a
	jp z, .nextMove  ; empty move slot
	
	; Save registers and read move data
	push hl
	push de
	push bc
	call ReadMove
	
	; Calculate type effectiveness
	callfar AIGetTypeEffectiveness
	
	; Check if move has STAB (Same Type Attack Bonus)
	call CheckMoveSTAB  ; returns carry if STAB
	push af  ; save STAB flag
	
	; Determine move category and assign priority score
	ld a, [wEnemyMovePower]
	and a
	jr z, .statusMove  ; if power = 0, it's a status move
	
	; Add 4x effectiveness detection to simple version
	ld a, [wTypeEffectiveness]
	cp FOUR_TIMES_EFFECTIVE  ; Check if 4x
	jr z, .fourTimesEffective
	cp SUPER_EFFECTIVE  ; Check if 2x
	jr z, .twoTimesEffective
	
	; Everything else (1x, 0.5x, 0x) - treat as neutral for now
	pop af  ; restore STAB flag
	jr c, .neutralWithSTAB
	ld a, 6  ; 1x + no STAB (score 6 from spec)
	jr .setScore
.neutralWithSTAB
	ld a, 4  ; 1x + STAB (score 4 from spec)
	jr .setScore
	
.fourTimesEffective
	; 4x effectiveness - give best scores based on STAB
	pop af  ; restore STAB flag
	jr c, .fourTimesWithSTAB
	ld a, 1  ; 4x + no STAB (score 1 from spec)
	jr .setScore
.fourTimesWithSTAB
	ld a, 0  ; 4x + STAB (score 0 from spec - best possible)
	jr .setScore
	
.twoTimesEffective
	; 2x effectiveness - give good scores based on STAB
	pop af  ; restore STAB flag
	jr c, .twoTimesWithSTAB
	ld a, 3  ; 2x + no STAB (score 3 from spec)
	jr .setScore
.twoTimesWithSTAB
	ld a, 2  ; 2x + STAB (score 2 from spec)
	jr .setScore
	
.statusMove
	pop af  ; restore STAB flag (discard for status moves)
	; Check if it's a status ailment move vs stat modification move
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .statusAilmentMove
	; Non-ailment status move (like TAIL WHIP, SCREECH)
	ld a, 5
	jr .setScore
.statusAilmentMove
	; Status ailment move - check if target already has status
	ld a, [wBattleMonStatus]
	and a
	jr nz, .targetHasStatus
	; Target has no status - status move is viable
	ld a, 5
	jr .setScore
.targetHasStatus
	; Target already has status - heavily discourage
	ld a, 9
	
.setScore
	; Restore registers and set the score
	pop bc
	pop de
	pop hl
	ld [de], a  ; store score in buffer at correct position
	
.nextMove
	inc hl
	inc de
	dec b
	jp nz, .checkMove
	
	; Skip complex post-processing for now - basic scoring system works
	ret

ApplyProbabilisticLogic:
	; Check for moves with specific scores and apply probabilistic status move logic
	ld hl, wBuffer
	ld de, wEnemyMonMoves
	ld b, NUM_MOVES
	
.findSpecialScores
	ld a, [hl]
	cp 2  ; 2x + STAB?
	jr z, .found2xSTAB
	cp 3  ; 2x + no STAB?
	jr z, .found2xNoSTAB
	cp 4  ; 1x + STAB?
	jr z, .found1xSTAB
	jr .nextCheck
	
.found2xSTAB
	; Check for status ailment moves and apply 80% logic
	call CheckForUsableStatusMoves
	jr nc, .nextCheck  ; no usable status moves
	ld a, [wBattleMonStatus]
	and a
	jr nz, .nextCheck  ; target has status
	; 80% chance to use status move, 20% chance to keep 2x STAB
	call Random
	cp 205  ; 80% chance (205/256 ≈ 80%)
	jr c, .useStatusMove
	jr .nextCheck
	
.found2xNoSTAB  
	; Check for status ailment moves and apply 90% logic
	call CheckForUsableStatusMoves
	jr nc, .nextCheck  ; no usable status moves
	ld a, [wBattleMonStatus]
	and a
	jr nz, .nextCheck  ; target has status
	; 90% chance to use status move, 10% chance to keep 2x no STAB
	call Random
	cp 230  ; 90% chance (230/256 ≈ 90%)
	jr c, .useStatusMove
	jr .nextCheck
	
.found1xSTAB
	; Check for status ailment moves and apply 95% logic
	call CheckForUsableStatusMoves
	jr nc, .nextCheck  ; no usable status moves
	ld a, [wBattleMonStatus]
	and a
	jr nz, .nextCheck  ; target has status
	; 95% chance to use status move, 5% chance to keep 1x STAB
	call Random
	cp 243  ; 95% chance (243/256 ≈ 95%)
	jr c, .useStatusMove
	jr .nextCheck

.useStatusMove
	; Find best status ailment move and give it score 0
	push hl
	call FindBestStatusMove  ; returns index in A, or 255 if none
	pop hl
	cp 255
	jr z, .nextCheck
	; Set the status move to best score
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	ld [hl], 0
	ret  ; done, status move now has priority
	
.nextCheck
	inc hl
	inc de
	dec b
	jr nz, .findSpecialScores
	
	; Finally, apply strongest move selection among same-score moves
	call SelectStrongestMove
	ret

FindBestStatusMove:
	; Find the best status ailment move index, return 255 if none
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES
	ld c, 0  ; move index
.findStatusLoop
	ld a, [hl]
	and a
	jr z, .notFound
	push hl
	push bc
	call ReadMove
	ld a, [wEnemyMovePower]
	and a
	jr nz, .notStatusMove
	; Check if status ailment move
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .foundStatus
.notStatusMove
	pop bc
	pop hl
	inc hl
	inc c
	dec b
	jr nz, .findStatusLoop
.notFound
	ld a, 255  ; not found
	ret
.foundStatus
	pop bc
	pop hl
	ld a, c    ; return index
	ret

SelectStrongestMove:
	; Find minimum score, then among moves with that score, pick strongest
	ld hl, wBuffer
	ld a, 10   ; start with high value
	ld b, NUM_MOVES
.findMinScore
	ld c, [hl]
	cp c
	jr c, .skipMin
	ld a, c    ; new minimum
.skipMin
	inc hl
	dec b
	jr nz, .findMinScore
	
	; A now contains minimum score, find strongest move with that score
	ld b, a    ; B = minimum score
	ld hl, wBuffer
	ld de, wEnemyMonMoves  
	ld c, NUM_MOVES
	ld a, 0    ; max power found
	ld [wTempoModifier], a
	xor a
	ld [wTempMoveID], a  ; index of strongest move
	
.findStrongestLoop
	ld a, [hl]
	cp b
	jr nz, .nextPowerCheck
	; This move has minimum score, check power
	push hl
	push de
	push bc
	ld a, [de]
	and a
	jr z, .emptyMove
	call ReadMove
	ld a, [wEnemyMovePower]
	ld d, a
	ld a, [wTempoModifier]
	cp d
	jr nc, .notStronger
	ld a, d
	ld [wTempoModifier], a
	ld a, c
	ld [wTempMoveID], a
.notStronger
.emptyMove
	pop bc
	pop de
	pop hl
.nextPowerCheck
	inc hl
	inc de
	dec c
	jr nz, .findStrongestLoop
	
	; Set strongest move to score 0, others to 10
	ld a, [wTempMoveID]
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	ld [hl], 0
	ret

; Check if there are usable status ailment moves  
; Returns: carry set if usable status moves exist
CheckForUsableStatusMoves:
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES
.checkStatusLoop
	ld a, [hl]
	and a
	jr z, .noUsableStatus  ; empty move slot
	
	push hl
	push bc
	call ReadMove
	
	; Check if it's a status move (power = 0)
	ld a, [wEnemyMovePower]
	and a
	jr nz, .notStatusMove
	
	; Check if it's a status ailment move
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .foundUsableStatus
	
.notStatusMove
	pop bc
	pop hl
	inc hl
	dec b
	jr nz, .checkStatusLoop
	
.noUsableStatus
	and a  ; clear carry
	ret
	
.foundUsableStatus
	pop bc
	pop hl
	scf    ; set carry
	ret

AIMoveChoiceModification4:
	ret

ReadMove:
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wEnemyMoveNum
	call CopyData
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/trainers/move_choices.asm"

INCLUDE "data/trainers/pic_pointers_money.asm"

INCLUDE "data/trainers/names.asm"

INCLUDE "engine/battle/misc.asm"

INCLUDE "engine/battle/read_trainer_party.asm"

INCLUDE "data/trainers/special_moves.asm"

INCLUDE "data/trainers/parties.asm"

TrainerAI:
	and a
	ld a, [wIsInBattle]
	dec a
	ret z ; if not a trainer, we're done here
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; if in a link battle, we're done as well
	ld a, [wTrainerClass] ; what trainer class is this?
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerAIPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [wAICount]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz, .getpointer
	dec hl
	ld a, [hli]
	ld [wAICount], a
.getpointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	jp hl

INCLUDE "data/trainers/ai_pointers.asm"

JugglerAI:
	cp 25 percent + 1
	ret nc
	jp AISwitchIfEnoughMons

BlackbeltAI:
	cp 13 percent - 1
	ret nc
	jp AIUseXAttack

GiovanniAI:
	cp 25 percent + 1
	ret nc
	jp AIUseGuardSpec

CooltrainerMAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXAttack

CooltrainerFAI:
	; The intended 25% chance to consider switching will not apply.
	; Uncomment the line below to fix this.
	cp 25 percent + 1
	ret nc
	ld a, 10
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AISwitchIfEnoughMons

BrockAI:
; if his active monster has a status condition, use a full heal
	ld a, [wEnemyMonStatus]
	and a
	ret z
	jp AIUseFullHeal

MistyAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXDefend

LtSurgeAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXSpeed

ErikaAI:
	cp 50 percent + 1
	ret nc
	ld a, 10
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

KogaAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXAttack

BlaineAI:
	cp 25 percent + 1
	ret nc
	ld a, 10
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

SabrinaAI:
	cp 25 percent + 1
	ret nc
	ld a, 10
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

Rival2AI:
	cp 13 percent - 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUsePotion

Rival3AI:
	cp 13 percent - 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseFullRestore

LoreleiAI:
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

BrunoAI:
	cp 25 percent + 1
	ret nc
	jp AIUseXDefend

AgathaAI:
	cp 8 percent
	jp c, AISwitchIfEnoughMons
	cp 50 percent + 1
	ret nc
	ld a, 4
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseSuperPotion

LanceAI:
	cp 50 percent + 1
	ret nc
	ld a, 5
	call AICheckIfHPBelowFraction
	ret nc
	jp AIUseHyperPotion

InfernatorAI:
	; Check if the opposing Pokémon is strong against this one

	;TODO: commented out because is it broken atm
/* 	call AICheckIfEnemySuperEffective
	jp c, AISwitchIfEnoughMons */

	; Check for status condition
	ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal

	; Check if HP is below 25%
	ld a, 25
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore

GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount:
	ld hl, wAICount
	dec [hl]
	scf
	ret

AIPlayRestoringSFX:
	ld a, SFX_HEAL_AILMENT
	jp PlaySoundWaitForCurrent

AIUseFullRestore:
	call AICureStatus
	ld a, FULL_RESTORE
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jr AIPrintItemUseAndUpdateHPBar

AIUsePotion:
; enemy trainer heals his monster with a potion
	ld a, POTION
	ld b, 20
	jr AIRecoverHP

AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
	ld a, SUPER_POTION
	ld b, 50
	jr AIRecoverHP

AIUseHyperPotion:
; enemy trainer heals his monster with a hyper potion
	ld a, HYPER_POTION
	ld b, 200
	; fallthrough

AIRecoverHP:
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [wAIItem], a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wHPBarOldHP], a
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	ld [wHPBarNewHP+1], a
	jr nc, .next
	inc a
	ld [hl], a
	ld [wHPBarNewHP+1], a
.next
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wHPBarMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wHPBarMaxHP+1], a
	sbc b
	jr nc, AIPrintItemUseAndUpdateHPBar
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wHPBarNewHP+1], a
	; fallthrough

AIPrintItemUseAndUpdateHPBar:
	call AIPrintItemUse_
	hlcoord 2, 2
	xor a
	ld [wHPBarType], a
	predef UpdateHPBar2
	push af
	farcall DrawEnemyHUDAndHPBar
	pop af
	jp DecrementAICount

AISwitchIfEnoughMons:
; enemy trainer switches if there are 2 or more unfainted mons in party
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP

	ld d, 0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp 2    ; don't bother if only 1
	jp nc, SwitchEnemyMon
	and a
	ret

SwitchEnemyMon:

; prepare to withdraw the active monster: copy hp, number, and status to roster

	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1HP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonHP
	ld bc, 4
	call CopyData

	ld hl, AIBattleWithdrawText
	call PrintText

	; This wFirstMonsNotOutYet variable is abused to prevent the player from
	; switching in a new mon in response to this switch.
	ld a, 1
	ld [wFirstMonsNotOutYet], a
	callfar EnemySendOut
	xor a
	ld [wFirstMonsNotOutYet], a

	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	scf
	ret

AIBattleWithdrawText:
	text_far _AIBattleWithdrawText
	text_end

AIUseFullHeal:
	call AIPlayRestoringSFX
	call AICureStatus
	ld a, FULL_HEAL
	jp AIPrintItemUse

AICureStatus:
; cures the status of enemy's active pokemon
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hl], a ; clear status in enemy team roster
	ld [wEnemyMonStatus], a ; clear status of active enemy
	ld hl, wEnemyBattleStatus3
	res 0, [hl]
	push af
	farcall DrawEnemyHUDAndHPBar
	pop af
	ret

AIUseXAccuracy: ; unused
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 0, [hl]
	ld a, X_ACCURACY
	jp AIPrintItemUse

AIUseGuardSpec:
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 1, [hl]
	ld a, GUARD_SPEC
	jp AIPrintItemUse

AIUseDireHit: ; unused
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 2, [hl]
	ld a, DIRE_HIT
	jp AIPrintItemUse

AICheckIfHPBelowFraction:
; return carry if enemy trainer's current HP is below 1 / a of the maximum
	ldh [hDivisor], a
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ldh [hDividend], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 3]
	ld c, a
	ldh a, [hQuotient + 2]
	ld b, a
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, d
	sub b
	ret nz
	ld a, e
	sub c
	ret

AIUseXAttack:
	ld b, $A
	ld a, X_ATTACK
	jr AIIncreaseStat

AIUseXDefend:
	ld b, $B
	ld a, X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed:
	ld b, $C
	ld a, X_SPEED
	jr AIIncreaseStat

AIUseXSpecial:
	ld b, $D
	ld a, X_SPECIAL
	; fallthrough

AIIncreaseStat:
	ld [wAIItem], a
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl, wEnemyMoveEffect
	ld a, [hld]
	push af
	ld a, [hl]
	push af
	push hl
	ld a, ANIM_AF
	ld [hli], a
	ld [hl], b
	callfar StatModifierUpEffect
	pop hl
	pop af
	ld [hli], a
	pop af
	ld [hl], a
	jp DecrementAICount

AIPrintItemUse:
	ld [wAIItem], a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [wAIItem] on z!"
	ld a, [wAIItem]
	ld [wd11e], a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AIBattleUseItemText:
	text_far _AIBattleUseItemText
	text_end

AICheckIfEnemySuperEffective:
	; Save enemy's types
	ld a, [wEnemyMonType1]
	ld b, a
	ld a, [wEnemyMonType2]
	ld c, a

	; Initialize move index
	ld hl, wBattleMonMoves
	ld d, 4 ; 4 moves to check

.loop
	ld a, [hl]
	and a
	jr z, .nextMove ; empty move slot
	push bc
	push de
	push hl

	call AIGetMoveType ; gets type in register A
	ld e, a

	; Check type effectiveness against enemy's types
	ld a, e
	ld b, c
	call AICheckTypeEffectiveness
	jr c, .superEffective

	ld a, e
	ld b, b
	call AICheckTypeEffectiveness
	jr c, .superEffective

	pop hl
	pop de
	pop bc

.nextMove
	inc hl
	dec d
	jr nz, .loop

	; No super-effective move found
	and a ; clear carry
	ret

.superEffective
	pop hl
	pop de
	pop bc
	scf ; set carry
	ret

AIGetMoveType:
	; Get the move type from move data
	ld e, a
	ld d, 0
	ld hl, Moves
	add hl, de
	add hl, de ; each move entry is 2 bytes (type and power)
	inc hl ; skip move effect byte
	ld a, [hl] ; load move type
	ret

; Inputs:
;   a = attack type
;   b = defender type
; Output:
;   Carry set if super-effective (2x), clear otherwise

AICheckTypeEffectiveness:
	push af
	push bc

	ld d, a ; attacker type
	ld e, b ; defender type
	call AIGetTypeEffectiveness
	ld a, [wTypeEffectiveness]
	cp $20 ; x2 multiplier
	jr z, .super

	and a ; clear carry
	jr .done

.super
	scf ; set carry

.done
	pop bc
	pop af
	ret

; Inputs:
;   d = attacker type
;   e = defender type
; Output:
;   [wTypeEffectiveness] = multiplier (0x00, 0x10, 0x14, 0x20)


; Check if current move gets STAB (Same Type Attack Bonus)
; Returns: carry set if STAB, clear if no STAB
CheckMoveSTAB:
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b
	jr z, .hasSTAB
	ld a, [wEnemyMonType2]
	cp b
	jr z, .hasSTAB
	; No STAB
	and a  ; clear carry
	ret
.hasSTAB
	scf    ; set carry
	ret

