_MoveDeleterGreetingText::
	text "Uh...Now who"
	line "was I again?"
	cont "... ... ..."
	cont "... ... ..."
	
	para "Oh yes!"
	line "I'm the"
	cont "MOVE DELETER!"
	cont "I can make"
	cont "#MON forget"
	cont "their moves."

	para "You're here so"
	line "I can make"
	cont "your #MON"
	cont "forget a move,"
	cont "um-hmm?"
	done

_MoveDeleterSaidYesText::
	text "Which #MON"
	line "would that be?"
	prompt

_MoveDeleterWhichMoveText::
	text "Mm-hmm..."
	line "And which move"
	cont "should it forget?"
	done

_MoveDeleterConfirmText::
	text "Oh, make it forget"
	line "@"
	;text_ram wcf4b
	text_ram wStringBuffer
	text "?"
	prompt

_MoveDeleterForgotText::
	text "It was a"
	line "great success!"

	para "Your #MON"
	line "has forgotten"
	cont "that it ever"
	cont "even knew"
	cont "@"
	;text_ram wcf4b
	text_ram wStringBuffer
	text "!"
	prompt

_MoveDeleterByeText::
	text "Come again"
	line "if there are"
	cont "moves that need"
	cont "to be forgotten."
	done

_MoveDeleterOneMoveText::
	text "What's that, friend?"
	line "That #MON only"
	cont "knows one move,"
	cont "you know?"
	done