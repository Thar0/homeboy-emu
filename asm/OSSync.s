# OSSync.c
.include "macros.inc"

.section .text, "ax"

.balign 4

SystemCallVector:
/* 0A7528 800ACAC8 7D30FAA6 */  mfspr   r9, 0x3f0
/* 0A752C 800ACACC 612A0008 */  ori     r10, r9, 8
/* 0A7530 800ACAD0 7D50FBA6 */  mtspr   0x3f0, r10
/* 0A7534 800ACAD4 4C00012C */  isync   
/* 0A7538 800ACAD8 7C0004AC */  sync    0
/* 0A753C 800ACADC 7D30FBA6 */  mtspr   0x3f0, r9
/* 0A7540 800ACAE0 4C000064 */  rfi     
glabel __OSSystemCallVectorEnd
/* 0A7544 800ACAE4 60000000 */  nop     

glabel __OSInitSystemCall
/* 0A7548 800ACAE8 7C0802A6 */  mflr    r0
/* 0A754C 800ACAEC 90010004 */  stw     r0, 4(r1)
/* 0A7550 800ACAF0 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0A7554 800ACAF4 93E1000C */  stw     r31, 0xc(r1)
/* 0A7558 800ACAF8 3CA08000 */  lis     r5, 0x8000
/* 0A755C 800ACAFC 3C80800B */  lis     r4, SystemCallVector@ha
/* 0A7560 800ACB00 3C60800B */  lis     r3, __OSSystemCallVectorEnd@ha
/* 0A7564 800ACB04 3BE50C00 */  addi    r31, r5, 0xc00
/* 0A7568 800ACB08 3803CAE4 */  addi    r0, r3, __OSSystemCallVectorEnd@l
/* 0A756C 800ACB0C 3884CAC8 */  addi    r4, r4, SystemCallVector@l
/* 0A7570 800ACB10 7FE3FB78 */  mr      r3, r31
/* 0A7574 800ACB14 7CA40050 */  subf    r5, r4, r0
/* 0A7578 800ACB18 4BF589AD */  bl      memcpy
/* 0A757C 800ACB1C 7FE3FB78 */  mr      r3, r31
/* 0A7580 800ACB20 38800100 */  li      r4, 0x100
/* 0A7584 800ACB24 4BFFC72D */  bl      DCFlushRangeNoSync
/* 0A7588 800ACB28 7C0004AC */  sync    0
/* 0A758C 800ACB2C 7FE3FB78 */  mr      r3, r31
/* 0A7590 800ACB30 38800100 */  li      r4, 0x100
/* 0A7594 800ACB34 4BFFC775 */  bl      ICInvalidateRange
/* 0A7598 800ACB38 80010014 */  lwz     r0, 0x14(r1)
/* 0A759C 800ACB3C 83E1000C */  lwz     r31, 0xc(r1)
/* 0A75A0 800ACB40 38210010 */  addi    r1, r1, 0x10
/* 0A75A4 800ACB44 7C0803A6 */  mtlr    r0
/* 0A75A8 800ACB48 4E800020 */  blr     


