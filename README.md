# MIPS Study Pack

A clean, well-organized repository with **cheat sheets, problem snippets, and example MIPS programs** based on my practice.

## Contents
- **/cheatsheets** — Short .s reference files (syscalls, arithmetic, memory, branches, shifts, floating point).
- **/examples** — Minimal runnable MIPS programs for SPIM/MARS.

## How to Run (SPIM/MARS)
1. Open MARS or QtSPIM.
2. File → Open… any `.asm` from `/examples`.
3. Assemble, then **Run**. Provide input when prompted.

> Conventions used
- **Syscalls**: `$v0` = service; args in `$a*` or `$f12` for floats; result in `$v0`/`$f0`.
- **Registers**: `$t*` caller-saved; `$s*` callee-saved; `$ra` return address; `$sp` stack pointer.
- **FP compare**: `c.eq.s/c.lt.s` + `bc1t/bc1f` (never `beq` with `$f*`).

## Example Index
- `hello.asm` — Hello string.
- `add_two_floats.asm` — Read two floats, print their sum.
- `compare_floats_and_count_strings.asm` — If floats equal → exit; else read strings, count len 3/4/other; stop after three of len 3 or 4.
- `sum_1_to_N.asm` — Loop sum skeleton.
- `primes_up_to_N.asm` — Prints primes 2..N using `isPrime` (trial division).
- `count_pos_neg_zero.asm` — Sign counters skeleton.
- `average_doubles.asm` — Average of N doubles (accumulate in double).
- `divisibility_3_5_15.asm` — Cascading counts for multiples of 3/5/15.
- `stack_push_pop.asm` — Push/pop demo.
- `function_prologue_example.asm` — Save/restore $ra,$s0.

## License
MIT
