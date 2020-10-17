# OSAlloc.c
.include "macros.inc"

.section .text, "ax"

.balign 4

DLInsert:
/* 0A32EC 800A888C 38E30000 */  addi    r7, r3, 0
/* 0A32F0 800A8890 38C00000 */  li      r6, 0
/* 0A32F4 800A8894 48000014 */  b       lbl_800A88A8
lbl_800A8898:
/* 0A32F8 800A8898 7C043840 */  cmplw   r4, r7
/* 0A32FC 800A889C 40810014 */  ble     lbl_800A88B0
/* 0A3300 800A88A0 7CE63B78 */  mr      r6, r7
/* 0A3304 800A88A4 80E70004 */  lwz     r7, 4(r7)
lbl_800A88A8:
/* 0A3308 800A88A8 28070000 */  cmplwi  r7, 0
/* 0A330C 800A88AC 4082FFEC */  bne     lbl_800A8898
lbl_800A88B0:
/* 0A3310 800A88B0 90E40004 */  stw     r7, 4(r4)
/* 0A3314 800A88B4 28070000 */  cmplwi  r7, 0
/* 0A3318 800A88B8 90C40000 */  stw     r6, 0(r4)
/* 0A331C 800A88BC 41820038 */  beq     lbl_800A88F4
/* 0A3320 800A88C0 90870000 */  stw     r4, 0(r7)
/* 0A3324 800A88C4 80A40008 */  lwz     r5, 8(r4)
/* 0A3328 800A88C8 7C042A14 */  add     r0, r4, r5
/* 0A332C 800A88CC 7C003840 */  cmplw   r0, r7
/* 0A3330 800A88D0 40820024 */  bne     lbl_800A88F4
/* 0A3334 800A88D4 80070008 */  lwz     r0, 8(r7)
/* 0A3338 800A88D8 7C050214 */  add     r0, r5, r0
/* 0A333C 800A88DC 90040008 */  stw     r0, 8(r4)
/* 0A3340 800A88E0 80E70004 */  lwz     r7, 4(r7)
/* 0A3344 800A88E4 28070000 */  cmplwi  r7, 0
/* 0A3348 800A88E8 90E40004 */  stw     r7, 4(r4)
/* 0A334C 800A88EC 41820008 */  beq     lbl_800A88F4
/* 0A3350 800A88F0 90870000 */  stw     r4, 0(r7)
lbl_800A88F4:
/* 0A3354 800A88F4 28060000 */  cmplwi  r6, 0
/* 0A3358 800A88F8 41820038 */  beq     lbl_800A8930
/* 0A335C 800A88FC 90860004 */  stw     r4, 4(r6)
/* 0A3360 800A8900 80A60008 */  lwz     r5, 8(r6)
/* 0A3364 800A8904 7C062A14 */  add     r0, r6, r5
/* 0A3368 800A8908 7C002040 */  cmplw   r0, r4
/* 0A336C 800A890C 4C820020 */  bnelr   
/* 0A3370 800A8910 80040008 */  lwz     r0, 8(r4)
/* 0A3374 800A8914 28070000 */  cmplwi  r7, 0
/* 0A3378 800A8918 7C050214 */  add     r0, r5, r0
/* 0A337C 800A891C 90060008 */  stw     r0, 8(r6)
/* 0A3380 800A8920 90E60004 */  stw     r7, 4(r6)
/* 0A3384 800A8924 4D820020 */  beqlr   
/* 0A3388 800A8928 90C70000 */  stw     r6, 0(r7)
/* 0A338C 800A892C 4E800020 */  blr     
lbl_800A8930:
/* 0A3390 800A8930 7C832378 */  mr      r3, r4
/* 0A3394 800A8934 4E800020 */  blr     

