# OSArena.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSGetArenaHi
/* 0A395C 800A8EFC 806D9110 */  lwz     r3, __OSArenaHi-_SDA_BASE_(r13)
/* 0A3960 800A8F00 4E800020 */  blr     

glabel OSGetArenaLo
/* 0A3964 800A8F04 806D8D08 */  lwz     r3, __OSArenaLo-_SDA_BASE_(r13)
/* 0A3968 800A8F08 4E800020 */  blr     

glabel OSSetArenaHi
/* 0A396C 800A8F0C 906D9110 */  stw     r3, __OSArenaHi-_SDA_BASE_(r13)
/* 0A3970 800A8F10 4E800020 */  blr     

glabel OSSetArenaLo
/* 0A3974 800A8F14 906D8D08 */  stw     r3, __OSArenaLo-_SDA_BASE_(r13)
/* 0A3978 800A8F18 4E800020 */  blr     


.section .sdata, "wa"

.balign 8

/* 000FFF48 801456E8 0004 */
__OSArenaLo:
    .long 0xFFFFFFFF


.section .sbss, "wa"

.balign 8

/* 00100350 80145AF0 0004 */
__OSArenaHi:
    .skip 4


