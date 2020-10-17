# AmcExi2Stubs.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel EXI2_Init
/* 0D90EC 800DE68C 4E800020 */  blr		

glabel EXI2_EnableInterrupts
/* 0D90F0 800DE690 4E800020 */  blr		

glabel EXI2_Poll
/* 0D90F4 800DE694 38600000 */  li		r3, 0
/* 0D90F8 800DE698 4E800020 */  blr		

glabel EXI2_ReadN
/* 0D90FC 800DE69C 38600000 */  li		r3, 0
/* 0D9100 800DE6A0 4E800020 */  blr		

glabel EXI2_WriteN
/* 0D9104 800DE6A4 38600000 */  li		r3, 0
/* 0D9108 800DE6A8 4E800020 */  blr		

glabel EXI2_Reserve
/* 0D910C 800DE6AC 4E800020 */  blr		

glabel EXI2_Unreserve
/* 0D9110 800DE6B0 4E800020 */  blr		

glabel AMC_IsStub
/* 0D9114 800DE6B4 38600001 */  li		r3, 1
/* 0D9118 800DE6B8 4E800020 */  blr		