glabel OSAllocFromHeap
/* 0A3398 800A8938 1C03000C */  mulli   r0, r3, 0xc
/* 0A339C 800A893C 806D9100 */  lwz     r3, HeapArray-_SDA_BASE_(r13)
/* 0A33A0 800A8940 7CA30214 */  add     r5, r3, r0
/* 0A33A4 800A8944 3804003F */  addi    r0, r4, 0x3f
/* 0A33A8 800A8948 80C50004 */  lwz     r6, 4(r5)
/* 0A33AC 800A894C 54030034 */  rlwinm  r3, r0, 0, 0, 0x1a
/* 0A33B0 800A8950 48000014 */  b       lbl_800A8964
lbl_800A8954:
/* 0A33B4 800A8954 80060008 */  lwz     r0, 8(r6)
/* 0A33B8 800A8958 7C030000 */  cmpw    r3, r0
/* 0A33BC 800A895C 40810010 */  ble     lbl_800A896C
/* 0A33C0 800A8960 80C60004 */  lwz     r6, 4(r6)
lbl_800A8964:
/* 0A33C4 800A8964 28060000 */  cmplwi  r6, 0
/* 0A33C8 800A8968 4082FFEC */  bne     lbl_800A8954
lbl_800A896C:
/* 0A33CC 800A896C 28060000 */  cmplwi  r6, 0
/* 0A33D0 800A8970 4082000C */  bne     lbl_800A897C
/* 0A33D4 800A8974 38600000 */  li      r3, 0
/* 0A33D8 800A8978 4E800020 */  blr     
lbl_800A897C:
/* 0A33DC 800A897C 80060008 */  lwz     r0, 8(r6)
/* 0A33E0 800A8980 7C030050 */  subf    r0, r3, r0
/* 0A33E4 800A8984 28000040 */  cmplwi  r0, 0x40
/* 0A33E8 800A8988 40800040 */  bge     lbl_800A89C8
/* 0A33EC 800A898C 80860004 */  lwz     r4, 4(r6)
/* 0A33F0 800A8990 80650004 */  lwz     r3, 4(r5)
/* 0A33F4 800A8994 28040000 */  cmplwi  r4, 0
/* 0A33F8 800A8998 4182000C */  beq     lbl_800A89A4
/* 0A33FC 800A899C 80060000 */  lwz     r0, 0(r6)
/* 0A3400 800A89A0 90040000 */  stw     r0, 0(r4)
lbl_800A89A4:
/* 0A3404 800A89A4 80860000 */  lwz     r4, 0(r6)
/* 0A3408 800A89A8 28040000 */  cmplwi  r4, 0
/* 0A340C 800A89AC 4082000C */  bne     lbl_800A89B8
/* 0A3410 800A89B0 80660004 */  lwz     r3, 4(r6)
/* 0A3414 800A89B4 4800000C */  b       lbl_800A89C0
lbl_800A89B8:
/* 0A3418 800A89B8 80060004 */  lwz     r0, 4(r6)
/* 0A341C 800A89BC 90040004 */  stw     r0, 4(r4)
lbl_800A89C0:
/* 0A3420 800A89C0 90650004 */  stw     r3, 4(r5)
/* 0A3424 800A89C4 48000048 */  b       lbl_800A8A0C
lbl_800A89C8:
/* 0A3428 800A89C8 90660008 */  stw     r3, 8(r6)
/* 0A342C 800A89CC 7C861A14 */  add     r4, r6, r3
/* 0A3430 800A89D0 90040008 */  stw     r0, 8(r4)
/* 0A3434 800A89D4 80060000 */  lwz     r0, 0(r6)
/* 0A3438 800A89D8 90040000 */  stw     r0, 0(r4)
/* 0A343C 800A89DC 80060004 */  lwz     r0, 4(r6)
/* 0A3440 800A89E0 90040004 */  stw     r0, 4(r4)
/* 0A3444 800A89E4 80640004 */  lwz     r3, 4(r4)
/* 0A3448 800A89E8 28030000 */  cmplwi  r3, 0
/* 0A344C 800A89EC 41820008 */  beq     lbl_800A89F4
/* 0A3450 800A89F0 90830000 */  stw     r4, 0(r3)
lbl_800A89F4:
/* 0A3454 800A89F4 80640000 */  lwz     r3, 0(r4)
/* 0A3458 800A89F8 28030000 */  cmplwi  r3, 0
/* 0A345C 800A89FC 4182000C */  beq     lbl_800A8A08
/* 0A3460 800A8A00 90830004 */  stw     r4, 4(r3)
/* 0A3464 800A8A04 48000008 */  b       lbl_800A8A0C
lbl_800A8A08:
/* 0A3468 800A8A08 90850004 */  stw     r4, 4(r5)
lbl_800A8A0C:
/* 0A346C 800A8A0C 80650008 */  lwz     r3, 8(r5)
/* 0A3470 800A8A10 38000000 */  li      r0, 0
/* 0A3474 800A8A14 90660004 */  stw     r3, 4(r6)
/* 0A3478 800A8A18 28030000 */  cmplwi  r3, 0
/* 0A347C 800A8A1C 90060000 */  stw     r0, 0(r6)
/* 0A3480 800A8A20 41820008 */  beq     lbl_800A8A28
/* 0A3484 800A8A24 90C30000 */  stw     r6, 0(r3)
lbl_800A8A28:
/* 0A3488 800A8A28 90C50008 */  stw     r6, 8(r5)
/* 0A348C 800A8A2C 38660020 */  addi    r3, r6, 0x20
/* 0A3490 800A8A30 4E800020 */  blr     

