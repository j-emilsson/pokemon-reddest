# Pokémon Reddest

This is a rom hack of Pokémon Red and Blue, based on the disassemblies, provided by the [pret team](https://github.com/pret).

## Features

- ### Adjusted base stats and movesets of all Pokémon

- ### New types
    - Dark
    - Steel
    - Fairy

- ### Physical/special split

- ### Fixed various bugs

  - Focus Energy bug
  - 100% Accuracy bug
  - Substitute bug
  - Dual-type move effectivness misreport
  - HP-draining moves and Dream Eater may hit through a Substitute
  - Ethers and Elixirs items not taking PP Ups into account
  - Bide in link battles
  - Struggle does not account for any PP Ups
  - Psychic, Psywave and Night Shade's animation does not wiggle the top 3 screen lines
  - Psywave can desync a link battle
  - Fly and Dig do not remove the invulnerable status when prevented from reaching their second stage by paralysis or confusion damage
  - Healing moves failing when max HP is 255 or 511 points higher than current HP
  - Switch-out messages do not account for HP underflow
  - Haze can prevent a Pokémon from attacking after curing freeze
  - CoolTrainerFAI switches all the time at 10-20% health instead of 25%
  - Blaine uses Super Potion even when his Pokémon aren't below 10% health
  - Transformed Pokémon are assumed to be Ditto
  - The Pokémon behind the Ghost is identified as seen in the Pokédex even if you didn't use the Silph Scope on it
  - Ghost Pokémon can be identified without the Silph Scope
  - Move swap sound is played from the wrong bank, playing the wrong sound as a result
  - Status-curing items remove stat modifiers
  - AI trainer HUD does not update when it uses healing items
  - Move swaps disallowed while transformed
  - Cinnabar Island's left-facing shore tiles point to invalid Pokémon
  - Star grass tiles don't yield any Pokémon encounters
  - Lt. Surge's gym trash cans do not use the proper trash cans for the locks
  - Having a stack of 99 items and adding more can cause memory corruption
  - Bicycle clerk causes text to appear instantly
  - A sign in Route 16 isn't readable at its front
  - A cuttable tree can return and block the player like it was never cut
  - Invisible PCs and Bench Dudes exist at the Celadon Hotel and most of the Safari Zone rest houses
  - The player can jump a ledge to land on top of an NPC
  - Falling through a hole on the Bicycle doesn't reset the music
  - Using the Escape Rope shows letters or JP characters instead of the proper sprite on DMG and doesn't spin correctly on SGB
  - Item Finder won't detect items at X or Y coordinate 0
  - NPCs on the overworld aren't restricted correctly
  - NPCs can treat the bottom row or the rightmost column of a map as offscreen
  - NPC movement delay can be higher than it should be
  - NPCs can randomly load at the corner of the screen when you first enter an area
  - NPCs can be stopped by holding down A at the left side of the Route 12 gate binoculars
  - Trainers' end battle text 2 isn't read correctly
  - Random items can cause Pokémon to evolve
  - Erroneous stone evolutions can cause Pokémon to evolve
  - Using the Pokédoll on the ghost Marowak can allow you to sequence break
  - Glitch Pokémon can corrupt SRAM
  - Glitch moves can have variable PP
  - Smoke puffs from Strength boulders don't show up correctly
  - Fainted parties can be walked around with through resets if poisoned
  - CollisionCheckOnWater doesn't properly check for whether to Surf or not
  - GetBattleTransitionID_IsDungeonMap fails to recognize some maps as dungeon maps
  - The slot machine's tile loading routine loads too many tiles
  - The lucky slot machine in the Game Corner doesn't stop when it should if you get a 7
  - The lucky slot machine in the Game Corner doesn't stop when it should if there are two 7s or BARs on the middle or bottom of the wheel
  - The hidden 40-coin stash in the Game Corner only gives half
  - The splash screen adds 2 more stars than it should
  - The PC screen in the healing machine doesn't flash correctly
  - GetName applies to all names rather than only item names
  - wd732 isn't cleared when starting a new game at the Cycling Road
  - Bad emulators cause the 'ED' tile to not display correctly
  - The player can escape from the Safari Zone by resetting the game or via poison damage
  - NPCs can receive the wrong movement byte and behave incorrectly
  - Tile collision detection while on certain tiles causes bad performance and strange behaviour if more tiles are added to collision arrays
  - Fix Trainer Fly Glitch
  - Disable fishing and surfing in statues
  - Stuck in the wall when following Oak to his Lab
  - Sliding of trainer and Pokémon graphics can cause tearing
  - The lower-right tile of Pokémon backsprites are deleted when sliding offscreen
  - Minimize and Substitute can cause sprite glitches with enemy Pokémon
  - OAM updates can be interrupted by V-Blank
  - Trainer Card transition screens can show brief garbage on DMG
  - Double Edge looks weird when the opponent uses it
  - Pewter Gym Youngster sprite glitch
  - The battle victory music can sometimes play at the wrong time
  - Prof. Oak's lab music can sometimes play with a channel cut off
  - The 'acquired an item' jingle can sometimes be cut off
  - The audio engine may borrow from the high byte of the wrong frequency
  - Articuno's cry may get distorted when you see it in the binoculars on Route 15/Fossils play their Pokémon's cry when they shouldn't in Pewter Museum
  - The Prof. Oak introduction uses Nidorina's cry instead of Nidorino's (changed to ONIX)
  - The text used by Prof. Oak when he gives you 5 Pokéballs overwrites the second line with the last line
  - An in-game trade NPC talks about an 'evolving Raichu/Poliwhirl'
  - The text used by one of the Route 8 battles has text cut off
  - The lucky slot machine in the Game Corner can be the nonexistent slot machine 255 (-1)
  - The player doesn't face the guard in the Route 8 gate when stopped by him
  - The Lift Key can be immediately grabbed after the Rocket Grunt drops it
  - The Silph Co. elevator can exhibit strange behavior on the 11th floor
  - Saving Mr. Fuji and warping to his house doesn't let you immediately leave
  - PokemonTower2FRivalEncounterEventCoords doesn't have a proper ending terminator
  - Battles can get stuck in a disabled state causing softlocks
  - Saves corrupted by mid-save shutoff are not handled
  - Multiple dialogs are able to be held on-screen with the A button

- ### Gym Leader Rematches
  - Brock
  
- ### Allow attacks after waking up from SLEEP

- ### POISON, BURN and LEECH do 8th of max HP instead of 16th

- ### Infinite TMs

- ### Improved catching system

- ### Increased money won from battles

- ### Facing enemy trainers when they see you

- ### Added Pokeball icon to show already-owned Pokemon

- ### Removed enemy trainer's 25% chance to miss status moves

- ### Added in-battle EXP bar

- ### Added Gen 7 Critial Hit chance mechanic

- ### Improved the Exp. All item

- ### Move Relearner and Move Deleter

- ### Purchasable TMs in PokéMarts

- ### Trade evolutions has been changed to level up evolutions

- ### Increased bag space

- ### Another rival

- ### Updated power, accuracy, pp and additional effect changes on existing moves to latest gen
  
- ### Updated some existing moves 
    - Trapping moves (Bind, Clamp, Fire Spin, Wrap) are now 2-5 hitting moves instead
    - Splash is now Water type, has 40 power and increases evasion by 1 stage
    - Cut is now Steel type and has 60 power
    - Sky Attack has been changed to now attack immediately and also has a 30% chance to flinch
    - Strength is now Rock type
    - Sonic Boom is now Electric type and has 40 power
    - Struggle is now Typeless and can hit anything
    - Submission now has 120 power, 100% accuracy and 15 PP
    - Low Kick now has 60 power
    - Rolling Kick now has 90 power
    - Pay Day now has 100 power
    - Psywave now deals random damage between user's level and 120 power

- ### Removed OHKO moves
    - Guillotine
    - Horn Drill
    - Fissure

- ### Removed bad moves
    - Vicegrip
    - Whirlwind
    - Roar
    - Mist
    - Rage
    - Bide
    - Poison Gas

- ### New moves from later gens
    - Feint Attack
    - Sludge Bomb
    - Flame Wheel
    - Outrage
    - Sacred Fire
    - Dragon Breath
    - Shadow Ball
    - Crunch
    - Extreme Speed
    - Giga Drain
    - Hyper Voice
    - Leaf Blade
    - Shock Wave
    - Iron Head
    - Flash Cannon
    - Aura Sphere
    - Drain Punch
    - Air Slash
    - Earth Power
    - Poison Jab
    - Power Gem
    - Bug Buzz
    - Rock Wrecker
    - Dark Pulse
    - Dragon Pulse
    - Moonblast
    - Play Rough
    - Shadow Bone
    - Plasma Fists
    - Thunderous Kick (Electric)

- ### New custom moves
    - Super Lick

- ### Different starters
    - Jolteon
    - Flareon
    - Vaporeon

- ### Adjusted typings of Pokémon
    -	Ekans/Arbok
        - Poison/Dark
    -   Arcanine
        - Fire/Dark
    -   Beedrill
        - Bug/Dark
    -   Bellsprout/Weepinbell/Victreebel
        - Grass/Dark
    -	Blastoise
        - Water/Steel
    -   Bulbasaur/Ivysaur/Venusaur
        - Grass/Ground
    -   Butterfree
        - Bug/Psychic
    -	Charizard
        - Fire/Dragon
    -	Clefairy/Clefable
        - Fairy
    -   Cubone/Marowak
        - Ground/Ghost
    -	Diglett/Dugtrio
        - Ground/Steel
    -   Electabuzz
        - Electric/Fighting
    -	Farfetch'd
        - Fighting/Flying
    -   Gastly/Haunter/Gengar
        - Ghost
    -   Geodude/Graveler/Golem
        - Rock/Fighting
    -	Gyarados
        - Water/Dragon
    -   Horsea/Seadra
        - Water/Poison
    -	Jigglypuff/Wigglytuff
        - Normal/Fairy
    -   Kangaskhan
        - Normal/Ground
    -   Lickitung
        - Normal/Fighting
    -   Machop/Machoke/Machamp
        - Fighting/Ground
    -   Magmar
        - Fire/Fighting
    -	Magnemite/Magneton
        - Electric/Steel
    -   Mankey/Primeape
        - Fighting/Dark
    -   Meowth/Persian
        - Normal/Dark
    -   Mew
        - Psychic/Flying
    -   Mewtwo
        - Psychic/Dark
    -	Mr.Mime
        - Psychic/Fairy
    -   Ninetales
        - Fire/Fairy
    -	Muk
        - Poison/Dark
    -   Onix
        - Rock/Dark
    -   Parasect
        - Grass/Ghost
    -   Pinsir
        - Bug/Fighting
    -   Porygon
        - Psychic/Electric
    -	Psyduck/Golduck
        - Water/Psychic
    -   Rattata/Raticate
        - Normal/Dark
    -   Sandshrew/Sandslash
        - Ground/Steel
    -   Spearow/Fearow
        - Flying/Dark
    -   Tauros
        - Normal/Steel
    -	Weezing
        - Poison/Fairy

## Credit
The pret team for the pokered disassemblies, which this repository is based on: [pret/pokered](https://github.com/pret/pokered)

The pret team and its contributors for the wiki tutorials: [Tutorials](https://github.com/pret/pokered/wiki/Tutorials)

TheFakeMateo for physical/special split: [rpp-backup](https://github.com/JustRegularLuna/rpp-backup)

TheFakeMateo for move relearner/deleter: [rpp-backup](https://github.com/JustRegularLuna/rpp-backup), and Jojobear13 for implementation guide: [shinpokered](https://github.com/jojobear13/shinpokered)