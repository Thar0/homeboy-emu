# msg.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKMessageSend
/* 0D0184 800D5724 7C0802A6 */  mflr	r0
/* 0D0188 800D5728 90010004 */  stw		r0, 4(r1)
/* 0D018C 800D572C 9421FFF8 */  stwu	r1, -8(r1)
/* 0D0190 800D5730 80830008 */  lwz		r4, 8(r3)
/* 0D0194 800D5734 38630010 */  addi	r3, r3, 0x10
/* 0D0198 800D5738 480040F1 */  bl		TRK_WriteUARTN
/* 0D019C 800D573C 38210008 */  addi	r1, r1, 8
/* 0D01A0 800D5740 80010004 */  lwz		r0, 4(r1)
/* 0D01A4 800D5744 7C0803A6 */  mtlr	r0
/* 0D01A8 800D5748 4E800020 */  blr		


