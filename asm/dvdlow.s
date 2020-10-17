# dvdlow.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __DVDInitWA
/* 0B7D94 800BD334 7C0802A6 */  mflr    r0
/* 0B7D98 800BD338 3C608014 */  lis     r3, CommandList@ha
/* 0B7D9C 800BD33C 90010004 */  stw     r0, 4(r1)
/* 0B7DA0 800BD340 38000000 */  li      r0, 0
/* 0B7DA4 800BD344 38800000 */  li      r4, 0
/* 0B7DA8 800BD348 9421FFF8 */  stwu    r1, -8(r1)
/* 0B7DAC 800BD34C 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B7DB0 800BD350 3800FFFF */  li      r0, -1
/* 0B7DB4 800BD354 900321B8 */  stw     r0, CommandList@l(r3)
/* 0B7DB8 800BD358 38600000 */  li      r3, 0
/* 0B7DBC 800BD35C 48000DD9 */  bl      __DVDLowSetWAType
/* 0B7DC0 800BD360 4BFEADD1 */  bl      OSInitAlarm
/* 0B7DC4 800BD364 8001000C */  lwz     r0, 0xc(r1)
/* 0B7DC8 800BD368 38210008 */  addi    r1, r1, 8
/* 0B7DCC 800BD36C 7C0803A6 */  mtlr    r0
/* 0B7DD0 800BD370 4E800020 */  blr     

glabel __DVDInterruptHandler
/* 0B7DD4 800BD374 7C0802A6 */  mflr    r0
/* 0B7DD8 800BD378 3C608014 */  lis     r3, CommandList@ha
/* 0B7DDC 800BD37C 90010004 */  stw     r0, 4(r1)
/* 0B7DE0 800BD380 9421FD10 */  stwu    r1, -0x2f0(r1)
/* 0B7DE4 800BD384 BF6102DC */  stmw    r27, 0x2dc(r1)
/* 0B7DE8 800BD388 3B840000 */  addi    r28, r4, 0
/* 0B7DEC 800BD38C 3BC321B8 */  addi    r30, r3, CommandList@l
/* 0B7DF0 800BD390 3BA00000 */  li      r29, 0
/* 0B7DF4 800BD394 800D92F0 */  lwz     r0, LastCommandWasRead-_SDA_BASE_(r13)
/* 0B7DF8 800BD398 2C000000 */  cmpwi   r0, 0
/* 0B7DFC 800BD39C 41820040 */  beq     lbl_800BD3DC
/* 0B7E00 800BD3A0 4BFF099D */  bl      __OSGetSystemTime
/* 0B7E04 800BD3A4 908D92E4 */  stw     r4, (LastReadFinished + 4)-_SDA_BASE_(r13)
/* 0B7E08 800BD3A8 38000000 */  li      r0, 0
/* 0B7E0C 800BD3AC 906D92E0 */  stw     r3, LastReadFinished-_SDA_BASE_(r13)
/* 0B7E10 800BD3B0 900D8DC8 */  stw     r0, FirstRead-_SDA_BASE_(r13)
/* 0B7E14 800BD3B4 801E00C4 */  lwz     r0, 0xc4(r30)
/* 0B7E18 800BD3B8 901E00B8 */  stw     r0, 0xb8(r30)
/* 0B7E1C 800BD3BC 801E00C8 */  lwz     r0, 0xc8(r30)
/* 0B7E20 800BD3C0 901E00BC */  stw     r0, 0xbc(r30)
/* 0B7E24 800BD3C4 801E00CC */  lwz     r0, 0xcc(r30)
/* 0B7E28 800BD3C8 901E00C0 */  stw     r0, 0xc0(r30)
/* 0B7E2C 800BD3CC 800D92B0 */  lwz     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B7E30 800BD3D0 2C000001 */  cmpwi   r0, 1
/* 0B7E34 800BD3D4 40820008 */  bne     lbl_800BD3DC
/* 0B7E38 800BD3D8 63BD0008 */  ori     r29, r29, 8
lbl_800BD3DC:
/* 0B7E3C 800BD3DC 38000000 */  li      r0, 0
/* 0B7E40 800BD3E0 900D92F0 */  stw     r0, LastCommandWasRead-_SDA_BASE_(r13)
/* 0B7E44 800BD3E4 3C60CC00 */  lis     r3, 0xcc00
/* 0B7E48 800BD3E8 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B7E4C 800BD3EC 80036000 */  lwz     r0, 0x6000(r3)
/* 0B7E50 800BD3F0 701F002A */  andi.   r31, r0, 0x2a
/* 0B7E54 800BD3F4 70030054 */  andi.   r3, r0, 0x54
/* 0B7E58 800BD3F8 57E0083C */  slwi    r0, r31, 1
/* 0B7E5C 800BD3FC 7C7B0038 */  and     r27, r3, r0
/* 0B7E60 800BD400 57600673 */  rlwinm. r0, r27, 0, 0x19, 0x19
/* 0B7E64 800BD404 41820008 */  beq     lbl_800BD40C
/* 0B7E68 800BD408 63BD0008 */  ori     r29, r29, 8
lbl_800BD40C:
/* 0B7E6C 800BD40C 576006F7 */  rlwinm. r0, r27, 0, 0x1b, 0x1b
/* 0B7E70 800BD410 41820008 */  beq     lbl_800BD418
/* 0B7E74 800BD414 63BD0001 */  ori     r29, r29, 1
lbl_800BD418:
/* 0B7E78 800BD418 5760077B */  rlwinm. r0, r27, 0, 0x1d, 0x1d
/* 0B7E7C 800BD41C 41820008 */  beq     lbl_800BD424
/* 0B7E80 800BD420 63BD0002 */  ori     r29, r29, 2
lbl_800BD424:
/* 0B7E84 800BD424 281D0000 */  cmplwi  r29, 0
/* 0B7E88 800BD428 41820014 */  beq     lbl_800BD43C
/* 0B7E8C 800BD42C 38000000 */  li      r0, 0
/* 0B7E90 800BD430 900D92C8 */  stw     r0, ResetOccurred-_SDA_BASE_(r13)
/* 0B7E94 800BD434 387E0068 */  addi    r3, r30, 0x68
/* 0B7E98 800BD438 4BFEB019 */  bl      OSCancelAlarm
lbl_800BD43C:
/* 0B7E9C 800BD43C 7F60FB78 */  or      r0, r27, r31
/* 0B7EA0 800BD440 3FE0CC00 */  lis     r31, 0xcc00
/* 0B7EA4 800BD444 901F6000 */  stw     r0, 0x6000(r31)
/* 0B7EA8 800BD448 800D92C8 */  lwz     r0, ResetOccurred-_SDA_BASE_(r13)
/* 0B7EAC 800BD44C 28000000 */  cmplwi  r0, 0
/* 0B7EB0 800BD450 418200A0 */  beq     lbl_800BD4F0
/* 0B7EB4 800BD454 4BFF08E9 */  bl      __OSGetSystemTime
/* 0B7EB8 800BD458 3CA08000 */  lis     r5, 0x8000
/* 0B7EBC 800BD45C 80ED92C0 */  lwz     r7, LastResetEnd-_SDA_BASE_(r13)
/* 0B7EC0 800BD460 80C500F8 */  lwz     r6, 0xf8(r5)
/* 0B7EC4 800BD464 3CA01062 */  lis     r5, 0x1062
/* 0B7EC8 800BD468 38A54DD3 */  addi    r5, r5, 0x4dd3
/* 0B7ECC 800BD46C 810D92C4 */  lwz     r8, (LastResetEnd + 4)-_SDA_BASE_(r13)
/* 0B7ED0 800BD470 54C6F0BE */  srwi    r6, r6, 2
/* 0B7ED4 800BD474 7CA53016 */  mulhwu  r5, r5, r6
/* 0B7ED8 800BD478 54A5D1BE */  srwi    r5, r5, 6
/* 0B7EDC 800BD47C 1CA500C8 */  mulli   r5, r5, 0xc8
/* 0B7EE0 800BD480 7CC82010 */  subfc   r6, r8, r4
/* 0B7EE4 800BD484 7C671910 */  subfe   r3, r7, r3
/* 0B7EE8 800BD488 38000000 */  li      r0, 0
/* 0B7EEC 800BD48C 6C648000 */  xoris   r4, r3, 0x8000
/* 0B7EF0 800BD490 6C038000 */  xoris   r3, r0, 0x8000
/* 0B7EF4 800BD494 7C053010 */  subfc   r0, r5, r6
/* 0B7EF8 800BD498 7C632110 */  subfe   r3, r3, r4
/* 0B7EFC 800BD49C 7C642110 */  subfe   r3, r4, r4
/* 0B7F00 800BD4A0 7C6300D1 */  neg.    r3, r3
/* 0B7F04 800BD4A4 4182004C */  beq     lbl_800BD4F0
/* 0B7F08 800BD4A8 3B7F6000 */  addi    r27, r31, 0x6000
/* 0B7F0C 800BD4AC 841B0004 */  lwzu    r0, 4(r27)
/* 0B7F10 800BD4B0 5403077A */  rlwinm  r3, r0, 0, 0x1d, 0x1d
/* 0B7F14 800BD4B4 54000F7A */  rlwinm  r0, r0, 1, 0x1d, 0x1d
/* 0B7F18 800BD4B8 7C600038 */  and     r0, r3, r0
/* 0B7F1C 800BD4BC 5400077B */  rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0B7F20 800BD4C0 41820024 */  beq     lbl_800BD4E4
/* 0B7F24 800BD4C4 818D92BC */  lwz     r12, ResetCoverCallback-_SDA_BASE_(r13)
/* 0B7F28 800BD4C8 280C0000 */  cmplwi  r12, 0
/* 0B7F2C 800BD4CC 41820010 */  beq     lbl_800BD4DC
/* 0B7F30 800BD4D0 7D8803A6 */  mtlr    r12
/* 0B7F34 800BD4D4 38600004 */  li      r3, 4
/* 0B7F38 800BD4D8 4E800021 */  blrl    
lbl_800BD4DC:
/* 0B7F3C 800BD4DC 38000000 */  li      r0, 0
/* 0B7F40 800BD4E0 900D92BC */  stw     r0, ResetCoverCallback-_SDA_BASE_(r13)
lbl_800BD4E4:
/* 0B7F44 800BD4E4 801B0000 */  lwz     r0, 0(r27)
/* 0B7F48 800BD4E8 901B0000 */  stw     r0, 0(r27)
/* 0B7F4C 800BD4EC 48000058 */  b       lbl_800BD544
lbl_800BD4F0:
/* 0B7F50 800BD4F0 800D92CC */  lwz     r0, WaitingCoverClose-_SDA_BASE_(r13)
/* 0B7F54 800BD4F4 2C000000 */  cmpwi   r0, 0
/* 0B7F58 800BD4F8 41820040 */  beq     lbl_800BD538
/* 0B7F5C 800BD4FC 3C60CC00 */  lis     r3, 0xcc00
/* 0B7F60 800BD500 38A36000 */  addi    r5, r3, 0x6000
/* 0B7F64 800BD504 84050004 */  lwzu    r0, 4(r5)
/* 0B7F68 800BD508 540407BC */  rlwinm  r4, r0, 0, 0x1e, 0x1e
/* 0B7F6C 800BD50C 5403077A */  rlwinm  r3, r0, 0, 0x1d, 0x1d
/* 0B7F70 800BD510 54000F7A */  rlwinm  r0, r0, 1, 0x1d, 0x1d
/* 0B7F74 800BD514 7C630038 */  and     r3, r3, r0
/* 0B7F78 800BD518 5460077B */  rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0B7F7C 800BD51C 41820008 */  beq     lbl_800BD524
/* 0B7F80 800BD520 63BD0004 */  ori     r29, r29, 4
lbl_800BD524:
/* 0B7F84 800BD524 7C602378 */  or      r0, r3, r4
/* 0B7F88 800BD528 90050000 */  stw     r0, 0(r5)
/* 0B7F8C 800BD52C 38000000 */  li      r0, 0
/* 0B7F90 800BD530 900D92CC */  stw     r0, WaitingCoverClose-_SDA_BASE_(r13)
/* 0B7F94 800BD534 48000010 */  b       lbl_800BD544
lbl_800BD538:
/* 0B7F98 800BD538 3C60CC00 */  lis     r3, 0xcc00
/* 0B7F9C 800BD53C 38000000 */  li      r0, 0
/* 0B7FA0 800BD540 90036004 */  stw     r0, 0x6004(r3)
lbl_800BD544:
/* 0B7FA4 800BD544 57A00739 */  rlwinm. r0, r29, 0, 0x1c, 0x1c
/* 0B7FA8 800BD548 41820014 */  beq     lbl_800BD55C
/* 0B7FAC 800BD54C 800D92D0 */  lwz     r0, Breaking-_SDA_BASE_(r13)
/* 0B7FB0 800BD550 2C000000 */  cmpwi   r0, 0
/* 0B7FB4 800BD554 40820008 */  bne     lbl_800BD55C
/* 0B7FB8 800BD558 57BD0776 */  rlwinm  r29, r29, 0, 0x1d, 0x1b
lbl_800BD55C:
/* 0B7FBC 800BD55C 57A007FF */  clrlwi. r0, r29, 0x1f
/* 0B7FC0 800BD560 41820080 */  beq     lbl_800BD5E0
/* 0B7FC4 800BD564 800D92F4 */  lwz     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B7FC8 800BD568 1C000014 */  mulli   r0, r0, 0x14
/* 0B7FCC 800BD56C 7C7E002E */  lwzx    r3, r30, r0
/* 0B7FD0 800BD570 2C030001 */  cmpwi   r3, 1
/* 0B7FD4 800BD574 40820030 */  bne     lbl_800BD5A4
/* 0B7FD8 800BD578 806D92F4 */  lwz     r3, NextCommandNumber-_SDA_BASE_(r13)
/* 0B7FDC 800BD57C 7CDE0214 */  add     r6, r30, r0
/* 0B7FE0 800BD580 38030001 */  addi    r0, r3, 1
/* 0B7FE4 800BD584 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B7FE8 800BD588 80660004 */  lwz     r3, 4(r6)
/* 0B7FEC 800BD58C 80860008 */  lwz     r4, 8(r6)
/* 0B7FF0 800BD590 80A6000C */  lwz     r5, 0xc(r6)
/* 0B7FF4 800BD594 80C60010 */  lwz     r6, 0x10(r6)
/* 0B7FF8 800BD598 480001B1 */  bl      Read
/* 0B7FFC 800BD59C 38000001 */  li      r0, 1
/* 0B8000 800BD5A0 48000034 */  b       lbl_800BD5D4
lbl_800BD5A4:
/* 0B8004 800BD5A4 2C030002 */  cmpwi   r3, 2
/* 0B8008 800BD5A8 40820028 */  bne     lbl_800BD5D0
/* 0B800C 800BD5AC 806D92F4 */  lwz     r3, NextCommandNumber-_SDA_BASE_(r13)
/* 0B8010 800BD5B0 7C9E0214 */  add     r4, r30, r0
/* 0B8014 800BD5B4 38030001 */  addi    r0, r3, 1
/* 0B8018 800BD5B8 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B801C 800BD5BC 8064000C */  lwz     r3, 0xc(r4)
/* 0B8020 800BD5C0 80840010 */  lwz     r4, 0x10(r4)
/* 0B8024 800BD5C4 480005AD */  bl      DVDLowSeek
/* 0B8028 800BD5C8 38000001 */  li      r0, 1
/* 0B802C 800BD5CC 48000008 */  b       lbl_800BD5D4
lbl_800BD5D0:
/* 0B8030 800BD5D0 38000000 */  li      r0, 0
lbl_800BD5D4:
/* 0B8034 800BD5D4 2C000000 */  cmpwi   r0, 0
/* 0B8038 800BD5D8 41820018 */  beq     lbl_800BD5F0
/* 0B803C 800BD5DC 48000064 */  b       lbl_800BD640
lbl_800BD5E0:
/* 0B8040 800BD5E0 3800FFFF */  li      r0, -1
/* 0B8044 800BD5E4 901E0000 */  stw     r0, 0(r30)
/* 0B8048 800BD5E8 38000000 */  li      r0, 0
/* 0B804C 800BD5EC 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
lbl_800BD5F0:
/* 0B8050 800BD5F0 38610010 */  addi    r3, r1, 0x10
/* 0B8054 800BD5F4 4BFEC625 */  bl      OSClearContext
/* 0B8058 800BD5F8 38610010 */  addi    r3, r1, 0x10
/* 0B805C 800BD5FC 4BFEC455 */  bl      OSSetCurrentContext
/* 0B8060 800BD600 281D0000 */  cmplwi  r29, 0
/* 0B8064 800BD604 4182002C */  beq     lbl_800BD630
/* 0B8068 800BD608 818D92B8 */  lwz     r12, Callback-_SDA_BASE_(r13)
/* 0B806C 800BD60C 38000000 */  li      r0, 0
/* 0B8070 800BD610 280C0000 */  cmplwi  r12, 0
/* 0B8074 800BD614 900D92B8 */  stw     r0, Callback-_SDA_BASE_(r13)
/* 0B8078 800BD618 41820010 */  beq     lbl_800BD628
/* 0B807C 800BD61C 7D8803A6 */  mtlr    r12
/* 0B8080 800BD620 387D0000 */  addi    r3, r29, 0
/* 0B8084 800BD624 4E800021 */  blrl    
lbl_800BD628:
/* 0B8088 800BD628 38000000 */  li      r0, 0
/* 0B808C 800BD62C 900D92D0 */  stw     r0, Breaking-_SDA_BASE_(r13)
lbl_800BD630:
/* 0B8090 800BD630 38610010 */  addi    r3, r1, 0x10
/* 0B8094 800BD634 4BFEC5E5 */  bl      OSClearContext
/* 0B8098 800BD638 7F83E378 */  mr      r3, r28
/* 0B809C 800BD63C 4BFEC415 */  bl      OSSetCurrentContext
lbl_800BD640:
/* 0B80A0 800BD640 BB6102DC */  lmw     r27, 0x2dc(r1)
/* 0B80A4 800BD644 800102F4 */  lwz     r0, 0x2f4(r1)
/* 0B80A8 800BD648 382102F0 */  addi    r1, r1, 0x2f0
/* 0B80AC 800BD64C 7C0803A6 */  mtlr    r0
/* 0B80B0 800BD650 4E800020 */  blr     

