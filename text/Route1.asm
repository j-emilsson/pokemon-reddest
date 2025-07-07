_Route1ViridianMartSampleText::
	text "Hi! I work at a"
	line "#MON MART."

	para "It's a convenient"
	line "shop, so please"
	cont "visit us in"
	cont "VIRIDIAN CITY."

	para "I know, I'll give"
	line "you a sample!"
	cont "Here you go!"
	prompt

_Route1Text_1cae8::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Text_1caee::
	text "We also carry"
	line "# BALLs for"
	cont "catching #MON!"
	done

_Route1Text_1caf3::
	text "You have too much"
	line "stuff with you!"
	done

_Route1Text2::
	text "See those ledges"
	line "along the road?"

	para "It's a bit scary,"
	line "but you can jump"
	cont "from them."

	para "You can get back"
	line "to PALLET TOWN"
	cont "quicker that way."
	done

_Route1Text3::
	text "ROUTE 1"
	line "PALLET TOWN -"
	cont "VIRIDIAN CITY"
	done

_Route1BattleText1::
    text "???: Hey!"
	line "<PLAYER>!"
	
    para "My name is"
	line "INFERNO!"
	
	para "I shall conquer"
	line "this world and"
	cont "become the best"
	cont "there ever was!"
	
	para "Now let's fight!"
	line "I shall"
	cont "destroy you!"
    done

_Route1EndBattleText1::
    text "WHAT?!"
	
	para "HOW...?!"
	
	para "You will"
	line "regret this."
	cont "I will be back..."
    prompt

_Route1AfterBattleText1::
    text "You were"
	line "just lucky!"
    cont "I will be back..."
    done
