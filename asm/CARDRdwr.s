# CARDRdwr.c
.include "macros.inc"

.section .text, "ax"

.balign 4

BlockReadCallback:
/* 0C3E8C 800C942C 7C0802A6 */  mflr    r0
/* 0C3E90 800C9430 90010004 */  stw     r0, 4(r1)
/* 0C3E94 800C9434 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0C3E98 800C9438 93E1001C */  stw     r31, 0x1c(r1)
/* 0C3E9C 800C943C 3BE30000 */  addi    r31, r3, 0
/* 0C3EA0 800C9440 3C608014 */  lis     r3, __CARDBlock@ha
/* 0C3EA4 800C9444 93C10018 */  stw     r30, 0x18(r1)
/* 0C3EA8 800C9448 1CBF0110 */  mulli   r5, r31, 0x110
/* 0C3EAC 800C944C 93A10014 */  stw     r29, 0x14(r1)
/* 0C3EB0 800C9450 380324D0 */  addi    r0, r3, __CARDBlock@l
/* 0C3EB4 800C9454 7C9D2379 */  or.     r29, r4, r4
/* 0C3EB8 800C9458 7FC02A14 */  add     r30, r0, r5
/* 0C3EBC 800C945C 41800050 */  blt     lbl_800C94AC
/* 0C3EC0 800C9460 807E00B8 */  lwz     r3, 0xb8(r30)
/* 0C3EC4 800C9464 38030200 */  addi    r0, r3, 0x200
/* 0C3EC8 800C9468 901E00B8 */  stw     r0, 0xb8(r30)
/* 0C3ECC 800C946C 807E00B0 */  lwz     r3, 0xb0(r30)
/* 0C3ED0 800C9470 38030200 */  addi    r0, r3, 0x200
/* 0C3ED4 800C9474 901E00B0 */  stw     r0, 0xb0(r30)
/* 0C3ED8 800C9478 807E00B4 */  lwz     r3, 0xb4(r30)
/* 0C3EDC 800C947C 38030200 */  addi    r0, r3, 0x200
/* 0C3EE0 800C9480 901E00B4 */  stw     r0, 0xb4(r30)
/* 0C3EE4 800C9484 807E00AC */  lwz     r3, 0xac(r30)
/* 0C3EE8 800C9488 3403FFFF */  addic.  r0, r3, -1
/* 0C3EEC 800C948C 901E00AC */  stw     r0, 0xac(r30)
/* 0C3EF0 800C9490 4081001C */  ble     lbl_800C94AC
/* 0C3EF4 800C9494 3C60800D */  lis     r3, BlockReadCallback@ha
/* 0C3EF8 800C9498 3883942C */  addi    r4, r3, BlockReadCallback@l
/* 0C3EFC 800C949C 387F0000 */  addi    r3, r31, 0
/* 0C3F00 800C94A0 4BFFE58D */  bl      __CARDReadSegment
/* 0C3F04 800C94A4 7C7D1B79 */  or.     r29, r3, r3
/* 0C3F08 800C94A8 40800044 */  bge     lbl_800C94EC
lbl_800C94AC:
/* 0C3F0C 800C94AC 801E00D0 */  lwz     r0, 0xd0(r30)
/* 0C3F10 800C94B0 28000000 */  cmplwi  r0, 0
/* 0C3F14 800C94B4 40820010 */  bne     lbl_800C94C4
/* 0C3F18 800C94B8 387E0000 */  addi    r3, r30, 0
/* 0C3F1C 800C94BC 389D0000 */  addi    r4, r29, 0
/* 0C3F20 800C94C0 4BFFEA41 */  bl      __CARDPutControlBlock
lbl_800C94C4:
/* 0C3F24 800C94C4 801E00D4 */  lwz     r0, 0xd4(r30)
/* 0C3F28 800C94C8 28000000 */  cmplwi  r0, 0
/* 0C3F2C 800C94CC 7C0C0378 */  mr      r12, r0
/* 0C3F30 800C94D0 4182001C */  beq     lbl_800C94EC
/* 0C3F34 800C94D4 38000000 */  li      r0, 0
/* 0C3F38 800C94D8 7D8803A6 */  mtlr    r12
/* 0C3F3C 800C94DC 901E00D4 */  stw     r0, 0xd4(r30)
/* 0C3F40 800C94E0 387F0000 */  addi    r3, r31, 0
/* 0C3F44 800C94E4 389D0000 */  addi    r4, r29, 0
/* 0C3F48 800C94E8 4E800021 */  blrl    
lbl_800C94EC:
/* 0C3F4C 800C94EC 80010024 */  lwz     r0, 0x24(r1)
/* 0C3F50 800C94F0 83E1001C */  lwz     r31, 0x1c(r1)
/* 0C3F54 800C94F4 83C10018 */  lwz     r30, 0x18(r1)
/* 0C3F58 800C94F8 83A10014 */  lwz     r29, 0x14(r1)
/* 0C3F5C 800C94FC 38210020 */  addi    r1, r1, 0x20
/* 0C3F60 800C9500 7C0803A6 */  mtlr    r0
/* 0C3F64 800C9504 4E800020 */  blr     

