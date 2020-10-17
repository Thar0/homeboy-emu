# global_destructor_chain.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __destroy_global_chain
/* 0D4478 800D9A18 7C0802A6 */  mflr	r0
/* 0D447C 800D9A1C 90010004 */  stw		r0, 4(r1)
/* 0D4480 800D9A20 9421FFF8 */  stwu	r1, -8(r1)
/* 0D4484 800D9A24 48000020 */  b		lbl_800D9A44
lbl_800D9A28:
/* 0D4488 800D9A28 80030000 */  lwz		r0, 0(r3)
/* 0D448C 800D9A2C 3880FFFF */  li		r4, -1
/* 0D4490 800D9A30 900D95B8 */  stw		r0, __global_destructor_chain-_SDA_BASE_(r13)
/* 0D4494 800D9A34 81830004 */  lwz		r12, 4(r3)
/* 0D4498 800D9A38 80630008 */  lwz		r3, 8(r3)
/* 0D449C 800D9A3C 7D8803A6 */  mtlr	r12
/* 0D44A0 800D9A40 4E800021 */  blrl	
lbl_800D9A44:
/* 0D44A4 800D9A44 806D95B8 */  lwz		r3, __global_destructor_chain-_SDA_BASE_(r13)
/* 0D44A8 800D9A48 28030000 */  cmplwi	r3, 0
/* 0D44AC 800D9A4C 4082FFDC */  bne		lbl_800D9A28
/* 0D44B0 800D9A50 8001000C */  lwz		r0, 0xc(r1)
/* 0D44B4 800D9A54 38210008 */  addi	r1, r1, 8
/* 0D44B8 800D9A58 7C0803A6 */  mtlr	r0
/* 0D44BC 800D9A5C 4E800020 */  blr		


.section .sbss, "wa"

.balign 8

/* 001007F8 80145F98 0004 */
glabel __global_destructor_chain
    .skip 4


