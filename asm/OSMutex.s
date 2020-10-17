# OSMutex.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __OSUnlockAllMutex
/* 0A5F30 800AB4D0 7C0802A6 */  mflr    r0
/* 0A5F34 800AB4D4 90010004 */  stw     r0, 4(r1)
/* 0A5F38 800AB4D8 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0A5F3C 800AB4DC 93E10014 */  stw     r31, 0x14(r1)
/* 0A5F40 800AB4E0 3BE00000 */  li      r31, 0
/* 0A5F44 800AB4E4 93C10010 */  stw     r30, 0x10(r1)
/* 0A5F48 800AB4E8 3BC30000 */  addi    r30, r3, 0
/* 0A5F4C 800AB4EC 48000030 */  b       lbl_800AB51C
lbl_800AB4F0:
/* 0A5F50 800AB4F0 80A40010 */  lwz     r5, 0x10(r4)
/* 0A5F54 800AB4F4 38640000 */  addi    r3, r4, 0
/* 0A5F58 800AB4F8 28050000 */  cmplwi  r5, 0
/* 0A5F5C 800AB4FC 4082000C */  bne     lbl_800AB508
/* 0A5F60 800AB500 93FE02F8 */  stw     r31, 0x2f8(r30)
/* 0A5F64 800AB504 48000008 */  b       lbl_800AB50C
lbl_800AB508:
/* 0A5F68 800AB508 93E50014 */  stw     r31, 0x14(r5)
lbl_800AB50C:
/* 0A5F6C 800AB50C 90BE02F4 */  stw     r5, 0x2f4(r30)
/* 0A5F70 800AB510 93E4000C */  stw     r31, 0xc(r4)
/* 0A5F74 800AB514 93E40008 */  stw     r31, 8(r4)
/* 0A5F78 800AB518 48002655 */  bl      OSWakeupThread
lbl_800AB51C:
/* 0A5F7C 800AB51C 809E02F4 */  lwz     r4, 0x2f4(r30)
/* 0A5F80 800AB520 28040000 */  cmplwi  r4, 0
/* 0A5F84 800AB524 4082FFCC */  bne     lbl_800AB4F0
/* 0A5F88 800AB528 8001001C */  lwz     r0, 0x1c(r1)
/* 0A5F8C 800AB52C 83E10014 */  lwz     r31, 0x14(r1)
/* 0A5F90 800AB530 83C10010 */  lwz     r30, 0x10(r1)
/* 0A5F94 800AB534 38210018 */  addi    r1, r1, 0x18
/* 0A5F98 800AB538 7C0803A6 */  mtlr    r0
/* 0A5F9C 800AB53C 4E800020 */  blr     