glabel __CARDRead
/* 0C3F68 800C9508 7C0802A6 */  mflr    r0
/* 0C3F6C 800C950C 1D230110 */  mulli   r9, r3, 0x110
/* 0C3F70 800C9510 90010004 */  stw     r0, 4(r1)
/* 0C3F74 800C9514 3D008014 */  lis     r8, __CARDBlock@ha
/* 0C3F78 800C9518 9421FFF8 */  stwu    r1, -8(r1)
/* 0C3F7C 800C951C 380824D0 */  addi    r0, r8, __CARDBlock@l
/* 0C3F80 800C9520 7D004A14 */  add     r8, r0, r9
/* 0C3F84 800C9524 80080000 */  lwz     r0, 0(r8)
/* 0C3F88 800C9528 2C000000 */  cmpwi   r0, 0
/* 0C3F8C 800C952C 4082000C */  bne     lbl_800C9538
/* 0C3F90 800C9530 3860FFFD */  li      r3, -3
/* 0C3F94 800C9534 48000028 */  b       lbl_800C955C
lbl_800C9538:
/* 0C3F98 800C9538 90E800D4 */  stw     r7, 0xd4(r8)
/* 0C3F9C 800C953C 54A0BA7E */  srwi    r0, r5, 9
/* 0C3FA0 800C9540 3CA0800D */  lis     r5, BlockReadCallback@ha
/* 0C3FA4 800C9544 900800AC */  stw     r0, 0xac(r8)
/* 0C3FA8 800C9548 3805942C */  addi    r0, r5, BlockReadCallback@l
/* 0C3FAC 800C954C 908800B0 */  stw     r4, 0xb0(r8)
/* 0C3FB0 800C9550 7C040378 */  mr      r4, r0
/* 0C3FB4 800C9554 90C800B4 */  stw     r6, 0xb4(r8)
/* 0C3FB8 800C9558 4BFFE4D5 */  bl      __CARDReadSegment
lbl_800C955C:
/* 0C3FBC 800C955C 8001000C */  lwz     r0, 0xc(r1)
/* 0C3FC0 800C9560 38210008 */  addi    r1, r1, 8
/* 0C3FC4 800C9564 7C0803A6 */  mtlr    r0
/* 0C3FC8 800C9568 4E800020 */  blr     

BlockWriteCallback:
/* 0C3FCC 800C956C 7C0802A6 */  mflr    r0
/* 0C3FD0 800C9570 90010004 */  stw     r0, 4(r1)
/* 0C3FD4 800C9574 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0C3FD8 800C9578 93E1001C */  stw     r31, 0x1c(r1)
/* 0C3FDC 800C957C 3BE30000 */  addi    r31, r3, 0
/* 0C3FE0 800C9580 3C608014 */  lis     r3, __CARDBlock@ha
/* 0C3FE4 800C9584 93C10018 */  stw     r30, 0x18(r1)
/* 0C3FE8 800C9588 1CBF0110 */  mulli   r5, r31, 0x110
/* 0C3FEC 800C958C 93A10014 */  stw     r29, 0x14(r1)
/* 0C3FF0 800C9590 380324D0 */  addi    r0, r3, __CARDBlock@l
/* 0C3FF4 800C9594 7C9D2379 */  or.     r29, r4, r4
/* 0C3FF8 800C9598 7FC02A14 */  add     r30, r0, r5
/* 0C3FFC 800C959C 41800050 */  blt     lbl_800C95EC
/* 0C4000 800C95A0 807E00B8 */  lwz     r3, 0xb8(r30)
/* 0C4004 800C95A4 38030080 */  addi    r0, r3, 0x80
/* 0C4008 800C95A8 901E00B8 */  stw     r0, 0xb8(r30)
/* 0C400C 800C95AC 807E00B0 */  lwz     r3, 0xb0(r30)
/* 0C4010 800C95B0 38030080 */  addi    r0, r3, 0x80
/* 0C4014 800C95B4 901E00B0 */  stw     r0, 0xb0(r30)
/* 0C4018 800C95B8 807E00B4 */  lwz     r3, 0xb4(r30)
/* 0C401C 800C95BC 38030080 */  addi    r0, r3, 0x80
/* 0C4020 800C95C0 901E00B4 */  stw     r0, 0xb4(r30)
/* 0C4024 800C95C4 807E00AC */  lwz     r3, 0xac(r30)
/* 0C4028 800C95C8 3403FFFF */  addic.  r0, r3, -1
/* 0C402C 800C95CC 901E00AC */  stw     r0, 0xac(r30)
/* 0C4030 800C95D0 4081001C */  ble     lbl_800C95EC
/* 0C4034 800C95D4 3C60800D */  lis     r3, BlockWriteCallback@ha
/* 0C4038 800C95D8 3883956C */  addi    r4, r3, BlockWriteCallback@l
/* 0C403C 800C95DC 387F0000 */  addi    r3, r31, 0
/* 0C4040 800C95E0 4BFFE581 */  bl      __CARDWritePage
/* 0C4044 800C95E4 7C7D1B79 */  or.     r29, r3, r3
/* 0C4048 800C95E8 40800044 */  bge     lbl_800C962C
lbl_800C95EC:
/* 0C404C 800C95EC 801E00D0 */  lwz     r0, 0xd0(r30)
/* 0C4050 800C95F0 28000000 */  cmplwi  r0, 0
/* 0C4054 800C95F4 40820010 */  bne     lbl_800C9604
/* 0C4058 800C95F8 387E0000 */  addi    r3, r30, 0
/* 0C405C 800C95FC 389D0000 */  addi    r4, r29, 0
/* 0C4060 800C9600 4BFFE901 */  bl      __CARDPutControlBlock
lbl_800C9604:
/* 0C4064 800C9604 801E00D4 */  lwz     r0, 0xd4(r30)
/* 0C4068 800C9608 28000000 */  cmplwi  r0, 0
/* 0C406C 800C960C 7C0C0378 */  mr      r12, r0
/* 0C4070 800C9610 4182001C */  beq     lbl_800C962C
/* 0C4074 800C9614 38000000 */  li      r0, 0
/* 0C4078 800C9618 7D8803A6 */  mtlr    r12
/* 0C407C 800C961C 901E00D4 */  stw     r0, 0xd4(r30)
/* 0C4080 800C9620 387F0000 */  addi    r3, r31, 0
/* 0C4084 800C9624 389D0000 */  addi    r4, r29, 0
/* 0C4088 800C9628 4E800021 */  blrl    
lbl_800C962C:
/* 0C408C 800C962C 80010024 */  lwz     r0, 0x24(r1)
/* 0C4090 800C9630 83E1001C */  lwz     r31, 0x1c(r1)
/* 0C4094 800C9634 83C10018 */  lwz     r30, 0x18(r1)
/* 0C4098 800C9638 83A10014 */  lwz     r29, 0x14(r1)
/* 0C409C 800C963C 38210020 */  addi    r1, r1, 0x20
/* 0C40A0 800C9640 7C0803A6 */  mtlr    r0
/* 0C40A4 800C9644 4E800020 */  blr     

