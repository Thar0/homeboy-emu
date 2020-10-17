# serpoll.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKTestForPacket
/* 0D09F4 800D5F94 7C0802A6 */  mflr    r0
/* 0D09F8 800D5F98 90010004 */  stw     r0, 4(r1)
/* 0D09FC 800D5F9C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0A00 800D5FA0 93E10014 */  stw     r31, 0x14(r1)
/* 0D0A04 800D5FA4 93C10010 */  stw     r30, 0x10(r1)
/* 0D0A08 800D5FA8 4800380D */  bl      TRKPollUART
/* 0D0A0C 800D5FAC 7C7E1B79 */  or.     r30, r3, r3
/* 0D0A10 800D5FB0 40810088 */  ble     lbl_800D6038
/* 0D0A14 800D5FB4 38610008 */  addi    r3, r1, 8
/* 0D0A18 800D5FB8 3881000C */  addi    r4, r1, 0xc
/* 0D0A1C 800D5FBC 4BFFF811 */  bl      TRKGetFreeBuffer
/* 0D0A20 800D5FC0 2C1E0880 */  cmpwi   r30, 0x880
/* 0D0A24 800D5FC4 4081004C */  ble     lbl_800D6010
/* 0D0A28 800D5FC8 4800002C */  b       lbl_800D5FF4
lbl_800D5FCC:
/* 0D0A2C 800D5FCC 2C1E0880 */  cmpwi   r30, 0x880
/* 0D0A30 800D5FD0 4081000C */  ble     lbl_800D5FDC
/* 0D0A34 800D5FD4 3BE00880 */  li      r31, 0x880
/* 0D0A38 800D5FD8 48000008 */  b       lbl_800D5FE0
lbl_800D5FDC:
/* 0D0A3C 800D5FDC 7FDFF378 */  mr      r31, r30
lbl_800D5FE0:
/* 0D0A40 800D5FE0 8061000C */  lwz     r3, 0xc(r1)
/* 0D0A44 800D5FE4 389F0000 */  addi    r4, r31, 0
/* 0D0A48 800D5FE8 38630010 */  addi    r3, r3, 0x10
/* 0D0A4C 800D5FEC 480037F9 */  bl      TRK_ReadUARTN
/* 0D0A50 800D5FF0 7FDFF050 */  subf    r30, r31, r30
lbl_800D5FF4:
/* 0D0A54 800D5FF4 2C1E0000 */  cmpwi   r30, 0
/* 0D0A58 800D5FF8 4181FFD4 */  bgt     lbl_800D5FCC
/* 0D0A5C 800D5FFC 8061000C */  lwz     r3, 0xc(r1)
/* 0D0A60 800D6000 388000FF */  li      r4, 0xff
/* 0D0A64 800D6004 38A00006 */  li      r5, 6
/* 0D0A68 800D6008 480002D9 */  bl      TRKStandardACK
/* 0D0A6C 800D600C 4800002C */  b       lbl_800D6038
lbl_800D6010:
/* 0D0A70 800D6010 8061000C */  lwz     r3, 0xc(r1)
/* 0D0A74 800D6014 389E0000 */  addi    r4, r30, 0
/* 0D0A78 800D6018 38630010 */  addi    r3, r3, 0x10
/* 0D0A7C 800D601C 480037C9 */  bl      TRK_ReadUARTN
/* 0D0A80 800D6020 2C030000 */  cmpwi   r3, 0
/* 0D0A84 800D6024 40820014 */  bne     lbl_800D6038
/* 0D0A88 800D6028 8061000C */  lwz     r3, 0xc(r1)
/* 0D0A8C 800D602C 93C30008 */  stw     r30, 8(r3)
/* 0D0A90 800D6030 80610008 */  lwz     r3, 8(r1)
/* 0D0A94 800D6034 48000018 */  b       lbl_800D604C
lbl_800D6038:
/* 0D0A98 800D6038 80610008 */  lwz     r3, 8(r1)
/* 0D0A9C 800D603C 2C03FFFF */  cmpwi   r3, -1
/* 0D0AA0 800D6040 41820008 */  beq     lbl_800D6048
/* 0D0AA4 800D6044 4BFFF851 */  bl      TRKReleaseBuffer
lbl_800D6048:
/* 0D0AA8 800D6048 3860FFFF */  li      r3, -1
lbl_800D604C:
/* 0D0AAC 800D604C 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0AB0 800D6050 83C10010 */  lwz     r30, 0x10(r1)
/* 0D0AB4 800D6054 38210018 */  addi    r1, r1, 0x18
/* 0D0AB8 800D6058 80010004 */  lwz     r0, 4(r1)
/* 0D0ABC 800D605C 7C0803A6 */  mtlr    r0
/* 0D0AC0 800D6060 4E800020 */  blr     

