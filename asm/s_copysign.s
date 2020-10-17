# s_copysign.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel copysign
/* 0D86C8 800DDC68 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D86CC 800DDC6C D8210008 */  stfd    f1, 8(r1)
/* 0D86D0 800DDC70 D8410010 */  stfd    f2, 0x10(r1)
/* 0D86D4 800DDC74 80610008 */  lwz     r3, 8(r1)
/* 0D86D8 800DDC78 80010010 */  lwz     r0, 0x10(r1)
/* 0D86DC 800DDC7C 54000000 */  rlwinm  r0, r0, 0, 0, 0
/* 0D86E0 800DDC80 5060007E */  rlwimi  r0, r3, 0, 1, 0x1f
/* 0D86E4 800DDC84 90010008 */  stw     r0, 8(r1)
/* 0D86E8 800DDC88 C8210008 */  lfd     f1, 8(r1)
/* 0D86EC 800DDC8C 38210018 */  addi    r1, r1, 0x18
/* 0D86F0 800DDC90 4E800020 */  blr     