AlarmHandler:
/* 0B80B4 800BD654 7C0802A6 */  mflr    r0
/* 0B80B8 800BD658 3C608014 */  lis     r3, CommandList@ha
/* 0B80BC 800BD65C 90010004 */  stw     r0, 4(r1)
/* 0B80C0 800BD660 388321B8 */  addi    r4, r3, CommandList@l
/* 0B80C4 800BD664 9421FFF8 */  stwu    r1, -8(r1)
/* 0B80C8 800BD668 800D92F4 */  lwz     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B80CC 800BD66C 1C000014 */  mulli   r0, r0, 0x14
/* 0B80D0 800BD670 7C64002E */  lwzx    r3, r4, r0
/* 0B80D4 800BD674 2C030001 */  cmpwi   r3, 1
/* 0B80D8 800BD678 4082002C */  bne     lbl_800BD6A4
/* 0B80DC 800BD67C 806D92F4 */  lwz     r3, NextCommandNumber-_SDA_BASE_(r13)
/* 0B80E0 800BD680 7CC40214 */  add     r6, r4, r0
/* 0B80E4 800BD684 38030001 */  addi    r0, r3, 1
/* 0B80E8 800BD688 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B80EC 800BD68C 80660004 */  lwz     r3, 4(r6)
/* 0B80F0 800BD690 80860008 */  lwz     r4, 8(r6)
/* 0B80F4 800BD694 80A6000C */  lwz     r5, 0xc(r6)
/* 0B80F8 800BD698 80C60010 */  lwz     r6, 0x10(r6)
/* 0B80FC 800BD69C 480000AD */  bl      Read
/* 0B8100 800BD6A0 48000028 */  b       lbl_800BD6C8
lbl_800BD6A4:
/* 0B8104 800BD6A4 2C030002 */  cmpwi   r3, 2
/* 0B8108 800BD6A8 40820020 */  bne     lbl_800BD6C8
/* 0B810C 800BD6AC 806D92F4 */  lwz     r3, NextCommandNumber-_SDA_BASE_(r13)
/* 0B8110 800BD6B0 7C840214 */  add     r4, r4, r0
/* 0B8114 800BD6B4 38030001 */  addi    r0, r3, 1
/* 0B8118 800BD6B8 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B811C 800BD6BC 8064000C */  lwz     r3, 0xc(r4)
/* 0B8120 800BD6C0 80840010 */  lwz     r4, 0x10(r4)
/* 0B8124 800BD6C4 480004AD */  bl      DVDLowSeek
lbl_800BD6C8:
/* 0B8128 800BD6C8 8001000C */  lwz     r0, 0xc(r1)
/* 0B812C 800BD6CC 38210008 */  addi    r1, r1, 8
/* 0B8130 800BD6D0 7C0803A6 */  mtlr    r0
/* 0B8134 800BD6D4 4E800020 */  blr     