glabel OSFreeToHeap
/* 0A3494 800A8A34 7C0802A6 */  mflr    r0
/* 0A3498 800A8A38 38C4FFE0 */  addi    r6, r4, -32
/* 0A349C 800A8A3C 90010004 */  stw     r0, 4(r1)
/* 0A34A0 800A8A40 1C03000C */  mulli   r0, r3, 0xc
/* 0A34A4 800A8A44 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0A34A8 800A8A48 93E10014 */  stw     r31, 0x14(r1)
/* 0A34AC 800A8A4C 808D9100 */  lwz     r4, HeapArray-_SDA_BASE_(r13)
/* 0A34B0 800A8A50 80660004 */  lwz     r3, 4(r6)
/* 0A34B4 800A8A54 7FE40214 */  add     r31, r4, r0
/* 0A34B8 800A8A58 28030000 */  cmplwi  r3, 0
/* 0A34BC 800A8A5C 80BF0008 */  lwz     r5, 8(r31)
/* 0A34C0 800A8A60 7CC43378 */  mr      r4, r6
/* 0A34C4 800A8A64 4182000C */  beq     lbl_800A8A70
/* 0A34C8 800A8A68 80040000 */  lwz     r0, 0(r4)
/* 0A34CC 800A8A6C 90030000 */  stw     r0, 0(r3)
lbl_800A8A70:
/* 0A34D0 800A8A70 80640000 */  lwz     r3, 0(r4)
/* 0A34D4 800A8A74 28030000 */  cmplwi  r3, 0
/* 0A34D8 800A8A78 4082000C */  bne     lbl_800A8A84
/* 0A34DC 800A8A7C 80A40004 */  lwz     r5, 4(r4)
/* 0A34E0 800A8A80 4800000C */  b       lbl_800A8A8C
lbl_800A8A84:
/* 0A34E4 800A8A84 80040004 */  lwz     r0, 4(r4)
/* 0A34E8 800A8A88 90030004 */  stw     r0, 4(r3)
lbl_800A8A8C:
/* 0A34EC 800A8A8C 90BF0008 */  stw     r5, 8(r31)
/* 0A34F0 800A8A90 807F0004 */  lwz     r3, 4(r31)
/* 0A34F4 800A8A94 4BFFFDF9 */  bl      DLInsert
/* 0A34F8 800A8A98 907F0004 */  stw     r3, 4(r31)
/* 0A34FC 800A8A9C 8001001C */  lwz     r0, 0x1c(r1)
/* 0A3500 800A8AA0 83E10014 */  lwz     r31, 0x14(r1)
/* 0A3504 800A8AA4 38210018 */  addi    r1, r1, 0x18
/* 0A3508 800A8AA8 7C0803A6 */  mtlr    r0
/* 0A350C 800A8AAC 4E800020 */  blr     

glabel OSSetCurrentHeap
/* 0A3510 800A8AB0 800D8D00 */  lwz     r0, __OSCurrHeap-_SDA_BASE_(r13)
/* 0A3514 800A8AB4 906D8D00 */  stw     r3, __OSCurrHeap-_SDA_BASE_(r13)
/* 0A3518 800A8AB8 7C030378 */  mr      r3, r0
/* 0A351C 800A8ABC 4E800020 */  blr     

glabel OSInitAlloc
/* 0A3520 800A8AC0 1CE5000C */  mulli   r7, r5, 0xc
/* 0A3524 800A8AC4 906D9100 */  stw     r3, HeapArray-_SDA_BASE_(r13)
/* 0A3528 800A8AC8 90AD9104 */  stw     r5, NumHeaps-_SDA_BASE_(r13)
/* 0A352C 800A8ACC 38C00000 */  li      r6, 0
/* 0A3530 800A8AD0 38660000 */  addi    r3, r6, 0
/* 0A3534 800A8AD4 39000000 */  li      r8, 0
/* 0A3538 800A8AD8 38A0FFFF */  li      r5, -1
/* 0A353C 800A8ADC 48000020 */  b       lbl_800A8AFC
lbl_800A8AE0:
/* 0A3540 800A8AE0 800D9100 */  lwz     r0, HeapArray-_SDA_BASE_(r13)
/* 0A3544 800A8AE4 39080001 */  addi    r8, r8, 1
/* 0A3548 800A8AE8 7D203214 */  add     r9, r0, r6
/* 0A354C 800A8AEC 90A90000 */  stw     r5, 0(r9)
/* 0A3550 800A8AF0 38C6000C */  addi    r6, r6, 0xc
/* 0A3554 800A8AF4 90690008 */  stw     r3, 8(r9)
/* 0A3558 800A8AF8 90690004 */  stw     r3, 4(r9)
lbl_800A8AFC:
/* 0A355C 800A8AFC 800D9104 */  lwz     r0, NumHeaps-_SDA_BASE_(r13)
/* 0A3560 800A8B00 7C080000 */  cmpw    r8, r0
/* 0A3564 800A8B04 4180FFDC */  blt     lbl_800A8AE0
/* 0A3568 800A8B08 806D9100 */  lwz     r3, HeapArray-_SDA_BASE_(r13)
/* 0A356C 800A8B0C 54800034 */  rlwinm  r0, r4, 0, 0, 0x1a
/* 0A3570 800A8B10 3880FFFF */  li      r4, -1
/* 0A3574 800A8B14 900D910C */  stw     r0, ArenaEnd-_SDA_BASE_(r13)
/* 0A3578 800A8B18 7C633A14 */  add     r3, r3, r7
/* 0A357C 800A8B1C 3803001F */  addi    r0, r3, 0x1f
/* 0A3580 800A8B20 908D8D00 */  stw     r4, __OSCurrHeap-_SDA_BASE_(r13)
/* 0A3584 800A8B24 54030034 */  rlwinm  r3, r0, 0, 0, 0x1a
/* 0A3588 800A8B28 906D9108 */  stw     r3, ArenaStart-_SDA_BASE_(r13)
/* 0A358C 800A8B2C 4E800020 */  blr     

