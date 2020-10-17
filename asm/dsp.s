# dsp.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel DSPCheckMailToDSP
/* 0C0EF4 800C6494 3C60CC00 */  lis     r3, 0xcc00
/* 0C0EF8 800C6498 A0035000 */  lhz     r0, 0x5000(r3)
/* 0C0EFC 800C649C 54038FFE */  rlwinm  r3, r0, 0x11, 0x1f, 0x1f
/* 0C0F00 800C64A0 4E800020 */  blr     

glabel DSPCheckMailFromDSP
/* 0C0F04 800C64A4 3C60CC00 */  lis     r3, 0xcc00
/* 0C0F08 800C64A8 A0035004 */  lhz     r0, 0x5004(r3)
/* 0C0F0C 800C64AC 54038FFE */  rlwinm  r3, r0, 0x11, 0x1f, 0x1f
/* 0C0F10 800C64B0 4E800020 */  blr     

glabel DSPReadMailFromDSP
/* 0C0F14 800C64B4 3C60CC00 */  lis     r3, 0xcc00
/* 0C0F18 800C64B8 38635000 */  addi    r3, r3, 0x5000
/* 0C0F1C 800C64BC A0030004 */  lhz     r0, 4(r3)
/* 0C0F20 800C64C0 A0630006 */  lhz     r3, 6(r3)
/* 0C0F24 800C64C4 5003801E */  rlwimi  r3, r0, 0x10, 0, 0xf
/* 0C0F28 800C64C8 4E800020 */  blr     

glabel DSPSendMailToDSP
/* 0C0F2C 800C64CC 3C80CC00 */  lis     r4, 0xcc00
/* 0C0F30 800C64D0 5460843E */  srwi    r0, r3, 0x10
/* 0C0F34 800C64D4 B0045000 */  sth     r0, 0x5000(r4)
/* 0C0F38 800C64D8 B0645002 */  sth     r3, 0x5002(r4)
/* 0C0F3C 800C64DC 4E800020 */  blr     

glabel DSPInit
/* 0C0F40 800C64E0 7C0802A6 */  mflr    r0
/* 0C0F44 800C64E4 3C608010 */  lis     r3, D_801018F8@ha
/* 0C0F48 800C64E8 90010004 */  stw     r0, 4(r1)
/* 0C0F4C 800C64EC 38A318F8 */  addi    r5, r3, D_801018F8@l
/* 0C0F50 800C64F0 4CC63182 */  crclr   6
/* 0C0F54 800C64F4 38650048 */  addi    r3, r5, 0x48
/* 0C0F58 800C64F8 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0C0F5C 800C64FC 38850068 */  addi    r4, r5, 0x68
/* 0C0F60 800C6500 93E1000C */  stw     r31, 0xc(r1)
/* 0C0F64 800C6504 38A50074 */  addi    r5, r5, 0x74
/* 0C0F68 800C6508 4800010D */  bl      __DSP_debug_printf
/* 0C0F6C 800C650C 800D9478 */  lwz     r0, __DSP_init_flag-_SDA_BASE_(r13)
/* 0C0F70 800C6510 2C000001 */  cmpwi   r0, 1
/* 0C0F74 800C6514 4182007C */  beq     lbl_800C6590
/* 0C0F78 800C6518 806D8E20 */  lwz     r3, __DSPVersion-_SDA_BASE_(r13)
/* 0C0F7C 800C651C 4BFE1BE9 */  bl      OSRegisterVersion
/* 0C0F80 800C6520 4BFE4251 */  bl      OSDisableInterrupts
/* 0C0F84 800C6524 3C80800C */  lis     r4, __DSPHandler@ha
/* 0C0F88 800C6528 3BE30000 */  addi    r31, r3, 0
/* 0C0F8C 800C652C 38846664 */  addi    r4, r4, __DSPHandler@l
/* 0C0F90 800C6530 38600007 */  li      r3, 7
/* 0C0F94 800C6534 4BFE4289 */  bl      __OSSetInterruptHandler
/* 0C0F98 800C6538 3C600100 */  lis     r3, 0x100
/* 0C0F9C 800C653C 4BFE4685 */  bl      __OSUnmaskInterrupts
/* 0C0FA0 800C6540 3C60CC00 */  lis     r3, 0xcc00
/* 0C0FA4 800C6544 38C35000 */  addi    r6, r3, 0x5000
/* 0C0FA8 800C6548 A063500A */  lhz     r3, 0x500a(r3)
/* 0C0FAC 800C654C 3800FF57 */  li      r0, -169
/* 0C0FB0 800C6550 7C600038 */  and     r0, r3, r0
/* 0C0FB4 800C6554 60000800 */  ori     r0, r0, 0x800
/* 0C0FB8 800C6558 B006000A */  sth     r0, 0xa(r6)
/* 0C0FBC 800C655C 38A0FF53 */  li      r5, -173
/* 0C0FC0 800C6560 38800000 */  li      r4, 0
/* 0C0FC4 800C6564 A0E6000A */  lhz     r7, 0xa(r6)
/* 0C0FC8 800C6568 38000001 */  li      r0, 1
/* 0C0FCC 800C656C 387F0000 */  addi    r3, r31, 0
/* 0C0FD0 800C6570 7CE52838 */  and     r5, r7, r5
/* 0C0FD4 800C6574 B0A6000A */  sth     r5, 0xa(r6)
/* 0C0FD8 800C6578 908D9488 */  stw     r4, __DSP_tmp_task-_SDA_BASE_(r13)
/* 0C0FDC 800C657C 908D9494 */  stw     r4, __DSP_curr_task-_SDA_BASE_(r13)
/* 0C0FE0 800C6580 908D948C */  stw     r4, __DSP_last_task-_SDA_BASE_(r13)
/* 0C0FE4 800C6584 908D9490 */  stw     r4, __DSP_first_task-_SDA_BASE_(r13)
/* 0C0FE8 800C6588 900D9478 */  stw     r0, __DSP_init_flag-_SDA_BASE_(r13)
/* 0C0FEC 800C658C 4BFE420D */  bl      OSRestoreInterrupts
lbl_800C6590:
/* 0C0FF0 800C6590 80010014 */  lwz     r0, 0x14(r1)
/* 0C0FF4 800C6594 83E1000C */  lwz     r31, 0xc(r1)
/* 0C0FF8 800C6598 38210010 */  addi    r1, r1, 0x10
/* 0C0FFC 800C659C 7C0803A6 */  mtlr    r0
/* 0C1000 800C65A0 4E800020 */  blr     