AlarmHandlerForTimeout:
/* 0B8138 800BD6D8 7C0802A6 */  mflr    r0
/* 0B813C 800BD6DC 38600400 */  li      r3, 0x400
/* 0B8140 800BD6E0 90010004 */  stw     r0, 4(r1)
/* 0B8144 800BD6E4 9421FD20 */  stwu    r1, -0x2e0(r1)
/* 0B8148 800BD6E8 93E102DC */  stw     r31, 0x2dc(r1)
/* 0B814C 800BD6EC 3BE40000 */  addi    r31, r4, 0
/* 0B8150 800BD6F0 4BFED449 */  bl      __OSMaskInterrupts
/* 0B8154 800BD6F4 38610010 */  addi    r3, r1, 0x10
/* 0B8158 800BD6F8 4BFEC521 */  bl      OSClearContext
/* 0B815C 800BD6FC 38610010 */  addi    r3, r1, 0x10
/* 0B8160 800BD700 4BFEC351 */  bl      OSSetCurrentContext
/* 0B8164 800BD704 818D92B8 */  lwz     r12, Callback-_SDA_BASE_(r13)
/* 0B8168 800BD708 38000000 */  li      r0, 0
/* 0B816C 800BD70C 280C0000 */  cmplwi  r12, 0
/* 0B8170 800BD710 900D92B8 */  stw     r0, Callback-_SDA_BASE_(r13)
/* 0B8174 800BD714 41820010 */  beq     lbl_800BD724
/* 0B8178 800BD718 7D8803A6 */  mtlr    r12
/* 0B817C 800BD71C 38600010 */  li      r3, 0x10
/* 0B8180 800BD720 4E800021 */  blrl    
lbl_800BD724:
/* 0B8184 800BD724 38610010 */  addi    r3, r1, 0x10
/* 0B8188 800BD728 4BFEC4F1 */  bl      OSClearContext
/* 0B818C 800BD72C 7FE3FB78 */  mr      r3, r31
/* 0B8190 800BD730 4BFEC321 */  bl      OSSetCurrentContext
/* 0B8194 800BD734 800102E4 */  lwz     r0, 0x2e4(r1)
/* 0B8198 800BD738 83E102DC */  lwz     r31, 0x2dc(r1)
/* 0B819C 800BD73C 382102E0 */  addi    r1, r1, 0x2e0
/* 0B81A0 800BD740 7C0803A6 */  mtlr    r0
/* 0B81A4 800BD744 4E800020 */  blr     

Read:
/* 0B81A8 800BD748 7C0802A6 */  mflr    r0
/* 0B81AC 800BD74C 90010004 */  stw     r0, 4(r1)
/* 0B81B0 800BD750 38000000 */  li      r0, 0
/* 0B81B4 800BD754 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0B81B8 800BD758 93E10024 */  stw     r31, 0x24(r1)
/* 0B81BC 800BD75C 93C10020 */  stw     r30, 0x20(r1)
/* 0B81C0 800BD760 3BC50000 */  addi    r30, r5, 0
/* 0B81C4 800BD764 93A1001C */  stw     r29, 0x1c(r1)
/* 0B81C8 800BD768 3BA40000 */  addi    r29, r4, 0
/* 0B81CC 800BD76C 93810018 */  stw     r28, 0x18(r1)
/* 0B81D0 800BD770 3B830000 */  addi    r28, r3, 0
/* 0B81D4 800BD774 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B81D8 800BD778 38000001 */  li      r0, 1
/* 0B81DC 800BD77C 90CD92B8 */  stw     r6, Callback-_SDA_BASE_(r13)
/* 0B81E0 800BD780 3CC08014 */  lis     r6, CommandList@ha
/* 0B81E4 800BD784 3BE621B8 */  addi    r31, r6, CommandList@l
/* 0B81E8 800BD788 900D92F0 */  stw     r0, LastCommandWasRead-_SDA_BASE_(r13)
/* 0B81EC 800BD78C 4BFF05B1 */  bl      __OSGetSystemTime
/* 0B81F0 800BD790 908D92EC */  stw     r4, (LastReadIssued + 4)-_SDA_BASE_(r13)
/* 0B81F4 800BD794 3C80CC00 */  lis     r4, 0xcc00
/* 0B81F8 800BD798 3C0000A0 */  lis     r0, 0xa0
/* 0B81FC 800BD79C 906D92E8 */  stw     r3, LastReadIssued-_SDA_BASE_(r13)
/* 0B8200 800BD7A0 38846000 */  addi    r4, r4, 0x6000
/* 0B8204 800BD7A4 3C60A800 */  lis     r3, 0xa800
/* 0B8208 800BD7A8 90640008 */  stw     r3, 8(r4)
/* 0B820C 800BD7AC 57C3F0BE */  srwi    r3, r30, 2
/* 0B8210 800BD7B0 7C1D0040 */  cmplw   r29, r0
/* 0B8214 800BD7B4 9064000C */  stw     r3, 0xc(r4)
/* 0B8218 800BD7B8 38000003 */  li      r0, 3
/* 0B821C 800BD7BC 93A40010 */  stw     r29, 0x10(r4)
/* 0B8220 800BD7C0 93840014 */  stw     r28, 0x14(r4)
/* 0B8224 800BD7C4 93A40018 */  stw     r29, 0x18(r4)
/* 0B8228 800BD7C8 93AD92B4 */  stw     r29, LastLength-_SDA_BASE_(r13)
/* 0B822C 800BD7CC 9004001C */  stw     r0, 0x1c(r4)
/* 0B8230 800BD7D0 40810038 */  ble     lbl_800BD808
/* 0B8234 800BD7D4 3C608000 */  lis     r3, 0x8000
/* 0B8238 800BD7D8 800300F8 */  lwz     r0, 0xf8(r3)
/* 0B823C 800BD7DC 387F0068 */  addi    r3, r31, 0x68
/* 0B8240 800BD7E0 5400F0BE */  srwi    r0, r0, 2
/* 0B8244 800BD7E4 1FC00014 */  mulli   r30, r0, 0x14
/* 0B8248 800BD7E8 4BFEA9A1 */  bl      OSCreateAlarm
/* 0B824C 800BD7EC 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8250 800BD7F0 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8254 800BD7F4 38DE0000 */  addi    r6, r30, 0
/* 0B8258 800BD7F8 387F0068 */  addi    r3, r31, 0x68
/* 0B825C 800BD7FC 38A00000 */  li      r5, 0
/* 0B8260 800BD800 4BFEABE9 */  bl      OSSetAlarm
/* 0B8264 800BD804 48000034 */  b       lbl_800BD838
lbl_800BD808:
/* 0B8268 800BD808 3C608000 */  lis     r3, 0x8000
/* 0B826C 800BD80C 800300F8 */  lwz     r0, 0xf8(r3)
/* 0B8270 800BD810 387F0068 */  addi    r3, r31, 0x68
/* 0B8274 800BD814 5400F0BE */  srwi    r0, r0, 2
/* 0B8278 800BD818 1FC0000A */  mulli   r30, r0, 0xa
/* 0B827C 800BD81C 4BFEA96D */  bl      OSCreateAlarm
/* 0B8280 800BD820 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8284 800BD824 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8288 800BD828 38DE0000 */  addi    r6, r30, 0
/* 0B828C 800BD82C 387F0068 */  addi    r3, r31, 0x68
/* 0B8290 800BD830 38A00000 */  li      r5, 0
/* 0B8294 800BD834 4BFEABB5 */  bl      OSSetAlarm
lbl_800BD838:
/* 0B8298 800BD838 8001002C */  lwz     r0, 0x2c(r1)
/* 0B829C 800BD83C 83E10024 */  lwz     r31, 0x24(r1)
/* 0B82A0 800BD840 83C10020 */  lwz     r30, 0x20(r1)
/* 0B82A4 800BD844 83A1001C */  lwz     r29, 0x1c(r1)
/* 0B82A8 800BD848 83810018 */  lwz     r28, 0x18(r1)
/* 0B82AC 800BD84C 38210028 */  addi    r1, r1, 0x28
/* 0B82B0 800BD850 7C0803A6 */  mtlr    r0
/* 0B82B4 800BD854 4E800020 */  blr     

SeekTwiceBeforeRead:
/* 0B82B8 800BD858 7C0802A6 */  mflr    r0
/* 0B82BC 800BD85C 3CE08014 */  lis     r7, CommandList@ha
/* 0B82C0 800BD860 90010004 */  stw     r0, 4(r1)
/* 0B82C4 800BD864 54A80021 */  rlwinm. r8, r5, 0, 0, 0x10
/* 0B82C8 800BD868 392721B8 */  addi    r9, r7, CommandList@l
/* 0B82CC 800BD86C 9421FFF8 */  stwu    r1, -8(r1)
/* 0B82D0 800BD870 4082000C */  bne     lbl_800BD87C
/* 0B82D4 800BD874 39400000 */  li      r10, 0
/* 0B82D8 800BD878 4800000C */  b       lbl_800BD884
lbl_800BD87C:
/* 0B82DC 800BD87C 800D92D8 */  lwz     r0, WorkAroundSeekLocation-_SDA_BASE_(r13)
/* 0B82E0 800BD880 7D480214 */  add     r10, r8, r0
lbl_800BD884:
/* 0B82E4 800BD884 38000002 */  li      r0, 2
/* 0B82E8 800BD888 90090000 */  stw     r0, 0(r9)
/* 0B82EC 800BD88C 39000001 */  li      r8, 1
/* 0B82F0 800BD890 38E0FFFF */  li      r7, -1
/* 0B82F4 800BD894 9149000C */  stw     r10, 0xc(r9)
/* 0B82F8 800BD898 38000000 */  li      r0, 0
/* 0B82FC 800BD89C 90C90010 */  stw     r6, 0x10(r9)
/* 0B8300 800BD8A0 91090014 */  stw     r8, 0x14(r9)
/* 0B8304 800BD8A4 90690018 */  stw     r3, 0x18(r9)
/* 0B8308 800BD8A8 7D435378 */  mr      r3, r10
/* 0B830C 800BD8AC 9089001C */  stw     r4, 0x1c(r9)
/* 0B8310 800BD8B0 7CC43378 */  mr      r4, r6
/* 0B8314 800BD8B4 90A90020 */  stw     r5, 0x20(r9)
/* 0B8318 800BD8B8 90C90024 */  stw     r6, 0x24(r9)
/* 0B831C 800BD8BC 90E90028 */  stw     r7, 0x28(r9)
/* 0B8320 800BD8C0 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B8324 800BD8C4 480002AD */  bl      DVDLowSeek
/* 0B8328 800BD8C8 8001000C */  lwz     r0, 0xc(r1)
/* 0B832C 800BD8CC 38210008 */  addi    r1, r1, 8
/* 0B8330 800BD8D0 7C0803A6 */  mtlr    r0
/* 0B8334 800BD8D4 4E800020 */  blr     

