# targcont.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKTargetContinue
/* 0D4350 800D98F0 7C0802A6 */  mflr    r0
/* 0D4354 800D98F4 38600000 */  li      r3, 0
/* 0D4358 800D98F8 90010004 */  stw     r0, 4(r1)
/* 0D435C 800D98FC 9421FFF8 */  stwu    r1, -8(r1)
/* 0D4360 800D9900 4BFFF38D */  bl      TRKTargetSetStopped
/* 0D4364 800D9904 4BFFFF99 */  bl      UnreserveEXI2Port
/* 0D4368 800D9908 4BFFED81 */  bl      TRKSwapAndGo
/* 0D436C 800D990C 4BFFFF61 */  bl      ReserveEXI2Port
/* 0D4370 800D9910 38600000 */  li      r3, 0
/* 0D4374 800D9914 38210008 */  addi    r1, r1, 8
/* 0D4378 800D9918 80010004 */  lwz     r0, 4(r1)
/* 0D437C 800D991C 7C0803A6 */  mtlr    r0
/* 0D4380 800D9920 4E800020 */  blr     


