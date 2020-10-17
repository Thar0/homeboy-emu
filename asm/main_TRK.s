# main_TRK.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKTargetCPUMinorType
/* 0D3FA8 800D9548 38600054 */  li		r3, 0x54
/* 0D3FAC 800D954C 4E800020 */  blr		

glabel TRK_main
/* 0D3FB0 800D9550 7C0802A6 */  mflr	r0
/* 0D3FB4 800D9554 90010004 */  stw		r0, 4(r1)
/* 0D3FB8 800D9558 9421FFF8 */  stwu	r1, -8(r1)
/* 0D3FBC 800D955C 4BFFC035 */  bl		TRKInitializeNub
/* 0D3FC0 800D9560 3C808014 */  lis		r4, TRK_mainError@ha
/* 0D3FC4 800D9564 946447D0 */  stwu	r3, TRK_mainError@l(r4)
/* 0D3FC8 800D9568 80040000 */  lwz		r0, 0(r4)
/* 0D3FCC 800D956C 2C000000 */  cmpwi	r0, 0
/* 0D3FD0 800D9570 4082000C */  bne		lbl_800D957C
/* 0D3FD4 800D9574 4BFFC115 */  bl		TRKNubWelcome
/* 0D3FD8 800D9578 4BFFBCC9 */  bl		TRKNubMainLoop
lbl_800D957C:
/* 0D3FDC 800D957C 4BFFC0E9 */  bl		TRKTerminateNub
/* 0D3FE0 800D9580 3C808014 */  lis		r4, TRK_mainError@ha
/* 0D3FE4 800D9584 906447D0 */  stw		r3, TRK_mainError@l(r4)
/* 0D3FE8 800D9588 38210008 */  addi	r1, r1, 8
/* 0D3FEC 800D958C 80010004 */  lwz		r0, 4(r1)
/* 0D3FF0 800D9590 7C0803A6 */  mtlr	r0
/* 0D3FF4 800D9594 4E800020 */  blr		


.section .bss, "wa"

.balign 4

/* 00141850 801447D0 0004 */
TRK_mainError:
    .skip 4


