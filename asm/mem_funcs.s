# mem_funcs.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __copy_longs_rev_unaligned
/* 0D5648 800DABE8 7D832A14 */  add     r12, r3, r5
/* 0D564C 800DABEC 558007BF */  clrlwi. r0, r12, 0x1e
/* 0D5650 800DABF0 7D642A14 */  add     r11, r4, r5
/* 0D5654 800DABF4 7C030378 */  mr      r3, r0
/* 0D5658 800DABF8 41820018 */  beq     lbl_800DAC10
/* 0D565C 800DABFC 7CA32850 */  subf    r5, r3, r5
lbl_800DAC00:
/* 0D5660 800DAC00 8C0BFFFF */  lbzu    r0, -1(r11)
/* 0D5664 800DAC04 3463FFFF */  addic.  r3, r3, -1
/* 0D5668 800DAC08 9C0CFFFF */  stbu    r0, -1(r12)
/* 0D566C 800DAC0C 4082FFF4 */  bne     lbl_800DAC00
lbl_800DAC10:
/* 0D5670 800DAC10 55641EF8 */  rlwinm  r4, r11, 3, 0x1b, 0x1c
/* 0D5674 800DAC14 556907BE */  clrlwi  r9, r11, 0x1e
/* 0D5678 800DAC18 21440020 */  subfic  r10, r4, 0x20
/* 0D567C 800DAC1C 20090004 */  subfic  r0, r9, 4
/* 0D5680 800DAC20 7D6B0214 */  add     r11, r11, r0
/* 0D5684 800DAC24 84EBFFFC */  lwzu    r7, -4(r11)
/* 0D5688 800DAC28 54A6E8FE */  srwi    r6, r5, 3
lbl_800DAC2C:
/* 0D568C 800DAC2C 810BFFFC */  lwz     r8, -4(r11)
/* 0D5690 800DAC30 7CE05430 */  srw     r0, r7, r10
/* 0D5694 800DAC34 34C6FFFF */  addic.  r6, r6, -1
/* 0D5698 800DAC38 7D032030 */  slw     r3, r8, r4
/* 0D569C 800DAC3C 7C600378 */  or      r0, r3, r0
/* 0D56A0 800DAC40 900CFFFC */  stw     r0, -4(r12)
/* 0D56A4 800DAC44 7D005430 */  srw     r0, r8, r10
/* 0D56A8 800DAC48 84EBFFF8 */  lwzu    r7, -8(r11)
/* 0D56AC 800DAC4C 7CE32030 */  slw     r3, r7, r4
/* 0D56B0 800DAC50 7C600378 */  or      r0, r3, r0
/* 0D56B4 800DAC54 940CFFF8 */  stwu    r0, -8(r12)
/* 0D56B8 800DAC58 4082FFD4 */  bne     lbl_800DAC2C
/* 0D56BC 800DAC5C 54A0077B */  rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 0D56C0 800DAC60 41820018 */  beq     lbl_800DAC78
/* 0D56C4 800DAC64 846BFFFC */  lwzu    r3, -4(r11)
/* 0D56C8 800DAC68 7CE05430 */  srw     r0, r7, r10
/* 0D56CC 800DAC6C 7C632030 */  slw     r3, r3, r4
/* 0D56D0 800DAC70 7C600378 */  or      r0, r3, r0
/* 0D56D4 800DAC74 940CFFFC */  stwu    r0, -4(r12)
lbl_800DAC78:
/* 0D56D8 800DAC78 54A507BF */  clrlwi. r5, r5, 0x1e
/* 0D56DC 800DAC7C 4D820020 */  beqlr   
/* 0D56E0 800DAC80 7D6B4A14 */  add     r11, r11, r9
lbl_800DAC84:
/* 0D56E4 800DAC84 8C0BFFFF */  lbzu    r0, -1(r11)
/* 0D56E8 800DAC88 34A5FFFF */  addic.  r5, r5, -1
/* 0D56EC 800DAC8C 9C0CFFFF */  stbu    r0, -1(r12)
/* 0D56F0 800DAC90 4082FFF4 */  bne     lbl_800DAC84
/* 0D56F4 800DAC94 4E800020 */  blr     

