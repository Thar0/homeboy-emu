# dvdFatal.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __DVDPrintFatalMessage
/* 0BC718 800C1CB8 7C0802A6 */  mflr	r0
/* 0BC71C 800C1CBC 90010004 */  stw		r0, 4(r1)
/* 0BC720 800C1CC0 9421FFF8 */  stwu	r1, -8(r1)
/* 0BC724 800C1CC4 818D9360 */  lwz		r12, FatalFunc-_SDA_BASE_(r13)
/* 0BC728 800C1CC8 280C0000 */  cmplwi	r12, 0
/* 0BC72C 800C1CCC 4182000C */  beq		lbl_800C1CD8
/* 0BC730 800C1CD0 7D8803A6 */  mtlr	r12
/* 0BC734 800C1CD4 4E800021 */  blrl	
lbl_800C1CD8:
/* 0BC738 800C1CD8 8001000C */  lwz		r0, 0xc(r1)
/* 0BC73C 800C1CDC 38210008 */  addi	r1, r1, 8
/* 0BC740 800C1CE0 7C0803A6 */  mtlr	r0
/* 0BC744 800C1CE4 4E800020 */  blr		


.section .sbss, "wa"

.balign 8

/* 001005A0 80145D40 0004 */
FatalFunc:
    .skip 4