glabel DVDLowRead
/* 0B8338 800BD8D8 7C0802A6 */  mflr    r0
/* 0B833C 800BD8DC 3CE0CC00 */  lis     r7, 0xcc00
/* 0B8340 800BD8E0 90010004 */  stw     r0, 4(r1)
/* 0B8344 800BD8E4 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0B8348 800BD8E8 BEC10018 */  stmw    r22, 0x18(r1)
/* 0B834C 800BD8EC 3B240000 */  addi    r25, r4, 0
/* 0B8350 800BD8F0 38876000 */  addi    r4, r7, 0x6000
/* 0B8354 800BD8F4 3CE08014 */  lis     r7, CommandList@ha
/* 0B8358 800BD8F8 3BE721B8 */  addi    r31, r7, CommandList@l
/* 0B835C 800BD8FC 3B030000 */  addi    r24, r3, 0
/* 0B8360 800BD900 3B450000 */  addi    r26, r5, 0
/* 0B8364 800BD904 3BDF00CC */  addi    r30, r31, 0xcc
/* 0B8368 800BD908 7CDB3378 */  mr      r27, r6
/* 0B836C 800BD90C 93240018 */  stw     r25, 0x18(r4)
/* 0B8370 800BD910 931F00C4 */  stw     r24, 0xc4(r31)
/* 0B8374 800BD914 933F00C8 */  stw     r25, 0xc8(r31)
/* 0B8378 800BD918 935F00CC */  stw     r26, 0xcc(r31)
/* 0B837C 800BD91C 800D92D4 */  lwz     r0, WorkAroundType-_SDA_BASE_(r13)
/* 0B8380 800BD920 28000000 */  cmplwi  r0, 0
/* 0B8384 800BD924 4082002C */  bne     lbl_800BD950
/* 0B8388 800BD928 3800FFFF */  li      r0, -1
/* 0B838C 800BD92C 901F0000 */  stw     r0, 0(r31)
/* 0B8390 800BD930 38000000 */  li      r0, 0
/* 0B8394 800BD934 38780000 */  addi    r3, r24, 0
/* 0B8398 800BD938 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B839C 800BD93C 38990000 */  addi    r4, r25, 0
/* 0B83A0 800BD940 38BA0000 */  addi    r5, r26, 0
/* 0B83A4 800BD944 38DB0000 */  addi    r6, r27, 0
/* 0B83A8 800BD948 4BFFFE01 */  bl      Read
/* 0B83AC 800BD94C 4800020C */  b       lbl_800BDB58
lbl_800BD950:
/* 0B83B0 800BD950 800D92D4 */  lwz     r0, WorkAroundType-_SDA_BASE_(r13)
/* 0B83B4 800BD954 28000001 */  cmplwi  r0, 1
/* 0B83B8 800BD958 40820200 */  bne     lbl_800BDB58
/* 0B83BC 800BD95C 800D8DC8 */  lwz     r0, FirstRead-_SDA_BASE_(r13)
/* 0B83C0 800BD960 2C000000 */  cmpwi   r0, 0
/* 0B83C4 800BD964 4182001C */  beq     lbl_800BD980
/* 0B83C8 800BD968 38780000 */  addi    r3, r24, 0
/* 0B83CC 800BD96C 38990000 */  addi    r4, r25, 0
/* 0B83D0 800BD970 38BA0000 */  addi    r5, r26, 0
/* 0B83D4 800BD974 38DB0000 */  addi    r6, r27, 0
/* 0B83D8 800BD978 4BFFFEE1 */  bl      SeekTwiceBeforeRead
/* 0B83DC 800BD97C 480001DC */  b       lbl_800BDB58
lbl_800BD980:
/* 0B83E0 800BD980 3BBF00BC */  addi    r29, r31, 0xbc
/* 0B83E4 800BD984 801E0000 */  lwz     r0, 0(r30)
/* 0B83E8 800BD988 3B9F00C0 */  addi    r28, r31, 0xc0
/* 0B83EC 800BD98C 807F00BC */  lwz     r3, 0xbc(r31)
/* 0B83F0 800BD990 809F00C0 */  lwz     r4, 0xc0(r31)
/* 0B83F4 800BD994 54178BFE */  srwi    r23, r0, 0xf
/* 0B83F8 800BD998 3803FFFF */  addi    r0, r3, -1
/* 0B83FC 800BD99C 7C040214 */  add     r0, r4, r0
/* 0B8400 800BD9A0 54168BFE */  srwi    r22, r0, 0xf
/* 0B8404 800BD9A4 48003C39 */  bl      DVDGetCurrentDiskID
/* 0B8408 800BD9A8 88030008 */  lbz     r0, 8(r3)
/* 0B840C 800BD9AC 28000000 */  cmplwi  r0, 0
/* 0B8410 800BD9B0 4182000C */  beq     lbl_800BD9BC
/* 0B8414 800BD9B4 38000001 */  li      r0, 1
/* 0B8418 800BD9B8 48000008 */  b       lbl_800BD9C0
lbl_800BD9BC:
/* 0B841C 800BD9BC 38000000 */  li      r0, 0
lbl_800BD9C0:
/* 0B8420 800BD9C0 2C000000 */  cmpwi   r0, 0
/* 0B8424 800BD9C4 4182000C */  beq     lbl_800BD9D0
/* 0B8428 800BD9C8 38600005 */  li      r3, 5
/* 0B842C 800BD9CC 48000008 */  b       lbl_800BD9D4
lbl_800BD9D0:
/* 0B8430 800BD9D0 3860000F */  li      r3, 0xf
lbl_800BD9D4:
/* 0B8434 800BD9D4 3816FFFE */  addi    r0, r22, -2
/* 0B8438 800BD9D8 7C170040 */  cmplw   r23, r0
/* 0B843C 800BD9DC 41810014 */  bgt     lbl_800BD9F0
/* 0B8440 800BD9E0 38030003 */  addi    r0, r3, 3
/* 0B8444 800BD9E4 7C160214 */  add     r0, r22, r0
/* 0B8448 800BD9E8 7C170040 */  cmplw   r23, r0
/* 0B844C 800BD9EC 4080000C */  bge     lbl_800BD9F8
lbl_800BD9F0:
/* 0B8450 800BD9F0 38000001 */  li      r0, 1
/* 0B8454 800BD9F4 48000008 */  b       lbl_800BD9FC
lbl_800BD9F8:
/* 0B8458 800BD9F8 38000000 */  li      r0, 0
lbl_800BD9FC:
/* 0B845C 800BD9FC 2C000000 */  cmpwi   r0, 0
/* 0B8460 800BDA00 4082002C */  bne     lbl_800BDA2C
/* 0B8464 800BDA04 3800FFFF */  li      r0, -1
/* 0B8468 800BDA08 901F0000 */  stw     r0, 0(r31)
/* 0B846C 800BDA0C 38000000 */  li      r0, 0
/* 0B8470 800BDA10 38780000 */  addi    r3, r24, 0
/* 0B8474 800BDA14 900D92F4 */  stw     r0, NextCommandNumber-_SDA_BASE_(r13)
/* 0B8478 800BDA18 38990000 */  addi    r4, r25, 0
/* 0B847C 800BDA1C 38BA0000 */  addi    r5, r26, 0
/* 0B8480 800BDA20 38DB0000 */  addi    r6, r27, 0
/* 0B8484 800BDA24 4BFFFD25 */  bl      Read
/* 0B8488 800BDA28 48000130 */  b       lbl_800BDB58
lbl_800BDA2C:
/* 0B848C 800BDA2C 807D0000 */  lwz     r3, 0(r29)
/* 0B8490 800BDA30 809C0000 */  lwz     r4, 0(r28)
/* 0B8494 800BDA34 3863FFFF */  addi    r3, r3, -1
/* 0B8498 800BDA38 801E0000 */  lwz     r0, 0(r30)
/* 0B849C 800BDA3C 7C641A14 */  add     r3, r4, r3
/* 0B84A0 800BDA40 54638BFE */  srwi    r3, r3, 0xf
/* 0B84A4 800BDA44 54048BFE */  srwi    r4, r0, 0xf
/* 0B84A8 800BDA48 7C032040 */  cmplw   r3, r4
/* 0B84AC 800BDA4C 41820010 */  beq     lbl_800BDA5C
/* 0B84B0 800BDA50 38030001 */  addi    r0, r3, 1
/* 0B84B4 800BDA54 7C002040 */  cmplw   r0, r4
/* 0B84B8 800BDA58 408200EC */  bne     lbl_800BDB44
lbl_800BDA5C:
/* 0B84BC 800BDA5C 4BFF02E1 */  bl      __OSGetSystemTime
/* 0B84C0 800BDA60 3CA08000 */  lis     r5, 0x8000
/* 0B84C4 800BDA64 810D92E0 */  lwz     r8, LastReadFinished-_SDA_BASE_(r13)
/* 0B84C8 800BDA68 800500F8 */  lwz     r0, 0xf8(r5)
/* 0B84CC 800BDA6C 3CA01062 */  lis     r5, 0x1062
/* 0B84D0 800BDA70 812D92E4 */  lwz     r9, (LastReadFinished + 4)-_SDA_BASE_(r13)
/* 0B84D4 800BDA74 38C00000 */  li      r6, 0
/* 0B84D8 800BDA78 5407F0BE */  srwi    r7, r0, 2
/* 0B84DC 800BDA7C 38054DD3 */  addi    r0, r5, 0x4dd3
/* 0B84E0 800BDA80 7C003816 */  mulhwu  r0, r0, r7
/* 0B84E4 800BDA84 5400D1BE */  srwi    r0, r0, 6
/* 0B84E8 800BDA88 7D292010 */  subfc   r9, r9, r4
/* 0B84EC 800BDA8C 7D081910 */  subfe   r8, r8, r3
/* 0B84F0 800BDA90 1CA00005 */  mulli   r5, r0, 5
/* 0B84F4 800BDA94 6CC48000 */  xoris   r4, r6, 0x8000
/* 0B84F8 800BDA98 6D038000 */  xoris   r3, r8, 0x8000
/* 0B84FC 800BDA9C 7C092810 */  subfc   r0, r9, r5
/* 0B8500 800BDAA0 7C632110 */  subfe   r3, r3, r4
/* 0B8504 800BDAA4 7C642110 */  subfe   r3, r4, r4
/* 0B8508 800BDAA8 7C6300D1 */  neg.    r3, r3
/* 0B850C 800BDAAC 41820028 */  beq     lbl_800BDAD4
/* 0B8510 800BDAB0 3800FFFF */  li      r0, -1
/* 0B8514 800BDAB4 901F0000 */  stw     r0, 0(r31)
/* 0B8518 800BDAB8 38780000 */  addi    r3, r24, 0
/* 0B851C 800BDABC 38990000 */  addi    r4, r25, 0
/* 0B8520 800BDAC0 90CD92F4 */  stw     r6, NextCommandNumber-_SDA_BASE_(r13)
/* 0B8524 800BDAC4 38BA0000 */  addi    r5, r26, 0
/* 0B8528 800BDAC8 38DB0000 */  addi    r6, r27, 0
/* 0B852C 800BDACC 4BFFFC7D */  bl      Read
/* 0B8530 800BDAD0 48000088 */  b       lbl_800BDB58
lbl_800BDAD4:
/* 0B8534 800BDAD4 38000001 */  li      r0, 1
/* 0B8538 800BDAD8 901F0000 */  stw     r0, 0(r31)
/* 0B853C 800BDADC 3C60431C */  lis     r3, 0x431c
/* 0B8540 800BDAE0 3803DE83 */  addi    r0, r3, -8573
/* 0B8544 800BDAE4 931F0004 */  stw     r24, 4(r31)
/* 0B8548 800BDAE8 7C003816 */  mulhwu  r0, r0, r7
/* 0B854C 800BDAEC 933F0008 */  stw     r25, 8(r31)
/* 0B8550 800BDAF0 935F000C */  stw     r26, 0xc(r31)
/* 0B8554 800BDAF4 54008BFE */  srwi    r0, r0, 0xf
/* 0B8558 800BDAF8 1C6001F4 */  mulli   r3, r0, 0x1f4
/* 0B855C 800BDAFC 937F0010 */  stw     r27, 0x10(r31)
/* 0B8560 800BDB00 3800FFFF */  li      r0, -1
/* 0B8564 800BDB04 901F0014 */  stw     r0, 0x14(r31)
/* 0B8568 800BDB08 7CA92810 */  subfc   r5, r9, r5
/* 0B856C 800BDB0C 7C883110 */  subfe   r4, r8, r6
/* 0B8570 800BDB10 5460E8FE */  srwi    r0, r3, 3
/* 0B8574 800BDB14 90CD92F4 */  stw     r6, NextCommandNumber-_SDA_BASE_(r13)
/* 0B8578 800BDB18 7EE50014 */  addc    r23, r5, r0
/* 0B857C 800BDB1C 7EC43114 */  adde    r22, r4, r6
/* 0B8580 800BDB20 387F0040 */  addi    r3, r31, 0x40
/* 0B8584 800BDB24 4BFEA665 */  bl      OSCreateAlarm
/* 0B8588 800BDB28 3C60800C */  lis     r3, AlarmHandler@ha
/* 0B858C 800BDB2C 38E3D654 */  addi    r7, r3, AlarmHandler@l
/* 0B8590 800BDB30 38D70000 */  addi    r6, r23, 0
/* 0B8594 800BDB34 38B60000 */  addi    r5, r22, 0
/* 0B8598 800BDB38 387F0040 */  addi    r3, r31, 0x40
/* 0B859C 800BDB3C 4BFEA8AD */  bl      OSSetAlarm
/* 0B85A0 800BDB40 48000018 */  b       lbl_800BDB58
lbl_800BDB44:
/* 0B85A4 800BDB44 38780000 */  addi    r3, r24, 0
/* 0B85A8 800BDB48 38990000 */  addi    r4, r25, 0
/* 0B85AC 800BDB4C 38BA0000 */  addi    r5, r26, 0
/* 0B85B0 800BDB50 38DB0000 */  addi    r6, r27, 0
/* 0B85B4 800BDB54 4BFFFD05 */  bl      SeekTwiceBeforeRead
lbl_800BDB58:
/* 0B85B8 800BDB58 BAC10018 */  lmw     r22, 0x18(r1)
/* 0B85BC 800BDB5C 38600001 */  li      r3, 1
/* 0B85C0 800BDB60 80010044 */  lwz     r0, 0x44(r1)
/* 0B85C4 800BDB64 38210040 */  addi    r1, r1, 0x40
/* 0B85C8 800BDB68 7C0803A6 */  mtlr    r0
/* 0B85CC 800BDB6C 4E800020 */  blr     

