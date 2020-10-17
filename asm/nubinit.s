# nubinit.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKInitializeNub
/* 0CFFF0 800D5590 7C0802A6 */  mflr    r0
/* 0CFFF4 800D5594 90010004 */  stw     r0, 4(r1)
/* 0CFFF8 800D5598 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0CFFFC 800D559C 93E1000C */  stw     r31, 0xc(r1)
/* 0D0000 800D55A0 93C10008 */  stw     r30, 8(r1)
/* 0D0004 800D55A4 4800010D */  bl      TRKInitializeEndian
/* 0D0008 800D55A8 7C7E1B79 */  or.     r30, r3, r3
/* 0D000C 800D55AC 40820008 */  bne     lbl_800D55B4
/* 0D0010 800D55B0 48000BAD */  bl      usr_put_initialize
lbl_800D55B4:
/* 0D0014 800D55B4 2C1E0000 */  cmpwi   r30, 0
/* 0D0018 800D55B8 4082000C */  bne     lbl_800D55C4
/* 0D001C 800D55BC 4BFFFD79 */  bl      TRKInitializeEventQueue
/* 0D0020 800D55C0 7C7E1B78 */  mr      r30, r3
lbl_800D55C4:
/* 0D0024 800D55C4 2C1E0000 */  cmpwi   r30, 0
/* 0D0028 800D55C8 4082000C */  bne     lbl_800D55D4
/* 0D002C 800D55CC 48000189 */  bl      TRKInitializeMessageBuffers
/* 0D0030 800D55D0 7C7E1B78 */  mr      r30, r3
lbl_800D55D4:
/* 0D0034 800D55D4 2C1E0000 */  cmpwi   r30, 0
/* 0D0038 800D55D8 4082000C */  bne     lbl_800D55E4
/* 0D003C 800D55DC 48000B85 */  bl      TRKInitializeDispatcher
/* 0D0040 800D55E0 7C7E1B78 */  mr      r30, r3
lbl_800D55E4:
/* 0D0044 800D55E4 2C1E0000 */  cmpwi   r30, 0
/* 0D0048 800D55E8 40820040 */  bne     lbl_800D5628
/* 0D004C 800D55EC 3C608014 */  lis     r3, gTRKInputPendingPtr@ha
/* 0D0050 800D55F0 3BE34244 */  addi    r31, r3, gTRKInputPendingPtr@l
/* 0D0054 800D55F4 3C600001 */  lis     r3, 1
/* 0D0058 800D55F8 38DF0000 */  addi    r6, r31, 0
/* 0D005C 800D55FC 3863E100 */  addi    r3, r3, -7936
/* 0D0060 800D5600 38800001 */  li      r4, 1
/* 0D0064 800D5604 38A00000 */  li      r5, 0
/* 0D0068 800D5608 4800413D */  bl      TRKInitializeIntDrivenUART
/* 0D006C 800D560C 7C601B78 */  mr      r0, r3
/* 0D0070 800D5610 807F0000 */  lwz     r3, 0(r31)
/* 0D0074 800D5614 7C1F0378 */  mr      r31, r0
/* 0D0078 800D5618 480039BD */  bl      TRKTargetSetInputPendingPtr
/* 0D007C 800D561C 2C1F0000 */  cmpwi   r31, 0
/* 0D0080 800D5620 41820008 */  beq     lbl_800D5628
/* 0D0084 800D5624 7FFEFB78 */  mr      r30, r31
lbl_800D5628:
/* 0D0088 800D5628 2C1E0000 */  cmpwi   r30, 0
/* 0D008C 800D562C 4082000C */  bne     lbl_800D5638
/* 0D0090 800D5630 48000B01 */  bl      TRKInitializeSerialHandler
/* 0D0094 800D5634 7C7E1B78 */  mr      r30, r3
lbl_800D5638:
/* 0D0098 800D5638 2C1E0000 */  cmpwi   r30, 0
/* 0D009C 800D563C 4082000C */  bne     lbl_800D5648
/* 0D00A0 800D5640 48003B59 */  bl      TRKInitializeTarget
/* 0D00A4 800D5644 7C7E1B78 */  mr      r30, r3
lbl_800D5648:
/* 0D00A8 800D5648 7FC3F378 */  mr      r3, r30
/* 0D00AC 800D564C 83E1000C */  lwz     r31, 0xc(r1)
/* 0D00B0 800D5650 83C10008 */  lwz     r30, 8(r1)
/* 0D00B4 800D5654 38210010 */  addi    r1, r1, 0x10
/* 0D00B8 800D5658 80010004 */  lwz     r0, 4(r1)
/* 0D00BC 800D565C 7C0803A6 */  mtlr    r0
/* 0D00C0 800D5660 4E800020 */  blr     

