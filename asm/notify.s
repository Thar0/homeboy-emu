# notify.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKDoNotifyStopped
/* 0D2358 800D78F8 7C0802A6 */  mflr    r0
/* 0D235C 800D78FC 90010004 */  stw     r0, 4(r1)
/* 0D2360 800D7900 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0D2364 800D7904 93E1001C */  stw     r31, 0x1c(r1)
/* 0D2368 800D7908 3881000C */  addi    r4, r1, 0xc
/* 0D236C 800D790C 93C10018 */  stw     r30, 0x18(r1)
/* 0D2370 800D7910 3BC30000 */  addi    r30, r3, 0
/* 0D2374 800D7914 38610008 */  addi    r3, r1, 8
/* 0D2378 800D7918 4BFFDEB5 */  bl      TRKGetFreeBuffer
/* 0D237C 800D791C 7C7F1B79 */  or.     r31, r3, r3
/* 0D2380 800D7920 40820094 */  bne     lbl_800D79B4
/* 0D2384 800D7924 80A1000C */  lwz     r5, 0xc(r1)
/* 0D2388 800D7928 8065000C */  lwz     r3, 0xc(r5)
/* 0D238C 800D792C 28030880 */  cmplwi  r3, 0x880
/* 0D2390 800D7930 4180000C */  blt     lbl_800D793C
/* 0D2394 800D7934 38800301 */  li      r4, 0x301
/* 0D2398 800D7938 48000024 */  b       lbl_800D795C
lbl_800D793C:
/* 0D239C 800D793C 38030001 */  addi    r0, r3, 1
/* 0D23A0 800D7940 7C651A14 */  add     r3, r5, r3
/* 0D23A4 800D7944 9005000C */  stw     r0, 0xc(r5)
/* 0D23A8 800D7948 38800000 */  li      r4, 0
/* 0D23AC 800D794C 9BC30010 */  stb     r30, 0x10(r3)
/* 0D23B0 800D7950 80650008 */  lwz     r3, 8(r5)
/* 0D23B4 800D7954 38030001 */  addi    r0, r3, 1
/* 0D23B8 800D7958 90050008 */  stw     r0, 8(r5)
lbl_800D795C:
/* 0D23BC 800D795C 2C040000 */  cmpwi   r4, 0
/* 0D23C0 800D7960 40820024 */  bne     lbl_800D7984
/* 0D23C4 800D7964 57C0063E */  clrlwi  r0, r30, 0x18
/* 0D23C8 800D7968 28000090 */  cmplwi  r0, 0x90
/* 0D23CC 800D796C 40820010 */  bne     lbl_800D797C
/* 0D23D0 800D7970 8061000C */  lwz     r3, 0xc(r1)
/* 0D23D4 800D7974 48000E91 */  bl      TRKTargetAddStopInfo
/* 0D23D8 800D7978 4800000C */  b       lbl_800D7984
lbl_800D797C:
/* 0D23DC 800D797C 8061000C */  lwz     r3, 0xc(r1)
/* 0D23E0 800D7980 48000F15 */  bl      TRKTargetAddExceptionInfo
lbl_800D7984:
/* 0D23E4 800D7984 8061000C */  lwz     r3, 0xc(r1)
/* 0D23E8 800D7988 38810010 */  addi    r4, r1, 0x10
/* 0D23EC 800D798C 38A00002 */  li      r5, 2
/* 0D23F0 800D7990 38C00003 */  li      r6, 3
/* 0D23F4 800D7994 38E00001 */  li      r7, 1
/* 0D23F8 800D7998 4BFFFDA5 */  bl      TRKRequestSend
/* 0D23FC 800D799C 7C7F1B79 */  or.     r31, r3, r3
/* 0D2400 800D79A0 4082000C */  bne     lbl_800D79AC
/* 0D2404 800D79A4 80610010 */  lwz     r3, 0x10(r1)
/* 0D2408 800D79A8 4BFFDEED */  bl      TRKReleaseBuffer
lbl_800D79AC:
/* 0D240C 800D79AC 80610008 */  lwz     r3, 8(r1)
/* 0D2410 800D79B0 4BFFDEE5 */  bl      TRKReleaseBuffer
lbl_800D79B4:
/* 0D2414 800D79B4 7FE3FB78 */  mr      r3, r31
/* 0D2418 800D79B8 83E1001C */  lwz     r31, 0x1c(r1)
/* 0D241C 800D79BC 83C10018 */  lwz     r30, 0x18(r1)
/* 0D2420 800D79C0 38210020 */  addi    r1, r1, 0x20
/* 0D2424 800D79C4 80010004 */  lwz     r0, 4(r1)
/* 0D2428 800D79C8 7C0803A6 */  mtlr    r0
/* 0D242C 800D79CC 4E800020 */  blr     