glabel DVDLowSeek
/* 0B85D0 800BDB70 7C0802A6 */  mflr    r0
/* 0B85D4 800BDB74 90010004 */  stw     r0, 4(r1)
/* 0B85D8 800BDB78 38000000 */  li      r0, 0
/* 0B85DC 800BDB7C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B85E0 800BDB80 93E10014 */  stw     r31, 0x14(r1)
/* 0B85E4 800BDB84 93C10010 */  stw     r30, 0x10(r1)
/* 0B85E8 800BDB88 908D92B8 */  stw     r4, Callback-_SDA_BASE_(r13)
/* 0B85EC 800BDB8C 3C80CC00 */  lis     r4, 0xcc00
/* 0B85F0 800BDB90 38846000 */  addi    r4, r4, 0x6000
/* 0B85F4 800BDB94 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B85F8 800BDB98 3C00AB00 */  lis     r0, 0xab00
/* 0B85FC 800BDB9C 90040008 */  stw     r0, 8(r4)
/* 0B8600 800BDBA0 5460F0BE */  srwi    r0, r3, 2
/* 0B8604 800BDBA4 3C608014 */  lis     r3, AlarmForTimeout@ha
/* 0B8608 800BDBA8 9004000C */  stw     r0, 0xc(r4)
/* 0B860C 800BDBAC 38000001 */  li      r0, 1
/* 0B8610 800BDBB0 3BE32220 */  addi    r31, r3, AlarmForTimeout@l
/* 0B8614 800BDBB4 9004001C */  stw     r0, 0x1c(r4)
/* 0B8618 800BDBB8 3C808000 */  lis     r4, 0x8000
/* 0B861C 800BDBBC 387F0000 */  addi    r3, r31, 0
/* 0B8620 800BDBC0 800400F8 */  lwz     r0, 0xf8(r4)
/* 0B8624 800BDBC4 5400F0BE */  srwi    r0, r0, 2
/* 0B8628 800BDBC8 1FC0000A */  mulli   r30, r0, 0xa
/* 0B862C 800BDBCC 4BFEA5BD */  bl      OSCreateAlarm
/* 0B8630 800BDBD0 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8634 800BDBD4 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8638 800BDBD8 387F0000 */  addi    r3, r31, 0
/* 0B863C 800BDBDC 38DE0000 */  addi    r6, r30, 0
/* 0B8640 800BDBE0 38A00000 */  li      r5, 0
/* 0B8644 800BDBE4 4BFEA805 */  bl      OSSetAlarm
/* 0B8648 800BDBE8 8001001C */  lwz     r0, 0x1c(r1)
/* 0B864C 800BDBEC 38600001 */  li      r3, 1
/* 0B8650 800BDBF0 83E10014 */  lwz     r31, 0x14(r1)
/* 0B8654 800BDBF4 83C10010 */  lwz     r30, 0x10(r1)
/* 0B8658 800BDBF8 38210018 */  addi    r1, r1, 0x18
/* 0B865C 800BDBFC 7C0803A6 */  mtlr    r0
/* 0B8660 800BDC00 4E800020 */  blr     

glabel DVDLowWaitCoverClose
/* 0B8664 800BDC04 38000001 */  li      r0, 1
/* 0B8668 800BDC08 906D92B8 */  stw     r3, Callback-_SDA_BASE_(r13)
/* 0B866C 800BDC0C 3C60CC00 */  lis     r3, 0xcc00
/* 0B8670 800BDC10 900D92CC */  stw     r0, WaitingCoverClose-_SDA_BASE_(r13)
/* 0B8674 800BDC14 38000000 */  li      r0, 0
/* 0B8678 800BDC18 38836000 */  addi    r4, r3, 0x6000
/* 0B867C 800BDC1C 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B8680 800BDC20 38000002 */  li      r0, 2
/* 0B8684 800BDC24 38600001 */  li      r3, 1
/* 0B8688 800BDC28 90040004 */  stw     r0, 4(r4)
/* 0B868C 800BDC2C 4E800020 */  blr     