glabel __copy_longs_unaligned
/* 0D56F8 800DAC98 7C0300D0 */  neg     r0, r3
/* 0D56FC 800DAC9C 540607BF */  clrlwi. r6, r0, 0x1e
/* 0D5700 800DACA0 3884FFFF */  addi    r4, r4, -1
/* 0D5704 800DACA4 3863FFFF */  addi    r3, r3, -1
/* 0D5708 800DACA8 41820018 */  beq     lbl_800DACC0
/* 0D570C 800DACAC 7CA62850 */  subf    r5, r6, r5
lbl_800DACB0:
/* 0D5710 800DACB0 8C040001 */  lbzu    r0, 1(r4)
/* 0D5714 800DACB4 34C6FFFF */  addic.  r6, r6, -1
/* 0D5718 800DACB8 9C030001 */  stbu    r0, 1(r3)
/* 0D571C 800DACBC 4082FFF4 */  bne     lbl_800DACB0
lbl_800DACC0:
/* 0D5720 800DACC0 38040001 */  addi    r0, r4, 1
/* 0D5724 800DACC4 540B07BE */  clrlwi  r11, r0, 0x1e
/* 0D5728 800DACC8 7C8B2050 */  subf    r4, r11, r4
/* 0D572C 800DACCC 3904FFFD */  addi    r8, r4, -3
/* 0D5730 800DACD0 85280004 */  lwzu    r9, 4(r8)
/* 0D5734 800DACD4 54041EF8 */  rlwinm  r4, r0, 3, 0x1b, 0x1c
/* 0D5738 800DACD8 21840020 */  subfic  r12, r4, 0x20
/* 0D573C 800DACDC 38C3FFFD */  addi    r6, r3, -3
/* 0D5740 800DACE0 54A7E8FE */  srwi    r7, r5, 3
lbl_800DACE4:
/* 0D5744 800DACE4 81480004 */  lwz     r10, 4(r8)
/* 0D5748 800DACE8 7D232030 */  slw     r3, r9, r4
/* 0D574C 800DACEC 34E7FFFF */  addic.  r7, r7, -1
/* 0D5750 800DACF0 7D406430 */  srw     r0, r10, r12
/* 0D5754 800DACF4 7C600378 */  or      r0, r3, r0
/* 0D5758 800DACF8 90060004 */  stw     r0, 4(r6)
/* 0D575C 800DACFC 7D432030 */  slw     r3, r10, r4
/* 0D5760 800DAD00 85280008 */  lwzu    r9, 8(r8)
/* 0D5764 800DAD04 7D206430 */  srw     r0, r9, r12
/* 0D5768 800DAD08 7C600378 */  or      r0, r3, r0
/* 0D576C 800DAD0C 94060008 */  stwu    r0, 8(r6)
/* 0D5770 800DAD10 4082FFD4 */  bne     lbl_800DACE4
/* 0D5774 800DAD14 54A0077B */  rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 0D5778 800DAD18 41820018 */  beq     lbl_800DAD30
/* 0D577C 800DAD1C 84080004 */  lwzu    r0, 4(r8)
/* 0D5780 800DAD20 7D232030 */  slw     r3, r9, r4
/* 0D5784 800DAD24 7C006430 */  srw     r0, r0, r12
/* 0D5788 800DAD28 7C600378 */  or      r0, r3, r0
/* 0D578C 800DAD2C 94060004 */  stwu    r0, 4(r6)
lbl_800DAD30:
/* 0D5790 800DAD30 54A507BF */  clrlwi. r5, r5, 0x1e
/* 0D5794 800DAD34 38880003 */  addi    r4, r8, 3
/* 0D5798 800DAD38 38660003 */  addi    r3, r6, 3
/* 0D579C 800DAD3C 4D820020 */  beqlr   
/* 0D57A0 800DAD40 200B0004 */  subfic  r0, r11, 4
/* 0D57A4 800DAD44 7C802050 */  subf    r4, r0, r4
lbl_800DAD48:
/* 0D57A8 800DAD48 8C040001 */  lbzu    r0, 1(r4)
/* 0D57AC 800DAD4C 34A5FFFF */  addic.  r5, r5, -1
/* 0D57B0 800DAD50 9C030001 */  stbu    r0, 1(r3)
/* 0D57B4 800DAD54 4082FFF4 */  bne     lbl_800DAD48
/* 0D57B8 800DAD58 4E800020 */  blr     