glabel OSCreateHeap
/* 0A3590 800A8B30 80CD9104 */  lwz     r6, NumHeaps-_SDA_BASE_(r13)
/* 0A3594 800A8B34 3803001F */  addi    r0, r3, 0x1f
/* 0A3598 800A8B38 80AD9100 */  lwz     r5, HeapArray-_SDA_BASE_(r13)
/* 0A359C 800A8B3C 54070034 */  rlwinm  r7, r0, 0, 0, 0x1a
/* 0A35A0 800A8B40 2C060000 */  cmpwi   r6, 0
/* 0A35A4 800A8B44 7CC903A6 */  mtctr   r6
/* 0A35A8 800A8B48 54840034 */  rlwinm  r4, r4, 0, 0, 0x1a
/* 0A35AC 800A8B4C 38600000 */  li      r3, 0
/* 0A35B0 800A8B50 40810044 */  ble     lbl_800A8B94
lbl_800A8B54:
/* 0A35B4 800A8B54 80050000 */  lwz     r0, 0(r5)
/* 0A35B8 800A8B58 2C000000 */  cmpwi   r0, 0
/* 0A35BC 800A8B5C 4080002C */  bge     lbl_800A8B88
/* 0A35C0 800A8B60 7C072050 */  subf    r0, r7, r4
/* 0A35C4 800A8B64 90050000 */  stw     r0, 0(r5)
/* 0A35C8 800A8B68 38800000 */  li      r4, 0
/* 0A35CC 800A8B6C 90870000 */  stw     r4, 0(r7)
/* 0A35D0 800A8B70 90870004 */  stw     r4, 4(r7)
/* 0A35D4 800A8B74 80050000 */  lwz     r0, 0(r5)
/* 0A35D8 800A8B78 90070008 */  stw     r0, 8(r7)
/* 0A35DC 800A8B7C 90E50004 */  stw     r7, 4(r5)
/* 0A35E0 800A8B80 90850008 */  stw     r4, 8(r5)
/* 0A35E4 800A8B84 4E800020 */  blr     
lbl_800A8B88:
/* 0A35E8 800A8B88 38A5000C */  addi    r5, r5, 0xc
/* 0A35EC 800A8B8C 38630001 */  addi    r3, r3, 1
/* 0A35F0 800A8B90 4200FFC4 */  bdnz    lbl_800A8B54
lbl_800A8B94:
/* 0A35F4 800A8B94 3860FFFF */  li      r3, -1
/* 0A35F8 800A8B98 4E800020 */  blr     