glabel __CARDWrite
/* 0C40A8 800C9648 7C0802A6 */  mflr    r0
/* 0C40AC 800C964C 1D230110 */  mulli   r9, r3, 0x110
/* 0C40B0 800C9650 90010004 */  stw     r0, 4(r1)
/* 0C40B4 800C9654 3D008014 */  lis     r8, __CARDBlock@ha
/* 0C40B8 800C9658 9421FFF8 */  stwu    r1, -8(r1)
/* 0C40BC 800C965C 380824D0 */  addi    r0, r8, __CARDBlock@l
/* 0C40C0 800C9660 7D004A14 */  add     r8, r0, r9
/* 0C40C4 800C9664 80080000 */  lwz     r0, 0(r8)
/* 0C40C8 800C9668 2C000000 */  cmpwi   r0, 0
/* 0C40CC 800C966C 4082000C */  bne     lbl_800C9678
/* 0C40D0 800C9670 3860FFFD */  li      r3, -3
/* 0C40D4 800C9674 48000028 */  b       lbl_800C969C
lbl_800C9678:
/* 0C40D8 800C9678 90E800D4 */  stw     r7, 0xd4(r8)
/* 0C40DC 800C967C 54A0C9FE */  srwi    r0, r5, 7
/* 0C40E0 800C9680 3CA0800D */  lis     r5, BlockWriteCallback@ha
/* 0C40E4 800C9684 900800AC */  stw     r0, 0xac(r8)
/* 0C40E8 800C9688 3805956C */  addi    r0, r5, BlockWriteCallback@l
/* 0C40EC 800C968C 908800B0 */  stw     r4, 0xb0(r8)
/* 0C40F0 800C9690 7C040378 */  mr      r4, r0
/* 0C40F4 800C9694 90C800B4 */  stw     r6, 0xb4(r8)
/* 0C40F8 800C9698 4BFFE4C9 */  bl      __CARDWritePage
lbl_800C969C:
/* 0C40FC 800C969C 8001000C */  lwz     r0, 0xc(r1)
/* 0C4100 800C96A0 38210008 */  addi    r1, r1, 8
/* 0C4104 800C96A4 7C0803A6 */  mtlr    r0
/* 0C4108 800C96A8 4E800020 */  blr     

glabel CARDGetXferredBytes
/* 0C410C 800C96AC 1C030110 */  mulli   r0, r3, 0x110
/* 0C4110 800C96B0 3C608014 */  lis     r3, __CARDBlock@ha
/* 0C4114 800C96B4 386324D0 */  addi    r3, r3, __CARDBlock@l
/* 0C4118 800C96B8 7C630214 */  add     r3, r3, r0
/* 0C411C 800C96BC 806300B8 */  lwz     r3, 0xb8(r3)
/* 0C4120 800C96C0 4E800020 */  blr     


