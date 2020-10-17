# w_pow.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel pow
/* 0D8A74 800DE014 7C0802A6 */  mflr	r0
/* 0D8A78 800DE018 90010004 */  stw		r0, 4(r1)
/* 0D8A7C 800DE01C 9421FFF8 */  stwu	r1, -8(r1)
/* 0D8A80 800DE020 4BFFF229 */  bl		__ieee754_pow
/* 0D8A84 800DE024 8001000C */  lwz		r0, 0xc(r1)
/* 0D8A88 800DE028 38210008 */  addi	r1, r1, 8
/* 0D8A8C 800DE02C 7C0803A6 */  mtlr	r0
/* 0D8A90 800DE030 4E800020 */  blr		