glabel OSCheckHeap
/* 0A35FC 800A8B9C 7C0802A6 */  mflr    r0
/* 0A3600 800A8BA0 3C808010 */  lis     r4, D_800FE880@ha
/* 0A3604 800A8BA4 90010004 */  stw     r0, 4(r1)
/* 0A3608 800A8BA8 38C4E880 */  addi    r6, r4, D_800FE880@l
/* 0A360C 800A8BAC 38000000 */  li      r0, 0
/* 0A3610 800A8BB0 9421FFF8 */  stwu    r1, -8(r1)
/* 0A3614 800A8BB4 38800000 */  li      r4, 0
/* 0A3618 800A8BB8 80ED9100 */  lwz     r7, HeapArray-_SDA_BASE_(r13)
/* 0A361C 800A8BBC 28070000 */  cmplwi  r7, 0
/* 0A3620 800A8BC0 4082001C */  bne     lbl_800A8BDC
/* 0A3624 800A8BC4 38660000 */  addi    r3, r6, 0
/* 0A3628 800A8BC8 4CC63182 */  crclr   6
/* 0A362C 800A8BCC 3880037D */  li      r4, 0x37d
/* 0A3630 800A8BD0 4800149D */  bl      OSReport
/* 0A3634 800A8BD4 3860FFFF */  li      r3, -1
/* 0A3638 800A8BD8 48000314 */  b       lbl_800A8EEC
lbl_800A8BDC:
/* 0A363C 800A8BDC 2C030000 */  cmpwi   r3, 0
/* 0A3640 800A8BE0 41800010 */  blt     lbl_800A8BF0
/* 0A3644 800A8BE4 80AD9104 */  lwz     r5, NumHeaps-_SDA_BASE_(r13)
/* 0A3648 800A8BE8 7C032800 */  cmpw    r3, r5
/* 0A364C 800A8BEC 4180001C */  blt     lbl_800A8C08
lbl_800A8BF0:
/* 0A3650 800A8BF0 38660024 */  addi    r3, r6, 0x24
/* 0A3654 800A8BF4 4CC63182 */  crclr   6
/* 0A3658 800A8BF8 3880037E */  li      r4, 0x37e
/* 0A365C 800A8BFC 48001471 */  bl      OSReport
/* 0A3660 800A8C00 3860FFFF */  li      r3, -1
/* 0A3664 800A8C04 480002E8 */  b       lbl_800A8EEC
lbl_800A8C08:
/* 0A3668 800A8C08 1C63000C */  mulli   r3, r3, 0xc
/* 0A366C 800A8C0C 7CA71A14 */  add     r5, r7, r3
/* 0A3670 800A8C10 80650000 */  lwz     r3, 0(r5)
/* 0A3674 800A8C14 2C030000 */  cmpwi   r3, 0
/* 0A3678 800A8C18 4080001C */  bge     lbl_800A8C34
/* 0A367C 800A8C1C 3866005C */  addi    r3, r6, 0x5c
/* 0A3680 800A8C20 4CC63182 */  crclr   6
/* 0A3684 800A8C24 38800381 */  li      r4, 0x381
/* 0A3688 800A8C28 48001445 */  bl      OSReport
/* 0A368C 800A8C2C 3860FFFF */  li      r3, -1
/* 0A3690 800A8C30 480002BC */  b       lbl_800A8EEC
lbl_800A8C34:
/* 0A3694 800A8C34 80E50008 */  lwz     r7, 8(r5)
/* 0A3698 800A8C38 28070000 */  cmplwi  r7, 0
/* 0A369C 800A8C3C 41820028 */  beq     lbl_800A8C64
/* 0A36A0 800A8C40 80670000 */  lwz     r3, 0(r7)
/* 0A36A4 800A8C44 28030000 */  cmplwi  r3, 0
/* 0A36A8 800A8C48 4182001C */  beq     lbl_800A8C64
/* 0A36AC 800A8C4C 38660084 */  addi    r3, r6, 0x84
/* 0A36B0 800A8C50 4CC63182 */  crclr   6
/* 0A36B4 800A8C54 38800383 */  li      r4, 0x383
/* 0A36B8 800A8C58 48001415 */  bl      OSReport
/* 0A36BC 800A8C5C 3860FFFF */  li      r3, -1
/* 0A36C0 800A8C60 4800028C */  b       lbl_800A8EEC
lbl_800A8C64:
/* 0A36C4 800A8C64 812D9108 */  lwz     r9, ArenaStart-_SDA_BASE_(r13)
/* 0A36C8 800A8C68 7CE83B78 */  mr      r8, r7
/* 0A36CC 800A8C6C 814D910C */  lwz     r10, ArenaEnd-_SDA_BASE_(r13)
/* 0A36D0 800A8C70 480000F0 */  b       lbl_800A8D60
lbl_800A8C74:
/* 0A36D4 800A8C74 7C094040 */  cmplw   r9, r8
/* 0A36D8 800A8C78 4181000C */  bgt     lbl_800A8C84
/* 0A36DC 800A8C7C 7C085040 */  cmplw   r8, r10
/* 0A36E0 800A8C80 4180001C */  blt     lbl_800A8C9C
lbl_800A8C84:
/* 0A36E4 800A8C84 386600D4 */  addi    r3, r6, 0xd4
/* 0A36E8 800A8C88 4CC63182 */  crclr   6
/* 0A36EC 800A8C8C 38800386 */  li      r4, 0x386
/* 0A36F0 800A8C90 480013DD */  bl      OSReport
/* 0A36F4 800A8C94 3860FFFF */  li      r3, -1
/* 0A36F8 800A8C98 48000254 */  b       lbl_800A8EEC
lbl_800A8C9C:
/* 0A36FC 800A8C9C 550306FF */  clrlwi. r3, r8, 0x1b
/* 0A3700 800A8CA0 4182001C */  beq     lbl_800A8CBC
/* 0A3704 800A8CA4 38660114 */  addi    r3, r6, 0x114
/* 0A3708 800A8CA8 4CC63182 */  crclr   6
/* 0A370C 800A8CAC 38800387 */  li      r4, 0x387
/* 0A3710 800A8CB0 480013BD */  bl      OSReport
/* 0A3714 800A8CB4 3860FFFF */  li      r3, -1
/* 0A3718 800A8CB8 48000234 */  b       lbl_800A8EEC
lbl_800A8CBC:
/* 0A371C 800A8CBC 80E80004 */  lwz     r7, 4(r8)
/* 0A3720 800A8CC0 28070000 */  cmplwi  r7, 0
/* 0A3724 800A8CC4 41820028 */  beq     lbl_800A8CEC
/* 0A3728 800A8CC8 80670000 */  lwz     r3, 0(r7)
/* 0A372C 800A8CCC 7C034040 */  cmplw   r3, r8
/* 0A3730 800A8CD0 4182001C */  beq     lbl_800A8CEC
/* 0A3734 800A8CD4 3866014C */  addi    r3, r6, 0x14c
/* 0A3738 800A8CD8 4CC63182 */  crclr   6
/* 0A373C 800A8CDC 38800388 */  li      r4, 0x388
/* 0A3740 800A8CE0 4800138D */  bl      OSReport
/* 0A3744 800A8CE4 3860FFFF */  li      r3, -1
/* 0A3748 800A8CE8 48000204 */  b       lbl_800A8EEC
lbl_800A8CEC:
/* 0A374C 800A8CEC 81080008 */  lwz     r8, 8(r8)
/* 0A3750 800A8CF0 28080040 */  cmplwi  r8, 0x40
/* 0A3754 800A8CF4 4080001C */  bge     lbl_800A8D10
/* 0A3758 800A8CF8 38660198 */  addi    r3, r6, 0x198
/* 0A375C 800A8CFC 4CC63182 */  crclr   6
/* 0A3760 800A8D00 38800389 */  li      r4, 0x389
/* 0A3764 800A8D04 48001369 */  bl      OSReport
/* 0A3768 800A8D08 3860FFFF */  li      r3, -1
/* 0A376C 800A8D0C 480001E0 */  b       lbl_800A8EEC
lbl_800A8D10:
/* 0A3770 800A8D10 550306FF */  clrlwi. r3, r8, 0x1b
/* 0A3774 800A8D14 4182001C */  beq     lbl_800A8D30
/* 0A3778 800A8D18 386601CC */  addi    r3, r6, 0x1cc
/* 0A377C 800A8D1C 4CC63182 */  crclr   6
/* 0A3780 800A8D20 3880038A */  li      r4, 0x38a
/* 0A3784 800A8D24 48001349 */  bl      OSReport
/* 0A3788 800A8D28 3860FFFF */  li      r3, -1
/* 0A378C 800A8D2C 480001C0 */  b       lbl_800A8EEC
lbl_800A8D30:
/* 0A3790 800A8D30 7C004215 */  add.    r0, r0, r8
/* 0A3794 800A8D34 40810010 */  ble     lbl_800A8D44
/* 0A3798 800A8D38 80650000 */  lwz     r3, 0(r5)
/* 0A379C 800A8D3C 7C001800 */  cmpw    r0, r3
/* 0A37A0 800A8D40 4081001C */  ble     lbl_800A8D5C
lbl_800A8D44:
/* 0A37A4 800A8D44 3866020C */  addi    r3, r6, 0x20c
/* 0A37A8 800A8D48 4CC63182 */  crclr   6
/* 0A37AC 800A8D4C 3880038D */  li      r4, 0x38d
/* 0A37B0 800A8D50 4800131D */  bl      OSReport
/* 0A37B4 800A8D54 3860FFFF */  li      r3, -1
/* 0A37B8 800A8D58 48000194 */  b       lbl_800A8EEC
lbl_800A8D5C:
/* 0A37BC 800A8D5C 7CE83B78 */  mr      r8, r7
lbl_800A8D60:
/* 0A37C0 800A8D60 28080000 */  cmplwi  r8, 0
/* 0A37C4 800A8D64 4082FF10 */  bne     lbl_800A8C74
/* 0A37C8 800A8D68 81650004 */  lwz     r11, 4(r5)
/* 0A37CC 800A8D6C 280B0000 */  cmplwi  r11, 0
/* 0A37D0 800A8D70 4182014C */  beq     lbl_800A8EBC
/* 0A37D4 800A8D74 806B0000 */  lwz     r3, 0(r11)
/* 0A37D8 800A8D78 28030000 */  cmplwi  r3, 0
/* 0A37DC 800A8D7C 41820140 */  beq     lbl_800A8EBC
/* 0A37E0 800A8D80 38660248 */  addi    r3, r6, 0x248
/* 0A37E4 800A8D84 4CC63182 */  crclr   6
/* 0A37E8 800A8D88 38800395 */  li      r4, 0x395
/* 0A37EC 800A8D8C 480012E1 */  bl      OSReport
/* 0A37F0 800A8D90 3860FFFF */  li      r3, -1
/* 0A37F4 800A8D94 48000158 */  b       lbl_800A8EEC
/* 0A37F8 800A8D98 48000124 */  b       lbl_800A8EBC
lbl_800A8D9C:
/* 0A37FC 800A8D9C 7C095840 */  cmplw   r9, r11
/* 0A3800 800A8DA0 4181000C */  bgt     lbl_800A8DAC
/* 0A3804 800A8DA4 7C0B5040 */  cmplw   r11, r10
/* 0A3808 800A8DA8 4180001C */  blt     lbl_800A8DC4
lbl_800A8DAC:
/* 0A380C 800A8DAC 386600D4 */  addi    r3, r6, 0xd4
/* 0A3810 800A8DB0 4CC63182 */  crclr   6
/* 0A3814 800A8DB4 38800398 */  li      r4, 0x398
/* 0A3818 800A8DB8 480012B5 */  bl      OSReport
/* 0A381C 800A8DBC 3860FFFF */  li      r3, -1
/* 0A3820 800A8DC0 4800012C */  b       lbl_800A8EEC
lbl_800A8DC4:
/* 0A3824 800A8DC4 556306FF */  clrlwi. r3, r11, 0x1b
/* 0A3828 800A8DC8 4182001C */  beq     lbl_800A8DE4
/* 0A382C 800A8DCC 38660114 */  addi    r3, r6, 0x114
/* 0A3830 800A8DD0 4CC63182 */  crclr   6
/* 0A3834 800A8DD4 38800399 */  li      r4, 0x399
/* 0A3838 800A8DD8 48001295 */  bl      OSReport
/* 0A383C 800A8DDC 3860FFFF */  li      r3, -1
/* 0A3840 800A8DE0 4800010C */  b       lbl_800A8EEC
lbl_800A8DE4:
/* 0A3844 800A8DE4 80EB0004 */  lwz     r7, 4(r11)
/* 0A3848 800A8DE8 28070000 */  cmplwi  r7, 0
/* 0A384C 800A8DEC 41820028 */  beq     lbl_800A8E14
/* 0A3850 800A8DF0 80670000 */  lwz     r3, 0(r7)
/* 0A3854 800A8DF4 7C035840 */  cmplw   r3, r11
/* 0A3858 800A8DF8 4182001C */  beq     lbl_800A8E14
/* 0A385C 800A8DFC 3866014C */  addi    r3, r6, 0x14c
/* 0A3860 800A8E00 4CC63182 */  crclr   6
/* 0A3864 800A8E04 3880039A */  li      r4, 0x39a
/* 0A3868 800A8E08 48001265 */  bl      OSReport
/* 0A386C 800A8E0C 3860FFFF */  li      r3, -1
/* 0A3870 800A8E10 480000DC */  b       lbl_800A8EEC
lbl_800A8E14:
/* 0A3874 800A8E14 810B0008 */  lwz     r8, 8(r11)
/* 0A3878 800A8E18 28080040 */  cmplwi  r8, 0x40
/* 0A387C 800A8E1C 4080001C */  bge     lbl_800A8E38
/* 0A3880 800A8E20 38660198 */  addi    r3, r6, 0x198
/* 0A3884 800A8E24 4CC63182 */  crclr   6
/* 0A3888 800A8E28 3880039B */  li      r4, 0x39b
/* 0A388C 800A8E2C 48001241 */  bl      OSReport
/* 0A3890 800A8E30 3860FFFF */  li      r3, -1
/* 0A3894 800A8E34 480000B8 */  b       lbl_800A8EEC
lbl_800A8E38:
/* 0A3898 800A8E38 550306FF */  clrlwi. r3, r8, 0x1b
/* 0A389C 800A8E3C 4182001C */  beq     lbl_800A8E58
/* 0A38A0 800A8E40 386601CC */  addi    r3, r6, 0x1cc
/* 0A38A4 800A8E44 4CC63182 */  crclr   6
/* 0A38A8 800A8E48 3880039C */  li      r4, 0x39c
/* 0A38AC 800A8E4C 48001221 */  bl      OSReport
/* 0A38B0 800A8E50 3860FFFF */  li      r3, -1
/* 0A38B4 800A8E54 48000098 */  b       lbl_800A8EEC
lbl_800A8E58:
/* 0A38B8 800A8E58 28070000 */  cmplwi  r7, 0
/* 0A38BC 800A8E5C 41820028 */  beq     lbl_800A8E84
/* 0A38C0 800A8E60 7C6B4214 */  add     r3, r11, r8
/* 0A38C4 800A8E64 7C033840 */  cmplw   r3, r7
/* 0A38C8 800A8E68 4180001C */  blt     lbl_800A8E84
/* 0A38CC 800A8E6C 38660290 */  addi    r3, r6, 0x290
/* 0A38D0 800A8E70 4CC63182 */  crclr   6
/* 0A38D4 800A8E74 3880039D */  li      r4, 0x39d
/* 0A38D8 800A8E78 480011F5 */  bl      OSReport
/* 0A38DC 800A8E7C 3860FFFF */  li      r3, -1
/* 0A38E0 800A8E80 4800006C */  b       lbl_800A8EEC
lbl_800A8E84:
/* 0A38E4 800A8E84 7C004215 */  add.    r0, r0, r8
/* 0A38E8 800A8E88 7C882214 */  add     r4, r8, r4
/* 0A38EC 800A8E8C 3884FFE0 */  addi    r4, r4, -32
/* 0A38F0 800A8E90 40810010 */  ble     lbl_800A8EA0
/* 0A38F4 800A8E94 80650000 */  lwz     r3, 0(r5)
/* 0A38F8 800A8E98 7C001800 */  cmpw    r0, r3
/* 0A38FC 800A8E9C 4081001C */  ble     lbl_800A8EB8
lbl_800A8EA0:
/* 0A3900 800A8EA0 3866020C */  addi    r3, r6, 0x20c
/* 0A3904 800A8EA4 4CC63182 */  crclr   6
/* 0A3908 800A8EA8 388003A1 */  li      r4, 0x3a1
/* 0A390C 800A8EAC 480011C1 */  bl      OSReport
/* 0A3910 800A8EB0 3860FFFF */  li      r3, -1
/* 0A3914 800A8EB4 48000038 */  b       lbl_800A8EEC
lbl_800A8EB8:
/* 0A3918 800A8EB8 7CEB3B78 */  mr      r11, r7
lbl_800A8EBC:
/* 0A391C 800A8EBC 280B0000 */  cmplwi  r11, 0
/* 0A3920 800A8EC0 4082FEDC */  bne     lbl_800A8D9C
/* 0A3924 800A8EC4 80650000 */  lwz     r3, 0(r5)
/* 0A3928 800A8EC8 7C001800 */  cmpw    r0, r3
/* 0A392C 800A8ECC 4182001C */  beq     lbl_800A8EE8
/* 0A3930 800A8ED0 386602F0 */  addi    r3, r6, 0x2f0
/* 0A3934 800A8ED4 4CC63182 */  crclr   6
/* 0A3938 800A8ED8 388003A8 */  li      r4, 0x3a8
/* 0A393C 800A8EDC 48001191 */  bl      OSReport
/* 0A3940 800A8EE0 3860FFFF */  li      r3, -1
/* 0A3944 800A8EE4 48000008 */  b       lbl_800A8EEC
lbl_800A8EE8:
/* 0A3948 800A8EE8 7C832378 */  mr      r3, r4
lbl_800A8EEC:
/* 0A394C 800A8EEC 8001000C */  lwz     r0, 0xc(r1)
/* 0A3950 800A8EF0 38210008 */  addi    r1, r1, 8
/* 0A3954 800A8EF4 7C0803A6 */  mtlr    r0
/* 0A3958 800A8EF8 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FB900 800FE880 0024 */
D_800FE880:
    .asciz "OSCheckHeap: Failed HeapArray in %d"