glabel DVDLowReadDiskID
/* 0B8690 800BDC30 7C0802A6 */  mflr    r0
/* 0B8694 800BDC34 39000000 */  li      r8, 0
/* 0B8698 800BDC38 90010004 */  stw     r0, 4(r1)
/* 0B869C 800BDC3C 3CA0A800 */  lis     r5, 0xa800
/* 0B86A0 800BDC40 38050040 */  addi    r0, r5, 0x40
/* 0B86A4 800BDC44 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B86A8 800BDC48 38C00020 */  li      r6, 0x20
/* 0B86AC 800BDC4C 3CA08000 */  lis     r5, 0x8000
/* 0B86B0 800BDC50 93E10014 */  stw     r31, 0x14(r1)
/* 0B86B4 800BDC54 93C10010 */  stw     r30, 0x10(r1)
/* 0B86B8 800BDC58 908D92B8 */  stw     r4, Callback-_SDA_BASE_(r13)
/* 0B86BC 800BDC5C 3C80CC00 */  lis     r4, 0xcc00
/* 0B86C0 800BDC60 38E46000 */  addi    r7, r4, 0x6000
/* 0B86C4 800BDC64 910D92B0 */  stw     r8, StopAtNextInt-_SDA_BASE_(r13)
/* 0B86C8 800BDC68 90046008 */  stw     r0, 0x6008(r4)
/* 0B86CC 800BDC6C 3C808014 */  lis     r4, AlarmForTimeout@ha
/* 0B86D0 800BDC70 38000003 */  li      r0, 3
/* 0B86D4 800BDC74 9107000C */  stw     r8, 0xc(r7)
/* 0B86D8 800BDC78 3BE42220 */  addi    r31, r4, AlarmForTimeout@l
/* 0B86DC 800BDC7C 90C70010 */  stw     r6, 0x10(r7)
/* 0B86E0 800BDC80 90670014 */  stw     r3, 0x14(r7)
/* 0B86E4 800BDC84 7FE3FB78 */  mr      r3, r31
/* 0B86E8 800BDC88 90C70018 */  stw     r6, 0x18(r7)
/* 0B86EC 800BDC8C 9007001C */  stw     r0, 0x1c(r7)
/* 0B86F0 800BDC90 800500F8 */  lwz     r0, 0xf8(r5)
/* 0B86F4 800BDC94 5400F0BE */  srwi    r0, r0, 2
/* 0B86F8 800BDC98 1FC0000A */  mulli   r30, r0, 0xa
/* 0B86FC 800BDC9C 4BFEA4ED */  bl      OSCreateAlarm
/* 0B8700 800BDCA0 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8704 800BDCA4 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8708 800BDCA8 387F0000 */  addi    r3, r31, 0
/* 0B870C 800BDCAC 38DE0000 */  addi    r6, r30, 0
/* 0B8710 800BDCB0 38A00000 */  li      r5, 0
/* 0B8714 800BDCB4 4BFEA735 */  bl      OSSetAlarm
/* 0B8718 800BDCB8 8001001C */  lwz     r0, 0x1c(r1)
/* 0B871C 800BDCBC 38600001 */  li      r3, 1
/* 0B8720 800BDCC0 83E10014 */  lwz     r31, 0x14(r1)
/* 0B8724 800BDCC4 83C10010 */  lwz     r30, 0x10(r1)
/* 0B8728 800BDCC8 38210018 */  addi    r1, r1, 0x18
/* 0B872C 800BDCCC 7C0803A6 */  mtlr    r0
/* 0B8730 800BDCD0 4E800020 */  blr     

glabel DVDLowStopMotor
/* 0B8734 800BDCD4 7C0802A6 */  mflr    r0
/* 0B8738 800BDCD8 90010004 */  stw     r0, 4(r1)
/* 0B873C 800BDCDC 38000000 */  li      r0, 0
/* 0B8740 800BDCE0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B8744 800BDCE4 93E10014 */  stw     r31, 0x14(r1)
/* 0B8748 800BDCE8 93C10010 */  stw     r30, 0x10(r1)
/* 0B874C 800BDCEC 906D92B8 */  stw     r3, Callback-_SDA_BASE_(r13)
/* 0B8750 800BDCF0 3C60CC00 */  lis     r3, 0xcc00
/* 0B8754 800BDCF4 38836000 */  addi    r4, r3, 0x6000
/* 0B8758 800BDCF8 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B875C 800BDCFC 3C00E300 */  lis     r0, 0xe300
/* 0B8760 800BDD00 90036008 */  stw     r0, 0x6008(r3)
/* 0B8764 800BDD04 38000001 */  li      r0, 1
/* 0B8768 800BDD08 3C608014 */  lis     r3, AlarmForTimeout@ha
/* 0B876C 800BDD0C 9004001C */  stw     r0, 0x1c(r4)
/* 0B8770 800BDD10 3C808000 */  lis     r4, 0x8000
/* 0B8774 800BDD14 3BE32220 */  addi    r31, r3, AlarmForTimeout@l
/* 0B8778 800BDD18 800400F8 */  lwz     r0, 0xf8(r4)
/* 0B877C 800BDD1C 387F0000 */  addi    r3, r31, 0
/* 0B8780 800BDD20 5400F0BE */  srwi    r0, r0, 2
/* 0B8784 800BDD24 1FC0000A */  mulli   r30, r0, 0xa
/* 0B8788 800BDD28 4BFEA461 */  bl      OSCreateAlarm
/* 0B878C 800BDD2C 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8790 800BDD30 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8794 800BDD34 387F0000 */  addi    r3, r31, 0
/* 0B8798 800BDD38 38DE0000 */  addi    r6, r30, 0
/* 0B879C 800BDD3C 38A00000 */  li      r5, 0
/* 0B87A0 800BDD40 4BFEA6A9 */  bl      OSSetAlarm
/* 0B87A4 800BDD44 8001001C */  lwz     r0, 0x1c(r1)
/* 0B87A8 800BDD48 38600001 */  li      r3, 1
/* 0B87AC 800BDD4C 83E10014 */  lwz     r31, 0x14(r1)
/* 0B87B0 800BDD50 83C10010 */  lwz     r30, 0x10(r1)
/* 0B87B4 800BDD54 38210018 */  addi    r1, r1, 0x18
/* 0B87B8 800BDD58 7C0803A6 */  mtlr    r0
/* 0B87BC 800BDD5C 4E800020 */  blr     

glabel DVDLowRequestError
/* 0B87C0 800BDD60 7C0802A6 */  mflr    r0
/* 0B87C4 800BDD64 90010004 */  stw     r0, 4(r1)
/* 0B87C8 800BDD68 38000000 */  li      r0, 0
/* 0B87CC 800BDD6C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B87D0 800BDD70 93E10014 */  stw     r31, 0x14(r1)
/* 0B87D4 800BDD74 93C10010 */  stw     r30, 0x10(r1)
/* 0B87D8 800BDD78 906D92B8 */  stw     r3, Callback-_SDA_BASE_(r13)
/* 0B87DC 800BDD7C 3C60CC00 */  lis     r3, 0xcc00
/* 0B87E0 800BDD80 38836000 */  addi    r4, r3, 0x6000
/* 0B87E4 800BDD84 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B87E8 800BDD88 3C00E000 */  lis     r0, 0xe000
/* 0B87EC 800BDD8C 90036008 */  stw     r0, 0x6008(r3)
/* 0B87F0 800BDD90 38000001 */  li      r0, 1
/* 0B87F4 800BDD94 3C608014 */  lis     r3, AlarmForTimeout@ha
/* 0B87F8 800BDD98 9004001C */  stw     r0, 0x1c(r4)
/* 0B87FC 800BDD9C 3C808000 */  lis     r4, 0x8000
/* 0B8800 800BDDA0 3BE32220 */  addi    r31, r3, AlarmForTimeout@l
/* 0B8804 800BDDA4 800400F8 */  lwz     r0, 0xf8(r4)
/* 0B8808 800BDDA8 387F0000 */  addi    r3, r31, 0
/* 0B880C 800BDDAC 5400F0BE */  srwi    r0, r0, 2
/* 0B8810 800BDDB0 1FC0000A */  mulli   r30, r0, 0xa
/* 0B8814 800BDDB4 4BFEA3D5 */  bl      OSCreateAlarm
/* 0B8818 800BDDB8 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B881C 800BDDBC 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8820 800BDDC0 387F0000 */  addi    r3, r31, 0
/* 0B8824 800BDDC4 38DE0000 */  addi    r6, r30, 0
/* 0B8828 800BDDC8 38A00000 */  li      r5, 0
/* 0B882C 800BDDCC 4BFEA61D */  bl      OSSetAlarm
/* 0B8830 800BDDD0 8001001C */  lwz     r0, 0x1c(r1)
/* 0B8834 800BDDD4 38600001 */  li      r3, 1
/* 0B8838 800BDDD8 83E10014 */  lwz     r31, 0x14(r1)
/* 0B883C 800BDDDC 83C10010 */  lwz     r30, 0x10(r1)
/* 0B8840 800BDDE0 38210018 */  addi    r1, r1, 0x18
/* 0B8844 800BDDE4 7C0803A6 */  mtlr    r0
/* 0B8848 800BDDE8 4E800020 */  blr     

glabel DVDLowInquiry
/* 0B884C 800BDDEC 7C0802A6 */  mflr    r0
/* 0B8850 800BDDF0 38C00020 */  li      r6, 0x20
/* 0B8854 800BDDF4 90010004 */  stw     r0, 4(r1)
/* 0B8858 800BDDF8 38000000 */  li      r0, 0
/* 0B885C 800BDDFC 3CA08000 */  lis     r5, 0x8000
/* 0B8860 800BDE00 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B8864 800BDE04 93E10014 */  stw     r31, 0x14(r1)
/* 0B8868 800BDE08 93C10010 */  stw     r30, 0x10(r1)
/* 0B886C 800BDE0C 908D92B8 */  stw     r4, Callback-_SDA_BASE_(r13)
/* 0B8870 800BDE10 3C80CC00 */  lis     r4, 0xcc00
/* 0B8874 800BDE14 38E46000 */  addi    r7, r4, 0x6000
/* 0B8878 800BDE18 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B887C 800BDE1C 3C001200 */  lis     r0, 0x1200
/* 0B8880 800BDE20 90046008 */  stw     r0, 0x6008(r4)
/* 0B8884 800BDE24 3C808014 */  lis     r4, AlarmForTimeout@ha
/* 0B8888 800BDE28 38000003 */  li      r0, 3
/* 0B888C 800BDE2C 90C70010 */  stw     r6, 0x10(r7)
/* 0B8890 800BDE30 3BE42220 */  addi    r31, r4, AlarmForTimeout@l
/* 0B8894 800BDE34 90670014 */  stw     r3, 0x14(r7)
/* 0B8898 800BDE38 387F0000 */  addi    r3, r31, 0
/* 0B889C 800BDE3C 90C70018 */  stw     r6, 0x18(r7)
/* 0B88A0 800BDE40 9007001C */  stw     r0, 0x1c(r7)
/* 0B88A4 800BDE44 800500F8 */  lwz     r0, 0xf8(r5)
/* 0B88A8 800BDE48 5400F0BE */  srwi    r0, r0, 2
/* 0B88AC 800BDE4C 1FC0000A */  mulli   r30, r0, 0xa
/* 0B88B0 800BDE50 4BFEA339 */  bl      OSCreateAlarm
/* 0B88B4 800BDE54 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B88B8 800BDE58 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B88BC 800BDE5C 387F0000 */  addi    r3, r31, 0
/* 0B88C0 800BDE60 38DE0000 */  addi    r6, r30, 0
/* 0B88C4 800BDE64 38A00000 */  li      r5, 0
/* 0B88C8 800BDE68 4BFEA581 */  bl      OSSetAlarm
/* 0B88CC 800BDE6C 8001001C */  lwz     r0, 0x1c(r1)
/* 0B88D0 800BDE70 38600001 */  li      r3, 1
/* 0B88D4 800BDE74 83E10014 */  lwz     r31, 0x14(r1)
/* 0B88D8 800BDE78 83C10010 */  lwz     r30, 0x10(r1)
/* 0B88DC 800BDE7C 38210018 */  addi    r1, r1, 0x18
/* 0B88E0 800BDE80 7C0803A6 */  mtlr    r0
/* 0B88E4 800BDE84 4E800020 */  blr     