glabel TRKGetInput
/* 0D0AC4 800D6064 7C0802A6 */  mflr    r0
/* 0D0AC8 800D6068 90010004 */  stw     r0, 4(r1)
/* 0D0ACC 800D606C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0AD0 800D6070 93E10014 */  stw     r31, 0x14(r1)
/* 0D0AD4 800D6074 93C10010 */  stw     r30, 0x10(r1)
/* 0D0AD8 800D6078 4BFFFF1D */  bl      TRKTestForPacket
/* 0D0ADC 800D607C 3BC30000 */  addi    r30, r3, 0
/* 0D0AE0 800D6080 2C1EFFFF */  cmpwi   r30, -1
/* 0D0AE4 800D6084 41820044 */  beq     lbl_800D60C8
/* 0D0AE8 800D6088 7FC3F378 */  mr      r3, r30
/* 0D0AEC 800D608C 4BFFF7DD */  bl      TRKGetBuffer
/* 0D0AF0 800D6090 3BE30000 */  addi    r31, r3, 0
/* 0D0AF4 800D6094 38800000 */  li      r4, 0
/* 0D0AF8 800D6098 4BFFF8A5 */  bl      TRKSetBufferPosition
/* 0D0AFC 800D609C 387F0000 */  addi    r3, r31, 0
/* 0D0B00 800D60A0 38810008 */  addi    r4, r1, 8
/* 0D0B04 800D60A4 4BFFFC1D */  bl      TRKReadBuffer1_ui8
/* 0D0B08 800D60A8 88010008 */  lbz     r0, 8(r1)
/* 0D0B0C 800D60AC 28000080 */  cmplwi  r0, 0x80
/* 0D0B10 800D60B0 40800010 */  bge     lbl_800D60C0
/* 0D0B14 800D60B4 7FC3F378 */  mr      r3, r30
/* 0D0B18 800D60B8 48000029 */  bl      TRKProcessInput
/* 0D0B1C 800D60BC 4800000C */  b       lbl_800D60C8
lbl_800D60C0:
/* 0D0B20 800D60C0 7FC3F378 */  mr      r3, r30
/* 0D0B24 800D60C4 4BFFF7D1 */  bl      TRKReleaseBuffer
lbl_800D60C8:
/* 0D0B28 800D60C8 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0B2C 800D60CC 83C10010 */  lwz     r30, 0x10(r1)
/* 0D0B30 800D60D0 38210018 */  addi    r1, r1, 0x18
/* 0D0B34 800D60D4 80010004 */  lwz     r0, 4(r1)
/* 0D0B38 800D60D8 7C0803A6 */  mtlr    r0
/* 0D0B3C 800D60DC 4E800020 */  blr     

glabel TRKProcessInput
/* 0D0B40 800D60E0 7C0802A6 */  mflr    r0
/* 0D0B44 800D60E4 38800002 */  li      r4, 2
/* 0D0B48 800D60E8 90010004 */  stw     r0, 4(r1)
/* 0D0B4C 800D60EC 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D0B50 800D60F0 93E10014 */  stw     r31, 0x14(r1)
/* 0D0B54 800D60F4 3BE30000 */  addi    r31, r3, 0
/* 0D0B58 800D60F8 38610008 */  addi    r3, r1, 8
/* 0D0B5C 800D60FC 4BFFF459 */  bl      TRKConstructEvent
/* 0D0B60 800D6100 3C608014 */  lis     r3, gTRKFramingState@ha
/* 0D0B64 800D6104 93E10010 */  stw     r31, 0x10(r1)
/* 0D0B68 800D6108 38834230 */  addi    r4, r3, gTRKFramingState@l
/* 0D0B6C 800D610C 38610008 */  addi    r3, r1, 8
/* 0D0B70 800D6110 3800FFFF */  li      r0, -1
/* 0D0B74 800D6114 90040000 */  stw     r0, 0(r4)
/* 0D0B78 800D6118 4BFFF35D */  bl      TRKPostEvent
/* 0D0B7C 800D611C 83E10014 */  lwz     r31, 0x14(r1)
/* 0D0B80 800D6120 38210018 */  addi    r1, r1, 0x18
/* 0D0B84 800D6124 80010004 */  lwz     r0, 4(r1)
/* 0D0B88 800D6128 7C0803A6 */  mtlr    r0
/* 0D0B8C 800D612C 4E800020 */  blr     

glabel TRKInitializeSerialHandler
/* 0D0B90 800D6130 3C608014 */  lis     r3, gTRKFramingState@ha
/* 0D0B94 800D6134 38834230 */  addi    r4, r3, gTRKFramingState@l
/* 0D0B98 800D6138 3800FFFF */  li      r0, -1
/* 0D0B9C 800D613C 90040000 */  stw     r0, 0(r4)
/* 0D0BA0 800D6140 38000000 */  li      r0, 0
/* 0D0BA4 800D6144 38600000 */  li      r3, 0
/* 0D0BA8 800D6148 98040008 */  stb     r0, 8(r4)
/* 0D0BAC 800D614C 9004000C */  stw     r0, 0xc(r4)
/* 0D0BB0 800D6150 4E800020 */  blr     

glabel TRKTerminateSerialHandler
/* 0D0BB4 800D6154 38600000 */  li      r3, 0
/* 0D0BB8 800D6158 4E800020 */  blr     


.section .bss, "wa"

.balign 4

/* 001412B0 80144230 0014 */
gTRKFramingState:
    .skip 20

.balign 4

/* 001412C4 80144244 0004 */
glabel gTRKInputPendingPtr
    .skip 4


