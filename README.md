# ELE338 Project

A menu-driven **16-bit x86 assembly** project written for the ELE338 lab assignment. It combines four number utilities with keyboard input, decimal output, and an interactive text menu.

Start with [ELE338_Assignment_21728184.asm](ELE338_Assignment_21728184.asm), the integrated program. The remaining files are individual exercises and development prototypes.

## Features

| Option | Utility | Behavior |
| --- | --- | --- |
| 1 | Fibonacci | Checks sequence membership; otherwise reports a lower Fibonacci number. |
| 2 | Factorial | Calculates a factorial using 16-bit arithmetic; rejects inputs above 8. |
| 3 | Square root | Reports an exact root or the integer root rounded down. |
| 4 | Prime | Checks primality; for composite inputs, searches downward for a prime. |
| 5 | About | Shows project and author information across three pages. |
| 6 | Exit | Clears the screen and halts execution. |

The menu labels option 3 “Square,” but it calculates a **square root**. Messages that say “closest” refer to a downward search, rather than the nearest value in either direction.

## Getting started

### Requirements

Use a 16-bit x86 assembler/emulator supporting MASM-style directives and DOS/BIOS interrupts. The source uses `org 100h`, `.model small`, DOS `int 21h`, and BIOS `int 10h` / `int 16h`.

The repository does not include a pinned assembler, build script, or executable. Your toolchain may require source adjustments. The assembly files cannot run directly in a modern terminal.

### Run the main program

1. Download the repository with **Code → Download ZIP**, or clone it:

   ```sh
   git clone https://github.com/oorhunn/ELE338Project.git
   cd ELE338Project
   ```

2. Open `ELE338_Assignment_21728184.asm` in your compatible assembler/emulator.
3. Assemble the source and run it inside the emulated DOS/BIOS environment.
4. Enter a menu option from **1–6** and press **Enter**.
5. For a number utility, enter decimal digits and press **Enter**. In About, use **Y/y** to advance through the pages.

Exit uses `hlt`; stop or reset the emulator when execution halts.

## Example checks

These small examples describe intended behavior for manual checks; they are not an automated test suite.

| Utility | Input | Expected result |
| --- | --- | --- |
| Fibonacci | 13 | Recognized as a Fibonacci number |
| Fibonacci | 14 | Lower Fibonacci number: 13 |
| Factorial | 5 | 120 |
| Square root | 144 | 12, exact square root |
| Square root | 150 | 12, rounded down |
| Prime | 11 | Recognized as prime |
| Prime | 12 | Lower prime: 11 |

## Repository contents

| File | Purpose |
| --- | --- |
| [ELE338_Assignment_21728184.asm](ELE338_Assignment_21728184.asm) | Integrated menu, input/output routines, and all four utilities |
| [factorial.asm](factorial.asm) | Standalone factorial exercise with a hardcoded input |
| [fibonacci.asm](fibonacci.asm) | Standalone Fibonacci exercise with a hardcoded input |
| [squareroot.asm](squareroot.asm) | Standalone integer square-root exercise |
| [prime.asm](prime.asm) | Standalone prime-checking and decimal-output exercise |
| [input.asm](input.asm) | Decimal keyboard-input conversion prototype |
| [integerprint.asm](integerprint.asm) | Integer-to-decimal-string conversion and printing example |
| [menu(oguz).asm](menu%28oguz%29.asm) | Earlier menu and input prototype |

## Implementation notes and limitations

This is coursework code with known edge cases:

- Arithmetic uses 16-bit registers. Large inputs can overflow; input conversion does not enforce the unsigned 16-bit limit of 65,535.
- Factorial handles 0 and rejects values above 8, but input **1** is not handled correctly by its loop.
- Fibonacci's small-input handling is incomplete: **0 and 2** do not follow a correct membership check.
- Prime incorrectly treats **1** as prime. Its early paths for **1 and 2** also use a result register that has not been initialized from the input.
- The DOS buffered-input declaration does not reserve the full character buffer. Invalid-input handling also leaves pushed values on the stack. These routines need correction before relying on repeated or malformed input.
- Square-root and Fibonacci calculations can overflow on large values. Start with the small examples above when inspecting the algorithms.

The standalone files use different test inputs and initialization. Inspect them individually rather than linking them together as modules. Runtime behavior has not been verified as part of this documentation.

## Author

Anıl Orhun Demiroğlu — created for the ELE338 lab assignment.