glabel TRKTerminateNub
/* 0D00C4 800D5664 7C0802A6 */  mflr    r0
/* 0D00C8 800D5668 90010004 */  stw     r0, 4(r1)
/* 0D00CC 800D566C 9421FFF8 */  stwu    r1, -8(r1)
/* 0D00D0 800D5670 48000AE5 */  bl      TRKTerminateSerialHandler
/* 0D00D4 800D5674 38600000 */  li      r3, 0
/* 0D00D8 800D5678 38210008 */  addi    r1, r1, 8
/* 0D00DC 800D567C 80010004 */  lwz     r0, 4(r1)
/* 0D00E0 800D5680 7C0803A6 */  mtlr    r0
/* 0D00E4 800D5684 4E800020 */  blr     

glabel TRKNubWelcome
/* 0D00E8 800D5688 7C0802A6 */  mflr    r0
/* 0D00EC 800D568C 3C60800E */  lis     r3, D_800DF410@ha
/* 0D00F0 800D5690 90010004 */  stw     r0, 4(r1)
/* 0D00F4 800D5694 3863F410 */  addi    r3, r3, D_800DF410@l
/* 0D00F8 800D5698 9421FFF8 */  stwu    r1, -8(r1)
/* 0D00FC 800D569C 48004231 */  bl      TRK_board_display
/* 0D0100 800D56A0 38210008 */  addi    r1, r1, 8
/* 0D0104 800D56A4 80010004 */  lwz     r0, 4(r1)
/* 0D0108 800D56A8 7C0803A6 */  mtlr    r0
/* 0D010C 800D56AC 4E800020 */  blr     

glabel TRKInitializeEndian
/* 0D0110 800D56B0 3C608014 */  lis     r3, gTRKBigEndian@ha
/* 0D0114 800D56B4 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D0118 800D56B8 38A32878 */  addi    r5, r3, gTRKBigEndian@l
/* 0D011C 800D56BC 38C00001 */  li      r6, 1
/* 0D0120 800D56C0 90C50000 */  stw     r6, 0(r5)
/* 0D0124 800D56C4 38000012 */  li      r0, 0x12
/* 0D0128 800D56C8 38600034 */  li      r3, 0x34
/* 0D012C 800D56CC 98010008 */  stb     r0, 8(r1)
/* 0D0130 800D56D0 38800056 */  li      r4, 0x56
/* 0D0134 800D56D4 38000078 */  li      r0, 0x78
/* 0D0138 800D56D8 98610009 */  stb     r3, 9(r1)
/* 0D013C 800D56DC 38600000 */  li      r3, 0
/* 0D0140 800D56E0 9881000A */  stb     r4, 0xa(r1)
/* 0D0144 800D56E4 9801000B */  stb     r0, 0xb(r1)
/* 0D0148 800D56E8 80810008 */  lwz     r4, 8(r1)
/* 0D014C 800D56EC 3C04EDCC */  addis   r0, r4, 0xedcc
/* 0D0150 800D56F0 28005678 */  cmplwi  r0, 0x5678
/* 0D0154 800D56F4 4082000C */  bne     lbl_800D5700
/* 0D0158 800D56F8 90C50000 */  stw     r6, 0(r5)
/* 0D015C 800D56FC 48000020 */  b       lbl_800D571C
lbl_800D5700:
/* 0D0160 800D5700 3C0487AA */  addis   r0, r4, 0x87aa
/* 0D0164 800D5704 28003412 */  cmplwi  r0, 0x3412
/* 0D0168 800D5708 40820010 */  bne     lbl_800D5718
/* 0D016C 800D570C 38000000 */  li      r0, 0
/* 0D0170 800D5710 90050000 */  stw     r0, 0(r5)
/* 0D0174 800D5714 48000008 */  b       lbl_800D571C
lbl_800D5718:
/* 0D0178 800D5718 38600001 */  li      r3, 1
lbl_800D571C:
/* 0D017C 800D571C 38210010 */  addi    r1, r1, 0x10
/* 0D0180 800D5720 4E800020 */  blr     


.section .rodata, "a"

.balign 8

/* 000DC490 800DF410 001A */
D_800DF410:
    .asciz "MetroTRK for Dolphin v0.5"


.section .bss, "wa"

.balign 4

/* 0013F8F8 80142878 0004 */
glabel gTRKBigEndian
    .skip 4


