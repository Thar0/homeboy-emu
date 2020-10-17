# mbstring.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel wcstombs
/* 0D54C0 800DAA60 28050000 */  cmplwi  r5, 0
/* 0D54C4 800DAA64 7CA903A6 */  mtctr   r5
/* 0D54C8 800DAA68 38C00000 */  li      r6, 0
/* 0D54CC 800DAA6C 40810028 */  ble     lbl_800DAA94
lbl_800DAA70:
/* 0D54D0 800DAA70 A0040000 */  lhz     r0, 0(r4)
/* 0D54D4 800DAA74 38840002 */  addi    r4, r4, 2
/* 0D54D8 800DAA78 7C050774 */  extsb   r5, r0
/* 0D54DC 800DAA7C 7CA00775 */  extsb.  r0, r5
/* 0D54E0 800DAA80 98A30000 */  stb     r5, 0(r3)
/* 0D54E4 800DAA84 38630001 */  addi    r3, r3, 1
/* 0D54E8 800DAA88 4182000C */  beq     lbl_800DAA94
/* 0D54EC 800DAA8C 38C60001 */  addi    r6, r6, 1
/* 0D54F0 800DAA90 4200FFE0 */  bdnz    lbl_800DAA70
lbl_800DAA94:
/* 0D54F4 800DAA94 7CC33378 */  mr      r3, r6
/* 0D54F8 800DAA98 4E800020 */  blr     