glabel __copy_longs_rev_aligned
/* 0D57BC 800DAD5C 7CC32A14 */  add     r6, r3, r5
/* 0D57C0 800DAD60 54C007BF */  clrlwi. r0, r6, 0x1e
/* 0D57C4 800DAD64 7C842A14 */  add     r4, r4, r5
/* 0D57C8 800DAD68 7C030378 */  mr      r3, r0
/* 0D57CC 800DAD6C 41820018 */  beq     lbl_800DAD84
/* 0D57D0 800DAD70 7CA32850 */  subf    r5, r3, r5
lbl_800DAD74:
/* 0D57D4 800DAD74 8C04FFFF */  lbzu    r0, -1(r4)
/* 0D57D8 800DAD78 3463FFFF */  addic.  r3, r3, -1
/* 0D57DC 800DAD7C 9C06FFFF */  stbu    r0, -1(r6)
/* 0D57E0 800DAD80 4082FFF4 */  bne     lbl_800DAD74
lbl_800DAD84:
/* 0D57E4 800DAD84 54A3D97F */  rlwinm. r3, r5, 0x1b, 5, 0x1f
/* 0D57E8 800DAD88 4182004C */  beq     lbl_800DADD4
lbl_800DAD8C:
/* 0D57EC 800DAD8C 8004FFFC */  lwz     r0, -4(r4)
/* 0D57F0 800DAD90 3463FFFF */  addic.  r3, r3, -1
/* 0D57F4 800DAD94 9006FFFC */  stw     r0, -4(r6)
/* 0D57F8 800DAD98 8004FFF8 */  lwz     r0, -8(r4)
/* 0D57FC 800DAD9C 9006FFF8 */  stw     r0, -8(r6)
/* 0D5800 800DADA0 8004FFF4 */  lwz     r0, -0xc(r4)
/* 0D5804 800DADA4 9006FFF4 */  stw     r0, -0xc(r6)
/* 0D5808 800DADA8 8004FFF0 */  lwz     r0, -0x10(r4)
/* 0D580C 800DADAC 9006FFF0 */  stw     r0, -0x10(r6)
/* 0D5810 800DADB0 8004FFEC */  lwz     r0, -0x14(r4)
/* 0D5814 800DADB4 9006FFEC */  stw     r0, -0x14(r6)
/* 0D5818 800DADB8 8004FFE8 */  lwz     r0, -0x18(r4)
/* 0D581C 800DADBC 9006FFE8 */  stw     r0, -0x18(r6)
/* 0D5820 800DADC0 8004FFE4 */  lwz     r0, -0x1c(r4)
/* 0D5824 800DADC4 9006FFE4 */  stw     r0, -0x1c(r6)
/* 0D5828 800DADC8 8404FFE0 */  lwzu    r0, -0x20(r4)
/* 0D582C 800DADCC 9406FFE0 */  stwu    r0, -0x20(r6)
/* 0D5830 800DADD0 4082FFBC */  bne     lbl_800DAD8C
lbl_800DADD4:
/* 0D5834 800DADD4 54A3F77F */  rlwinm. r3, r5, 0x1e, 0x1d, 0x1f
/* 0D5838 800DADD8 41820014 */  beq     lbl_800DADEC
lbl_800DADDC:
/* 0D583C 800DADDC 8404FFFC */  lwzu    r0, -4(r4)
/* 0D5840 800DADE0 3463FFFF */  addic.  r3, r3, -1
/* 0D5844 800DADE4 9406FFFC */  stwu    r0, -4(r6)
/* 0D5848 800DADE8 4082FFF4 */  bne     lbl_800DADDC
lbl_800DADEC:
/* 0D584C 800DADEC 54A507BF */  clrlwi. r5, r5, 0x1e
/* 0D5850 800DADF0 4D820020 */  beqlr   
lbl_800DADF4:
/* 0D5854 800DADF4 8C04FFFF */  lbzu    r0, -1(r4)
/* 0D5858 800DADF8 34A5FFFF */  addic.  r5, r5, -1
/* 0D585C 800DADFC 9C06FFFF */  stbu    r0, -1(r6)
/* 0D5860 800DAE00 4082FFF4 */  bne     lbl_800DADF4
/* 0D5864 800DAE04 4E800020 */  blr     

