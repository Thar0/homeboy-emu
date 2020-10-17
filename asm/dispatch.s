# dispatch.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKInitializeDispatcher
/* 0D0BC0 800D6160 3C608014 */  lis     r3, gTRKDispatchTableSize@ha
/* 0D0BC4 800D6164 38000020 */  li      r0, 0x20
/* 0D0BC8 800D6168 90034248 */  stw     r0, gTRKDispatchTableSize@l(r3)
/* 0D0BCC 800D616C 38600000 */  li      r3, 0
/* 0D0BD0 800D6170 4E800020 */  blr     

glabel TRKDispatchMessage
/* 0D0BD4 800D6174 7C0802A6 */  mflr    r0
/* 0D0BD8 800D6178 38800000 */  li      r4, 0
/* 0D0BDC 800D617C 90010004 */  stw     r0, 4(r1)
/* 0D0BE0 800D6180 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0BE4 800D6184 93E10014 */  stw     r31, 0x14(r1)
/* 0D0BE8 800D6188 3BE00500 */  li      r31, 0x500
/* 0D0BEC 800D618C 93C10010 */  stw     r30, 0x10(r1)
/* 0D0BF0 800D6190 3BC30000 */  addi    r30, r3, 0
/* 0D0BF4 800D6194 4BFFF7A9 */  bl      TRKSetBufferPosition
/* 0D0BF8 800D6198 387E0000 */  addi    r3, r30, 0
/* 0D0BFC 800D619C 38810008 */  addi    r4, r1, 8
/* 0D0C00 800D61A0 4BFFFB21 */  bl      TRKReadBuffer1_ui8
/* 0D0C04 800D61A4 3C608014 */  lis     r3, gTRKDispatchTableSize@ha
/* 0D0C08 800D61A8 88810008 */  lbz     r4, 8(r1)
/* 0D0C0C 800D61AC 80034248 */  lwz     r0, gTRKDispatchTableSize@l(r3)
/* 0D0C10 800D61B0 7C040040 */  cmplw   r4, r0
/* 0D0C14 800D61B4 40800028 */  bge     lbl_800D61DC
/* 0D0C18 800D61B8 3C608010 */  lis     r3, gTRKDispatchTable@ha
/* 0D0C1C 800D61BC 5484103A */  slwi    r4, r4, 2
/* 0D0C20 800D61C0 38031D00 */  addi    r0, r3, gTRKDispatchTable@l
/* 0D0C24 800D61C4 7C602214 */  add     r3, r0, r4
/* 0D0C28 800D61C8 81830000 */  lwz     r12, 0(r3)
/* 0D0C2C 800D61CC 387E0000 */  addi    r3, r30, 0
/* 0D0C30 800D61D0 7D8803A6 */  mtlr    r12
/* 0D0C34 800D61D4 4E800021 */  blrl    
/* 0D0C38 800D61D8 7C7F1B78 */  mr      r31, r3
lbl_800D61DC:
/* 0D0C3C 800D61DC 7FE3FB78 */  mr      r3, r31
/* 0D0C40 800D61E0 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0C44 800D61E4 83C10010 */  lwz     r30, 0x10(r1)
/* 0D0C48 800D61E8 38210018 */  addi    r1, r1, 0x18
/* 0D0C4C 800D61EC 80010004 */  lwz     r0, 4(r1)
/* 0D0C50 800D61F0 7C0803A6 */  mtlr    r0
/* 0D0C54 800D61F4 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FED80 80101D00 0084 */
glabel gTRKDispatchTable
    .long TRKDoUnsupported, TRKDoConnect, TRKDoDisconnect, TRKDoReset, TRKDoVersions, TRKDoSupportMask, TRKDoCPUType, TRKDoUnsupported
    .long TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported
    .long TRKDoReadMemory, TRKDoWriteMemory, TRKDoReadRegisters, TRKDoWriteRegisters, TRKDoUnsupported, TRKDoUnsupported, TRKDoFlushCache, TRKDoUnsupported
    .long TRKDoContinue, TRKDoStep, TRKDoStop, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported, TRKDoUnsupported
    .long 0x00000000


.section .bss, "wa"

.balign 4

/* 001412C8 80144248 0004 */
glabel gTRKDispatchTableSize
    .skip 4