.balign 4

/* 000FB924 800FE8A4 0037 */
D_800FE8A4:
    .asciz "OSCheckHeap: Failed 0 <= heap && heap < NumHeaps in %d"

.balign 4

/* 000FB95C 800FE8DC 0028 */
D_800FE8DC:
    .asciz "OSCheckHeap: Failed 0 <= hd->size in %d"

.balign 4

/* 000FB984 800FE904 004F */
D_800FE904:
    .asciz "OSCheckHeap: Failed hd->allocated == NULL || hd->allocated->prev == NULL in %d"

.balign 4

/* 000FB9D4 800FE954 003E */
D_800FE954:
    .asciz "OSCheckHeap: Failed InRange(cell, ArenaStart, ArenaEnd) in %d"

.balign 4

/* 000FBA14 800FE994 0037 */
D_800FE994:
    .asciz "OSCheckHeap: Failed OFFSET(cell, ALIGNMENT) == 0 in %d"

.balign 4

/* 000FBA4C 800FE9CC 0049 */
D_800FE9CC:
    .asciz "OSCheckHeap: Failed cell->next == NULL || cell->next->prev == cell in %d"

.balign 4

/* 000FBA98 800FEA18 0033 */
D_800FEA18:
    .asciz "OSCheckHeap: Failed MINOBJSIZE <= cell->size in %d"