glabel DVDLowAudioStream
/* 0B88E8 800BDE88 7C0802A6 */  mflr    r0
/* 0B88EC 800BDE8C 90010004 */  stw     r0, 4(r1)
/* 0B88F0 800BDE90 38000000 */  li      r0, 0
/* 0B88F4 800BDE94 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B88F8 800BDE98 93E1001C */  stw     r31, 0x1c(r1)
/* 0B88FC 800BDE9C 93C10018 */  stw     r30, 0x18(r1)
/* 0B8900 800BDEA0 90CD92B8 */  stw     r6, Callback-_SDA_BASE_(r13)
/* 0B8904 800BDEA4 3CC0CC00 */  lis     r6, 0xcc00
/* 0B8908 800BDEA8 38C66000 */  addi    r6, r6, 0x6000
/* 0B890C 800BDEAC 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B8910 800BDEB0 6460E100 */  oris    r0, r3, 0xe100
/* 0B8914 800BDEB4 3C608014 */  lis     r3, AlarmForTimeout@ha
/* 0B8918 800BDEB8 90060008 */  stw     r0, 8(r6)
/* 0B891C 800BDEBC 54A0F0BE */  srwi    r0, r5, 2
/* 0B8920 800BDEC0 3BE32220 */  addi    r31, r3, AlarmForTimeout@l
/* 0B8924 800BDEC4 9006000C */  stw     r0, 0xc(r6)
/* 0B8928 800BDEC8 38000001 */  li      r0, 1
/* 0B892C 800BDECC 387F0000 */  addi    r3, r31, 0
/* 0B8930 800BDED0 90860010 */  stw     r4, 0x10(r6)
/* 0B8934 800BDED4 3C808000 */  lis     r4, 0x8000
/* 0B8938 800BDED8 9006001C */  stw     r0, 0x1c(r6)
/* 0B893C 800BDEDC 800400F8 */  lwz     r0, 0xf8(r4)
/* 0B8940 800BDEE0 5400F0BE */  srwi    r0, r0, 2
/* 0B8944 800BDEE4 1FC0000A */  mulli   r30, r0, 0xa
/* 0B8948 800BDEE8 4BFEA2A1 */  bl      OSCreateAlarm
/* 0B894C 800BDEEC 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8950 800BDEF0 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8954 800BDEF4 387F0000 */  addi    r3, r31, 0
/* 0B8958 800BDEF8 38DE0000 */  addi    r6, r30, 0
/* 0B895C 800BDEFC 38A00000 */  li      r5, 0
/* 0B8960 800BDF00 4BFEA4E9 */  bl      OSSetAlarm
/* 0B8964 800BDF04 80010024 */  lwz     r0, 0x24(r1)
/* 0B8968 800BDF08 38600001 */  li      r3, 1
/* 0B896C 800BDF0C 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B8970 800BDF10 83C10018 */  lwz     r30, 0x18(r1)
/* 0B8974 800BDF14 38210020 */  addi    r1, r1, 0x20
/* 0B8978 800BDF18 7C0803A6 */  mtlr    r0
/* 0B897C 800BDF1C 4E800020 */  blr     

glabel DVDLowRequestAudioStatus
/* 0B8980 800BDF20 7C0802A6 */  mflr    r0
/* 0B8984 800BDF24 90010004 */  stw     r0, 4(r1)
/* 0B8988 800BDF28 38000000 */  li      r0, 0
/* 0B898C 800BDF2C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B8990 800BDF30 93E10014 */  stw     r31, 0x14(r1)
/* 0B8994 800BDF34 93C10010 */  stw     r30, 0x10(r1)
/* 0B8998 800BDF38 908D92B8 */  stw     r4, Callback-_SDA_BASE_(r13)
/* 0B899C 800BDF3C 3C80CC00 */  lis     r4, 0xcc00
/* 0B89A0 800BDF40 38846000 */  addi    r4, r4, 0x6000
/* 0B89A4 800BDF44 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B89A8 800BDF48 6460E200 */  oris    r0, r3, 0xe200
/* 0B89AC 800BDF4C 3C608014 */  lis     r3, AlarmForTimeout@ha
/* 0B89B0 800BDF50 90040008 */  stw     r0, 8(r4)
/* 0B89B4 800BDF54 38000001 */  li      r0, 1
/* 0B89B8 800BDF58 3BE32220 */  addi    r31, r3, AlarmForTimeout@l
/* 0B89BC 800BDF5C 9004001C */  stw     r0, 0x1c(r4)
/* 0B89C0 800BDF60 3C808000 */  lis     r4, 0x8000
/* 0B89C4 800BDF64 387F0000 */  addi    r3, r31, 0
/* 0B89C8 800BDF68 800400F8 */  lwz     r0, 0xf8(r4)
/* 0B89CC 800BDF6C 5400F0BE */  srwi    r0, r0, 2
/* 0B89D0 800BDF70 1FC0000A */  mulli   r30, r0, 0xa
/* 0B89D4 800BDF74 4BFEA215 */  bl      OSCreateAlarm
/* 0B89D8 800BDF78 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B89DC 800BDF7C 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B89E0 800BDF80 387F0000 */  addi    r3, r31, 0
/* 0B89E4 800BDF84 38DE0000 */  addi    r6, r30, 0
/* 0B89E8 800BDF88 38A00000 */  li      r5, 0
/* 0B89EC 800BDF8C 4BFEA45D */  bl      OSSetAlarm
/* 0B89F0 800BDF90 8001001C */  lwz     r0, 0x1c(r1)
/* 0B89F4 800BDF94 38600001 */  li      r3, 1
/* 0B89F8 800BDF98 83E10014 */  lwz     r31, 0x14(r1)
/* 0B89FC 800BDF9C 83C10010 */  lwz     r30, 0x10(r1)
/* 0B8A00 800BDFA0 38210018 */  addi    r1, r1, 0x18
/* 0B8A04 800BDFA4 7C0803A6 */  mtlr    r0
/* 0B8A08 800BDFA8 4E800020 */  blr     

glabel DVDLowAudioBufferConfig
/* 0B8A0C 800BDFAC 7C0802A6 */  mflr    r0
/* 0B8A10 800BDFB0 2C030000 */  cmpwi   r3, 0
/* 0B8A14 800BDFB4 90010004 */  stw     r0, 4(r1)
/* 0B8A18 800BDFB8 38000000 */  li      r0, 0
/* 0B8A1C 800BDFBC 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B8A20 800BDFC0 93E1001C */  stw     r31, 0x1c(r1)
/* 0B8A24 800BDFC4 93C10018 */  stw     r30, 0x18(r1)
/* 0B8A28 800BDFC8 90AD92B8 */  stw     r5, Callback-_SDA_BASE_(r13)
/* 0B8A2C 800BDFCC 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B8A30 800BDFD0 41820008 */  beq     lbl_800BDFD8
/* 0B8A34 800BDFD4 3C000001 */  lis     r0, 1
lbl_800BDFD8:
/* 0B8A38 800BDFD8 6400E400 */  oris    r0, r0, 0xe400
/* 0B8A3C 800BDFDC 3C60CC00 */  lis     r3, 0xcc00
/* 0B8A40 800BDFE0 7C800378 */  or      r0, r4, r0
/* 0B8A44 800BDFE4 38636000 */  addi    r3, r3, 0x6000
/* 0B8A48 800BDFE8 90030008 */  stw     r0, 8(r3)
/* 0B8A4C 800BDFEC 38000001 */  li      r0, 1
/* 0B8A50 800BDFF0 3C808000 */  lis     r4, 0x8000
/* 0B8A54 800BDFF4 9003001C */  stw     r0, 0x1c(r3)
/* 0B8A58 800BDFF8 3C608014 */  lis     r3, AlarmForTimeout@ha
/* 0B8A5C 800BDFFC 3BE32220 */  addi    r31, r3, AlarmForTimeout@l
/* 0B8A60 800BE000 800400F8 */  lwz     r0, 0xf8(r4)
/* 0B8A64 800BE004 387F0000 */  addi    r3, r31, 0
/* 0B8A68 800BE008 5400F0BE */  srwi    r0, r0, 2
/* 0B8A6C 800BE00C 1FC0000A */  mulli   r30, r0, 0xa
/* 0B8A70 800BE010 4BFEA179 */  bl      OSCreateAlarm
/* 0B8A74 800BE014 3C60800C */  lis     r3, AlarmHandlerForTimeout@ha
/* 0B8A78 800BE018 38E3D6D8 */  addi    r7, r3, AlarmHandlerForTimeout@l
/* 0B8A7C 800BE01C 387F0000 */  addi    r3, r31, 0
/* 0B8A80 800BE020 38DE0000 */  addi    r6, r30, 0
/* 0B8A84 800BE024 38A00000 */  li      r5, 0
/* 0B8A88 800BE028 4BFEA3C1 */  bl      OSSetAlarm
/* 0B8A8C 800BE02C 80010024 */  lwz     r0, 0x24(r1)
/* 0B8A90 800BE030 38600001 */  li      r3, 1
/* 0B8A94 800BE034 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B8A98 800BE038 83C10018 */  lwz     r30, 0x18(r1)
/* 0B8A9C 800BE03C 38210020 */  addi    r1, r1, 0x20
/* 0B8AA0 800BE040 7C0803A6 */  mtlr    r0
/* 0B8AA4 800BE044 4E800020 */  blr     