glabel __copy_longs_aligned
/* 0D5868 800DAE08 7C0300D0 */  neg     r0, r3
/* 0D586C 800DAE0C 540607BF */  clrlwi. r6, r0, 0x1e
/* 0D5870 800DAE10 38E4FFFF */  addi    r7, r4, -1
/* 0D5874 800DAE14 3863FFFF */  addi    r3, r3, -1
/* 0D5878 800DAE18 41820018 */  beq     lbl_800DAE30
/* 0D587C 800DAE1C 7CA62850 */  subf    r5, r6, r5
lbl_800DAE20:
/* 0D5880 800DAE20 8C070001 */  lbzu    r0, 1(r7)
/* 0D5884 800DAE24 34C6FFFF */  addic.  r6, r6, -1
/* 0D5888 800DAE28 9C030001 */  stbu    r0, 1(r3)
/* 0D588C 800DAE2C 4082FFF4 */  bne     lbl_800DAE20
lbl_800DAE30:
/* 0D5890 800DAE30 54A4D97F */  rlwinm. r4, r5, 0x1b, 5, 0x1f
/* 0D5894 800DAE34 38C7FFFD */  addi    r6, r7, -3
/* 0D5898 800DAE38 3863FFFD */  addi    r3, r3, -3
/* 0D589C 800DAE3C 4182004C */  beq     lbl_800DAE88
lbl_800DAE40:
/* 0D58A0 800DAE40 80060004 */  lwz     r0, 4(r6)
/* 0D58A4 800DAE44 3484FFFF */  addic.  r4, r4, -1
/* 0D58A8 800DAE48 90030004 */  stw     r0, 4(r3)
/* 0D58AC 800DAE4C 80060008 */  lwz     r0, 8(r6)
/* 0D58B0 800DAE50 90030008 */  stw     r0, 8(r3)
/* 0D58B4 800DAE54 8006000C */  lwz     r0, 0xc(r6)
/* 0D58B8 800DAE58 9003000C */  stw     r0, 0xc(r3)
/* 0D58BC 800DAE5C 80060010 */  lwz     r0, 0x10(r6)
/* 0D58C0 800DAE60 90030010 */  stw     r0, 0x10(r3)
/* 0D58C4 800DAE64 80060014 */  lwz     r0, 0x14(r6)
/* 0D58C8 800DAE68 90030014 */  stw     r0, 0x14(r3)
/* 0D58CC 800DAE6C 80060018 */  lwz     r0, 0x18(r6)
/* 0D58D0 800DAE70 90030018 */  stw     r0, 0x18(r3)
/* 0D58D4 800DAE74 8006001C */  lwz     r0, 0x1c(r6)
/* 0D58D8 800DAE78 9003001C */  stw     r0, 0x1c(r3)
/* 0D58DC 800DAE7C 84060020 */  lwzu    r0, 0x20(r6)
/* 0D58E0 800DAE80 94030020 */  stwu    r0, 0x20(r3)
/* 0D58E4 800DAE84 4082FFBC */  bne     lbl_800DAE40
lbl_800DAE88:
/* 0D58E8 800DAE88 54A4F77F */  rlwinm. r4, r5, 0x1e, 0x1d, 0x1f
/* 0D58EC 800DAE8C 41820014 */  beq     lbl_800DAEA0
lbl_800DAE90:
/* 0D58F0 800DAE90 84060004 */  lwzu    r0, 4(r6)
/* 0D58F4 800DAE94 3484FFFF */  addic.  r4, r4, -1
/* 0D58F8 800DAE98 94030004 */  stwu    r0, 4(r3)
/* 0D58FC 800DAE9C 4082FFF4 */  bne     lbl_800DAE90
lbl_800DAEA0:
/* 0D5900 800DAEA0 54A507BF */  clrlwi. r5, r5, 0x1e
/* 0D5904 800DAEA4 38860003 */  addi    r4, r6, 3
/* 0D5908 800DAEA8 38630003 */  addi    r3, r3, 3
/* 0D590C 800DAEAC 4D820020 */  beqlr   
lbl_800DAEB0:
/* 0D5910 800DAEB0 8C040001 */  lbzu    r0, 1(r4)
/* 0D5914 800DAEB4 34A5FFFF */  addic.  r5, r5, -1
/* 0D5918 800DAEB8 9C030001 */  stbu    r0, 1(r3)
/* 0D591C 800DAEBC 4082FFF4 */  bne     lbl_800DAEB0
/* 0D5920 800DAEC0 4E800020 */  blr     


