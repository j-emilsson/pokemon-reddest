# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Pokemon Red/Blue ROM hack called "Pok�mon Reddest" based on the pret team's disassemblies. It includes significant gameplay modifications like a physical/special split, new types (Dark, Steel, Fairy), hard mode, and extensive bug fixes.

## Build Commands

### Basic Build
```bash
make              # Build both pokered.gbc and pokeblue.gbc
make red          # Build only pokered.gbc
make blue         # Build only pokeblue.gbc
make blue_debug   # Build debug version of pokeblue.gbc
```

### Development Commands
```bash
make clean        # Remove build artifacts and generated graphics
make tidy         # Remove object files and ROMs only
make compare      # Compare built ROMs against expected checksums
make tools        # Build development tools (gfx compressor, etc.)
```

### Testing ROMs
The built ROMs (pokered.gbc, pokeblue.gbc) can be tested in Game Boy emulators or on real hardware.

## Codebase Architecture

### ROM Banking System
- **ROM0 (home.asm)**: Fixed bank containing critical functions
- **ROMX Banks 1-45**: Switchable banks for specialized systems
  - Banks 1-3: Core game engines
  - Banks 4-15: Battle engine components
  - Banks 16-19: Graphics and tilesets
  - Banks 20-42: Text data

### Memory Layout
- **WRAM (wram.asm)**: Audio, sprites, maps, party data
- **SRAM (sram.asm)**: Save data across 4 banks
- **HRAM (hram.asm)**: High-speed critical functions

### Core Engine Systems

#### Battle Engine
- Distributed across multiple banks for complex turn-based combat
- Individual move effects in `engine/battle/effects/`
- AI system with trainer-specific behaviors
- Physical/special split implementation

#### Overworld Engine
- Map loading and transitions in `engine/overworld/`
- NPC scripting in `scripts/` directory
- Wild Pokemon encounters in `data/wild/`

#### Menu Systems
- Party management, items, Pokedex in `engine/menus/`
- PC systems for Pokemon storage

### Data Organization

#### Pokemon Data (`data/pokemon/`)
- `base_stats.asm`: Stats, types, abilities
- `evos_moves.asm`: Evolution conditions and learnsets
- `names.asm`: Pokemon names

#### Move Data (`data/moves/`)
- `moves.asm`: Power, accuracy, PP, effects
- `effects_pointers.asm`: Move effect implementations
- `animations.asm`: Battle animation data

#### Trainer Data (`data/trainers/`)
- `parties.asm`: Trainer Pokemon teams
- `ai_pointers.asm`: AI behavior patterns
- `move_choices.asm`: AI move selection logic

#### Map Data (`data/maps/`)
- Map headers, object placement, connections
- `scripts/`: Event scripts for each map area

### Graphics Pipeline
- **Source**: PNG files for editing
- **Build**: Automated conversion to Game Boy 2BPP format
- **Compression**: Custom tools create .pic files for ROM storage
- **Organization**: Separate folders for Pokemon, tilesets, UI elements

### Constants and Configuration
- `constants/`: System-wide definitions
- `constants/battle_constants.asm`: Battle mechanics configuration
- `constants/pokemon_constants.asm`: Pokemon indices and limits

### ROM Hack Customizations
- `custom/`: New features and modifications
- Custom trainer "INFERNATOR" with unique AI
- Difficulty adjustments and stat modifications
- New move implementations
- New and improved trainer AI logic:
    - Terminology:
        - x = multiplier, 4x means 4 times more damage (double super effective)
        - 2x means 2 times more damage (super effective)
        - 1x means normal damage
        - 0.5x means half damage (not very effective)
        - 0x means no damage (no effect)
        - SE = super effective, either 4x or 2x, depending on pokemon's type or types
        - STAB = same type attack bonus, moves that are the same type as user (e.g. ROCK type using a ROCK move, etc)
    - Trainer AI selects the best move using the following priority:
        - Score Index Priority (lower is better)(0 based):
            1. 0: 4x + STAB (Best)
            2. 1: 4x + no STAB
            3. 2: 2x + STAB
	              - if has status ailment move AND target does not have one already
                    1. 80% pick chance to choose status ailment move
                    2. 20% chance to choose 2x SE + STAB move
	              - else
                    1. 90% pick chance
                    2. Else go to 5 — fallback suppressed if no usable status
            4. 3: 2x + no STAB        
	              - if has status ailment move AND target does not have one already
                    1. 90% pick chance to choose status ailment move
                    2. 10% chance to choose 2x SE + no STAB
	              - else
                    1. 75% pick chance
                    2. else go to 5 — fallback suppressed if no usable status
            5. 4: 1x + STAB
                - if has status ailment move AND target does not have one already
                    1. 95% pick chance to choose status ailment move
                    2. 5% chance to choose Neutral + STAB
                - else
                    1. 60% pick chance
                    2. else go to 5 — fallback suppressed if no usable status
            6. 5: Non Ailment Status Move
            7. 6: 1x + no STAB
            8. 7: 0.5x + STAB
            9. 8: 0.5x + no STAB
            10. 9: 0x     (Worst)

    - Picks the strongest move among multiples with same score

## Development Workflow

### Making Changes
1. Edit source files (`.asm` files)
2. Update constants if needed
3. Run `make` to build and test
4. Use `make compare` to verify ROM integrity

### Graphics Modifications
1. Edit PNG files in `gfx/` subdirectories
2. Run `make` to auto-convert to Game Boy format
3. Graphics are automatically compressed during build

### Adding New Features
- Place custom code in `custom/` directory
- Update relevant data files in `data/`
- Add constants in `constants/` files
- Update build system if new files are added

## Important Notes

### RGBDS Toolchain
- Requires RGBDS 0.5.2 (included in `rgbds-0.5.2/` directory)
- Build system automatically uses local version
- Different versions may cause compatibility issues

### Memory Constraints
- Game Boy has strict memory limits (32KB ROM banks, 8KB WRAM)
- Critical functions must stay in ROM0 (home bank)
- Large features may require bank reorganization

### ROM Hack Specific Features
- Hard mode with forced Set Mode and gym level caps
- Custom starter Pokemon (Jolteon, Flareon, Vaporeon)
- Extensive bug fixes from original games
- New types and physical/special split implementation

## Testing and Validation

### Built-in Tests
- `make compare` verifies ROM checksums
- Debug builds include additional development features
- Save files in `saves/` directory for testing specific scenarios

### Custom Features Testing
- INFERNATOR trainer battles for AI testing
- Difficulty mode validation
- New move and type effectiveness testing