glabel DVDLowReset
/* 0B8AA8 800BE048 7C0802A6 */  mflr    r0
/* 0B8AAC 800BE04C 3C80CC00 */  lis     r4, 0xcc00
/* 0B8AB0 800BE050 90010004 */  stw     r0, 4(r1)
/* 0B8AB4 800BE054 38000002 */  li      r0, 2
/* 0B8AB8 800BE058 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B8ABC 800BE05C BF410008 */  stmw    r26, 8(r1)
/* 0B8AC0 800BE060 3BE43000 */  addi    r31, r4, 0x3000
/* 0B8AC4 800BE064 90046004 */  stw     r0, 0x6004(r4)
/* 0B8AC8 800BE068 83C43024 */  lwz     r30, 0x3024(r4)
/* 0B8ACC 800BE06C 57C007B8 */  rlwinm  r0, r30, 0, 0x1e, 0x1c
/* 0B8AD0 800BE070 60000001 */  ori     r0, r0, 1
/* 0B8AD4 800BE074 941F0024 */  stwu    r0, 0x24(r31)
/* 0B8AD8 800BE078 4BFEFCC5 */  bl      __OSGetSystemTime
/* 0B8ADC 800BE07C 3CA08000 */  lis     r5, 0x8000
/* 0B8AE0 800BE080 800500F8 */  lwz     r0, 0xf8(r5)
/* 0B8AE4 800BE084 3CA0431C */  lis     r5, 0x431c
/* 0B8AE8 800BE088 38A5DE83 */  addi    r5, r5, -8573
/* 0B8AEC 800BE08C 5400F0BE */  srwi    r0, r0, 2
/* 0B8AF0 800BE090 7C050016 */  mulhwu  r0, r5, r0
/* 0B8AF4 800BE094 54008BFE */  srwi    r0, r0, 0xf
/* 0B8AF8 800BE098 1C00000C */  mulli   r0, r0, 0xc
/* 0B8AFC 800BE09C 3B440000 */  addi    r26, r4, 0
/* 0B8B00 800BE0A0 3B630000 */  addi    r27, r3, 0
/* 0B8B04 800BE0A4 541CE8FE */  srwi    r28, r0, 3
/* 0B8B08 800BE0A8 3BA00000 */  li      r29, 0
lbl_800BE0AC:
/* 0B8B0C 800BE0AC 4BFEFC91 */  bl      __OSGetSystemTime
/* 0B8B10 800BE0B0 7CBA2010 */  subfc   r5, r26, r4
/* 0B8B14 800BE0B4 7C1B1910 */  subfe   r0, r27, r3
/* 0B8B18 800BE0B8 6C048000 */  xoris   r4, r0, 0x8000
/* 0B8B1C 800BE0BC 6FA38000 */  xoris   r3, r29, 0x8000
/* 0B8B20 800BE0C0 7C1C2810 */  subfc   r0, r28, r5
/* 0B8B24 800BE0C4 7C632110 */  subfe   r3, r3, r4
/* 0B8B28 800BE0C8 7C642110 */  subfe   r3, r4, r4
/* 0B8B2C 800BE0CC 7C6300D1 */  neg.    r3, r3
/* 0B8B30 800BE0D0 4082FFDC */  bne     lbl_800BE0AC
/* 0B8B34 800BE0D4 63C00005 */  ori     r0, r30, 5
/* 0B8B38 800BE0D8 901F0000 */  stw     r0, 0(r31)
/* 0B8B3C 800BE0DC 38000001 */  li      r0, 1
/* 0B8B40 800BE0E0 900D92C8 */  stw     r0, ResetOccurred-_SDA_BASE_(r13)
/* 0B8B44 800BE0E4 4BFEFC59 */  bl      __OSGetSystemTime
/* 0B8B48 800BE0E8 908D92C4 */  stw     r4, (LastResetEnd + 4)-_SDA_BASE_(r13)
/* 0B8B4C 800BE0EC 906D92C0 */  stw     r3, LastResetEnd-_SDA_BASE_(r13)
/* 0B8B50 800BE0F0 BB410008 */  lmw     r26, 8(r1)
/* 0B8B54 800BE0F4 80010024 */  lwz     r0, 0x24(r1)
/* 0B8B58 800BE0F8 38210020 */  addi    r1, r1, 0x20
/* 0B8B5C 800BE0FC 7C0803A6 */  mtlr    r0
/* 0B8B60 800BE100 4E800020 */  blr     

glabel DVDLowBreak
/* 0B8B64 800BE104 38000001 */  li      r0, 1
/* 0B8B68 800BE108 900D92B0 */  stw     r0, StopAtNextInt-_SDA_BASE_(r13)
/* 0B8B6C 800BE10C 38600001 */  li      r3, 1
/* 0B8B70 800BE110 900D92D0 */  stw     r0, Breaking-_SDA_BASE_(r13)
/* 0B8B74 800BE114 4E800020 */  blr     

glabel DVDLowClearCallback
/* 0B8B78 800BE118 3C60CC00 */  lis     r3, 0xcc00
/* 0B8B7C 800BE11C 38000000 */  li      r0, 0
/* 0B8B80 800BE120 90036004 */  stw     r0, 0x6004(r3)
/* 0B8B84 800BE124 806D92B8 */  lwz     r3, Callback-_SDA_BASE_(r13)
/* 0B8B88 800BE128 900D92CC */  stw     r0, WaitingCoverClose-_SDA_BASE_(r13)
/* 0B8B8C 800BE12C 900D92B8 */  stw     r0, Callback-_SDA_BASE_(r13)
/* 0B8B90 800BE130 4E800020 */  blr     

glabel __DVDLowSetWAType
/* 0B8B94 800BE134 7C0802A6 */  mflr    r0
/* 0B8B98 800BE138 90010004 */  stw     r0, 4(r1)
/* 0B8B9C 800BE13C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B8BA0 800BE140 93E10014 */  stw     r31, 0x14(r1)
/* 0B8BA4 800BE144 3BE40000 */  addi    r31, r4, 0
/* 0B8BA8 800BE148 93C10010 */  stw     r30, 0x10(r1)
/* 0B8BAC 800BE14C 3BC30000 */  addi    r30, r3, 0
/* 0B8BB0 800BE150 4BFEC621 */  bl      OSDisableInterrupts
/* 0B8BB4 800BE154 93CD92D4 */  stw     r30, WorkAroundType-_SDA_BASE_(r13)
/* 0B8BB8 800BE158 93ED92D8 */  stw     r31, WorkAroundSeekLocation-_SDA_BASE_(r13)
/* 0B8BBC 800BE15C 4BFEC63D */  bl      OSRestoreInterrupts
/* 0B8BC0 800BE160 8001001C */  lwz     r0, 0x1c(r1)
/* 0B8BC4 800BE164 83E10014 */  lwz     r31, 0x14(r1)
/* 0B8BC8 800BE168 83C10010 */  lwz     r30, 0x10(r1)
/* 0B8BCC 800BE16C 38210018 */  addi    r1, r1, 0x18
/* 0B8BD0 800BE170 7C0803A6 */  mtlr    r0
/* 0B8BD4 800BE174 4E800020 */  blr     

glabel __DVDLowTestAlarm
/* 0B8BD8 800BE178 3C808014 */  lis     r4, AlarmForBreak@ha
/* 0B8BDC 800BE17C 38042248 */  addi    r0, r4, AlarmForBreak@l
/* 0B8BE0 800BE180 7C030040 */  cmplw   r3, r0
/* 0B8BE4 800BE184 4082000C */  bne     lbl_800BE190
/* 0B8BE8 800BE188 38600001 */  li      r3, 1
/* 0B8BEC 800BE18C 4E800020 */  blr     
lbl_800BE190:
/* 0B8BF0 800BE190 3C808014 */  lis     r4, AlarmForTimeout@ha
/* 0B8BF4 800BE194 38042220 */  addi    r0, r4, AlarmForTimeout@l
/* 0B8BF8 800BE198 7C030040 */  cmplw   r3, r0
/* 0B8BFC 800BE19C 4082000C */  bne     lbl_800BE1A8
/* 0B8C00 800BE1A0 38600001 */  li      r3, 1
/* 0B8C04 800BE1A4 4E800020 */  blr     
lbl_800BE1A8:
/* 0B8C08 800BE1A8 38600000 */  li      r3, 0
/* 0B8C0C 800BE1AC 4E800020 */  blr     


.section .bss, "wa"

.balign 4

/* 0013F238 801421B8 003C */
CommandList:
    .skip 60

.balign 8

/* 0013F278 801421F8 0028 */
AlarmForWA:
    .skip 40

.balign 4

/* 0013F2A0 80142220 0028 */
AlarmForTimeout:
    .skip 40

.balign 4

/* 0013F2C8 80142248 0028 */
AlarmForBreak:
    .skip 40

.balign 4

/* 0013F2F0 80142270 000C */
Prev:
    .skip 12

.balign 4

/* 0013F2FC 8014227C 000C */
Curr:
    .skip 12


.section .sdata, "wa"

.balign 8

/* 00100008 801457A8 0004 */
FirstRead:
    .long 0x00000001


.section .sbss, "wa"

.balign 8

/* 001004F0 80145C90 0004 */
StopAtNextInt:
    .skip 4

.balign 4

/* 001004F4 80145C94 0004 */
LastLength:
    .skip 4

.balign 4

/* 001004F8 80145C98 0004 */
Callback:
    .skip 4

.balign 4

/* 001004FC 80145C9C 0004 */
ResetCoverCallback:
    .skip 4

.balign 8

/* 00100500 80145CA0 0008 */
LastResetEnd:
    .skip 8

.balign 4

/* 00100508 80145CA8 0004 */
ResetOccurred:
    .skip 4

.balign 4

/* 0010050C 80145CAC 0004 */
WaitingCoverClose:
    .skip 4

.balign 4

/* 00100510 80145CB0 0004 */
Breaking:
    .skip 4

.balign 4

/* 00100514 80145CB4 0004 */
WorkAroundType:
    .skip 4

.balign 4

/* 00100518 80145CB8 0004 */
WorkAroundSeekLocation:
    .skip 4

.balign 8

/* 00100520 80145CC0 0008 */
LastReadFinished:
    .skip 8

.balign 8

/* 00100528 80145CC8 0008 */
LastReadIssued:
    .skip 8

.balign 4

/* 00100530 80145CD0 0004 */
LastCommandWasRead:
    .skip 4

.balign 4

/* 00100534 80145CD4 0004 */
NextCommandNumber:
    .skip 4