.balign 4

/* 000FBACC 800FEA4C 003D */
D_800FEA4C:
    .asciz "OSCheckHeap: Failed OFFSET(cell->size, ALIGNMENT) == 0 in %d"

.balign 4

/* 000FBB0C 800FEA8C 0039 */
D_800FEA8C:
    .asciz "OSCheckHeap: Failed 0 < total && total <= hd->size in %d"

.balign 4

/* 000FBB48 800FEAC8 0045 */
D_800FEAC8:
    .asciz "OSCheckHeap: Failed hd->free == NULL || hd->free->prev == NULL in %d"

.balign 4

/* 000FBB90 800FEB10 005F */
D_800FEB10:
    .asciz "OSCheckHeap: Failed cell->next == NULL || (char*) cell + cell->size < (char*) cell->next in %d"

.balign 4

/* 000FBBF0 800FEB70 002C */
D_800FEB70:
    .asciz "OSCheckHeap: Failed total == hd->size in %d"

.balign 4

/* 000FBC1C 800FEB9C 0012 */
D_800FEB9C:
    .asciz "\nOSDumpHeap(%d):\n"

.balign 4

/* 000FBC30 800FEBB0 0012 */
D_800FEBB0:
    .asciz "--------Inactive\n"

.balign 4

/* 000FBC44 800FEBC4 001A */
D_800FEBC4:
    .asciz "addr\tsize\t\tend\tprev\tnext\n"

.balign 4

/* 000FBC60 800FEBE0 0013 */
D_800FEBE0:
    .asciz "--------Allocated\n"

.balign 4

/* 000FBC74 800FEBF4 0010 */
D_800FEBF4:
    .asciz "%x\t%d\t%x\t%x\t%x\n"

.balign 4

/* 000FBC84 800FEC04 000E */
D_800FEC04:
    .asciz "--------Free\n"


.section .sdata, "wa"

.balign 8

/* 000FFF40 801456E0 0004 */
glabel __OSCurrHeap
    .long 0xFFFFFFFF


.section .sbss, "wa"

.balign 8

/* 00100340 80145AE0 0004 */
HeapArray:
    .skip 4

.balign 4

/* 00100344 80145AE4 0004 */
NumHeaps:
    .skip 4

.balign 4

/* 00100348 80145AE8 0004 */
ArenaStart:
    .skip 4

.balign 4

/* 0010034C 80145AEC 0004 */
ArenaEnd:
    .skip 4