glabel DSPAddTask
/* 0C1004 800C65A4 7C0802A6 */  mflr    r0
/* 0C1008 800C65A8 90010004 */  stw     r0, 4(r1)
/* 0C100C 800C65AC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0C1010 800C65B0 93E10014 */  stw     r31, 0x14(r1)
/* 0C1014 800C65B4 93C10010 */  stw     r30, 0x10(r1)
/* 0C1018 800C65B8 7C7E1B78 */  mr      r30, r3
/* 0C101C 800C65BC 4BFE41B5 */  bl      OSDisableInterrupts
/* 0C1020 800C65C0 3BE30000 */  addi    r31, r3, 0
/* 0C1024 800C65C4 387E0000 */  addi    r3, r30, 0
/* 0C1028 800C65C8 480007ED */  bl      __DSP_insert_task
/* 0C102C 800C65CC 38000000 */  li      r0, 0
/* 0C1030 800C65D0 901E0000 */  stw     r0, 0(r30)
/* 0C1034 800C65D4 38000001 */  li      r0, 1
/* 0C1038 800C65D8 387F0000 */  addi    r3, r31, 0
/* 0C103C 800C65DC 901E0008 */  stw     r0, 8(r30)
/* 0C1040 800C65E0 4BFE41B9 */  bl      OSRestoreInterrupts
/* 0C1044 800C65E4 800D9490 */  lwz     r0, __DSP_first_task-_SDA_BASE_(r13)
/* 0C1048 800C65E8 7C1E0040 */  cmplw   r30, r0
/* 0C104C 800C65EC 4082000C */  bne     lbl_800C65F8
/* 0C1050 800C65F0 7FC3F378 */  mr      r3, r30
/* 0C1054 800C65F4 48000635 */  bl      __DSP_boot_task
lbl_800C65F8:
/* 0C1058 800C65F8 7FC3F378 */  mr      r3, r30
/* 0C105C 800C65FC 8001001C */  lwz     r0, 0x1c(r1)
/* 0C1060 800C6600 83E10014 */  lwz     r31, 0x14(r1)
/* 0C1064 800C6604 83C10010 */  lwz     r30, 0x10(r1)
/* 0C1068 800C6608 38210018 */  addi    r1, r1, 0x18
/* 0C106C 800C660C 7C0803A6 */  mtlr    r0
/* 0C1070 800C6610 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FE978 801018F8 0045 */
D_801018F8:
    .asciz "<< Dolphin SDK - DSP\trelease build: Apr 17 2003 12:34:16 (0x2301) >>"

.balign 4

/* 000FE9C0 80101940 001E */
D_80101940:
    .asciz "DSPInit(): Build Date: %s %s\n"

.balign 4

/* 000FE9E0 80101960 000C */
D_80101960:
    .asciz "Apr 17 2003"

.balign 4

/* 000FE9EC 8010196C 0009 */
D_8010196C:
    .asciz "12:34:16"


.section .sdata, "wa"

.balign 8

/* 00100060 80145800 0004 */
glabel __DSPVersion
    .long D_801018F8


.section .sbss, "wa"

.balign 8

/* 001006B8 80145E58 0004 */
__DSP_init_flag:
    .skip 4


