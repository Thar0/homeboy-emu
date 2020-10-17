# dvd.c
.include "macros.inc"

.section .text, "ax"

.balign 4

defaultOptionalCommandChecker:
/* 0B96D0 800BEC70 4E800020 */  blr     

glabel DVDInit
/* 0B96D4 800BEC74 7C0802A6 */  mflr    r0
/* 0B96D8 800BEC78 90010004 */  stw     r0, 4(r1)
/* 0B96DC 800BEC7C 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0B96E0 800BEC80 93E1000C */  stw     r31, 0xc(r1)
/* 0B96E4 800BEC84 800D9358 */  lwz     r0, DVDInitialized-_SDA_BASE_(r13)
/* 0B96E8 800BEC88 2C000000 */  cmpwi   r0, 0
/* 0B96EC 800BEC8C 408200A0 */  bne     lbl_800BED2C
/* 0B96F0 800BEC90 806D8DD8 */  lwz     r3, __DVDVersion-_SDA_BASE_(r13)
/* 0B96F4 800BEC94 4BFE9471 */  bl      OSRegisterVersion
/* 0B96F8 800BEC98 3BE00001 */  li      r31, 1
/* 0B96FC 800BEC9C 93ED9358 */  stw     r31, DVDInitialized-_SDA_BASE_(r13)
/* 0B9700 800BECA0 4BFFF511 */  bl      __DVDFSInit
/* 0B9704 800BECA4 48002B8D */  bl      __DVDClearWaitingQueue
/* 0B9708 800BECA8 4BFFE68D */  bl      __DVDInitWA
/* 0B970C 800BECAC 3C008000 */  lis     r0, 0x8000
/* 0B9710 800BECB0 3C60800C */  lis     r3, __DVDInterruptHandler@ha
/* 0B9714 800BECB4 900D9320 */  stw     r0, bootInfo-_SDA_BASE_(r13)
/* 0B9718 800BECB8 3883D374 */  addi    r4, r3, __DVDInterruptHandler@l
/* 0B971C 800BECBC 900D931C */  stw     r0, IDShouldBe-_SDA_BASE_(r13)
/* 0B9720 800BECC0 38600015 */  li      r3, 0x15
/* 0B9724 800BECC4 4BFEBAF9 */  bl      __OSSetInterruptHandler
/* 0B9728 800BECC8 38600400 */  li      r3, 0x400
/* 0B972C 800BECCC 4BFEBEF5 */  bl      __OSUnmaskInterrupts
/* 0B9730 800BECD0 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0B9734 800BECD4 4BFEDFD5 */  bl      OSInitThreadQueue
/* 0B9738 800BECD8 3C60CC00 */  lis     r3, 0xcc00
/* 0B973C 800BECDC 3800002A */  li      r0, 0x2a
/* 0B9740 800BECE0 90036000 */  stw     r0, 0x6000(r3)
/* 0B9744 800BECE4 38000000 */  li      r0, 0
/* 0B9748 800BECE8 90036004 */  stw     r0, 0x6004(r3)
/* 0B974C 800BECEC 806D9320 */  lwz     r3, bootInfo-_SDA_BASE_(r13)
/* 0B9750 800BECF0 38630020 */  addi    r3, r3, 0x20
/* 0B9754 800BECF4 80630000 */  lwz     r3, 0(r3)
/* 0B9758 800BECF8 3C031AE0 */  addis   r0, r3, 0x1ae0
/* 0B975C 800BECFC 28007C22 */  cmplwi  r0, 0x7c22
/* 0B9760 800BED00 4082001C */  bne     lbl_800BED1C
/* 0B9764 800BED04 3C608010 */  lis     r3, D_80100790@ha
/* 0B9768 800BED08 4CC63182 */  crclr   6
/* 0B976C 800BED0C 38630790 */  addi    r3, r3, D_80100790@l
/* 0B9770 800BED10 4BFEB35D */  bl      OSReport
/* 0B9774 800BED14 480030AD */  bl      __fstLoad
/* 0B9778 800BED18 48000014 */  b       lbl_800BED2C
lbl_800BED1C:
/* 0B977C 800BED1C 3C03F2EB */  addis   r0, r3, 0xf2eb
/* 0B9780 800BED20 2800EA5E */  cmplwi  r0, 0xea5e
/* 0B9784 800BED24 41820008 */  beq     lbl_800BED2C
/* 0B9788 800BED28 93ED9354 */  stw     r31, FirstTimeInBootrom-_SDA_BASE_(r13)
lbl_800BED2C:
/* 0B978C 800BED2C 80010014 */  lwz     r0, 0x14(r1)
/* 0B9790 800BED30 83E1000C */  lwz     r31, 0xc(r1)
/* 0B9794 800BED34 38210010 */  addi    r1, r1, 0x10
/* 0B9798 800BED38 7C0803A6 */  mtlr    r0
/* 0B979C 800BED3C 4E800020 */  blr     

stateReadingFST:
/* 0B97A0 800BED40 7C0802A6 */  mflr    r0
/* 0B97A4 800BED44 3C60800C */  lis     r3, stateReadingFST@ha
/* 0B97A8 800BED48 90010004 */  stw     r0, 4(r1)
/* 0B97AC 800BED4C 3803ED40 */  addi    r0, r3, stateReadingFST@l
/* 0B97B0 800BED50 3C608014 */  lis     r3, BB2@ha
/* 0B97B4 800BED54 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0B97B8 800BED58 386322A0 */  addi    r3, r3, BB2@l
/* 0B97BC 800BED5C 93E1000C */  stw     r31, 0xc(r1)
/* 0B97C0 800BED60 3BE30008 */  addi    r31, r3, 8
/* 0B97C4 800BED64 900D935C */  stw     r0, LastState-_SDA_BASE_(r13)
/* 0B97C8 800BED68 808D9320 */  lwz     r4, bootInfo-_SDA_BASE_(r13)
/* 0B97CC 800BED6C 801F0000 */  lwz     r0, 0(r31)
/* 0B97D0 800BED70 8064003C */  lwz     r3, 0x3c(r4)
/* 0B97D4 800BED74 7C030040 */  cmplw   r3, r0
/* 0B97D8 800BED78 4080001C */  bge     lbl_800BED94
/* 0B97DC 800BED7C 3C608010 */  lis     r3, D_8010079C@ha
/* 0B97E0 800BED80 4CC63182 */  crclr   6
/* 0B97E4 800BED84 38A3079C */  addi    r5, r3, D_8010079C@l
/* 0B97E8 800BED88 386D8DE4 */  addi    r3, r13, D_801457C4-_SDA_BASE_
/* 0B97EC 800BED8C 3880028A */  li      r4, 0x28a
/* 0B97F0 800BED90 4BFEB35D */  bl      OSPanic
lbl_800BED94:
/* 0B97F4 800BED94 3C608014 */  lis     r3, BB2@ha
/* 0B97F8 800BED98 80DF0000 */  lwz     r6, 0(r31)
/* 0B97FC 800BED9C 38A322A0 */  addi    r5, r3, BB2@l
/* 0B9800 800BEDA0 80ED9320 */  lwz     r7, bootInfo-_SDA_BASE_(r13)
/* 0B9804 800BEDA4 3C80800C */  lis     r4, cbForStateReadingFST@ha
/* 0B9808 800BEDA8 80A50004 */  lwz     r5, 4(r5)
/* 0B980C 800BEDAC 3806001F */  addi    r0, r6, 0x1f
/* 0B9810 800BEDB0 80670038 */  lwz     r3, 0x38(r7)
/* 0B9814 800BEDB4 38C4EDD4 */  addi    r6, r4, cbForStateReadingFST@l
/* 0B9818 800BEDB8 54040034 */  rlwinm  r4, r0, 0, 0, 0x1a
/* 0B981C 800BEDBC 4BFFEB1D */  bl      DVDLowRead
/* 0B9820 800BEDC0 80010014 */  lwz     r0, 0x14(r1)
/* 0B9824 800BEDC4 83E1000C */  lwz     r31, 0xc(r1)
/* 0B9828 800BEDC8 38210010 */  addi    r1, r1, 0x10
/* 0B982C 800BEDCC 7C0803A6 */  mtlr    r0
/* 0B9830 800BEDD0 4E800020 */  blr     

cbForStateReadingFST:
/* 0B9834 800BEDD4 7C0802A6 */  mflr    r0
/* 0B9838 800BEDD8 28030010 */  cmplwi  r3, 0x10
/* 0B983C 800BEDDC 90010004 */  stw     r0, 4(r1)
/* 0B9840 800BEDE0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B9844 800BEDE4 93E10014 */  stw     r31, 0x14(r1)
/* 0B9848 800BEDE8 40820018 */  bne     lbl_800BEE00
/* 0B984C 800BEDEC 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9850 800BEDF0 3800FFFF */  li      r0, -1
/* 0B9854 800BEDF4 9003000C */  stw     r0, 0xc(r3)
/* 0B9858 800BEDF8 48000115 */  bl      stateTimeout
/* 0B985C 800BEDFC 48000050 */  b       lbl_800BEE4C
lbl_800BEE00:
/* 0B9860 800BEE00 546007FF */  clrlwi. r0, r3, 0x1f
/* 0B9864 800BEE04 41820044 */  beq     lbl_800BEE48
/* 0B9868 800BEE08 3BE00000 */  li      r31, 0
/* 0B986C 800BEE0C 93ED934C */  stw     r31, NumInternalRetry-_SDA_BASE_(r13)
/* 0B9870 800BEE10 4BFFF3A1 */  bl      __DVDFSInit
/* 0B9874 800BEE14 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0B9878 800BEE18 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B987C 800BEE1C 380322E0 */  addi    r0, r3, DummyCommandBlock@l
/* 0B9880 800BEE20 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0B9884 800BEE24 93E4000C */  stw     r31, 0xc(r4)
/* 0B9888 800BEE28 81840028 */  lwz     r12, 0x28(r4)
/* 0B988C 800BEE2C 280C0000 */  cmplwi  r12, 0
/* 0B9890 800BEE30 41820010 */  beq     lbl_800BEE40
/* 0B9894 800BEE34 7D8803A6 */  mtlr    r12
/* 0B9898 800BEE38 38600000 */  li      r3, 0
/* 0B989C 800BEE3C 4E800021 */  blrl    
lbl_800BEE40:
/* 0B98A0 800BEE40 48000E95 */  bl      stateReady
/* 0B98A4 800BEE44 48000008 */  b       lbl_800BEE4C
lbl_800BEE48:
/* 0B98A8 800BEE48 480000F9 */  bl      stateGettingError
lbl_800BEE4C:
/* 0B98AC 800BEE4C 8001001C */  lwz     r0, 0x1c(r1)
/* 0B98B0 800BEE50 83E10014 */  lwz     r31, 0x14(r1)
/* 0B98B4 800BEE54 38210018 */  addi    r1, r1, 0x18
/* 0B98B8 800BEE58 7C0803A6 */  mtlr    r0
/* 0B98BC 800BEE5C 4E800020 */  blr     

cbForStateError:
/* 0B98C0 800BEE60 7C0802A6 */  mflr    r0
/* 0B98C4 800BEE64 28030010 */  cmplwi  r3, 0x10
/* 0B98C8 800BEE68 90010004 */  stw     r0, 4(r1)
/* 0B98CC 800BEE6C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B98D0 800BEE70 93E10014 */  stw     r31, 0x14(r1)
/* 0B98D4 800BEE74 40820018 */  bne     lbl_800BEE8C
/* 0B98D8 800BEE78 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B98DC 800BEE7C 3800FFFF */  li      r0, -1
/* 0B98E0 800BEE80 9003000C */  stw     r0, 0xc(r3)
/* 0B98E4 800BEE84 48000089 */  bl      stateTimeout
/* 0B98E8 800BEE88 48000070 */  b       lbl_800BEEF8
lbl_800BEE8C:
/* 0B98EC 800BEE8C 48002E2D */  bl      __DVDPrintFatalMessage
/* 0B98F0 800BEE90 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0B98F4 800BEE94 83ED9318 */  lwz     r31, executing-_SDA_BASE_(r13)
/* 0B98F8 800BEE98 380322E0 */  addi    r0, r3, DummyCommandBlock@l
/* 0B98FC 800BEE9C 38600001 */  li      r3, 1
/* 0B9900 800BEEA0 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0B9904 800BEEA4 906D9330 */  stw     r3, FatalErrorFlag-_SDA_BASE_(r13)
/* 0B9908 800BEEA8 819F0028 */  lwz     r12, 0x28(r31)
/* 0B990C 800BEEAC 280C0000 */  cmplwi  r12, 0
/* 0B9910 800BEEB0 41820014 */  beq     lbl_800BEEC4
/* 0B9914 800BEEB4 7D8803A6 */  mtlr    r12
/* 0B9918 800BEEB8 389F0000 */  addi    r4, r31, 0
/* 0B991C 800BEEBC 3860FFFF */  li      r3, -1
/* 0B9920 800BEEC0 4E800021 */  blrl    
lbl_800BEEC4:
/* 0B9924 800BEEC4 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0B9928 800BEEC8 28000000 */  cmplwi  r0, 0
/* 0B992C 800BEECC 41820028 */  beq     lbl_800BEEF4
/* 0B9930 800BEED0 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0B9934 800BEED4 38000000 */  li      r0, 0
/* 0B9938 800BEED8 900D9338 */  stw     r0, Canceling-_SDA_BASE_(r13)
/* 0B993C 800BEEDC 280C0000 */  cmplwi  r12, 0
/* 0B9940 800BEEE0 41820014 */  beq     lbl_800BEEF4
/* 0B9944 800BEEE4 7D8803A6 */  mtlr    r12
/* 0B9948 800BEEE8 389F0000 */  addi    r4, r31, 0
/* 0B994C 800BEEEC 38600000 */  li      r3, 0
/* 0B9950 800BEEF0 4E800021 */  blrl    
lbl_800BEEF4:
/* 0B9954 800BEEF4 48000DE1 */  bl      stateReady
lbl_800BEEF8:
/* 0B9958 800BEEF8 8001001C */  lwz     r0, 0x1c(r1)
/* 0B995C 800BEEFC 83E10014 */  lwz     r31, 0x14(r1)
/* 0B9960 800BEF00 38210018 */  addi    r1, r1, 0x18
/* 0B9964 800BEF04 7C0803A6 */  mtlr    r0
/* 0B9968 800BEF08 4E800020 */  blr     

stateTimeout:
/* 0B996C 800BEF0C 7C0802A6 */  mflr    r0
/* 0B9970 800BEF10 3C600123 */  lis     r3, 0x123
/* 0B9974 800BEF14 90010004 */  stw     r0, 4(r1)
/* 0B9978 800BEF18 38634568 */  addi    r3, r3, 0x4568
/* 0B997C 800BEF1C 9421FFF8 */  stwu    r1, -8(r1)
/* 0B9980 800BEF20 48002C25 */  bl      __DVDStoreErrorCode
/* 0B9984 800BEF24 480021D1 */  bl      DVDReset
/* 0B9988 800BEF28 38600000 */  li      r3, 0
/* 0B998C 800BEF2C 4BFFFF35 */  bl      cbForStateError
/* 0B9990 800BEF30 8001000C */  lwz     r0, 0xc(r1)
/* 0B9994 800BEF34 38210008 */  addi    r1, r1, 8
/* 0B9998 800BEF38 7C0803A6 */  mtlr    r0
/* 0B999C 800BEF3C 4E800020 */  blr     

stateGettingError:
/* 0B99A0 800BEF40 7C0802A6 */  mflr    r0
/* 0B99A4 800BEF44 3C60800C */  lis     r3, cbForStateGettingError@ha
/* 0B99A8 800BEF48 90010004 */  stw     r0, 4(r1)
/* 0B99AC 800BEF4C 3863F01C */  addi    r3, r3, cbForStateGettingError@l
/* 0B99B0 800BEF50 9421FFF8 */  stwu    r1, -8(r1)
/* 0B99B4 800BEF54 4BFFEE0D */  bl      DVDLowRequestError
/* 0B99B8 800BEF58 8001000C */  lwz     r0, 0xc(r1)
/* 0B99BC 800BEF5C 38210008 */  addi    r1, r1, 8
/* 0B99C0 800BEF60 7C0803A6 */  mtlr    r0
/* 0B99C4 800BEF64 4E800020 */  blr     

CategorizeError:
/* 0B99C8 800BEF68 3C03FFFE */  addis   r0, r3, 0xfffe
/* 0B99CC 800BEF6C 28000400 */  cmplwi  r0, 0x400
/* 0B99D0 800BEF70 40820010 */  bne     lbl_800BEF80
/* 0B99D4 800BEF74 906D9348 */  stw     r3, LastError-_SDA_BASE_(r13)
/* 0B99D8 800BEF78 38600001 */  li      r3, 1
/* 0B99DC 800BEF7C 4E800020 */  blr     
lbl_800BEF80:
/* 0B99E0 800BEF80 5464023E */  clrlwi  r4, r3, 8
/* 0B99E4 800BEF84 3C04FFFA */  addis   r0, r4, 0xfffa
/* 0B99E8 800BEF88 28002800 */  cmplwi  r0, 0x2800
/* 0B99EC 800BEF8C 4182001C */  beq     lbl_800BEFA8
/* 0B99F0 800BEF90 3C04FFFE */  addis   r0, r4, 0xfffe
/* 0B99F4 800BEF94 28003A00 */  cmplwi  r0, 0x3a00
/* 0B99F8 800BEF98 41820010 */  beq     lbl_800BEFA8
/* 0B99FC 800BEF9C 3C04FFF5 */  addis   r0, r4, 0xfff5
/* 0B9A00 800BEFA0 28005A01 */  cmplwi  r0, 0x5a01
/* 0B9A04 800BEFA4 4082000C */  bne     lbl_800BEFB0
lbl_800BEFA8:
/* 0B9A08 800BEFA8 38600000 */  li      r3, 0
/* 0B9A0C 800BEFAC 4E800020 */  blr     
lbl_800BEFB0:
/* 0B9A10 800BEFB0 806D934C */  lwz     r3, NumInternalRetry-_SDA_BASE_(r13)
/* 0B9A14 800BEFB4 38030001 */  addi    r0, r3, 1
/* 0B9A18 800BEFB8 900D934C */  stw     r0, NumInternalRetry-_SDA_BASE_(r13)
/* 0B9A1C 800BEFBC 800D934C */  lwz     r0, NumInternalRetry-_SDA_BASE_(r13)
/* 0B9A20 800BEFC0 2C000002 */  cmpwi   r0, 2
/* 0B9A24 800BEFC4 40820028 */  bne     lbl_800BEFEC
/* 0B9A28 800BEFC8 800D9348 */  lwz     r0, LastError-_SDA_BASE_(r13)
/* 0B9A2C 800BEFCC 7C040040 */  cmplw   r4, r0
/* 0B9A30 800BEFD0 40820010 */  bne     lbl_800BEFE0
/* 0B9A34 800BEFD4 908D9348 */  stw     r4, LastError-_SDA_BASE_(r13)
/* 0B9A38 800BEFD8 38600001 */  li      r3, 1
/* 0B9A3C 800BEFDC 4E800020 */  blr     
lbl_800BEFE0:
/* 0B9A40 800BEFE0 908D9348 */  stw     r4, LastError-_SDA_BASE_(r13)
/* 0B9A44 800BEFE4 38600002 */  li      r3, 2
/* 0B9A48 800BEFE8 4E800020 */  blr     
lbl_800BEFEC:
/* 0B9A4C 800BEFEC 3C04FFFD */  addis   r0, r4, 0xfffd
/* 0B9A50 800BEFF0 908D9348 */  stw     r4, LastError-_SDA_BASE_(r13)
/* 0B9A54 800BEFF4 28001100 */  cmplwi  r0, 0x1100
/* 0B9A58 800BEFF8 41820014 */  beq     lbl_800BF00C
/* 0B9A5C 800BEFFC 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9A60 800BF000 80030008 */  lwz     r0, 8(r3)
/* 0B9A64 800BF004 28000005 */  cmplwi  r0, 5
/* 0B9A68 800BF008 4082000C */  bne     lbl_800BF014
lbl_800BF00C:
/* 0B9A6C 800BF00C 38600002 */  li      r3, 2
/* 0B9A70 800BF010 4E800020 */  blr     
lbl_800BF014:
/* 0B9A74 800BF014 38600003 */  li      r3, 3
/* 0B9A78 800BF018 4E800020 */  blr     

cbForStateGettingError:
/* 0B9A7C 800BF01C 7C0802A6 */  mflr    r0
/* 0B9A80 800BF020 28030010 */  cmplwi  r3, 0x10
/* 0B9A84 800BF024 90010004 */  stw     r0, 4(r1)
/* 0B9A88 800BF028 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0B9A8C 800BF02C 93E1001C */  stw     r31, 0x1c(r1)
/* 0B9A90 800BF030 93C10018 */  stw     r30, 0x18(r1)
/* 0B9A94 800BF034 93A10014 */  stw     r29, 0x14(r1)
/* 0B9A98 800BF038 93810010 */  stw     r28, 0x10(r1)
/* 0B9A9C 800BF03C 4082002C */  bne     lbl_800BF068
/* 0B9AA0 800BF040 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9AA4 800BF044 3800FFFF */  li      r0, -1
/* 0B9AA8 800BF048 3C600123 */  lis     r3, 0x123
/* 0B9AAC 800BF04C 9004000C */  stw     r0, 0xc(r4)
/* 0B9AB0 800BF050 38634568 */  addi    r3, r3, 0x4568
/* 0B9AB4 800BF054 48002AF1 */  bl      __DVDStoreErrorCode
/* 0B9AB8 800BF058 4800209D */  bl      DVDReset
/* 0B9ABC 800BF05C 38600000 */  li      r3, 0
/* 0B9AC0 800BF060 4BFFFE01 */  bl      cbForStateError
/* 0B9AC4 800BF064 4800022C */  b       lbl_800BF290
lbl_800BF068:
/* 0B9AC8 800BF068 546007BD */  rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0B9ACC 800BF06C 4182002C */  beq     lbl_800BF098
/* 0B9AD0 800BF070 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9AD4 800BF074 3800FFFF */  li      r0, -1
/* 0B9AD8 800BF078 3C600123 */  lis     r3, 0x123
/* 0B9ADC 800BF07C 9004000C */  stw     r0, 0xc(r4)
/* 0B9AE0 800BF080 38634567 */  addi    r3, r3, 0x4567
/* 0B9AE4 800BF084 48002AC1 */  bl      __DVDStoreErrorCode
/* 0B9AE8 800BF088 3C60800C */  lis     r3, cbForStateError@ha
/* 0B9AEC 800BF08C 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0B9AF0 800BF090 4BFFEC45 */  bl      DVDLowStopMotor
/* 0B9AF4 800BF094 480001FC */  b       lbl_800BF290
lbl_800BF098:
/* 0B9AF8 800BF098 3C60CC00 */  lis     r3, 0xcc00
/* 0B9AFC 800BF09C 83A36020 */  lwz     r29, 0x6020(r3)
/* 0B9B00 800BF0A0 387D0000 */  addi    r3, r29, 0
/* 0B9B04 800BF0A4 57BC000E */  rlwinm  r28, r29, 0, 0, 7
/* 0B9B08 800BF0A8 4BFFFEC1 */  bl      CategorizeError
/* 0B9B0C 800BF0AC 3BE30000 */  addi    r31, r3, 0
/* 0B9B10 800BF0B0 281F0001 */  cmplwi  r31, 1
/* 0B9B14 800BF0B4 40820028 */  bne     lbl_800BF0DC
/* 0B9B18 800BF0B8 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9B1C 800BF0BC 3800FFFF */  li      r0, -1
/* 0B9B20 800BF0C0 387D0000 */  addi    r3, r29, 0
/* 0B9B24 800BF0C4 9004000C */  stw     r0, 0xc(r4)
/* 0B9B28 800BF0C8 48002A7D */  bl      __DVDStoreErrorCode
/* 0B9B2C 800BF0CC 3C60800C */  lis     r3, cbForStateError@ha
/* 0B9B30 800BF0D0 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0B9B34 800BF0D4 4BFFEC01 */  bl      DVDLowStopMotor
/* 0B9B38 800BF0D8 480001B8 */  b       lbl_800BF290
lbl_800BF0DC:
/* 0B9B3C 800BF0DC 381FFFFE */  addi    r0, r31, -2
/* 0B9B40 800BF0E0 28000001 */  cmplwi  r0, 1
/* 0B9B44 800BF0E4 4181000C */  bgt     lbl_800BF0F0
/* 0B9B48 800BF0E8 38800000 */  li      r4, 0
/* 0B9B4C 800BF0EC 48000044 */  b       lbl_800BF130
lbl_800BF0F0:
/* 0B9B50 800BF0F0 3C1CFF00 */  addis   r0, r28, 0xff00
/* 0B9B54 800BF0F4 28000000 */  cmplwi  r0, 0
/* 0B9B58 800BF0F8 4082000C */  bne     lbl_800BF104
/* 0B9B5C 800BF0FC 38800004 */  li      r4, 4
/* 0B9B60 800BF100 48000030 */  b       lbl_800BF130
lbl_800BF104:
/* 0B9B64 800BF104 3C1CFE00 */  addis   r0, r28, 0xfe00
/* 0B9B68 800BF108 28000000 */  cmplwi  r0, 0
/* 0B9B6C 800BF10C 4082000C */  bne     lbl_800BF118
/* 0B9B70 800BF110 38800006 */  li      r4, 6
/* 0B9B74 800BF114 4800001C */  b       lbl_800BF130
lbl_800BF118:
/* 0B9B78 800BF118 3C1CFD00 */  addis   r0, r28, 0xfd00
/* 0B9B7C 800BF11C 28000000 */  cmplwi  r0, 0
/* 0B9B80 800BF120 4082000C */  bne     lbl_800BF12C
/* 0B9B84 800BF124 38800003 */  li      r4, 3
/* 0B9B88 800BF128 48000008 */  b       lbl_800BF130
lbl_800BF12C:
/* 0B9B8C 800BF12C 38800005 */  li      r4, 5
lbl_800BF130:
/* 0B9B90 800BF130 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0B9B94 800BF134 28000000 */  cmplwi  r0, 0
/* 0B9B98 800BF138 4182006C */  beq     lbl_800BF1A4
/* 0B9B9C 800BF13C 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0B9BA0 800BF140 908D9340 */  stw     r4, ResumeFromHere-_SDA_BASE_(r13)
/* 0B9BA4 800BF144 38000000 */  li      r0, 0
/* 0B9BA8 800BF148 83CD9318 */  lwz     r30, executing-_SDA_BASE_(r13)
/* 0B9BAC 800BF14C 386322E0 */  addi    r3, r3, DummyCommandBlock@l
/* 0B9BB0 800BF150 900D9338 */  stw     r0, Canceling-_SDA_BASE_(r13)
/* 0B9BB4 800BF154 3800000A */  li      r0, 0xa
/* 0B9BB8 800BF158 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0B9BBC 800BF15C 901E000C */  stw     r0, 0xc(r30)
/* 0B9BC0 800BF160 819E0028 */  lwz     r12, 0x28(r30)
/* 0B9BC4 800BF164 280C0000 */  cmplwi  r12, 0
/* 0B9BC8 800BF168 41820014 */  beq     lbl_800BF17C
/* 0B9BCC 800BF16C 7D8803A6 */  mtlr    r12
/* 0B9BD0 800BF170 389E0000 */  addi    r4, r30, 0
/* 0B9BD4 800BF174 3860FFFD */  li      r3, -3
/* 0B9BD8 800BF178 4E800021 */  blrl    
lbl_800BF17C:
/* 0B9BDC 800BF17C 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0B9BE0 800BF180 280C0000 */  cmplwi  r12, 0
/* 0B9BE4 800BF184 41820014 */  beq     lbl_800BF198
/* 0B9BE8 800BF188 7D8803A6 */  mtlr    r12
/* 0B9BEC 800BF18C 389E0000 */  addi    r4, r30, 0
/* 0B9BF0 800BF190 38600000 */  li      r3, 0
/* 0B9BF4 800BF194 4E800021 */  blrl    
lbl_800BF198:
/* 0B9BF8 800BF198 48000B3D */  bl      stateReady
/* 0B9BFC 800BF19C 38000001 */  li      r0, 1
/* 0B9C00 800BF1A0 48000008 */  b       lbl_800BF1A8
lbl_800BF1A4:
/* 0B9C04 800BF1A4 38000000 */  li      r0, 0
lbl_800BF1A8:
/* 0B9C08 800BF1A8 2C000000 */  cmpwi   r0, 0
/* 0B9C0C 800BF1AC 408200E4 */  bne     lbl_800BF290
/* 0B9C10 800BF1B0 281F0002 */  cmplwi  r31, 2
/* 0B9C14 800BF1B4 40820014 */  bne     lbl_800BF1C8
/* 0B9C18 800BF1B8 7FA3EB78 */  mr      r3, r29
/* 0B9C1C 800BF1BC 48002989 */  bl      __DVDStoreErrorCode
/* 0B9C20 800BF1C0 480001F1 */  bl      stateGoToRetry
/* 0B9C24 800BF1C4 480000CC */  b       lbl_800BF290
lbl_800BF1C8:
/* 0B9C28 800BF1C8 281F0003 */  cmplwi  r31, 3
/* 0B9C2C 800BF1CC 40820040 */  bne     lbl_800BF20C
/* 0B9C30 800BF1D0 57A3023E */  clrlwi  r3, r29, 8
/* 0B9C34 800BF1D4 3C03FFFD */  addis   r0, r3, 0xfffd
/* 0B9C38 800BF1D8 28001100 */  cmplwi  r0, 0x1100
/* 0B9C3C 800BF1DC 4082001C */  bne     lbl_800BF1F8
/* 0B9C40 800BF1E0 80AD9318 */  lwz     r5, executing-_SDA_BASE_(r13)
/* 0B9C44 800BF1E4 3C60800C */  lis     r3, cbForUnrecoveredError@ha
/* 0B9C48 800BF1E8 3883F2B0 */  addi    r4, r3, cbForUnrecoveredError@l
/* 0B9C4C 800BF1EC 80650010 */  lwz     r3, 0x10(r5)
/* 0B9C50 800BF1F0 4BFFE981 */  bl      DVDLowSeek
/* 0B9C54 800BF1F4 4800009C */  b       lbl_800BF290
lbl_800BF1F8:
/* 0B9C58 800BF1F8 818D935C */  lwz     r12, LastState-_SDA_BASE_(r13)
/* 0B9C5C 800BF1FC 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9C60 800BF200 7D8803A6 */  mtlr    r12
/* 0B9C64 800BF204 4E800021 */  blrl    
/* 0B9C68 800BF208 48000088 */  b       lbl_800BF290
lbl_800BF20C:
/* 0B9C6C 800BF20C 3C1CFF00 */  addis   r0, r28, 0xff00
/* 0B9C70 800BF210 28000000 */  cmplwi  r0, 0
/* 0B9C74 800BF214 40820018 */  bne     lbl_800BF22C
/* 0B9C78 800BF218 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9C7C 800BF21C 38000005 */  li      r0, 5
/* 0B9C80 800BF220 9003000C */  stw     r0, 0xc(r3)
/* 0B9C84 800BF224 480009A5 */  bl      stateMotorStopped
/* 0B9C88 800BF228 48000068 */  b       lbl_800BF290
lbl_800BF22C:
/* 0B9C8C 800BF22C 3C1CFE00 */  addis   r0, r28, 0xfe00
/* 0B9C90 800BF230 28000000 */  cmplwi  r0, 0
/* 0B9C94 800BF234 40820018 */  bne     lbl_800BF24C
/* 0B9C98 800BF238 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9C9C 800BF23C 38000003 */  li      r0, 3
/* 0B9CA0 800BF240 9003000C */  stw     r0, 0xc(r3)
/* 0B9CA4 800BF244 48000819 */  bl      stateCoverClosed
/* 0B9CA8 800BF248 48000048 */  b       lbl_800BF290
lbl_800BF24C:
/* 0B9CAC 800BF24C 3C1CFD00 */  addis   r0, r28, 0xfd00
/* 0B9CB0 800BF250 28000000 */  cmplwi  r0, 0
/* 0B9CB4 800BF254 40820018 */  bne     lbl_800BF26C
/* 0B9CB8 800BF258 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9CBC 800BF25C 38000004 */  li      r0, 4
/* 0B9CC0 800BF260 9003000C */  stw     r0, 0xc(r3)
/* 0B9CC4 800BF264 48000965 */  bl      stateMotorStopped
/* 0B9CC8 800BF268 48000028 */  b       lbl_800BF290
lbl_800BF26C:
/* 0B9CCC 800BF26C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9CD0 800BF270 3800FFFF */  li      r0, -1
/* 0B9CD4 800BF274 3C600123 */  lis     r3, 0x123
/* 0B9CD8 800BF278 9004000C */  stw     r0, 0xc(r4)
/* 0B9CDC 800BF27C 38634567 */  addi    r3, r3, 0x4567
/* 0B9CE0 800BF280 480028C5 */  bl      __DVDStoreErrorCode
/* 0B9CE4 800BF284 3C60800C */  lis     r3, cbForStateError@ha
/* 0B9CE8 800BF288 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0B9CEC 800BF28C 4BFFEA49 */  bl      DVDLowStopMotor
lbl_800BF290:
/* 0B9CF0 800BF290 80010024 */  lwz     r0, 0x24(r1)
/* 0B9CF4 800BF294 83E1001C */  lwz     r31, 0x1c(r1)
/* 0B9CF8 800BF298 83C10018 */  lwz     r30, 0x18(r1)
/* 0B9CFC 800BF29C 83A10014 */  lwz     r29, 0x14(r1)
/* 0B9D00 800BF2A0 83810010 */  lwz     r28, 0x10(r1)
/* 0B9D04 800BF2A4 38210020 */  addi    r1, r1, 0x20
/* 0B9D08 800BF2A8 7C0803A6 */  mtlr    r0
/* 0B9D0C 800BF2AC 4E800020 */  blr     

cbForUnrecoveredError:
/* 0B9D10 800BF2B0 7C0802A6 */  mflr    r0
/* 0B9D14 800BF2B4 28030010 */  cmplwi  r3, 0x10
/* 0B9D18 800BF2B8 90010004 */  stw     r0, 4(r1)
/* 0B9D1C 800BF2BC 9421FFF8 */  stwu    r1, -8(r1)
/* 0B9D20 800BF2C0 4082002C */  bne     lbl_800BF2EC
/* 0B9D24 800BF2C4 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9D28 800BF2C8 3800FFFF */  li      r0, -1
/* 0B9D2C 800BF2CC 3C600123 */  lis     r3, 0x123
/* 0B9D30 800BF2D0 9004000C */  stw     r0, 0xc(r4)
/* 0B9D34 800BF2D4 38634568 */  addi    r3, r3, 0x4568
/* 0B9D38 800BF2D8 4800286D */  bl      __DVDStoreErrorCode
/* 0B9D3C 800BF2DC 48001E19 */  bl      DVDReset
/* 0B9D40 800BF2E0 38600000 */  li      r3, 0
/* 0B9D44 800BF2E4 4BFFFB7D */  bl      cbForStateError
/* 0B9D48 800BF2E8 48000020 */  b       lbl_800BF308
lbl_800BF2EC:
/* 0B9D4C 800BF2EC 546007FF */  clrlwi. r0, r3, 0x1f
/* 0B9D50 800BF2F0 4182000C */  beq     lbl_800BF2FC
/* 0B9D54 800BF2F4 480000BD */  bl      stateGoToRetry
/* 0B9D58 800BF2F8 48000010 */  b       lbl_800BF308
lbl_800BF2FC:
/* 0B9D5C 800BF2FC 3C60800C */  lis     r3, cbForUnrecoveredErrorRetry@ha
/* 0B9D60 800BF300 3863F318 */  addi    r3, r3, cbForUnrecoveredErrorRetry@l
/* 0B9D64 800BF304 4BFFEA5D */  bl      DVDLowRequestError
lbl_800BF308:
/* 0B9D68 800BF308 8001000C */  lwz     r0, 0xc(r1)
/* 0B9D6C 800BF30C 38210008 */  addi    r1, r1, 8
/* 0B9D70 800BF310 7C0803A6 */  mtlr    r0
/* 0B9D74 800BF314 4E800020 */  blr     

cbForUnrecoveredErrorRetry:
/* 0B9D78 800BF318 7C0802A6 */  mflr    r0
/* 0B9D7C 800BF31C 28030010 */  cmplwi  r3, 0x10
/* 0B9D80 800BF320 90010004 */  stw     r0, 4(r1)
/* 0B9D84 800BF324 9421FFF8 */  stwu    r1, -8(r1)
/* 0B9D88 800BF328 4082002C */  bne     lbl_800BF354
/* 0B9D8C 800BF32C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9D90 800BF330 3800FFFF */  li      r0, -1
/* 0B9D94 800BF334 3C600123 */  lis     r3, 0x123
/* 0B9D98 800BF338 9004000C */  stw     r0, 0xc(r4)
/* 0B9D9C 800BF33C 38634568 */  addi    r3, r3, 0x4568
/* 0B9DA0 800BF340 48002805 */  bl      __DVDStoreErrorCode
/* 0B9DA4 800BF344 48001DB1 */  bl      DVDReset
/* 0B9DA8 800BF348 38600000 */  li      r3, 0
/* 0B9DAC 800BF34C 4BFFFB15 */  bl      cbForStateError
/* 0B9DB0 800BF350 48000050 */  b       lbl_800BF3A0
lbl_800BF354:
/* 0B9DB4 800BF354 546007BD */  rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0B9DB8 800BF358 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9DBC 800BF35C 3880FFFF */  li      r4, -1
/* 0B9DC0 800BF360 9083000C */  stw     r4, 0xc(r3)
/* 0B9DC4 800BF364 41820020 */  beq     lbl_800BF384
/* 0B9DC8 800BF368 3C600123 */  lis     r3, 0x123
/* 0B9DCC 800BF36C 38634567 */  addi    r3, r3, 0x4567
/* 0B9DD0 800BF370 480027D5 */  bl      __DVDStoreErrorCode
/* 0B9DD4 800BF374 3C60800C */  lis     r3, cbForStateError@ha
/* 0B9DD8 800BF378 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0B9DDC 800BF37C 4BFFE959 */  bl      DVDLowStopMotor
/* 0B9DE0 800BF380 48000020 */  b       lbl_800BF3A0
lbl_800BF384:
/* 0B9DE4 800BF384 3C60CC00 */  lis     r3, 0xcc00
/* 0B9DE8 800BF388 38636000 */  addi    r3, r3, 0x6000
/* 0B9DEC 800BF38C 80630020 */  lwz     r3, 0x20(r3)
/* 0B9DF0 800BF390 480027B5 */  bl      __DVDStoreErrorCode
/* 0B9DF4 800BF394 3C60800C */  lis     r3, cbForStateError@ha
/* 0B9DF8 800BF398 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0B9DFC 800BF39C 4BFFE939 */  bl      DVDLowStopMotor
lbl_800BF3A0:
/* 0B9E00 800BF3A0 8001000C */  lwz     r0, 0xc(r1)
/* 0B9E04 800BF3A4 38210008 */  addi    r1, r1, 8
/* 0B9E08 800BF3A8 7C0803A6 */  mtlr    r0
/* 0B9E0C 800BF3AC 4E800020 */  blr     

stateGoToRetry:
/* 0B9E10 800BF3B0 7C0802A6 */  mflr    r0
/* 0B9E14 800BF3B4 3C60800C */  lis     r3, cbForStateGoToRetry@ha
/* 0B9E18 800BF3B8 90010004 */  stw     r0, 4(r1)
/* 0B9E1C 800BF3BC 3863F3D8 */  addi    r3, r3, cbForStateGoToRetry@l
/* 0B9E20 800BF3C0 9421FFF8 */  stwu    r1, -8(r1)
/* 0B9E24 800BF3C4 4BFFE911 */  bl      DVDLowStopMotor
/* 0B9E28 800BF3C8 8001000C */  lwz     r0, 0xc(r1)
/* 0B9E2C 800BF3CC 38210008 */  addi    r1, r1, 8
/* 0B9E30 800BF3D0 7C0803A6 */  mtlr    r0
/* 0B9E34 800BF3D4 4E800020 */  blr     

cbForStateGoToRetry:
/* 0B9E38 800BF3D8 7C0802A6 */  mflr    r0
/* 0B9E3C 800BF3DC 28030010 */  cmplwi  r3, 0x10
/* 0B9E40 800BF3E0 90010004 */  stw     r0, 4(r1)
/* 0B9E44 800BF3E4 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B9E48 800BF3E8 93E10014 */  stw     r31, 0x14(r1)
/* 0B9E4C 800BF3EC 4082002C */  bne     lbl_800BF418
/* 0B9E50 800BF3F0 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9E54 800BF3F4 3800FFFF */  li      r0, -1
/* 0B9E58 800BF3F8 3C600123 */  lis     r3, 0x123
/* 0B9E5C 800BF3FC 9004000C */  stw     r0, 0xc(r4)
/* 0B9E60 800BF400 38634568 */  addi    r3, r3, 0x4568
/* 0B9E64 800BF404 48002741 */  bl      __DVDStoreErrorCode
/* 0B9E68 800BF408 48001CED */  bl      DVDReset
/* 0B9E6C 800BF40C 38600000 */  li      r3, 0
/* 0B9E70 800BF410 4BFFFA51 */  bl      cbForStateError
/* 0B9E74 800BF414 48000108 */  b       lbl_800BF51C
lbl_800BF418:
/* 0B9E78 800BF418 546007BD */  rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0B9E7C 800BF41C 4182002C */  beq     lbl_800BF448
/* 0B9E80 800BF420 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9E84 800BF424 3800FFFF */  li      r0, -1
/* 0B9E88 800BF428 3C600123 */  lis     r3, 0x123
/* 0B9E8C 800BF42C 9004000C */  stw     r0, 0xc(r4)
/* 0B9E90 800BF430 38634567 */  addi    r3, r3, 0x4567
/* 0B9E94 800BF434 48002711 */  bl      __DVDStoreErrorCode
/* 0B9E98 800BF438 3C60800C */  lis     r3, cbForStateError@ha
/* 0B9E9C 800BF43C 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0B9EA0 800BF440 4BFFE895 */  bl      DVDLowStopMotor
/* 0B9EA4 800BF444 480000D8 */  b       lbl_800BF51C
lbl_800BF448:
/* 0B9EA8 800BF448 38000000 */  li      r0, 0
/* 0B9EAC 800BF44C 900D934C */  stw     r0, NumInternalRetry-_SDA_BASE_(r13)
/* 0B9EB0 800BF450 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0B9EB4 800BF454 28000004 */  cmplwi  r0, 4
/* 0B9EB8 800BF458 41820028 */  beq     lbl_800BF480
/* 0B9EBC 800BF45C 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0B9EC0 800BF460 28000005 */  cmplwi  r0, 5
/* 0B9EC4 800BF464 4182001C */  beq     lbl_800BF480
/* 0B9EC8 800BF468 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0B9ECC 800BF46C 2800000D */  cmplwi  r0, 0xd
/* 0B9ED0 800BF470 41820010 */  beq     lbl_800BF480
/* 0B9ED4 800BF474 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0B9ED8 800BF478 2800000F */  cmplwi  r0, 0xf
/* 0B9EDC 800BF47C 4082000C */  bne     lbl_800BF488
lbl_800BF480:
/* 0B9EE0 800BF480 38000001 */  li      r0, 1
/* 0B9EE4 800BF484 900D9350 */  stw     r0, ResetRequired-_SDA_BASE_(r13)
lbl_800BF488:
/* 0B9EE8 800BF488 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0B9EEC 800BF48C 28000000 */  cmplwi  r0, 0
/* 0B9EF0 800BF490 41820070 */  beq     lbl_800BF500
/* 0B9EF4 800BF494 38000002 */  li      r0, 2
/* 0B9EF8 800BF498 83ED9318 */  lwz     r31, executing-_SDA_BASE_(r13)
/* 0B9EFC 800BF49C 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0B9F00 800BF4A0 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0B9F04 800BF4A4 380322E0 */  addi    r0, r3, DummyCommandBlock@l
/* 0B9F08 800BF4A8 38600000 */  li      r3, 0
/* 0B9F0C 800BF4AC 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0B9F10 800BF4B0 3800000A */  li      r0, 0xa
/* 0B9F14 800BF4B4 906D9338 */  stw     r3, Canceling-_SDA_BASE_(r13)
/* 0B9F18 800BF4B8 901F000C */  stw     r0, 0xc(r31)
/* 0B9F1C 800BF4BC 819F0028 */  lwz     r12, 0x28(r31)
/* 0B9F20 800BF4C0 280C0000 */  cmplwi  r12, 0
/* 0B9F24 800BF4C4 41820014 */  beq     lbl_800BF4D8
/* 0B9F28 800BF4C8 7D8803A6 */  mtlr    r12
/* 0B9F2C 800BF4CC 389F0000 */  addi    r4, r31, 0
/* 0B9F30 800BF4D0 3860FFFD */  li      r3, -3
/* 0B9F34 800BF4D4 4E800021 */  blrl    
lbl_800BF4D8:
/* 0B9F38 800BF4D8 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0B9F3C 800BF4DC 280C0000 */  cmplwi  r12, 0
/* 0B9F40 800BF4E0 41820014 */  beq     lbl_800BF4F4
/* 0B9F44 800BF4E4 7D8803A6 */  mtlr    r12
/* 0B9F48 800BF4E8 389F0000 */  addi    r4, r31, 0
/* 0B9F4C 800BF4EC 38600000 */  li      r3, 0
/* 0B9F50 800BF4F0 4E800021 */  blrl    
lbl_800BF4F4:
/* 0B9F54 800BF4F4 480007E1 */  bl      stateReady
/* 0B9F58 800BF4F8 38000001 */  li      r0, 1
/* 0B9F5C 800BF4FC 48000008 */  b       lbl_800BF504
lbl_800BF500:
/* 0B9F60 800BF500 38000000 */  li      r0, 0
lbl_800BF504:
/* 0B9F64 800BF504 2C000000 */  cmpwi   r0, 0
/* 0B9F68 800BF508 40820014 */  bne     lbl_800BF51C
/* 0B9F6C 800BF50C 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0B9F70 800BF510 3800000B */  li      r0, 0xb
/* 0B9F74 800BF514 9003000C */  stw     r0, 0xc(r3)
/* 0B9F78 800BF518 480006B1 */  bl      stateMotorStopped
lbl_800BF51C:
/* 0B9F7C 800BF51C 8001001C */  lwz     r0, 0x1c(r1)
/* 0B9F80 800BF520 83E10014 */  lwz     r31, 0x14(r1)
/* 0B9F84 800BF524 38210018 */  addi    r1, r1, 0x18
/* 0B9F88 800BF528 7C0803A6 */  mtlr    r0
/* 0B9F8C 800BF52C 4E800020 */  blr     

stateCheckID:
/* 0B9F90 800BF530 7C0802A6 */  mflr    r0
/* 0B9F94 800BF534 3C608014 */  lis     r3, BB2@ha
/* 0B9F98 800BF538 90010004 */  stw     r0, 4(r1)
/* 0B9F9C 800BF53C 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0B9FA0 800BF540 93E1000C */  stw     r31, 0xc(r1)
/* 0B9FA4 800BF544 3BE322A0 */  addi    r31, r3, BB2@l
/* 0B9FA8 800BF548 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0B9FAC 800BF54C 2C000003 */  cmpwi   r0, 3
/* 0B9FB0 800BF550 41820008 */  beq     lbl_800BF558
/* 0B9FB4 800BF554 4800006C */  b       lbl_800BF5C0
lbl_800BF558:
/* 0B9FB8 800BF558 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9FBC 800BF55C 387F0020 */  addi    r3, r31, 0x20
/* 0B9FC0 800BF560 80840024 */  lwz     r4, 0x24(r4)
/* 0B9FC4 800BF564 4800265D */  bl      DVDCompareDiskID
/* 0B9FC8 800BF568 2C030000 */  cmpwi   r3, 0
/* 0B9FCC 800BF56C 41820044 */  beq     lbl_800BF5B0
/* 0B9FD0 800BF570 806D931C */  lwz     r3, IDShouldBe-_SDA_BASE_(r13)
/* 0B9FD4 800BF574 389F0020 */  addi    r4, r31, 0x20
/* 0B9FD8 800BF578 38A00020 */  li      r5, 0x20
/* 0B9FDC 800BF57C 4BF45F49 */  bl      memcpy
/* 0B9FE0 800BF580 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0B9FE4 800BF584 38000001 */  li      r0, 1
/* 0B9FE8 800BF588 387F0000 */  addi    r3, r31, 0
/* 0B9FEC 800BF58C 9004000C */  stw     r0, 0xc(r4)
/* 0B9FF0 800BF590 38800020 */  li      r4, 0x20
/* 0B9FF4 800BF594 4BFE9C31 */  bl      DCInvalidateRange
/* 0B9FF8 800BF598 3C80800C */  lis     r4, stateCheckID2a@ha
/* 0B9FFC 800BF59C 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA000 800BF5A0 3804F644 */  addi    r0, r4, stateCheckID2a@l
/* 0BA004 800BF5A4 900D935C */  stw     r0, LastState-_SDA_BASE_(r13)
/* 0BA008 800BF5A8 4800009D */  bl      stateCheckID2a
/* 0BA00C 800BF5AC 48000050 */  b       lbl_800BF5FC
lbl_800BF5B0:
/* 0BA010 800BF5B0 3C60800C */  lis     r3, cbForStateCheckID1@ha
/* 0BA014 800BF5B4 3863F724 */  addi    r3, r3, cbForStateCheckID1@l
/* 0BA018 800BF5B8 4BFFE71D */  bl      DVDLowStopMotor
/* 0BA01C 800BF5BC 48000040 */  b       lbl_800BF5FC
lbl_800BF5C0:
/* 0BA020 800BF5C0 808D931C */  lwz     r4, IDShouldBe-_SDA_BASE_(r13)
/* 0BA024 800BF5C4 387F0020 */  addi    r3, r31, 0x20
/* 0BA028 800BF5C8 38A00020 */  li      r5, 0x20
/* 0BA02C 800BF5CC 4801B4D1 */  bl      memcmp
/* 0BA030 800BF5D0 2C030000 */  cmpwi   r3, 0
/* 0BA034 800BF5D4 41820014 */  beq     lbl_800BF5E8
/* 0BA038 800BF5D8 3C60800C */  lis     r3, cbForStateCheckID1@ha
/* 0BA03C 800BF5DC 3863F724 */  addi    r3, r3, cbForStateCheckID1@l
/* 0BA040 800BF5E0 4BFFE6F5 */  bl      DVDLowStopMotor
/* 0BA044 800BF5E4 48000018 */  b       lbl_800BF5FC
lbl_800BF5E8:
/* 0BA048 800BF5E8 3C80800C */  lis     r4, stateCheckID3@ha
/* 0BA04C 800BF5EC 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA050 800BF5F0 3804F610 */  addi    r0, r4, stateCheckID3@l
/* 0BA054 800BF5F4 900D935C */  stw     r0, LastState-_SDA_BASE_(r13)
/* 0BA058 800BF5F8 48000019 */  bl      stateCheckID3
lbl_800BF5FC:
/* 0BA05C 800BF5FC 80010014 */  lwz     r0, 0x14(r1)
/* 0BA060 800BF600 83E1000C */  lwz     r31, 0xc(r1)
/* 0BA064 800BF604 38210010 */  addi    r1, r1, 0x10
/* 0BA068 800BF608 7C0803A6 */  mtlr    r0
/* 0BA06C 800BF60C 4E800020 */  blr     

stateCheckID3:
/* 0BA070 800BF610 7C0802A6 */  mflr    r0
/* 0BA074 800BF614 3C60800C */  lis     r3, cbForStateCheckID3@ha
/* 0BA078 800BF618 90010004 */  stw     r0, 4(r1)
/* 0BA07C 800BF61C 38A3F91C */  addi    r5, r3, cbForStateCheckID3@l
/* 0BA080 800BF620 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA084 800BF624 808D931C */  lwz     r4, IDShouldBe-_SDA_BASE_(r13)
/* 0BA088 800BF628 88640008 */  lbz     r3, 8(r4)
/* 0BA08C 800BF62C 3880000A */  li      r4, 0xa
/* 0BA090 800BF630 4BFFE97D */  bl      DVDLowAudioBufferConfig
/* 0BA094 800BF634 8001000C */  lwz     r0, 0xc(r1)
/* 0BA098 800BF638 38210008 */  addi    r1, r1, 8
/* 0BA09C 800BF63C 7C0803A6 */  mtlr    r0
/* 0BA0A0 800BF640 4E800020 */  blr     

stateCheckID2a:
/* 0BA0A4 800BF644 7C0802A6 */  mflr    r0
/* 0BA0A8 800BF648 3C60800C */  lis     r3, cbForStateCheckID2a@ha
/* 0BA0AC 800BF64C 90010004 */  stw     r0, 4(r1)
/* 0BA0B0 800BF650 38A3F678 */  addi    r5, r3, cbForStateCheckID2a@l
/* 0BA0B4 800BF654 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA0B8 800BF658 808D931C */  lwz     r4, IDShouldBe-_SDA_BASE_(r13)
/* 0BA0BC 800BF65C 88640008 */  lbz     r3, 8(r4)
/* 0BA0C0 800BF660 3880000A */  li      r4, 0xa
/* 0BA0C4 800BF664 4BFFE949 */  bl      DVDLowAudioBufferConfig
/* 0BA0C8 800BF668 8001000C */  lwz     r0, 0xc(r1)
/* 0BA0CC 800BF66C 38210008 */  addi    r1, r1, 8
/* 0BA0D0 800BF670 7C0803A6 */  mtlr    r0
/* 0BA0D4 800BF674 4E800020 */  blr     

cbForStateCheckID2a:
/* 0BA0D8 800BF678 7C0802A6 */  mflr    r0
/* 0BA0DC 800BF67C 28030010 */  cmplwi  r3, 0x10
/* 0BA0E0 800BF680 90010004 */  stw     r0, 4(r1)
/* 0BA0E4 800BF684 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA0E8 800BF688 4082002C */  bne     lbl_800BF6B4
/* 0BA0EC 800BF68C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA0F0 800BF690 3800FFFF */  li      r0, -1
/* 0BA0F4 800BF694 3C600123 */  lis     r3, 0x123
/* 0BA0F8 800BF698 9004000C */  stw     r0, 0xc(r4)
/* 0BA0FC 800BF69C 38634568 */  addi    r3, r3, 0x4568
/* 0BA100 800BF6A0 480024A5 */  bl      __DVDStoreErrorCode
/* 0BA104 800BF6A4 48001A51 */  bl      DVDReset
/* 0BA108 800BF6A8 38600000 */  li      r3, 0
/* 0BA10C 800BF6AC 4BFFF7B5 */  bl      cbForStateError
/* 0BA110 800BF6B0 4800002C */  b       lbl_800BF6DC
lbl_800BF6B4:
/* 0BA114 800BF6B4 546007FF */  clrlwi. r0, r3, 0x1f
/* 0BA118 800BF6B8 41820018 */  beq     lbl_800BF6D0
/* 0BA11C 800BF6BC 38000000 */  li      r0, 0
/* 0BA120 800BF6C0 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA124 800BF6C4 900D934C */  stw     r0, NumInternalRetry-_SDA_BASE_(r13)
/* 0BA128 800BF6C8 48000025 */  bl      stateCheckID2
/* 0BA12C 800BF6CC 48000010 */  b       lbl_800BF6DC
lbl_800BF6D0:
/* 0BA130 800BF6D0 3C60800C */  lis     r3, cbForStateGettingError@ha
/* 0BA134 800BF6D4 3863F01C */  addi    r3, r3, cbForStateGettingError@l
/* 0BA138 800BF6D8 4BFFE689 */  bl      DVDLowRequestError
lbl_800BF6DC:
/* 0BA13C 800BF6DC 8001000C */  lwz     r0, 0xc(r1)
/* 0BA140 800BF6E0 38210008 */  addi    r1, r1, 8
/* 0BA144 800BF6E4 7C0803A6 */  mtlr    r0
/* 0BA148 800BF6E8 4E800020 */  blr     

stateCheckID2:
/* 0BA14C 800BF6EC 7C0802A6 */  mflr    r0
/* 0BA150 800BF6F0 3C608014 */  lis     r3, BB2@ha
/* 0BA154 800BF6F4 90010004 */  stw     r0, 4(r1)
/* 0BA158 800BF6F8 3C80800C */  lis     r4, cbForStateCheckID2@ha
/* 0BA15C 800BF6FC 38C4F838 */  addi    r6, r4, cbForStateCheckID2@l
/* 0BA160 800BF700 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA164 800BF704 386322A0 */  addi    r3, r3, BB2@l
/* 0BA168 800BF708 38800020 */  li      r4, 0x20
/* 0BA16C 800BF70C 38A00420 */  li      r5, 0x420
/* 0BA170 800BF710 4BFFE1C9 */  bl      DVDLowRead
/* 0BA174 800BF714 8001000C */  lwz     r0, 0xc(r1)
/* 0BA178 800BF718 38210008 */  addi    r1, r1, 8
/* 0BA17C 800BF71C 7C0803A6 */  mtlr    r0
/* 0BA180 800BF720 4E800020 */  blr     

cbForStateCheckID1:
/* 0BA184 800BF724 7C0802A6 */  mflr    r0
/* 0BA188 800BF728 28030010 */  cmplwi  r3, 0x10
/* 0BA18C 800BF72C 90010004 */  stw     r0, 4(r1)
/* 0BA190 800BF730 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BA194 800BF734 93E10014 */  stw     r31, 0x14(r1)
/* 0BA198 800BF738 4082002C */  bne     lbl_800BF764
/* 0BA19C 800BF73C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA1A0 800BF740 3800FFFF */  li      r0, -1
/* 0BA1A4 800BF744 3C600123 */  lis     r3, 0x123
/* 0BA1A8 800BF748 9004000C */  stw     r0, 0xc(r4)
/* 0BA1AC 800BF74C 38634568 */  addi    r3, r3, 0x4568
/* 0BA1B0 800BF750 480023F5 */  bl      __DVDStoreErrorCode
/* 0BA1B4 800BF754 480019A1 */  bl      DVDReset
/* 0BA1B8 800BF758 38600000 */  li      r3, 0
/* 0BA1BC 800BF75C 4BFFF705 */  bl      cbForStateError
/* 0BA1C0 800BF760 480000C4 */  b       lbl_800BF824
lbl_800BF764:
/* 0BA1C4 800BF764 546007BD */  rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0BA1C8 800BF768 4182002C */  beq     lbl_800BF794
/* 0BA1CC 800BF76C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA1D0 800BF770 3800FFFF */  li      r0, -1
/* 0BA1D4 800BF774 3C600123 */  lis     r3, 0x123
/* 0BA1D8 800BF778 9004000C */  stw     r0, 0xc(r4)
/* 0BA1DC 800BF77C 38634567 */  addi    r3, r3, 0x4567
/* 0BA1E0 800BF780 480023C5 */  bl      __DVDStoreErrorCode
/* 0BA1E4 800BF784 3C60800C */  lis     r3, cbForStateError@ha
/* 0BA1E8 800BF788 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0BA1EC 800BF78C 4BFFE549 */  bl      DVDLowStopMotor
/* 0BA1F0 800BF790 48000094 */  b       lbl_800BF824
lbl_800BF794:
/* 0BA1F4 800BF794 38800000 */  li      r4, 0
/* 0BA1F8 800BF798 908D934C */  stw     r4, NumInternalRetry-_SDA_BASE_(r13)
/* 0BA1FC 800BF79C 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BA200 800BF7A0 28000000 */  cmplwi  r0, 0
/* 0BA204 800BF7A4 41820068 */  beq     lbl_800BF80C
/* 0BA208 800BF7A8 38000001 */  li      r0, 1
/* 0BA20C 800BF7AC 83ED9318 */  lwz     r31, executing-_SDA_BASE_(r13)
/* 0BA210 800BF7B0 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BA214 800BF7B4 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0BA218 800BF7B8 386322E0 */  addi    r3, r3, DummyCommandBlock@l
/* 0BA21C 800BF7BC 908D9338 */  stw     r4, Canceling-_SDA_BASE_(r13)
/* 0BA220 800BF7C0 3800000A */  li      r0, 0xa
/* 0BA224 800BF7C4 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BA228 800BF7C8 901F000C */  stw     r0, 0xc(r31)
/* 0BA22C 800BF7CC 819F0028 */  lwz     r12, 0x28(r31)
/* 0BA230 800BF7D0 280C0000 */  cmplwi  r12, 0
/* 0BA234 800BF7D4 41820014 */  beq     lbl_800BF7E8
/* 0BA238 800BF7D8 7D8803A6 */  mtlr    r12
/* 0BA23C 800BF7DC 389F0000 */  addi    r4, r31, 0
/* 0BA240 800BF7E0 3860FFFD */  li      r3, -3
/* 0BA244 800BF7E4 4E800021 */  blrl    
lbl_800BF7E8:
/* 0BA248 800BF7E8 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0BA24C 800BF7EC 280C0000 */  cmplwi  r12, 0
/* 0BA250 800BF7F0 41820014 */  beq     lbl_800BF804
/* 0BA254 800BF7F4 7D8803A6 */  mtlr    r12
/* 0BA258 800BF7F8 389F0000 */  addi    r4, r31, 0
/* 0BA25C 800BF7FC 38600000 */  li      r3, 0
/* 0BA260 800BF800 4E800021 */  blrl    
lbl_800BF804:
/* 0BA264 800BF804 480004D1 */  bl      stateReady
/* 0BA268 800BF808 38800001 */  li      r4, 1
lbl_800BF80C:
/* 0BA26C 800BF80C 2C040000 */  cmpwi   r4, 0
/* 0BA270 800BF810 40820014 */  bne     lbl_800BF824
/* 0BA274 800BF814 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA278 800BF818 38000006 */  li      r0, 6
/* 0BA27C 800BF81C 9003000C */  stw     r0, 0xc(r3)
/* 0BA280 800BF820 480003A9 */  bl      stateMotorStopped
lbl_800BF824:
/* 0BA284 800BF824 8001001C */  lwz     r0, 0x1c(r1)
/* 0BA288 800BF828 83E10014 */  lwz     r31, 0x14(r1)
/* 0BA28C 800BF82C 38210018 */  addi    r1, r1, 0x18
/* 0BA290 800BF830 7C0803A6 */  mtlr    r0
/* 0BA294 800BF834 4E800020 */  blr     

cbForStateCheckID2:
/* 0BA298 800BF838 7C0802A6 */  mflr    r0
/* 0BA29C 800BF83C 28030010 */  cmplwi  r3, 0x10
/* 0BA2A0 800BF840 90010004 */  stw     r0, 4(r1)
/* 0BA2A4 800BF844 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BA2A8 800BF848 93E10014 */  stw     r31, 0x14(r1)
/* 0BA2AC 800BF84C 4082002C */  bne     lbl_800BF878
/* 0BA2B0 800BF850 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA2B4 800BF854 3800FFFF */  li      r0, -1
/* 0BA2B8 800BF858 3C600123 */  lis     r3, 0x123
/* 0BA2BC 800BF85C 9004000C */  stw     r0, 0xc(r4)
/* 0BA2C0 800BF860 38634568 */  addi    r3, r3, 0x4568
/* 0BA2C4 800BF864 480022E1 */  bl      __DVDStoreErrorCode
/* 0BA2C8 800BF868 4800188D */  bl      DVDReset
/* 0BA2CC 800BF86C 38600000 */  li      r3, 0
/* 0BA2D0 800BF870 4BFFF5F1 */  bl      cbForStateError
/* 0BA2D4 800BF874 48000094 */  b       lbl_800BF908
lbl_800BF878:
/* 0BA2D8 800BF878 546007FF */  clrlwi. r0, r3, 0x1f
/* 0BA2DC 800BF87C 41820080 */  beq     lbl_800BF8FC
/* 0BA2E0 800BF880 3C60800C */  lis     r3, stateReadingFST@ha
/* 0BA2E4 800BF884 808D9320 */  lwz     r4, bootInfo-_SDA_BASE_(r13)
/* 0BA2E8 800BF888 3803ED40 */  addi    r0, r3, stateReadingFST@l
/* 0BA2EC 800BF88C 38A00000 */  li      r5, 0
/* 0BA2F0 800BF890 900D935C */  stw     r0, LastState-_SDA_BASE_(r13)
/* 0BA2F4 800BF894 3C608014 */  lis     r3, BB2@ha
/* 0BA2F8 800BF898 90AD934C */  stw     r5, NumInternalRetry-_SDA_BASE_(r13)
/* 0BA2FC 800BF89C 386322A0 */  addi    r3, r3, BB2@l
/* 0BA300 800BF8A0 3BE30008 */  addi    r31, r3, 8
/* 0BA304 800BF8A4 8064003C */  lwz     r3, 0x3c(r4)
/* 0BA308 800BF8A8 801F0000 */  lwz     r0, 0(r31)
/* 0BA30C 800BF8AC 7C030040 */  cmplw   r3, r0
/* 0BA310 800BF8B0 4080001C */  bge     lbl_800BF8CC
/* 0BA314 800BF8B4 3C608010 */  lis     r3, D_8010079C@ha
/* 0BA318 800BF8B8 4CC63182 */  crclr   6
/* 0BA31C 800BF8BC 38A3079C */  addi    r5, r3, D_8010079C@l
/* 0BA320 800BF8C0 386D8DE4 */  addi    r3, r13, D_801457C4-_SDA_BASE_
/* 0BA324 800BF8C4 3880028A */  li      r4, 0x28a
/* 0BA328 800BF8C8 4BFEA825 */  bl      OSPanic
lbl_800BF8CC:
/* 0BA32C 800BF8CC 3C608014 */  lis     r3, BB2@ha
/* 0BA330 800BF8D0 80DF0000 */  lwz     r6, 0(r31)
/* 0BA334 800BF8D4 38A322A0 */  addi    r5, r3, BB2@l
/* 0BA338 800BF8D8 80ED9320 */  lwz     r7, bootInfo-_SDA_BASE_(r13)
/* 0BA33C 800BF8DC 3C80800C */  lis     r4, cbForStateReadingFST@ha
/* 0BA340 800BF8E0 80A50004 */  lwz     r5, 4(r5)
/* 0BA344 800BF8E4 3806001F */  addi    r0, r6, 0x1f
/* 0BA348 800BF8E8 80670038 */  lwz     r3, 0x38(r7)
/* 0BA34C 800BF8EC 38C4EDD4 */  addi    r6, r4, cbForStateReadingFST@l
/* 0BA350 800BF8F0 54040034 */  rlwinm  r4, r0, 0, 0, 0x1a
/* 0BA354 800BF8F4 4BFFDFE5 */  bl      DVDLowRead
/* 0BA358 800BF8F8 48000010 */  b       lbl_800BF908
lbl_800BF8FC:
/* 0BA35C 800BF8FC 3C60800C */  lis     r3, cbForStateGettingError@ha
/* 0BA360 800BF900 3863F01C */  addi    r3, r3, cbForStateGettingError@l
/* 0BA364 800BF904 4BFFE45D */  bl      DVDLowRequestError
lbl_800BF908:
/* 0BA368 800BF908 8001001C */  lwz     r0, 0x1c(r1)
/* 0BA36C 800BF90C 83E10014 */  lwz     r31, 0x14(r1)
/* 0BA370 800BF910 38210018 */  addi    r1, r1, 0x18
/* 0BA374 800BF914 7C0803A6 */  mtlr    r0
/* 0BA378 800BF918 4E800020 */  blr     

cbForStateCheckID3:
/* 0BA37C 800BF91C 7C0802A6 */  mflr    r0
/* 0BA380 800BF920 28030010 */  cmplwi  r3, 0x10
/* 0BA384 800BF924 90010004 */  stw     r0, 4(r1)
/* 0BA388 800BF928 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BA38C 800BF92C 93E10014 */  stw     r31, 0x14(r1)
/* 0BA390 800BF930 4082002C */  bne     lbl_800BF95C
/* 0BA394 800BF934 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA398 800BF938 3800FFFF */  li      r0, -1
/* 0BA39C 800BF93C 3C600123 */  lis     r3, 0x123
/* 0BA3A0 800BF940 9004000C */  stw     r0, 0xc(r4)
/* 0BA3A4 800BF944 38634568 */  addi    r3, r3, 0x4568
/* 0BA3A8 800BF948 480021FD */  bl      __DVDStoreErrorCode
/* 0BA3AC 800BF94C 480017A9 */  bl      DVDReset
/* 0BA3B0 800BF950 38600000 */  li      r3, 0
/* 0BA3B4 800BF954 4BFFF50D */  bl      cbForStateError
/* 0BA3B8 800BF958 480000AC */  b       lbl_800BFA04
lbl_800BF95C:
/* 0BA3BC 800BF95C 546007FF */  clrlwi. r0, r3, 0x1f
/* 0BA3C0 800BF960 41820098 */  beq     lbl_800BF9F8
/* 0BA3C4 800BF964 38800000 */  li      r4, 0
/* 0BA3C8 800BF968 908D934C */  stw     r4, NumInternalRetry-_SDA_BASE_(r13)
/* 0BA3CC 800BF96C 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BA3D0 800BF970 28000000 */  cmplwi  r0, 0
/* 0BA3D4 800BF974 41820064 */  beq     lbl_800BF9D8
/* 0BA3D8 800BF978 908D9340 */  stw     r4, ResumeFromHere-_SDA_BASE_(r13)
/* 0BA3DC 800BF97C 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0BA3E0 800BF980 83ED9318 */  lwz     r31, executing-_SDA_BASE_(r13)
/* 0BA3E4 800BF984 386322E0 */  addi    r3, r3, DummyCommandBlock@l
/* 0BA3E8 800BF988 908D9338 */  stw     r4, Canceling-_SDA_BASE_(r13)
/* 0BA3EC 800BF98C 3800000A */  li      r0, 0xa
/* 0BA3F0 800BF990 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BA3F4 800BF994 901F000C */  stw     r0, 0xc(r31)
/* 0BA3F8 800BF998 819F0028 */  lwz     r12, 0x28(r31)
/* 0BA3FC 800BF99C 280C0000 */  cmplwi  r12, 0
/* 0BA400 800BF9A0 41820014 */  beq     lbl_800BF9B4
/* 0BA404 800BF9A4 7D8803A6 */  mtlr    r12
/* 0BA408 800BF9A8 389F0000 */  addi    r4, r31, 0
/* 0BA40C 800BF9AC 3860FFFD */  li      r3, -3
/* 0BA410 800BF9B0 4E800021 */  blrl    
lbl_800BF9B4:
/* 0BA414 800BF9B4 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0BA418 800BF9B8 280C0000 */  cmplwi  r12, 0
/* 0BA41C 800BF9BC 41820014 */  beq     lbl_800BF9D0
/* 0BA420 800BF9C0 7D8803A6 */  mtlr    r12
/* 0BA424 800BF9C4 389F0000 */  addi    r4, r31, 0
/* 0BA428 800BF9C8 38600000 */  li      r3, 0
/* 0BA42C 800BF9CC 4E800021 */  blrl    
lbl_800BF9D0:
/* 0BA430 800BF9D0 48000305 */  bl      stateReady
/* 0BA434 800BF9D4 38800001 */  li      r4, 1
lbl_800BF9D8:
/* 0BA438 800BF9D8 2C040000 */  cmpwi   r4, 0
/* 0BA43C 800BF9DC 40820028 */  bne     lbl_800BFA04
/* 0BA440 800BF9E0 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA444 800BF9E4 38000001 */  li      r0, 1
/* 0BA448 800BF9E8 9003000C */  stw     r0, 0xc(r3)
/* 0BA44C 800BF9EC 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA450 800BF9F0 48000515 */  bl      stateBusy
/* 0BA454 800BF9F4 48000010 */  b       lbl_800BFA04
lbl_800BF9F8:
/* 0BA458 800BF9F8 3C60800C */  lis     r3, cbForStateGettingError@ha
/* 0BA45C 800BF9FC 3863F01C */  addi    r3, r3, cbForStateGettingError@l
/* 0BA460 800BFA00 4BFFE361 */  bl      DVDLowRequestError
lbl_800BFA04:
/* 0BA464 800BFA04 8001001C */  lwz     r0, 0x1c(r1)
/* 0BA468 800BFA08 83E10014 */  lwz     r31, 0x14(r1)
/* 0BA46C 800BFA0C 38210018 */  addi    r1, r1, 0x18
/* 0BA470 800BFA10 7C0803A6 */  mtlr    r0
/* 0BA474 800BFA14 4E800020 */  blr     

AlarmHandler:
/* 0BA478 800BFA18 7C0802A6 */  mflr    r0
/* 0BA47C 800BFA1C 90010004 */  stw     r0, 4(r1)
/* 0BA480 800BFA20 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA484 800BFA24 480016D1 */  bl      DVDReset
/* 0BA488 800BFA28 3C608014 */  lis     r3, CurrDiskID@ha
/* 0BA48C 800BFA2C 386322C0 */  addi    r3, r3, CurrDiskID@l
/* 0BA490 800BFA30 38800020 */  li      r4, 0x20
/* 0BA494 800BFA34 4BFE9791 */  bl      DCInvalidateRange
/* 0BA498 800BFA38 3C80800C */  lis     r4, stateCoverClosed_CMD@ha
/* 0BA49C 800BFA3C 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA4A0 800BFA40 3804FB28 */  addi    r0, r4, stateCoverClosed_CMD@l
/* 0BA4A4 800BFA44 900D935C */  stw     r0, LastState-_SDA_BASE_(r13)
/* 0BA4A8 800BFA48 480000E1 */  bl      stateCoverClosed_CMD
/* 0BA4AC 800BFA4C 8001000C */  lwz     r0, 0xc(r1)
/* 0BA4B0 800BFA50 38210008 */  addi    r1, r1, 8
/* 0BA4B4 800BFA54 7C0803A6 */  mtlr    r0
/* 0BA4B8 800BFA58 4E800020 */  blr     

stateCoverClosed:
/* 0BA4BC 800BFA5C 7C0802A6 */  mflr    r0
/* 0BA4C0 800BFA60 3C608014 */  lis     r3, BB2@ha
/* 0BA4C4 800BFA64 90010004 */  stw     r0, 4(r1)
/* 0BA4C8 800BFA68 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0BA4CC 800BFA6C 93E1000C */  stw     r31, 0xc(r1)
/* 0BA4D0 800BFA70 3BE322A0 */  addi    r31, r3, BB2@l
/* 0BA4D4 800BFA74 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BA4D8 800BFA78 2C00000D */  cmpwi   r0, 0xd
/* 0BA4DC 800BFA7C 41820028 */  beq     lbl_800BFAA4
/* 0BA4E0 800BFA80 40800018 */  bge     lbl_800BFA98
/* 0BA4E4 800BFA84 2C000006 */  cmpwi   r0, 6
/* 0BA4E8 800BFA88 4080004C */  bge     lbl_800BFAD4
/* 0BA4EC 800BFA8C 2C000004 */  cmpwi   r0, 4
/* 0BA4F0 800BFA90 40800014 */  bge     lbl_800BFAA4
/* 0BA4F4 800BFA94 48000040 */  b       lbl_800BFAD4
lbl_800BFA98:
/* 0BA4F8 800BFA98 2C00000F */  cmpwi   r0, 0xf
/* 0BA4FC 800BFA9C 41820008 */  beq     lbl_800BFAA4
/* 0BA500 800BFAA0 48000034 */  b       lbl_800BFAD4
lbl_800BFAA4:
/* 0BA504 800BFAA4 48001D8D */  bl      __DVDClearWaitingQueue
/* 0BA508 800BFAA8 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA50C 800BFAAC 381F0040 */  addi    r0, r31, 0x40
/* 0BA510 800BFAB0 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA514 800BFAB4 81840028 */  lwz     r12, 0x28(r4)
/* 0BA518 800BFAB8 280C0000 */  cmplwi  r12, 0
/* 0BA51C 800BFABC 41820010 */  beq     lbl_800BFACC
/* 0BA520 800BFAC0 7D8803A6 */  mtlr    r12
/* 0BA524 800BFAC4 3860FFFC */  li      r3, -4
/* 0BA528 800BFAC8 4E800021 */  blrl    
lbl_800BFACC:
/* 0BA52C 800BFACC 48000209 */  bl      stateReady
/* 0BA530 800BFAD0 48000044 */  b       lbl_800BFB14
lbl_800BFAD4:
/* 0BA534 800BFAD4 48001621 */  bl      DVDReset
/* 0BA538 800BFAD8 387F0070 */  addi    r3, r31, 0x70
/* 0BA53C 800BFADC 4BFE86AD */  bl      OSCreateAlarm
/* 0BA540 800BFAE0 3C608000 */  lis     r3, 0x8000
/* 0BA544 800BFAE4 800300F8 */  lwz     r0, 0xf8(r3)
/* 0BA548 800BFAE8 3C801062 */  lis     r4, 0x1062
/* 0BA54C 800BFAEC 3C60800C */  lis     r3, AlarmHandler@ha
/* 0BA550 800BFAF0 5400F0BE */  srwi    r0, r0, 2
/* 0BA554 800BFAF4 38844DD3 */  addi    r4, r4, 0x4dd3
/* 0BA558 800BFAF8 7C040016 */  mulhwu  r0, r4, r0
/* 0BA55C 800BFAFC 5400D1BE */  srwi    r0, r0, 6
/* 0BA560 800BFB00 1CC0047E */  mulli   r6, r0, 0x47e
/* 0BA564 800BFB04 38E3FA18 */  addi    r7, r3, AlarmHandler@l
/* 0BA568 800BFB08 387F0070 */  addi    r3, r31, 0x70
/* 0BA56C 800BFB0C 38A00000 */  li      r5, 0
/* 0BA570 800BFB10 4BFE88D9 */  bl      OSSetAlarm
lbl_800BFB14:
/* 0BA574 800BFB14 80010014 */  lwz     r0, 0x14(r1)
/* 0BA578 800BFB18 83E1000C */  lwz     r31, 0xc(r1)
/* 0BA57C 800BFB1C 38210010 */  addi    r1, r1, 0x10
/* 0BA580 800BFB20 7C0803A6 */  mtlr    r0
/* 0BA584 800BFB24 4E800020 */  blr     

stateCoverClosed_CMD:
/* 0BA588 800BFB28 7C0802A6 */  mflr    r0
/* 0BA58C 800BFB2C 3C608014 */  lis     r3, CurrDiskID@ha
/* 0BA590 800BFB30 90010004 */  stw     r0, 4(r1)
/* 0BA594 800BFB34 3C80800C */  lis     r4, cbForStateCoverClosed@ha
/* 0BA598 800BFB38 386322C0 */  addi    r3, r3, CurrDiskID@l
/* 0BA59C 800BFB3C 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA5A0 800BFB40 3884FB58 */  addi    r4, r4, cbForStateCoverClosed@l
/* 0BA5A4 800BFB44 4BFFE0ED */  bl      DVDLowReadDiskID
/* 0BA5A8 800BFB48 8001000C */  lwz     r0, 0xc(r1)
/* 0BA5AC 800BFB4C 38210008 */  addi    r1, r1, 8
/* 0BA5B0 800BFB50 7C0803A6 */  mtlr    r0
/* 0BA5B4 800BFB54 4E800020 */  blr     

cbForStateCoverClosed:
/* 0BA5B8 800BFB58 7C0802A6 */  mflr    r0
/* 0BA5BC 800BFB5C 28030010 */  cmplwi  r3, 0x10
/* 0BA5C0 800BFB60 90010004 */  stw     r0, 4(r1)
/* 0BA5C4 800BFB64 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA5C8 800BFB68 4082002C */  bne     lbl_800BFB94
/* 0BA5CC 800BFB6C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA5D0 800BFB70 3800FFFF */  li      r0, -1
/* 0BA5D4 800BFB74 3C600123 */  lis     r3, 0x123
/* 0BA5D8 800BFB78 9004000C */  stw     r0, 0xc(r4)
/* 0BA5DC 800BFB7C 38634568 */  addi    r3, r3, 0x4568
/* 0BA5E0 800BFB80 48001FC5 */  bl      __DVDStoreErrorCode
/* 0BA5E4 800BFB84 48001571 */  bl      DVDReset
/* 0BA5E8 800BFB88 38600000 */  li      r3, 0
/* 0BA5EC 800BFB8C 4BFFF2D5 */  bl      cbForStateError
/* 0BA5F0 800BFB90 48000028 */  b       lbl_800BFBB8
lbl_800BFB94:
/* 0BA5F4 800BFB94 546007FF */  clrlwi. r0, r3, 0x1f
/* 0BA5F8 800BFB98 41820014 */  beq     lbl_800BFBAC
/* 0BA5FC 800BFB9C 38000000 */  li      r0, 0
/* 0BA600 800BFBA0 900D934C */  stw     r0, NumInternalRetry-_SDA_BASE_(r13)
/* 0BA604 800BFBA4 4BFFF98D */  bl      stateCheckID
/* 0BA608 800BFBA8 48000010 */  b       lbl_800BFBB8
lbl_800BFBAC:
/* 0BA60C 800BFBAC 3C60800C */  lis     r3, cbForStateGettingError@ha
/* 0BA610 800BFBB0 3863F01C */  addi    r3, r3, cbForStateGettingError@l
/* 0BA614 800BFBB4 4BFFE1AD */  bl      DVDLowRequestError
lbl_800BFBB8:
/* 0BA618 800BFBB8 8001000C */  lwz     r0, 0xc(r1)
/* 0BA61C 800BFBBC 38210008 */  addi    r1, r1, 8
/* 0BA620 800BFBC0 7C0803A6 */  mtlr    r0
/* 0BA624 800BFBC4 4E800020 */  blr     

stateMotorStopped:
/* 0BA628 800BFBC8 7C0802A6 */  mflr    r0
/* 0BA62C 800BFBCC 3C60800C */  lis     r3, cbForStateMotorStopped@ha
/* 0BA630 800BFBD0 90010004 */  stw     r0, 4(r1)
/* 0BA634 800BFBD4 3863FBF0 */  addi    r3, r3, cbForStateMotorStopped@l
/* 0BA638 800BFBD8 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA63C 800BFBDC 4BFFE029 */  bl      DVDLowWaitCoverClose
/* 0BA640 800BFBE0 8001000C */  lwz     r0, 0xc(r1)
/* 0BA644 800BFBE4 38210008 */  addi    r1, r1, 8
/* 0BA648 800BFBE8 7C0803A6 */  mtlr    r0
/* 0BA64C 800BFBEC 4E800020 */  blr     

cbForStateMotorStopped:
/* 0BA650 800BFBF0 7C0802A6 */  mflr    r0
/* 0BA654 800BFBF4 3C60CC00 */  lis     r3, 0xcc00
/* 0BA658 800BFBF8 90010004 */  stw     r0, 4(r1)
/* 0BA65C 800BFBFC 38000000 */  li      r0, 0
/* 0BA660 800BFC00 3C808014 */  lis     r4, BB2@ha
/* 0BA664 800BFC04 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BA668 800BFC08 93E10014 */  stw     r31, 0x14(r1)
/* 0BA66C 800BFC0C 3BE422A0 */  addi    r31, r4, BB2@l
/* 0BA670 800BFC10 90036004 */  stw     r0, 0x6004(r3)
/* 0BA674 800BFC14 38000003 */  li      r0, 3
/* 0BA678 800BFC18 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA67C 800BFC1C 9003000C */  stw     r0, 0xc(r3)
/* 0BA680 800BFC20 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BA684 800BFC24 2C00000D */  cmpwi   r0, 0xd
/* 0BA688 800BFC28 41820028 */  beq     lbl_800BFC50
/* 0BA68C 800BFC2C 40800018 */  bge     lbl_800BFC44
/* 0BA690 800BFC30 2C000006 */  cmpwi   r0, 6
/* 0BA694 800BFC34 4080004C */  bge     lbl_800BFC80
/* 0BA698 800BFC38 2C000004 */  cmpwi   r0, 4
/* 0BA69C 800BFC3C 40800014 */  bge     lbl_800BFC50
/* 0BA6A0 800BFC40 48000040 */  b       lbl_800BFC80
lbl_800BFC44:
/* 0BA6A4 800BFC44 2C00000F */  cmpwi   r0, 0xf
/* 0BA6A8 800BFC48 41820008 */  beq     lbl_800BFC50
/* 0BA6AC 800BFC4C 48000034 */  b       lbl_800BFC80
lbl_800BFC50:
/* 0BA6B0 800BFC50 48001BE1 */  bl      __DVDClearWaitingQueue
/* 0BA6B4 800BFC54 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA6B8 800BFC58 381F0040 */  addi    r0, r31, 0x40
/* 0BA6BC 800BFC5C 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA6C0 800BFC60 81840028 */  lwz     r12, 0x28(r4)
/* 0BA6C4 800BFC64 280C0000 */  cmplwi  r12, 0
/* 0BA6C8 800BFC68 41820010 */  beq     lbl_800BFC78
/* 0BA6CC 800BFC6C 7D8803A6 */  mtlr    r12
/* 0BA6D0 800BFC70 3860FFFC */  li      r3, -4
/* 0BA6D4 800BFC74 4E800021 */  blrl    
lbl_800BFC78:
/* 0BA6D8 800BFC78 4800005D */  bl      stateReady
/* 0BA6DC 800BFC7C 48000044 */  b       lbl_800BFCC0
lbl_800BFC80:
/* 0BA6E0 800BFC80 48001475 */  bl      DVDReset
/* 0BA6E4 800BFC84 387F0070 */  addi    r3, r31, 0x70
/* 0BA6E8 800BFC88 4BFE8501 */  bl      OSCreateAlarm
/* 0BA6EC 800BFC8C 3C608000 */  lis     r3, 0x8000
/* 0BA6F0 800BFC90 800300F8 */  lwz     r0, 0xf8(r3)
/* 0BA6F4 800BFC94 3C801062 */  lis     r4, 0x1062
/* 0BA6F8 800BFC98 3C60800C */  lis     r3, AlarmHandler@ha
/* 0BA6FC 800BFC9C 5400F0BE */  srwi    r0, r0, 2
/* 0BA700 800BFCA0 38844DD3 */  addi    r4, r4, 0x4dd3
/* 0BA704 800BFCA4 7C040016 */  mulhwu  r0, r4, r0
/* 0BA708 800BFCA8 5400D1BE */  srwi    r0, r0, 6
/* 0BA70C 800BFCAC 1CC0047E */  mulli   r6, r0, 0x47e
/* 0BA710 800BFCB0 38E3FA18 */  addi    r7, r3, AlarmHandler@l
/* 0BA714 800BFCB4 387F0070 */  addi    r3, r31, 0x70
/* 0BA718 800BFCB8 38A00000 */  li      r5, 0
/* 0BA71C 800BFCBC 4BFE872D */  bl      OSSetAlarm
lbl_800BFCC0:
/* 0BA720 800BFCC0 8001001C */  lwz     r0, 0x1c(r1)
/* 0BA724 800BFCC4 83E10014 */  lwz     r31, 0x14(r1)
/* 0BA728 800BFCC8 38210018 */  addi    r1, r1, 0x18
/* 0BA72C 800BFCCC 7C0803A6 */  mtlr    r0
/* 0BA730 800BFCD0 4E800020 */  blr     

stateReady:
/* 0BA734 800BFCD4 7C0802A6 */  mflr    r0
/* 0BA738 800BFCD8 3C608014 */  lis     r3, BB2@ha
/* 0BA73C 800BFCDC 90010004 */  stw     r0, 4(r1)
/* 0BA740 800BFCE0 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0BA744 800BFCE4 93E1000C */  stw     r31, 0xc(r1)
/* 0BA748 800BFCE8 3BE322A0 */  addi    r31, r3, BB2@l
/* 0BA74C 800BFCEC 48001C85 */  bl      __DVDCheckWaitingQueue
/* 0BA750 800BFCF0 2C030000 */  cmpwi   r3, 0
/* 0BA754 800BFCF4 40820010 */  bne     lbl_800BFD04
/* 0BA758 800BFCF8 38000000 */  li      r0, 0
/* 0BA75C 800BFCFC 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA760 800BFD00 480001F0 */  b       lbl_800BFEF0
lbl_800BFD04:
/* 0BA764 800BFD04 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BA768 800BFD08 2C000000 */  cmpwi   r0, 0
/* 0BA76C 800BFD0C 41820018 */  beq     lbl_800BFD24
/* 0BA770 800BFD10 38600001 */  li      r3, 1
/* 0BA774 800BFD14 38000000 */  li      r0, 0
/* 0BA778 800BFD18 906D9328 */  stw     r3, PausingFlag-_SDA_BASE_(r13)
/* 0BA77C 800BFD1C 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA780 800BFD20 480001D0 */  b       lbl_800BFEF0
lbl_800BFD24:
/* 0BA784 800BFD24 48001BAD */  bl      __DVDPopWaitingQueue
/* 0BA788 800BFD28 800D9330 */  lwz     r0, FatalErrorFlag-_SDA_BASE_(r13)
/* 0BA78C 800BFD2C 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BA790 800BFD30 2C000000 */  cmpwi   r0, 0
/* 0BA794 800BFD34 4182003C */  beq     lbl_800BFD70
/* 0BA798 800BFD38 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA79C 800BFD3C 3880FFFF */  li      r4, -1
/* 0BA7A0 800BFD40 381F0040 */  addi    r0, r31, 0x40
/* 0BA7A4 800BFD44 9083000C */  stw     r4, 0xc(r3)
/* 0BA7A8 800BFD48 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA7AC 800BFD4C 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA7B0 800BFD50 81840028 */  lwz     r12, 0x28(r4)
/* 0BA7B4 800BFD54 280C0000 */  cmplwi  r12, 0
/* 0BA7B8 800BFD58 41820010 */  beq     lbl_800BFD68
/* 0BA7BC 800BFD5C 7D8803A6 */  mtlr    r12
/* 0BA7C0 800BFD60 3860FFFF */  li      r3, -1
/* 0BA7C4 800BFD64 4E800021 */  blrl    
lbl_800BFD68:
/* 0BA7C8 800BFD68 4BFFFF6D */  bl      stateReady
/* 0BA7CC 800BFD6C 48000184 */  b       lbl_800BFEF0
lbl_800BFD70:
/* 0BA7D0 800BFD70 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA7D4 800BFD74 80040008 */  lwz     r0, 8(r4)
/* 0BA7D8 800BFD78 900D9334 */  stw     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BA7DC 800BFD7C 800D9340 */  lwz     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BA7E0 800BFD80 28000000 */  cmplwi  r0, 0
/* 0BA7E4 800BFD84 4182015C */  beq     lbl_800BFEE0
/* 0BA7E8 800BFD88 800D9340 */  lwz     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BA7EC 800BFD8C 2C000004 */  cmpwi   r0, 4
/* 0BA7F0 800BFD90 41820064 */  beq     lbl_800BFDF4
/* 0BA7F4 800BFD94 4080001C */  bge     lbl_800BFDB0
/* 0BA7F8 800BFD98 2C000002 */  cmpwi   r0, 2
/* 0BA7FC 800BFD9C 41820028 */  beq     lbl_800BFDC4
/* 0BA800 800BFDA0 4080003C */  bge     lbl_800BFDDC
/* 0BA804 800BFDA4 2C000001 */  cmpwi   r0, 1
/* 0BA808 800BFDA8 40800064 */  bge     lbl_800BFE0C
/* 0BA80C 800BFDAC 48000128 */  b       lbl_800BFED4
lbl_800BFDB0:
/* 0BA810 800BFDB0 2C000008 */  cmpwi   r0, 8
/* 0BA814 800BFDB4 40800120 */  bge     lbl_800BFED4
/* 0BA818 800BFDB8 2C000006 */  cmpwi   r0, 6
/* 0BA81C 800BFDBC 40800050 */  bge     lbl_800BFE0C
/* 0BA820 800BFDC0 480000F8 */  b       lbl_800BFEB8
lbl_800BFDC4:
/* 0BA824 800BFDC4 3800000B */  li      r0, 0xb
/* 0BA828 800BFDC8 3C60800C */  lis     r3, cbForStateMotorStopped@ha
/* 0BA82C 800BFDCC 9004000C */  stw     r0, 0xc(r4)
/* 0BA830 800BFDD0 3863FBF0 */  addi    r3, r3, cbForStateMotorStopped@l
/* 0BA834 800BFDD4 4BFFDE31 */  bl      DVDLowWaitCoverClose
/* 0BA838 800BFDD8 480000FC */  b       lbl_800BFED4
lbl_800BFDDC:
/* 0BA83C 800BFDDC 38000004 */  li      r0, 4
/* 0BA840 800BFDE0 3C60800C */  lis     r3, cbForStateMotorStopped@ha
/* 0BA844 800BFDE4 9004000C */  stw     r0, 0xc(r4)
/* 0BA848 800BFDE8 3863FBF0 */  addi    r3, r3, cbForStateMotorStopped@l
/* 0BA84C 800BFDEC 4BFFDE19 */  bl      DVDLowWaitCoverClose
/* 0BA850 800BFDF0 480000E4 */  b       lbl_800BFED4
lbl_800BFDF4:
/* 0BA854 800BFDF4 38000005 */  li      r0, 5
/* 0BA858 800BFDF8 3C60800C */  lis     r3, cbForStateMotorStopped@ha
/* 0BA85C 800BFDFC 9004000C */  stw     r0, 0xc(r4)
/* 0BA860 800BFE00 3863FBF0 */  addi    r3, r3, cbForStateMotorStopped@l
/* 0BA864 800BFE04 4BFFDE01 */  bl      DVDLowWaitCoverClose
/* 0BA868 800BFE08 480000CC */  b       lbl_800BFED4
lbl_800BFE0C:
/* 0BA86C 800BFE0C 38000003 */  li      r0, 3
/* 0BA870 800BFE10 9004000C */  stw     r0, 0xc(r4)
/* 0BA874 800BFE14 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BA878 800BFE18 2C00000D */  cmpwi   r0, 0xd
/* 0BA87C 800BFE1C 41820028 */  beq     lbl_800BFE44
/* 0BA880 800BFE20 40800018 */  bge     lbl_800BFE38
/* 0BA884 800BFE24 2C000006 */  cmpwi   r0, 6
/* 0BA888 800BFE28 4080004C */  bge     lbl_800BFE74
/* 0BA88C 800BFE2C 2C000004 */  cmpwi   r0, 4
/* 0BA890 800BFE30 40800014 */  bge     lbl_800BFE44
/* 0BA894 800BFE34 48000040 */  b       lbl_800BFE74
lbl_800BFE38:
/* 0BA898 800BFE38 2C00000F */  cmpwi   r0, 0xf
/* 0BA89C 800BFE3C 41820008 */  beq     lbl_800BFE44
/* 0BA8A0 800BFE40 48000034 */  b       lbl_800BFE74
lbl_800BFE44:
/* 0BA8A4 800BFE44 480019ED */  bl      __DVDClearWaitingQueue
/* 0BA8A8 800BFE48 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA8AC 800BFE4C 381F0040 */  addi    r0, r31, 0x40
/* 0BA8B0 800BFE50 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA8B4 800BFE54 81840028 */  lwz     r12, 0x28(r4)
/* 0BA8B8 800BFE58 280C0000 */  cmplwi  r12, 0
/* 0BA8BC 800BFE5C 41820010 */  beq     lbl_800BFE6C
/* 0BA8C0 800BFE60 7D8803A6 */  mtlr    r12
/* 0BA8C4 800BFE64 3860FFFC */  li      r3, -4
/* 0BA8C8 800BFE68 4E800021 */  blrl    
lbl_800BFE6C:
/* 0BA8CC 800BFE6C 4BFFFE69 */  bl      stateReady
/* 0BA8D0 800BFE70 48000064 */  b       lbl_800BFED4
lbl_800BFE74:
/* 0BA8D4 800BFE74 48001281 */  bl      DVDReset
/* 0BA8D8 800BFE78 387F0070 */  addi    r3, r31, 0x70
/* 0BA8DC 800BFE7C 4BFE830D */  bl      OSCreateAlarm
/* 0BA8E0 800BFE80 3C608000 */  lis     r3, 0x8000
/* 0BA8E4 800BFE84 800300F8 */  lwz     r0, 0xf8(r3)
/* 0BA8E8 800BFE88 3C801062 */  lis     r4, 0x1062
/* 0BA8EC 800BFE8C 3C60800C */  lis     r3, AlarmHandler@ha
/* 0BA8F0 800BFE90 5400F0BE */  srwi    r0, r0, 2
/* 0BA8F4 800BFE94 38844DD3 */  addi    r4, r4, 0x4dd3
/* 0BA8F8 800BFE98 7C040016 */  mulhwu  r0, r4, r0
/* 0BA8FC 800BFE9C 5400D1BE */  srwi    r0, r0, 6
/* 0BA900 800BFEA0 1CC0047E */  mulli   r6, r0, 0x47e
/* 0BA904 800BFEA4 38E3FA18 */  addi    r7, r3, AlarmHandler@l
/* 0BA908 800BFEA8 387F0070 */  addi    r3, r31, 0x70
/* 0BA90C 800BFEAC 38A00000 */  li      r5, 0
/* 0BA910 800BFEB0 4BFE8539 */  bl      OSSetAlarm
/* 0BA914 800BFEB4 48000020 */  b       lbl_800BFED4
lbl_800BFEB8:
/* 0BA918 800BFEB8 3800FFFF */  li      r0, -1
/* 0BA91C 800BFEBC 9004000C */  stw     r0, 0xc(r4)
/* 0BA920 800BFEC0 806D9344 */  lwz     r3, CancelLastError-_SDA_BASE_(r13)
/* 0BA924 800BFEC4 48001C81 */  bl      __DVDStoreErrorCode
/* 0BA928 800BFEC8 3C60800C */  lis     r3, cbForStateError@ha
/* 0BA92C 800BFECC 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0BA930 800BFED0 4BFFDE05 */  bl      DVDLowStopMotor
lbl_800BFED4:
/* 0BA934 800BFED4 38000000 */  li      r0, 0
/* 0BA938 800BFED8 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BA93C 800BFEDC 48000014 */  b       lbl_800BFEF0
lbl_800BFEE0:
/* 0BA940 800BFEE0 38000001 */  li      r0, 1
/* 0BA944 800BFEE4 9004000C */  stw     r0, 0xc(r4)
/* 0BA948 800BFEE8 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BA94C 800BFEEC 48000019 */  bl      stateBusy
lbl_800BFEF0:
/* 0BA950 800BFEF0 80010014 */  lwz     r0, 0x14(r1)
/* 0BA954 800BFEF4 83E1000C */  lwz     r31, 0xc(r1)
/* 0BA958 800BFEF8 38210010 */  addi    r1, r1, 0x10
/* 0BA95C 800BFEFC 7C0803A6 */  mtlr    r0
/* 0BA960 800BFF00 4E800020 */  blr     

stateBusy:
/* 0BA964 800BFF04 7C0802A6 */  mflr    r0
/* 0BA968 800BFF08 3C80800C */  lis     r4, stateBusy@ha
/* 0BA96C 800BFF0C 90010004 */  stw     r0, 4(r1)
/* 0BA970 800BFF10 3804FF04 */  addi    r0, r4, stateBusy@l
/* 0BA974 800BFF14 7C671B78 */  mr      r7, r3
/* 0BA978 800BFF18 9421FFF8 */  stwu    r1, -8(r1)
/* 0BA97C 800BFF1C 900D935C */  stw     r0, LastState-_SDA_BASE_(r13)
/* 0BA980 800BFF20 80030008 */  lwz     r0, 8(r3)
/* 0BA984 800BFF24 2800000F */  cmplwi  r0, 0xf
/* 0BA988 800BFF28 418102D4 */  bgt     lbl_800C01FC
/* 0BA98C 800BFF2C 3C608010 */  lis     r3, jtbl_801007D0@ha
/* 0BA990 800BFF30 386307D0 */  addi    r3, r3, jtbl_801007D0@l
/* 0BA994 800BFF34 5400103A */  slwi    r0, r0, 2
/* 0BA998 800BFF38 7C03002E */  lwzx    r0, r3, r0
/* 0BA99C 800BFF3C 7C0903A6 */  mtctr   r0
/* 0BA9A0 800BFF40 4E800420 */  bctr    
glabel lbl_800BFF44
/* 0BA9A4 800BFF44 3C60CC00 */  lis     r3, 0xcc00
/* 0BA9A8 800BFF48 80036004 */  lwz     r0, 0x6004(r3)
/* 0BA9AC 800BFF4C 38A36000 */  addi    r5, r3, 0x6000
/* 0BA9B0 800BFF50 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BA9B4 800BFF54 90050004 */  stw     r0, 4(r5)
/* 0BA9B8 800BFF58 38000020 */  li      r0, 0x20
/* 0BA9BC 800BFF5C 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BA9C0 800BFF60 9007001C */  stw     r0, 0x1c(r7)
/* 0BA9C4 800BFF64 80670018 */  lwz     r3, 0x18(r7)
/* 0BA9C8 800BFF68 4BFFDCC9 */  bl      DVDLowReadDiskID
/* 0BA9CC 800BFF6C 480002A8 */  b       lbl_800C0214
glabel lbl_800BFF70
/* 0BA9D0 800BFF70 80070014 */  lwz     r0, 0x14(r7)
/* 0BA9D4 800BFF74 28000000 */  cmplwi  r0, 0
/* 0BA9D8 800BFF78 4082003C */  bne     lbl_800BFFB4
/* 0BA9DC 800BFF7C 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0BA9E0 800BFF80 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BA9E4 800BFF84 380322E0 */  addi    r0, r3, DummyCommandBlock@l
/* 0BA9E8 800BFF88 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BA9EC 800BFF8C 38000000 */  li      r0, 0
/* 0BA9F0 800BFF90 9004000C */  stw     r0, 0xc(r4)
/* 0BA9F4 800BFF94 81840028 */  lwz     r12, 0x28(r4)
/* 0BA9F8 800BFF98 280C0000 */  cmplwi  r12, 0
/* 0BA9FC 800BFF9C 41820010 */  beq     lbl_800BFFAC
/* 0BAA00 800BFFA0 7D8803A6 */  mtlr    r12
/* 0BAA04 800BFFA4 38600000 */  li      r3, 0
/* 0BAA08 800BFFA8 4E800021 */  blrl    
lbl_800BFFAC:
/* 0BAA0C 800BFFAC 4BFFFD29 */  bl      stateReady
/* 0BAA10 800BFFB0 48000264 */  b       lbl_800C0214
lbl_800BFFB4:
/* 0BAA14 800BFFB4 3C60CC00 */  lis     r3, 0xcc00
/* 0BAA18 800BFFB8 38636000 */  addi    r3, r3, 0x6000
/* 0BAA1C 800BFFBC 80030004 */  lwz     r0, 4(r3)
/* 0BAA20 800BFFC0 3C800008 */  lis     r4, 8
/* 0BAA24 800BFFC4 90030004 */  stw     r0, 4(r3)
/* 0BAA28 800BFFC8 80670020 */  lwz     r3, 0x20(r7)
/* 0BAA2C 800BFFCC 80070014 */  lwz     r0, 0x14(r7)
/* 0BAA30 800BFFD0 7C030050 */  subf    r0, r3, r0
/* 0BAA34 800BFFD4 7C002040 */  cmplw   r0, r4
/* 0BAA38 800BFFD8 40810008 */  ble     lbl_800BFFE0
/* 0BAA3C 800BFFDC 48000008 */  b       lbl_800BFFE4
lbl_800BFFE0:
/* 0BAA40 800BFFE0 7C040378 */  mr      r4, r0
lbl_800BFFE4:
/* 0BAA44 800BFFE4 9087001C */  stw     r4, 0x1c(r7)
/* 0BAA48 800BFFE8 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAA4C 800BFFEC 38C30224 */  addi    r6, r3, cbForStateBusy@l
/* 0BAA50 800BFFF0 80A70020 */  lwz     r5, 0x20(r7)
/* 0BAA54 800BFFF4 80670018 */  lwz     r3, 0x18(r7)
/* 0BAA58 800BFFF8 80070010 */  lwz     r0, 0x10(r7)
/* 0BAA5C 800BFFFC 7C632A14 */  add     r3, r3, r5
/* 0BAA60 800C0000 8087001C */  lwz     r4, 0x1c(r7)
/* 0BAA64 800C0004 7CA02A14 */  add     r5, r0, r5
/* 0BAA68 800C0008 4BFFD8D1 */  bl      DVDLowRead
/* 0BAA6C 800C000C 48000208 */  b       lbl_800C0214
glabel lbl_800C0010
/* 0BAA70 800C0010 3C60CC00 */  lis     r3, 0xcc00
/* 0BAA74 800C0014 80036004 */  lwz     r0, 0x6004(r3)
/* 0BAA78 800C0018 38A36000 */  addi    r5, r3, 0x6000
/* 0BAA7C 800C001C 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAA80 800C0020 90050004 */  stw     r0, 4(r5)
/* 0BAA84 800C0024 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BAA88 800C0028 80670010 */  lwz     r3, 0x10(r7)
/* 0BAA8C 800C002C 4BFFDB45 */  bl      DVDLowSeek
/* 0BAA90 800C0030 480001E4 */  b       lbl_800C0214
glabel lbl_800C0034
/* 0BAA94 800C0034 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAA98 800C0038 38630224 */  addi    r3, r3, cbForStateBusy@l
/* 0BAA9C 800C003C 4BFFDC99 */  bl      DVDLowStopMotor
/* 0BAAA0 800C0040 480001D4 */  b       lbl_800C0214
glabel lbl_800C0044
/* 0BAAA4 800C0044 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAAA8 800C0048 38630224 */  addi    r3, r3, cbForStateBusy@l
/* 0BAAAC 800C004C 4BFFDC89 */  bl      DVDLowStopMotor
/* 0BAAB0 800C0050 480001C4 */  b       lbl_800C0214
glabel lbl_800C0054
/* 0BAAB4 800C0054 3C60CC00 */  lis     r3, 0xcc00
/* 0BAAB8 800C0058 38636000 */  addi    r3, r3, 0x6000
/* 0BAABC 800C005C 80030004 */  lwz     r0, 4(r3)
/* 0BAAC0 800C0060 90030004 */  stw     r0, 4(r3)
/* 0BAAC4 800C0064 800D932C */  lwz     r0, AutoFinishing-_SDA_BASE_(r13)
/* 0BAAC8 800C0068 2C000000 */  cmpwi   r0, 0
/* 0BAACC 800C006C 41820024 */  beq     lbl_800C0090
/* 0BAAD0 800C0070 80AD9318 */  lwz     r5, executing-_SDA_BASE_(r13)
/* 0BAAD4 800C0074 38000000 */  li      r0, 0
/* 0BAAD8 800C0078 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAADC 800C007C 9005001C */  stw     r0, 0x1c(r5)
/* 0BAAE0 800C0080 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BAAE4 800C0084 38600000 */  li      r3, 0
/* 0BAAE8 800C0088 4BFFDE99 */  bl      DVDLowRequestAudioStatus
/* 0BAAEC 800C008C 48000188 */  b       lbl_800C0214
lbl_800C0090:
/* 0BAAF0 800C0090 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BAAF4 800C0094 38000001 */  li      r0, 1
/* 0BAAF8 800C0098 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAAFC 800C009C 9004001C */  stw     r0, 0x1c(r4)
/* 0BAB00 800C00A0 38C30224 */  addi    r6, r3, cbForStateBusy@l
/* 0BAB04 800C00A4 38600000 */  li      r3, 0
/* 0BAB08 800C00A8 80870014 */  lwz     r4, 0x14(r7)
/* 0BAB0C 800C00AC 80A70010 */  lwz     r5, 0x10(r7)
/* 0BAB10 800C00B0 4BFFDDD9 */  bl      DVDLowAudioStream
/* 0BAB14 800C00B4 48000160 */  b       lbl_800C0214
glabel lbl_800C00B8
/* 0BAB18 800C00B8 3C60CC00 */  lis     r3, 0xcc00
/* 0BAB1C 800C00BC 80036004 */  lwz     r0, 0x6004(r3)
/* 0BAB20 800C00C0 38836000 */  addi    r4, r3, 0x6000
/* 0BAB24 800C00C4 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAB28 800C00C8 90040004 */  stw     r0, 4(r4)
/* 0BAB2C 800C00CC 38C30224 */  addi    r6, r3, cbForStateBusy@l
/* 0BAB30 800C00D0 3C600001 */  lis     r3, 1
/* 0BAB34 800C00D4 38800000 */  li      r4, 0
/* 0BAB38 800C00D8 38A00000 */  li      r5, 0
/* 0BAB3C 800C00DC 4BFFDDAD */  bl      DVDLowAudioStream
/* 0BAB40 800C00E0 48000134 */  b       lbl_800C0214
glabel lbl_800C00E4
/* 0BAB44 800C00E4 3C60CC00 */  lis     r3, 0xcc00
/* 0BAB48 800C00E8 80036004 */  lwz     r0, 0x6004(r3)
/* 0BAB4C 800C00EC 38836000 */  addi    r4, r3, 0x6000
/* 0BAB50 800C00F0 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAB54 800C00F4 90040004 */  stw     r0, 4(r4)
/* 0BAB58 800C00F8 38000001 */  li      r0, 1
/* 0BAB5C 800C00FC 38C30224 */  addi    r6, r3, cbForStateBusy@l
/* 0BAB60 800C0100 900D932C */  stw     r0, AutoFinishing-_SDA_BASE_(r13)
/* 0BAB64 800C0104 38600000 */  li      r3, 0
/* 0BAB68 800C0108 38800000 */  li      r4, 0
/* 0BAB6C 800C010C 38A00000 */  li      r5, 0
/* 0BAB70 800C0110 4BFFDD79 */  bl      DVDLowAudioStream
/* 0BAB74 800C0114 48000100 */  b       lbl_800C0214
glabel lbl_800C0118
/* 0BAB78 800C0118 3C60CC00 */  lis     r3, 0xcc00
/* 0BAB7C 800C011C 80036004 */  lwz     r0, 0x6004(r3)
/* 0BAB80 800C0120 38A36000 */  addi    r5, r3, 0x6000
/* 0BAB84 800C0124 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAB88 800C0128 90050004 */  stw     r0, 4(r5)
/* 0BAB8C 800C012C 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BAB90 800C0130 38600000 */  li      r3, 0
/* 0BAB94 800C0134 4BFFDDED */  bl      DVDLowRequestAudioStatus
/* 0BAB98 800C0138 480000DC */  b       lbl_800C0214
glabel lbl_800C013C
/* 0BAB9C 800C013C 3C60CC00 */  lis     r3, 0xcc00
/* 0BABA0 800C0140 80036004 */  lwz     r0, 0x6004(r3)
/* 0BABA4 800C0144 38A36000 */  addi    r5, r3, 0x6000
/* 0BABA8 800C0148 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BABAC 800C014C 90050004 */  stw     r0, 4(r5)
/* 0BABB0 800C0150 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BABB4 800C0154 3C600001 */  lis     r3, 1
/* 0BABB8 800C0158 4BFFDDC9 */  bl      DVDLowRequestAudioStatus
/* 0BABBC 800C015C 480000B8 */  b       lbl_800C0214
glabel lbl_800C0160
/* 0BABC0 800C0160 3C60CC00 */  lis     r3, 0xcc00
/* 0BABC4 800C0164 80036004 */  lwz     r0, 0x6004(r3)
/* 0BABC8 800C0168 38A36000 */  addi    r5, r3, 0x6000
/* 0BABCC 800C016C 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BABD0 800C0170 90050004 */  stw     r0, 4(r5)
/* 0BABD4 800C0174 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BABD8 800C0178 3C600002 */  lis     r3, 2
/* 0BABDC 800C017C 4BFFDDA5 */  bl      DVDLowRequestAudioStatus
/* 0BABE0 800C0180 48000094 */  b       lbl_800C0214
glabel lbl_800C0184
/* 0BABE4 800C0184 3C60CC00 */  lis     r3, 0xcc00
/* 0BABE8 800C0188 80036004 */  lwz     r0, 0x6004(r3)
/* 0BABEC 800C018C 38A36000 */  addi    r5, r3, 0x6000
/* 0BABF0 800C0190 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BABF4 800C0194 90050004 */  stw     r0, 4(r5)
/* 0BABF8 800C0198 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BABFC 800C019C 3C600003 */  lis     r3, 3
/* 0BAC00 800C01A0 4BFFDD81 */  bl      DVDLowRequestAudioStatus
/* 0BAC04 800C01A4 48000070 */  b       lbl_800C0214
glabel lbl_800C01A8
/* 0BAC08 800C01A8 3C60CC00 */  lis     r3, 0xcc00
/* 0BAC0C 800C01AC 80036004 */  lwz     r0, 0x6004(r3)
/* 0BAC10 800C01B0 38836000 */  addi    r4, r3, 0x6000
/* 0BAC14 800C01B4 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAC18 800C01B8 90040004 */  stw     r0, 4(r4)
/* 0BAC1C 800C01BC 38A30224 */  addi    r5, r3, cbForStateBusy@l
/* 0BAC20 800C01C0 80670010 */  lwz     r3, 0x10(r7)
/* 0BAC24 800C01C4 80870014 */  lwz     r4, 0x14(r7)
/* 0BAC28 800C01C8 4BFFDDE5 */  bl      DVDLowAudioBufferConfig
/* 0BAC2C 800C01CC 48000048 */  b       lbl_800C0214
glabel lbl_800C01D0
/* 0BAC30 800C01D0 3C60CC00 */  lis     r3, 0xcc00
/* 0BAC34 800C01D4 80036004 */  lwz     r0, 0x6004(r3)
/* 0BAC38 800C01D8 38A36000 */  addi    r5, r3, 0x6000
/* 0BAC3C 800C01DC 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAC40 800C01E0 90050004 */  stw     r0, 4(r5)
/* 0BAC44 800C01E4 38000020 */  li      r0, 0x20
/* 0BAC48 800C01E8 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BAC4C 800C01EC 9007001C */  stw     r0, 0x1c(r7)
/* 0BAC50 800C01F0 80670018 */  lwz     r3, 0x18(r7)
/* 0BAC54 800C01F4 4BFFDBF9 */  bl      DVDLowInquiry
/* 0BAC58 800C01F8 4800001C */  b       lbl_800C0214
glabel lbl_800C01FC
/* 0BAC5C 800C01FC 818D8DE0 */  lwz     r12, checkOptionalCommand-_SDA_BASE_(r13)
/* 0BAC60 800C0200 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BAC64 800C0204 38830224 */  addi    r4, r3, cbForStateBusy@l
/* 0BAC68 800C0208 7D8803A6 */  mtlr    r12
/* 0BAC6C 800C020C 38670000 */  addi    r3, r7, 0
/* 0BAC70 800C0210 4E800021 */  blrl    
lbl_800C0214:
/* 0BAC74 800C0214 8001000C */  lwz     r0, 0xc(r1)
/* 0BAC78 800C0218 38210008 */  addi    r1, r1, 8
/* 0BAC7C 800C021C 7C0803A6 */  mtlr    r0
/* 0BAC80 800C0220 4E800020 */  blr     

cbForStateBusy:
/* 0BAC84 800C0224 7C0802A6 */  mflr    r0
/* 0BAC88 800C0228 28030010 */  cmplwi  r3, 0x10
/* 0BAC8C 800C022C 90010004 */  stw     r0, 4(r1)
/* 0BAC90 800C0230 3C808014 */  lis     r4, BB2@ha
/* 0BAC94 800C0234 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BAC98 800C0238 93E10014 */  stw     r31, 0x14(r1)
/* 0BAC9C 800C023C 3BE422A0 */  addi    r31, r4, BB2@l
/* 0BACA0 800C0240 93C10010 */  stw     r30, 0x10(r1)
/* 0BACA4 800C0244 4082002C */  bne     lbl_800C0270
/* 0BACA8 800C0248 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BACAC 800C024C 3800FFFF */  li      r0, -1
/* 0BACB0 800C0250 3C600123 */  lis     r3, 0x123
/* 0BACB4 800C0254 9004000C */  stw     r0, 0xc(r4)
/* 0BACB8 800C0258 38634568 */  addi    r3, r3, 0x4568
/* 0BACBC 800C025C 480018E9 */  bl      __DVDStoreErrorCode
/* 0BACC0 800C0260 48000E95 */  bl      DVDReset
/* 0BACC4 800C0264 38600000 */  li      r3, 0
/* 0BACC8 800C0268 4BFFEBF9 */  bl      cbForStateError
/* 0BACCC 800C026C 480005D8 */  b       lbl_800C0844
lbl_800C0270:
/* 0BACD0 800C0270 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BACD4 800C0274 28000003 */  cmplwi  r0, 3
/* 0BACD8 800C0278 41820010 */  beq     lbl_800C0288
/* 0BACDC 800C027C 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BACE0 800C0280 2800000F */  cmplwi  r0, 0xf
/* 0BACE4 800C0284 408200EC */  bne     lbl_800C0370
lbl_800C0288:
/* 0BACE8 800C0288 546007BD */  rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0BACEC 800C028C 4182002C */  beq     lbl_800C02B8
/* 0BACF0 800C0290 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BACF4 800C0294 3800FFFF */  li      r0, -1
/* 0BACF8 800C0298 3C600123 */  lis     r3, 0x123
/* 0BACFC 800C029C 9004000C */  stw     r0, 0xc(r4)
/* 0BAD00 800C02A0 38634567 */  addi    r3, r3, 0x4567
/* 0BAD04 800C02A4 480018A1 */  bl      __DVDStoreErrorCode
/* 0BAD08 800C02A8 3C60800C */  lis     r3, cbForStateError@ha
/* 0BAD0C 800C02AC 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0BAD10 800C02B0 4BFFDA25 */  bl      DVDLowStopMotor
/* 0BAD14 800C02B4 48000590 */  b       lbl_800C0844
lbl_800C02B8:
/* 0BAD18 800C02B8 38000000 */  li      r0, 0
/* 0BAD1C 800C02BC 900D934C */  stw     r0, NumInternalRetry-_SDA_BASE_(r13)
/* 0BAD20 800C02C0 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BAD24 800C02C4 2800000F */  cmplwi  r0, 0xf
/* 0BAD28 800C02C8 4082000C */  bne     lbl_800C02D4
/* 0BAD2C 800C02CC 38000001 */  li      r0, 1
/* 0BAD30 800C02D0 900D9350 */  stw     r0, ResetRequired-_SDA_BASE_(r13)
lbl_800C02D4:
/* 0BAD34 800C02D4 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BAD38 800C02D8 28000000 */  cmplwi  r0, 0
/* 0BAD3C 800C02DC 4182006C */  beq     lbl_800C0348
/* 0BAD40 800C02E0 38000007 */  li      r0, 7
/* 0BAD44 800C02E4 83CD9318 */  lwz     r30, executing-_SDA_BASE_(r13)
/* 0BAD48 800C02E8 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BAD4C 800C02EC 387F0040 */  addi    r3, r31, 0x40
/* 0BAD50 800C02F0 38000000 */  li      r0, 0
/* 0BAD54 800C02F4 900D9338 */  stw     r0, Canceling-_SDA_BASE_(r13)
/* 0BAD58 800C02F8 3800000A */  li      r0, 0xa
/* 0BAD5C 800C02FC 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BAD60 800C0300 901E000C */  stw     r0, 0xc(r30)
/* 0BAD64 800C0304 819E0028 */  lwz     r12, 0x28(r30)
/* 0BAD68 800C0308 280C0000 */  cmplwi  r12, 0
/* 0BAD6C 800C030C 41820014 */  beq     lbl_800C0320
/* 0BAD70 800C0310 7D8803A6 */  mtlr    r12
/* 0BAD74 800C0314 389E0000 */  addi    r4, r30, 0
/* 0BAD78 800C0318 3860FFFD */  li      r3, -3
/* 0BAD7C 800C031C 4E800021 */  blrl    
lbl_800C0320:
/* 0BAD80 800C0320 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0BAD84 800C0324 280C0000 */  cmplwi  r12, 0
/* 0BAD88 800C0328 41820014 */  beq     lbl_800C033C
/* 0BAD8C 800C032C 7D8803A6 */  mtlr    r12
/* 0BAD90 800C0330 389E0000 */  addi    r4, r30, 0
/* 0BAD94 800C0334 38600000 */  li      r3, 0
/* 0BAD98 800C0338 4E800021 */  blrl    
lbl_800C033C:
/* 0BAD9C 800C033C 4BFFF999 */  bl      stateReady
/* 0BADA0 800C0340 38000001 */  li      r0, 1
/* 0BADA4 800C0344 48000008 */  b       lbl_800C034C
lbl_800C0348:
/* 0BADA8 800C0348 38000000 */  li      r0, 0
lbl_800C034C:
/* 0BADAC 800C034C 2C000000 */  cmpwi   r0, 0
/* 0BADB0 800C0350 408204F4 */  bne     lbl_800C0844
/* 0BADB4 800C0354 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BADB8 800C0358 38000007 */  li      r0, 7
/* 0BADBC 800C035C 3C60800C */  lis     r3, cbForStateMotorStopped@ha
/* 0BADC0 800C0360 9004000C */  stw     r0, 0xc(r4)
/* 0BADC4 800C0364 3863FBF0 */  addi    r3, r3, cbForStateMotorStopped@l
/* 0BADC8 800C0368 4BFFD89D */  bl      DVDLowWaitCoverClose
/* 0BADCC 800C036C 480004D8 */  b       lbl_800C0844
lbl_800C0370:
/* 0BADD0 800C0370 808D9334 */  lwz     r4, CurrCommand-_SDA_BASE_(r13)
/* 0BADD4 800C0374 28040001 */  cmplwi  r4, 1
/* 0BADD8 800C0378 41820018 */  beq     lbl_800C0390
/* 0BADDC 800C037C 3804FFFC */  addi    r0, r4, -4
/* 0BADE0 800C0380 28000001 */  cmplwi  r0, 1
/* 0BADE4 800C0384 4081000C */  ble     lbl_800C0390
/* 0BADE8 800C0388 2804000E */  cmplwi  r4, 0xe
/* 0BADEC 800C038C 4082000C */  bne     lbl_800C0398
lbl_800C0390:
/* 0BADF0 800C0390 38000001 */  li      r0, 1
/* 0BADF4 800C0394 4800001C */  b       lbl_800C03B0
lbl_800C0398:
/* 0BADF8 800C0398 800D8DEC */  lwz     r0, DmaCommand-_SDA_BASE_(r13)
/* 0BADFC 800C039C 7C040040 */  cmplw   r4, r0
/* 0BAE00 800C03A0 4082000C */  bne     lbl_800C03AC
/* 0BAE04 800C03A4 38000001 */  li      r0, 1
/* 0BAE08 800C03A8 48000008 */  b       lbl_800C03B0
lbl_800C03AC:
/* 0BAE0C 800C03AC 38000000 */  li      r0, 0
lbl_800C03B0:
/* 0BAE10 800C03B0 2C000000 */  cmpwi   r0, 0
/* 0BAE14 800C03B4 41820028 */  beq     lbl_800C03DC
/* 0BAE18 800C03B8 80CD9318 */  lwz     r6, executing-_SDA_BASE_(r13)
/* 0BAE1C 800C03BC 3C80CC00 */  lis     r4, 0xcc00
/* 0BAE20 800C03C0 38846000 */  addi    r4, r4, 0x6000
/* 0BAE24 800C03C4 80840018 */  lwz     r4, 0x18(r4)
/* 0BAE28 800C03C8 8006001C */  lwz     r0, 0x1c(r6)
/* 0BAE2C 800C03CC 80A60020 */  lwz     r5, 0x20(r6)
/* 0BAE30 800C03D0 7C040050 */  subf    r0, r4, r0
/* 0BAE34 800C03D4 7C050214 */  add     r0, r5, r0
/* 0BAE38 800C03D8 90060020 */  stw     r0, 0x20(r6)
lbl_800C03DC:
/* 0BAE3C 800C03DC 54600739 */  rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0BAE40 800C03E0 41820060 */  beq     lbl_800C0440
/* 0BAE44 800C03E4 83CD9318 */  lwz     r30, executing-_SDA_BASE_(r13)
/* 0BAE48 800C03E8 387F0040 */  addi    r3, r31, 0x40
/* 0BAE4C 800C03EC 38000000 */  li      r0, 0
/* 0BAE50 800C03F0 900D9338 */  stw     r0, Canceling-_SDA_BASE_(r13)
/* 0BAE54 800C03F4 3800000A */  li      r0, 0xa
/* 0BAE58 800C03F8 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BAE5C 800C03FC 901E000C */  stw     r0, 0xc(r30)
/* 0BAE60 800C0400 819E0028 */  lwz     r12, 0x28(r30)
/* 0BAE64 800C0404 280C0000 */  cmplwi  r12, 0
/* 0BAE68 800C0408 41820014 */  beq     lbl_800C041C
/* 0BAE6C 800C040C 7D8803A6 */  mtlr    r12
/* 0BAE70 800C0410 389E0000 */  addi    r4, r30, 0
/* 0BAE74 800C0414 3860FFFD */  li      r3, -3
/* 0BAE78 800C0418 4E800021 */  blrl    
lbl_800C041C:
/* 0BAE7C 800C041C 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0BAE80 800C0420 280C0000 */  cmplwi  r12, 0
/* 0BAE84 800C0424 41820014 */  beq     lbl_800C0438
/* 0BAE88 800C0428 7D8803A6 */  mtlr    r12
/* 0BAE8C 800C042C 389E0000 */  addi    r4, r30, 0
/* 0BAE90 800C0430 38600000 */  li      r3, 0
/* 0BAE94 800C0434 4E800021 */  blrl    
lbl_800C0438:
/* 0BAE98 800C0438 4BFFF89D */  bl      stateReady
/* 0BAE9C 800C043C 48000408 */  b       lbl_800C0844
lbl_800C0440:
/* 0BAEA0 800C0440 546007FF */  clrlwi. r0, r3, 0x1f
/* 0BAEA4 800C0444 418202D0 */  beq     lbl_800C0714
/* 0BAEA8 800C0448 38800000 */  li      r4, 0
/* 0BAEAC 800C044C 908D934C */  stw     r4, NumInternalRetry-_SDA_BASE_(r13)
/* 0BAEB0 800C0450 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BAEB4 800C0454 28000000 */  cmplwi  r0, 0
/* 0BAEB8 800C0458 41820060 */  beq     lbl_800C04B8
/* 0BAEBC 800C045C 908D9340 */  stw     r4, ResumeFromHere-_SDA_BASE_(r13)
/* 0BAEC0 800C0460 387F0040 */  addi    r3, r31, 0x40
/* 0BAEC4 800C0464 83CD9318 */  lwz     r30, executing-_SDA_BASE_(r13)
/* 0BAEC8 800C0468 3800000A */  li      r0, 0xa
/* 0BAECC 800C046C 908D9338 */  stw     r4, Canceling-_SDA_BASE_(r13)
/* 0BAED0 800C0470 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BAED4 800C0474 901E000C */  stw     r0, 0xc(r30)
/* 0BAED8 800C0478 819E0028 */  lwz     r12, 0x28(r30)
/* 0BAEDC 800C047C 280C0000 */  cmplwi  r12, 0
/* 0BAEE0 800C0480 41820014 */  beq     lbl_800C0494
/* 0BAEE4 800C0484 7D8803A6 */  mtlr    r12
/* 0BAEE8 800C0488 389E0000 */  addi    r4, r30, 0
/* 0BAEEC 800C048C 3860FFFD */  li      r3, -3
/* 0BAEF0 800C0490 4E800021 */  blrl    
lbl_800C0494:
/* 0BAEF4 800C0494 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0BAEF8 800C0498 280C0000 */  cmplwi  r12, 0
/* 0BAEFC 800C049C 41820014 */  beq     lbl_800C04B0
/* 0BAF00 800C04A0 7D8803A6 */  mtlr    r12
/* 0BAF04 800C04A4 389E0000 */  addi    r4, r30, 0
/* 0BAF08 800C04A8 38600000 */  li      r3, 0
/* 0BAF0C 800C04AC 4E800021 */  blrl    
lbl_800C04B0:
/* 0BAF10 800C04B0 4BFFF825 */  bl      stateReady
/* 0BAF14 800C04B4 38800001 */  li      r4, 1
lbl_800C04B8:
/* 0BAF18 800C04B8 2C040000 */  cmpwi   r4, 0
/* 0BAF1C 800C04BC 40820388 */  bne     lbl_800C0844
/* 0BAF20 800C04C0 806D9334 */  lwz     r3, CurrCommand-_SDA_BASE_(r13)
/* 0BAF24 800C04C4 28030001 */  cmplwi  r3, 1
/* 0BAF28 800C04C8 41820018 */  beq     lbl_800C04E0
/* 0BAF2C 800C04CC 3803FFFC */  addi    r0, r3, -4
/* 0BAF30 800C04D0 28000001 */  cmplwi  r0, 1
/* 0BAF34 800C04D4 4081000C */  ble     lbl_800C04E0
/* 0BAF38 800C04D8 2803000E */  cmplwi  r3, 0xe
/* 0BAF3C 800C04DC 4082000C */  bne     lbl_800C04E8
lbl_800C04E0:
/* 0BAF40 800C04E0 38000001 */  li      r0, 1
/* 0BAF44 800C04E4 4800001C */  b       lbl_800C0500
lbl_800C04E8:
/* 0BAF48 800C04E8 800D8DEC */  lwz     r0, DmaCommand-_SDA_BASE_(r13)
/* 0BAF4C 800C04EC 7C030040 */  cmplw   r3, r0
/* 0BAF50 800C04F0 4082000C */  bne     lbl_800C04FC
/* 0BAF54 800C04F4 38000001 */  li      r0, 1
/* 0BAF58 800C04F8 48000008 */  b       lbl_800C0500
lbl_800C04FC:
/* 0BAF5C 800C04FC 38000000 */  li      r0, 0
lbl_800C0500:
/* 0BAF60 800C0500 2C000000 */  cmpwi   r0, 0
/* 0BAF64 800C0504 41820054 */  beq     lbl_800C0558
/* 0BAF68 800C0508 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BAF6C 800C050C 80830020 */  lwz     r4, 0x20(r3)
/* 0BAF70 800C0510 80030014 */  lwz     r0, 0x14(r3)
/* 0BAF74 800C0514 7C040040 */  cmplw   r4, r0
/* 0BAF78 800C0518 4182000C */  beq     lbl_800C0524
/* 0BAF7C 800C051C 4BFFF9E9 */  bl      stateBusy
/* 0BAF80 800C0520 48000324 */  b       lbl_800C0844
lbl_800C0524:
/* 0BAF84 800C0524 381F0040 */  addi    r0, r31, 0x40
/* 0BAF88 800C0528 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BAF8C 800C052C 38000000 */  li      r0, 0
/* 0BAF90 800C0530 38830000 */  addi    r4, r3, 0
/* 0BAF94 800C0534 9003000C */  stw     r0, 0xc(r3)
/* 0BAF98 800C0538 81830028 */  lwz     r12, 0x28(r3)
/* 0BAF9C 800C053C 280C0000 */  cmplwi  r12, 0
/* 0BAFA0 800C0540 41820010 */  beq     lbl_800C0550
/* 0BAFA4 800C0544 80640020 */  lwz     r3, 0x20(r4)
/* 0BAFA8 800C0548 7D8803A6 */  mtlr    r12
/* 0BAFAC 800C054C 4E800021 */  blrl    
lbl_800C0550:
/* 0BAFB0 800C0550 4BFFF785 */  bl      stateReady
/* 0BAFB4 800C0554 480002F0 */  b       lbl_800C0844
lbl_800C0558:
/* 0BAFB8 800C0558 808D9334 */  lwz     r4, CurrCommand-_SDA_BASE_(r13)
/* 0BAFBC 800C055C 3804FFF7 */  addi    r0, r4, -9
/* 0BAFC0 800C0560 28000003 */  cmplwi  r0, 3
/* 0BAFC4 800C0564 4181000C */  bgt     lbl_800C0570
/* 0BAFC8 800C0568 38000001 */  li      r0, 1
/* 0BAFCC 800C056C 48000048 */  b       lbl_800C05B4
lbl_800C0570:
/* 0BAFD0 800C0570 3C608010 */  lis     r3, ImmCommand@ha
/* 0BAFD4 800C0574 84030810 */  lwzu    r0, ImmCommand@l(r3)
/* 0BAFD8 800C0578 7C040040 */  cmplw   r4, r0
/* 0BAFDC 800C057C 4082000C */  bne     lbl_800C0588
/* 0BAFE0 800C0580 38000001 */  li      r0, 1
/* 0BAFE4 800C0584 48000030 */  b       lbl_800C05B4
lbl_800C0588:
/* 0BAFE8 800C0588 84030004 */  lwzu    r0, 4(r3)
/* 0BAFEC 800C058C 7C040040 */  cmplw   r4, r0
/* 0BAFF0 800C0590 4082000C */  bne     lbl_800C059C
/* 0BAFF4 800C0594 38000001 */  li      r0, 1
/* 0BAFF8 800C0598 4800001C */  b       lbl_800C05B4
lbl_800C059C:
/* 0BAFFC 800C059C 80030004 */  lwz     r0, 4(r3)
/* 0BB000 800C05A0 7C040040 */  cmplw   r4, r0
/* 0BB004 800C05A4 4082000C */  bne     lbl_800C05B0
/* 0BB008 800C05A8 38000001 */  li      r0, 1
/* 0BB00C 800C05AC 48000008 */  b       lbl_800C05B4
lbl_800C05B0:
/* 0BB010 800C05B0 38000000 */  li      r0, 0
lbl_800C05B4:
/* 0BB014 800C05B4 2C000000 */  cmpwi   r0, 0
/* 0BB018 800C05B8 41820068 */  beq     lbl_800C0620
/* 0BB01C 800C05BC 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB020 800C05C0 2800000B */  cmplwi  r0, 0xb
/* 0BB024 800C05C4 41820010 */  beq     lbl_800C05D4
/* 0BB028 800C05C8 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB02C 800C05CC 2800000A */  cmplwi  r0, 0xa
/* 0BB030 800C05D0 40820014 */  bne     lbl_800C05E4
lbl_800C05D4:
/* 0BB034 800C05D4 3C60CC00 */  lis     r3, 0xcc00
/* 0BB038 800C05D8 80036020 */  lwz     r0, 0x6020(r3)
/* 0BB03C 800C05DC 5403103A */  slwi    r3, r0, 2
/* 0BB040 800C05E0 48000010 */  b       lbl_800C05F0
lbl_800C05E4:
/* 0BB044 800C05E4 3C60CC00 */  lis     r3, 0xcc00
/* 0BB048 800C05E8 38636000 */  addi    r3, r3, 0x6000
/* 0BB04C 800C05EC 80630020 */  lwz     r3, 0x20(r3)
lbl_800C05F0:
/* 0BB050 800C05F0 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BB054 800C05F4 38BF0040 */  addi    r5, r31, 0x40
/* 0BB058 800C05F8 38000000 */  li      r0, 0
/* 0BB05C 800C05FC 90AD9318 */  stw     r5, executing-_SDA_BASE_(r13)
/* 0BB060 800C0600 9004000C */  stw     r0, 0xc(r4)
/* 0BB064 800C0604 81840028 */  lwz     r12, 0x28(r4)
/* 0BB068 800C0608 280C0000 */  cmplwi  r12, 0
/* 0BB06C 800C060C 4182000C */  beq     lbl_800C0618
/* 0BB070 800C0610 7D8803A6 */  mtlr    r12
/* 0BB074 800C0614 4E800021 */  blrl    
lbl_800C0618:
/* 0BB078 800C0618 4BFFF6BD */  bl      stateReady
/* 0BB07C 800C061C 48000228 */  b       lbl_800C0844
lbl_800C0620:
/* 0BB080 800C0620 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB084 800C0624 28000006 */  cmplwi  r0, 6
/* 0BB088 800C0628 408200B8 */  bne     lbl_800C06E0
/* 0BB08C 800C062C 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BB090 800C0630 38A4001C */  addi    r5, r4, 0x1c
/* 0BB094 800C0634 8004001C */  lwz     r0, 0x1c(r4)
/* 0BB098 800C0638 28000000 */  cmplwi  r0, 0
/* 0BB09C 800C063C 40820074 */  bne     lbl_800C06B0
/* 0BB0A0 800C0640 3C60CC00 */  lis     r3, 0xcc00
/* 0BB0A4 800C0644 80036020 */  lwz     r0, 0x6020(r3)
/* 0BB0A8 800C0648 540007FF */  clrlwi. r0, r0, 0x1f
/* 0BB0AC 800C064C 41820034 */  beq     lbl_800C0680
/* 0BB0B0 800C0650 381F0040 */  addi    r0, r31, 0x40
/* 0BB0B4 800C0654 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BB0B8 800C0658 38000009 */  li      r0, 9
/* 0BB0BC 800C065C 9004000C */  stw     r0, 0xc(r4)
/* 0BB0C0 800C0660 81840028 */  lwz     r12, 0x28(r4)
/* 0BB0C4 800C0664 280C0000 */  cmplwi  r12, 0
/* 0BB0C8 800C0668 41820010 */  beq     lbl_800C0678
/* 0BB0CC 800C066C 7D8803A6 */  mtlr    r12
/* 0BB0D0 800C0670 3860FFFE */  li      r3, -2
/* 0BB0D4 800C0674 4E800021 */  blrl    
lbl_800C0678:
/* 0BB0D8 800C0678 4BFFF65D */  bl      stateReady
/* 0BB0DC 800C067C 480001C8 */  b       lbl_800C0844
lbl_800C0680:
/* 0BB0E0 800C0680 38000000 */  li      r0, 0
/* 0BB0E4 800C0684 900D932C */  stw     r0, AutoFinishing-_SDA_BASE_(r13)
/* 0BB0E8 800C0688 38000001 */  li      r0, 1
/* 0BB0EC 800C068C 3C60800C */  lis     r3, cbForStateBusy@ha
/* 0BB0F0 800C0690 90050000 */  stw     r0, 0(r5)
/* 0BB0F4 800C0694 38C30224 */  addi    r6, r3, cbForStateBusy@l
/* 0BB0F8 800C0698 38600000 */  li      r3, 0
/* 0BB0FC 800C069C 80AD9318 */  lwz     r5, executing-_SDA_BASE_(r13)
/* 0BB100 800C06A0 80850014 */  lwz     r4, 0x14(r5)
/* 0BB104 800C06A4 80A50010 */  lwz     r5, 0x10(r5)
/* 0BB108 800C06A8 4BFFD7E1 */  bl      DVDLowAudioStream
/* 0BB10C 800C06AC 48000198 */  b       lbl_800C0844
lbl_800C06B0:
/* 0BB110 800C06B0 381F0040 */  addi    r0, r31, 0x40
/* 0BB114 800C06B4 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BB118 800C06B8 38000000 */  li      r0, 0
/* 0BB11C 800C06BC 9004000C */  stw     r0, 0xc(r4)
/* 0BB120 800C06C0 81840028 */  lwz     r12, 0x28(r4)
/* 0BB124 800C06C4 280C0000 */  cmplwi  r12, 0
/* 0BB128 800C06C8 41820010 */  beq     lbl_800C06D8
/* 0BB12C 800C06CC 7D8803A6 */  mtlr    r12
/* 0BB130 800C06D0 38600000 */  li      r3, 0
/* 0BB134 800C06D4 4E800021 */  blrl    
lbl_800C06D8:
/* 0BB138 800C06D8 4BFFF5FD */  bl      stateReady
/* 0BB13C 800C06DC 48000168 */  b       lbl_800C0844
lbl_800C06E0:
/* 0BB140 800C06E0 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BB144 800C06E4 387F0040 */  addi    r3, r31, 0x40
/* 0BB148 800C06E8 38000000 */  li      r0, 0
/* 0BB14C 800C06EC 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BB150 800C06F0 9004000C */  stw     r0, 0xc(r4)
/* 0BB154 800C06F4 81840028 */  lwz     r12, 0x28(r4)
/* 0BB158 800C06F8 280C0000 */  cmplwi  r12, 0
/* 0BB15C 800C06FC 41820010 */  beq     lbl_800C070C
/* 0BB160 800C0700 7D8803A6 */  mtlr    r12
/* 0BB164 800C0704 38600000 */  li      r3, 0
/* 0BB168 800C0708 4E800021 */  blrl    
lbl_800C070C:
/* 0BB16C 800C070C 4BFFF5C9 */  bl      stateReady
/* 0BB170 800C0710 48000134 */  b       lbl_800C0844
lbl_800C0714:
/* 0BB174 800C0714 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB178 800C0718 2800000E */  cmplwi  r0, 0xe
/* 0BB17C 800C071C 4082002C */  bne     lbl_800C0748
/* 0BB180 800C0720 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BB184 800C0724 3800FFFF */  li      r0, -1
/* 0BB188 800C0728 3C600123 */  lis     r3, 0x123
/* 0BB18C 800C072C 9004000C */  stw     r0, 0xc(r4)
/* 0BB190 800C0730 38634567 */  addi    r3, r3, 0x4567
/* 0BB194 800C0734 48001411 */  bl      __DVDStoreErrorCode
/* 0BB198 800C0738 3C60800C */  lis     r3, cbForStateError@ha
/* 0BB19C 800C073C 3863EE60 */  addi    r3, r3, cbForStateError@l
/* 0BB1A0 800C0740 4BFFD595 */  bl      DVDLowStopMotor
/* 0BB1A4 800C0744 48000100 */  b       lbl_800C0844
lbl_800C0748:
/* 0BB1A8 800C0748 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB1AC 800C074C 28000001 */  cmplwi  r0, 1
/* 0BB1B0 800C0750 41820028 */  beq     lbl_800C0778
/* 0BB1B4 800C0754 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB1B8 800C0758 28000004 */  cmplwi  r0, 4
/* 0BB1BC 800C075C 4182001C */  beq     lbl_800C0778
/* 0BB1C0 800C0760 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB1C4 800C0764 28000005 */  cmplwi  r0, 5
/* 0BB1C8 800C0768 41820010 */  beq     lbl_800C0778
/* 0BB1CC 800C076C 800D9334 */  lwz     r0, CurrCommand-_SDA_BASE_(r13)
/* 0BB1D0 800C0770 2800000E */  cmplwi  r0, 0xe
/* 0BB1D4 800C0774 408200C4 */  bne     lbl_800C0838
lbl_800C0778:
/* 0BB1D8 800C0778 83CD9318 */  lwz     r30, executing-_SDA_BASE_(r13)
/* 0BB1DC 800C077C 807E0020 */  lwz     r3, 0x20(r30)
/* 0BB1E0 800C0780 801E0014 */  lwz     r0, 0x14(r30)
/* 0BB1E4 800C0784 7C030040 */  cmplw   r3, r0
/* 0BB1E8 800C0788 408200B0 */  bne     lbl_800C0838
/* 0BB1EC 800C078C 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BB1F0 800C0790 28000000 */  cmplwi  r0, 0
/* 0BB1F4 800C0794 41820064 */  beq     lbl_800C07F8
/* 0BB1F8 800C0798 38800000 */  li      r4, 0
/* 0BB1FC 800C079C 908D9340 */  stw     r4, ResumeFromHere-_SDA_BASE_(r13)
/* 0BB200 800C07A0 387F0040 */  addi    r3, r31, 0x40
/* 0BB204 800C07A4 3800000A */  li      r0, 0xa
/* 0BB208 800C07A8 908D9338 */  stw     r4, Canceling-_SDA_BASE_(r13)
/* 0BB20C 800C07AC 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BB210 800C07B0 901E000C */  stw     r0, 0xc(r30)
/* 0BB214 800C07B4 819E0028 */  lwz     r12, 0x28(r30)
/* 0BB218 800C07B8 280C0000 */  cmplwi  r12, 0
/* 0BB21C 800C07BC 41820014 */  beq     lbl_800C07D0
/* 0BB220 800C07C0 7D8803A6 */  mtlr    r12
/* 0BB224 800C07C4 389E0000 */  addi    r4, r30, 0
/* 0BB228 800C07C8 3860FFFD */  li      r3, -3
/* 0BB22C 800C07CC 4E800021 */  blrl    
lbl_800C07D0:
/* 0BB230 800C07D0 818D933C */  lwz     r12, CancelCallback-_SDA_BASE_(r13)
/* 0BB234 800C07D4 280C0000 */  cmplwi  r12, 0
/* 0BB238 800C07D8 41820014 */  beq     lbl_800C07EC
/* 0BB23C 800C07DC 7D8803A6 */  mtlr    r12
/* 0BB240 800C07E0 389E0000 */  addi    r4, r30, 0
/* 0BB244 800C07E4 38600000 */  li      r3, 0
/* 0BB248 800C07E8 4E800021 */  blrl    
lbl_800C07EC:
/* 0BB24C 800C07EC 4BFFF4E9 */  bl      stateReady
/* 0BB250 800C07F0 38000001 */  li      r0, 1
/* 0BB254 800C07F4 48000008 */  b       lbl_800C07FC
lbl_800C07F8:
/* 0BB258 800C07F8 38000000 */  li      r0, 0
lbl_800C07FC:
/* 0BB25C 800C07FC 2C000000 */  cmpwi   r0, 0
/* 0BB260 800C0800 40820044 */  bne     lbl_800C0844
/* 0BB264 800C0804 808D9318 */  lwz     r4, executing-_SDA_BASE_(r13)
/* 0BB268 800C0808 387F0040 */  addi    r3, r31, 0x40
/* 0BB26C 800C080C 38000000 */  li      r0, 0
/* 0BB270 800C0810 906D9318 */  stw     r3, executing-_SDA_BASE_(r13)
/* 0BB274 800C0814 9004000C */  stw     r0, 0xc(r4)
/* 0BB278 800C0818 81840028 */  lwz     r12, 0x28(r4)
/* 0BB27C 800C081C 280C0000 */  cmplwi  r12, 0
/* 0BB280 800C0820 41820010 */  beq     lbl_800C0830
/* 0BB284 800C0824 80640020 */  lwz     r3, 0x20(r4)
/* 0BB288 800C0828 7D8803A6 */  mtlr    r12
/* 0BB28C 800C082C 4E800021 */  blrl    
lbl_800C0830:
/* 0BB290 800C0830 4BFFF4A5 */  bl      stateReady
/* 0BB294 800C0834 48000010 */  b       lbl_800C0844
lbl_800C0838:
/* 0BB298 800C0838 3C60800C */  lis     r3, cbForStateGettingError@ha
/* 0BB29C 800C083C 3863F01C */  addi    r3, r3, cbForStateGettingError@l
/* 0BB2A0 800C0840 4BFFD521 */  bl      DVDLowRequestError
lbl_800C0844:
/* 0BB2A4 800C0844 8001001C */  lwz     r0, 0x1c(r1)
/* 0BB2A8 800C0848 83E10014 */  lwz     r31, 0x14(r1)
/* 0BB2AC 800C084C 83C10010 */  lwz     r30, 0x10(r1)
/* 0BB2B0 800C0850 38210018 */  addi    r1, r1, 0x18
/* 0BB2B4 800C0854 7C0803A6 */  mtlr    r0
/* 0BB2B8 800C0858 4E800020 */  blr     

issueCommand:
/* 0BB2BC 800C085C 7C0802A6 */  mflr    r0
/* 0BB2C0 800C0860 90010004 */  stw     r0, 4(r1)
/* 0BB2C4 800C0864 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BB2C8 800C0868 93E1001C */  stw     r31, 0x1c(r1)
/* 0BB2CC 800C086C 93C10018 */  stw     r30, 0x18(r1)
/* 0BB2D0 800C0870 3BC40000 */  addi    r30, r4, 0
/* 0BB2D4 800C0874 93A10014 */  stw     r29, 0x14(r1)
/* 0BB2D8 800C0878 3BA30000 */  addi    r29, r3, 0
/* 0BB2DC 800C087C 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB2E0 800C0880 2C000000 */  cmpwi   r0, 0
/* 0BB2E4 800C0884 41820030 */  beq     lbl_800C08B4
/* 0BB2E8 800C0888 807E0008 */  lwz     r3, 8(r30)
/* 0BB2EC 800C088C 28030001 */  cmplwi  r3, 1
/* 0BB2F0 800C0890 41820018 */  beq     lbl_800C08A8
/* 0BB2F4 800C0894 3803FFFC */  addi    r0, r3, -4
/* 0BB2F8 800C0898 28000001 */  cmplwi  r0, 1
/* 0BB2FC 800C089C 4081000C */  ble     lbl_800C08A8
/* 0BB300 800C08A0 2803000E */  cmplwi  r3, 0xe
/* 0BB304 800C08A4 40820010 */  bne     lbl_800C08B4
lbl_800C08A8:
/* 0BB308 800C08A8 807E0018 */  lwz     r3, 0x18(r30)
/* 0BB30C 800C08AC 809E0014 */  lwz     r4, 0x14(r30)
/* 0BB310 800C08B0 4BFE8915 */  bl      DCInvalidateRange
lbl_800C08B4:
/* 0BB314 800C08B4 4BFE9EBD */  bl      OSDisableInterrupts
/* 0BB318 800C08B8 38000002 */  li      r0, 2
/* 0BB31C 800C08BC 901E000C */  stw     r0, 0xc(r30)
/* 0BB320 800C08C0 3BE30000 */  addi    r31, r3, 0
/* 0BB324 800C08C4 387D0000 */  addi    r3, r29, 0
/* 0BB328 800C08C8 389E0000 */  addi    r4, r30, 0
/* 0BB32C 800C08CC 48000F9D */  bl      __DVDPushWaitingQueue
/* 0BB330 800C08D0 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB334 800C08D4 3BC30000 */  addi    r30, r3, 0
/* 0BB338 800C08D8 28000000 */  cmplwi  r0, 0
/* 0BB33C 800C08DC 40820014 */  bne     lbl_800C08F0
/* 0BB340 800C08E0 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB344 800C08E4 2C000000 */  cmpwi   r0, 0
/* 0BB348 800C08E8 40820008 */  bne     lbl_800C08F0
/* 0BB34C 800C08EC 4BFFF3E9 */  bl      stateReady
lbl_800C08F0:
/* 0BB350 800C08F0 7FE3FB78 */  mr      r3, r31
/* 0BB354 800C08F4 4BFE9EA5 */  bl      OSRestoreInterrupts
/* 0BB358 800C08F8 7FC3F378 */  mr      r3, r30
/* 0BB35C 800C08FC 80010024 */  lwz     r0, 0x24(r1)
/* 0BB360 800C0900 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BB364 800C0904 83C10018 */  lwz     r30, 0x18(r1)
/* 0BB368 800C0908 83A10014 */  lwz     r29, 0x14(r1)
/* 0BB36C 800C090C 38210020 */  addi    r1, r1, 0x20
/* 0BB370 800C0910 7C0803A6 */  mtlr    r0
/* 0BB374 800C0914 4E800020 */  blr     

glabel DVDReadAbsAsyncPrio
/* 0BB378 800C0918 7C0802A6 */  mflr    r0
/* 0BB37C 800C091C 90010004 */  stw     r0, 4(r1)
/* 0BB380 800C0920 38000001 */  li      r0, 1
/* 0BB384 800C0924 9421FFC8 */  stwu    r1, -0x38(r1)
/* 0BB388 800C0928 93E10034 */  stw     r31, 0x34(r1)
/* 0BB38C 800C092C 3BE80000 */  addi    r31, r8, 0
/* 0BB390 800C0930 93C10030 */  stw     r30, 0x30(r1)
/* 0BB394 800C0934 93A1002C */  stw     r29, 0x2c(r1)
/* 0BB398 800C0938 3BA30000 */  addi    r29, r3, 0
/* 0BB39C 800C093C 90030008 */  stw     r0, 8(r3)
/* 0BB3A0 800C0940 38000000 */  li      r0, 0
/* 0BB3A4 800C0944 90830018 */  stw     r4, 0x18(r3)
/* 0BB3A8 800C0948 90A30014 */  stw     r5, 0x14(r3)
/* 0BB3AC 800C094C 90C30010 */  stw     r6, 0x10(r3)
/* 0BB3B0 800C0950 90030020 */  stw     r0, 0x20(r3)
/* 0BB3B4 800C0954 90E30028 */  stw     r7, 0x28(r3)
/* 0BB3B8 800C0958 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB3BC 800C095C 2C000000 */  cmpwi   r0, 0
/* 0BB3C0 800C0960 41820030 */  beq     lbl_800C0990
/* 0BB3C4 800C0964 807D0008 */  lwz     r3, 8(r29)
/* 0BB3C8 800C0968 28030001 */  cmplwi  r3, 1
/* 0BB3CC 800C096C 41820018 */  beq     lbl_800C0984
/* 0BB3D0 800C0970 3803FFFC */  addi    r0, r3, -4
/* 0BB3D4 800C0974 28000001 */  cmplwi  r0, 1
/* 0BB3D8 800C0978 4081000C */  ble     lbl_800C0984
/* 0BB3DC 800C097C 2803000E */  cmplwi  r3, 0xe
/* 0BB3E0 800C0980 40820010 */  bne     lbl_800C0990
lbl_800C0984:
/* 0BB3E4 800C0984 807D0018 */  lwz     r3, 0x18(r29)
/* 0BB3E8 800C0988 809D0014 */  lwz     r4, 0x14(r29)
/* 0BB3EC 800C098C 4BFE8839 */  bl      DCInvalidateRange
lbl_800C0990:
/* 0BB3F0 800C0990 4BFE9DE1 */  bl      OSDisableInterrupts
/* 0BB3F4 800C0994 38000002 */  li      r0, 2
/* 0BB3F8 800C0998 901D000C */  stw     r0, 0xc(r29)
/* 0BB3FC 800C099C 3BC30000 */  addi    r30, r3, 0
/* 0BB400 800C09A0 387F0000 */  addi    r3, r31, 0
/* 0BB404 800C09A4 389D0000 */  addi    r4, r29, 0
/* 0BB408 800C09A8 48000EC1 */  bl      __DVDPushWaitingQueue
/* 0BB40C 800C09AC 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB410 800C09B0 3BE30000 */  addi    r31, r3, 0
/* 0BB414 800C09B4 28000000 */  cmplwi  r0, 0
/* 0BB418 800C09B8 40820014 */  bne     lbl_800C09CC
/* 0BB41C 800C09BC 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB420 800C09C0 2C000000 */  cmpwi   r0, 0
/* 0BB424 800C09C4 40820008 */  bne     lbl_800C09CC
/* 0BB428 800C09C8 4BFFF30D */  bl      stateReady
lbl_800C09CC:
/* 0BB42C 800C09CC 7FC3F378 */  mr      r3, r30
/* 0BB430 800C09D0 4BFE9DC9 */  bl      OSRestoreInterrupts
/* 0BB434 800C09D4 7FE3FB78 */  mr      r3, r31
/* 0BB438 800C09D8 8001003C */  lwz     r0, 0x3c(r1)
/* 0BB43C 800C09DC 83E10034 */  lwz     r31, 0x34(r1)
/* 0BB440 800C09E0 83C10030 */  lwz     r30, 0x30(r1)
/* 0BB444 800C09E4 83A1002C */  lwz     r29, 0x2c(r1)
/* 0BB448 800C09E8 38210038 */  addi    r1, r1, 0x38
/* 0BB44C 800C09EC 7C0803A6 */  mtlr    r0
/* 0BB450 800C09F0 4E800020 */  blr     

glabel DVDSeekAbsAsyncPrio
/* 0BB454 800C09F4 7C0802A6 */  mflr    r0
/* 0BB458 800C09F8 90010004 */  stw     r0, 4(r1)
/* 0BB45C 800C09FC 38000002 */  li      r0, 2
/* 0BB460 800C0A00 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0BB464 800C0A04 93E1002C */  stw     r31, 0x2c(r1)
/* 0BB468 800C0A08 7CDF3378 */  mr      r31, r6
/* 0BB46C 800C0A0C 93C10028 */  stw     r30, 0x28(r1)
/* 0BB470 800C0A10 93A10024 */  stw     r29, 0x24(r1)
/* 0BB474 800C0A14 3BA30000 */  addi    r29, r3, 0
/* 0BB478 800C0A18 90030008 */  stw     r0, 8(r3)
/* 0BB47C 800C0A1C 90830010 */  stw     r4, 0x10(r3)
/* 0BB480 800C0A20 90A30028 */  stw     r5, 0x28(r3)
/* 0BB484 800C0A24 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB488 800C0A28 2C000000 */  cmpwi   r0, 0
/* 0BB48C 800C0A2C 41820030 */  beq     lbl_800C0A5C
/* 0BB490 800C0A30 807D0008 */  lwz     r3, 8(r29)
/* 0BB494 800C0A34 28030001 */  cmplwi  r3, 1
/* 0BB498 800C0A38 41820018 */  beq     lbl_800C0A50
/* 0BB49C 800C0A3C 3803FFFC */  addi    r0, r3, -4
/* 0BB4A0 800C0A40 28000001 */  cmplwi  r0, 1
/* 0BB4A4 800C0A44 4081000C */  ble     lbl_800C0A50
/* 0BB4A8 800C0A48 2803000E */  cmplwi  r3, 0xe
/* 0BB4AC 800C0A4C 40820010 */  bne     lbl_800C0A5C
lbl_800C0A50:
/* 0BB4B0 800C0A50 807D0018 */  lwz     r3, 0x18(r29)
/* 0BB4B4 800C0A54 809D0014 */  lwz     r4, 0x14(r29)
/* 0BB4B8 800C0A58 4BFE876D */  bl      DCInvalidateRange
lbl_800C0A5C:
/* 0BB4BC 800C0A5C 4BFE9D15 */  bl      OSDisableInterrupts
/* 0BB4C0 800C0A60 38000002 */  li      r0, 2
/* 0BB4C4 800C0A64 901D000C */  stw     r0, 0xc(r29)
/* 0BB4C8 800C0A68 3BC30000 */  addi    r30, r3, 0
/* 0BB4CC 800C0A6C 387F0000 */  addi    r3, r31, 0
/* 0BB4D0 800C0A70 389D0000 */  addi    r4, r29, 0
/* 0BB4D4 800C0A74 48000DF5 */  bl      __DVDPushWaitingQueue
/* 0BB4D8 800C0A78 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB4DC 800C0A7C 3BE30000 */  addi    r31, r3, 0
/* 0BB4E0 800C0A80 28000000 */  cmplwi  r0, 0
/* 0BB4E4 800C0A84 40820014 */  bne     lbl_800C0A98
/* 0BB4E8 800C0A88 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB4EC 800C0A8C 2C000000 */  cmpwi   r0, 0
/* 0BB4F0 800C0A90 40820008 */  bne     lbl_800C0A98
/* 0BB4F4 800C0A94 4BFFF241 */  bl      stateReady
lbl_800C0A98:
/* 0BB4F8 800C0A98 7FC3F378 */  mr      r3, r30
/* 0BB4FC 800C0A9C 4BFE9CFD */  bl      OSRestoreInterrupts
/* 0BB500 800C0AA0 7FE3FB78 */  mr      r3, r31
/* 0BB504 800C0AA4 80010034 */  lwz     r0, 0x34(r1)
/* 0BB508 800C0AA8 83E1002C */  lwz     r31, 0x2c(r1)
/* 0BB50C 800C0AAC 83C10028 */  lwz     r30, 0x28(r1)
/* 0BB510 800C0AB0 83A10024 */  lwz     r29, 0x24(r1)
/* 0BB514 800C0AB4 38210030 */  addi    r1, r1, 0x30
/* 0BB518 800C0AB8 7C0803A6 */  mtlr    r0
/* 0BB51C 800C0ABC 4E800020 */  blr     

glabel DVDReadAbsAsyncForBS
/* 0BB520 800C0AC0 7C0802A6 */  mflr    r0
/* 0BB524 800C0AC4 90010004 */  stw     r0, 4(r1)
/* 0BB528 800C0AC8 38000004 */  li      r0, 4
/* 0BB52C 800C0ACC 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0BB530 800C0AD0 93E1002C */  stw     r31, 0x2c(r1)
/* 0BB534 800C0AD4 3BE30000 */  addi    r31, r3, 0
/* 0BB538 800C0AD8 93C10028 */  stw     r30, 0x28(r1)
/* 0BB53C 800C0ADC 90030008 */  stw     r0, 8(r3)
/* 0BB540 800C0AE0 38000000 */  li      r0, 0
/* 0BB544 800C0AE4 90830018 */  stw     r4, 0x18(r3)
/* 0BB548 800C0AE8 90A30014 */  stw     r5, 0x14(r3)
/* 0BB54C 800C0AEC 90C30010 */  stw     r6, 0x10(r3)
/* 0BB550 800C0AF0 90030020 */  stw     r0, 0x20(r3)
/* 0BB554 800C0AF4 90E30028 */  stw     r7, 0x28(r3)
/* 0BB558 800C0AF8 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB55C 800C0AFC 2C000000 */  cmpwi   r0, 0
/* 0BB560 800C0B00 41820030 */  beq     lbl_800C0B30
/* 0BB564 800C0B04 807F0008 */  lwz     r3, 8(r31)
/* 0BB568 800C0B08 28030001 */  cmplwi  r3, 1
/* 0BB56C 800C0B0C 41820018 */  beq     lbl_800C0B24
/* 0BB570 800C0B10 3803FFFC */  addi    r0, r3, -4
/* 0BB574 800C0B14 28000001 */  cmplwi  r0, 1
/* 0BB578 800C0B18 4081000C */  ble     lbl_800C0B24
/* 0BB57C 800C0B1C 2803000E */  cmplwi  r3, 0xe
/* 0BB580 800C0B20 40820010 */  bne     lbl_800C0B30
lbl_800C0B24:
/* 0BB584 800C0B24 807F0018 */  lwz     r3, 0x18(r31)
/* 0BB588 800C0B28 809F0014 */  lwz     r4, 0x14(r31)
/* 0BB58C 800C0B2C 4BFE8699 */  bl      DCInvalidateRange
lbl_800C0B30:
/* 0BB590 800C0B30 4BFE9C41 */  bl      OSDisableInterrupts
/* 0BB594 800C0B34 38000002 */  li      r0, 2
/* 0BB598 800C0B38 901F000C */  stw     r0, 0xc(r31)
/* 0BB59C 800C0B3C 3BC30000 */  addi    r30, r3, 0
/* 0BB5A0 800C0B40 389F0000 */  addi    r4, r31, 0
/* 0BB5A4 800C0B44 38600002 */  li      r3, 2
/* 0BB5A8 800C0B48 48000D21 */  bl      __DVDPushWaitingQueue
/* 0BB5AC 800C0B4C 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB5B0 800C0B50 3BE30000 */  addi    r31, r3, 0
/* 0BB5B4 800C0B54 28000000 */  cmplwi  r0, 0
/* 0BB5B8 800C0B58 40820014 */  bne     lbl_800C0B6C
/* 0BB5BC 800C0B5C 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB5C0 800C0B60 2C000000 */  cmpwi   r0, 0
/* 0BB5C4 800C0B64 40820008 */  bne     lbl_800C0B6C
/* 0BB5C8 800C0B68 4BFFF16D */  bl      stateReady
lbl_800C0B6C:
/* 0BB5CC 800C0B6C 7FC3F378 */  mr      r3, r30
/* 0BB5D0 800C0B70 4BFE9C29 */  bl      OSRestoreInterrupts
/* 0BB5D4 800C0B74 7FE3FB78 */  mr      r3, r31
/* 0BB5D8 800C0B78 80010034 */  lwz     r0, 0x34(r1)
/* 0BB5DC 800C0B7C 83E1002C */  lwz     r31, 0x2c(r1)
/* 0BB5E0 800C0B80 83C10028 */  lwz     r30, 0x28(r1)
/* 0BB5E4 800C0B84 38210030 */  addi    r1, r1, 0x30
/* 0BB5E8 800C0B88 7C0803A6 */  mtlr    r0
/* 0BB5EC 800C0B8C 4E800020 */  blr     

glabel DVDReadDiskID
/* 0BB5F0 800C0B90 7C0802A6 */  mflr    r0
/* 0BB5F4 800C0B94 90010004 */  stw     r0, 4(r1)
/* 0BB5F8 800C0B98 38000005 */  li      r0, 5
/* 0BB5FC 800C0B9C 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0BB600 800C0BA0 93E10024 */  stw     r31, 0x24(r1)
/* 0BB604 800C0BA4 3BE30000 */  addi    r31, r3, 0
/* 0BB608 800C0BA8 93C10020 */  stw     r30, 0x20(r1)
/* 0BB60C 800C0BAC 90030008 */  stw     r0, 8(r3)
/* 0BB610 800C0BB0 38600020 */  li      r3, 0x20
/* 0BB614 800C0BB4 38000000 */  li      r0, 0
/* 0BB618 800C0BB8 909F0018 */  stw     r4, 0x18(r31)
/* 0BB61C 800C0BBC 907F0014 */  stw     r3, 0x14(r31)
/* 0BB620 800C0BC0 901F0010 */  stw     r0, 0x10(r31)
/* 0BB624 800C0BC4 901F0020 */  stw     r0, 0x20(r31)
/* 0BB628 800C0BC8 90BF0028 */  stw     r5, 0x28(r31)
/* 0BB62C 800C0BCC 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB630 800C0BD0 2C000000 */  cmpwi   r0, 0
/* 0BB634 800C0BD4 41820030 */  beq     lbl_800C0C04
/* 0BB638 800C0BD8 807F0008 */  lwz     r3, 8(r31)
/* 0BB63C 800C0BDC 28030001 */  cmplwi  r3, 1
/* 0BB640 800C0BE0 41820018 */  beq     lbl_800C0BF8
/* 0BB644 800C0BE4 3803FFFC */  addi    r0, r3, -4
/* 0BB648 800C0BE8 28000001 */  cmplwi  r0, 1
/* 0BB64C 800C0BEC 4081000C */  ble     lbl_800C0BF8
/* 0BB650 800C0BF0 2803000E */  cmplwi  r3, 0xe
/* 0BB654 800C0BF4 40820010 */  bne     lbl_800C0C04
lbl_800C0BF8:
/* 0BB658 800C0BF8 807F0018 */  lwz     r3, 0x18(r31)
/* 0BB65C 800C0BFC 809F0014 */  lwz     r4, 0x14(r31)
/* 0BB660 800C0C00 4BFE85C5 */  bl      DCInvalidateRange
lbl_800C0C04:
/* 0BB664 800C0C04 4BFE9B6D */  bl      OSDisableInterrupts
/* 0BB668 800C0C08 38000002 */  li      r0, 2
/* 0BB66C 800C0C0C 901F000C */  stw     r0, 0xc(r31)
/* 0BB670 800C0C10 3BC30000 */  addi    r30, r3, 0
/* 0BB674 800C0C14 389F0000 */  addi    r4, r31, 0
/* 0BB678 800C0C18 38600002 */  li      r3, 2
/* 0BB67C 800C0C1C 48000C4D */  bl      __DVDPushWaitingQueue
/* 0BB680 800C0C20 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB684 800C0C24 3BE30000 */  addi    r31, r3, 0
/* 0BB688 800C0C28 28000000 */  cmplwi  r0, 0
/* 0BB68C 800C0C2C 40820014 */  bne     lbl_800C0C40
/* 0BB690 800C0C30 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB694 800C0C34 2C000000 */  cmpwi   r0, 0
/* 0BB698 800C0C38 40820008 */  bne     lbl_800C0C40
/* 0BB69C 800C0C3C 4BFFF099 */  bl      stateReady
lbl_800C0C40:
/* 0BB6A0 800C0C40 7FC3F378 */  mr      r3, r30
/* 0BB6A4 800C0C44 4BFE9B55 */  bl      OSRestoreInterrupts
/* 0BB6A8 800C0C48 7FE3FB78 */  mr      r3, r31
/* 0BB6AC 800C0C4C 8001002C */  lwz     r0, 0x2c(r1)
/* 0BB6B0 800C0C50 83E10024 */  lwz     r31, 0x24(r1)
/* 0BB6B4 800C0C54 83C10020 */  lwz     r30, 0x20(r1)
/* 0BB6B8 800C0C58 38210028 */  addi    r1, r1, 0x28
/* 0BB6BC 800C0C5C 7C0803A6 */  mtlr    r0
/* 0BB6C0 800C0C60 4E800020 */  blr     

glabel DVDPrepareStreamAbsAsync
/* 0BB6C4 800C0C64 7C0802A6 */  mflr    r0
/* 0BB6C8 800C0C68 90010004 */  stw     r0, 4(r1)
/* 0BB6CC 800C0C6C 38000006 */  li      r0, 6
/* 0BB6D0 800C0C70 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0BB6D4 800C0C74 93E10024 */  stw     r31, 0x24(r1)
/* 0BB6D8 800C0C78 3BE30000 */  addi    r31, r3, 0
/* 0BB6DC 800C0C7C 93C10020 */  stw     r30, 0x20(r1)
/* 0BB6E0 800C0C80 90030008 */  stw     r0, 8(r3)
/* 0BB6E4 800C0C84 90830014 */  stw     r4, 0x14(r3)
/* 0BB6E8 800C0C88 90A30010 */  stw     r5, 0x10(r3)
/* 0BB6EC 800C0C8C 90C30028 */  stw     r6, 0x28(r3)
/* 0BB6F0 800C0C90 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB6F4 800C0C94 2C000000 */  cmpwi   r0, 0
/* 0BB6F8 800C0C98 41820030 */  beq     lbl_800C0CC8
/* 0BB6FC 800C0C9C 807F0008 */  lwz     r3, 8(r31)
/* 0BB700 800C0CA0 28030001 */  cmplwi  r3, 1
/* 0BB704 800C0CA4 41820018 */  beq     lbl_800C0CBC
/* 0BB708 800C0CA8 3803FFFC */  addi    r0, r3, -4
/* 0BB70C 800C0CAC 28000001 */  cmplwi  r0, 1
/* 0BB710 800C0CB0 4081000C */  ble     lbl_800C0CBC
/* 0BB714 800C0CB4 2803000E */  cmplwi  r3, 0xe
/* 0BB718 800C0CB8 40820010 */  bne     lbl_800C0CC8
lbl_800C0CBC:
/* 0BB71C 800C0CBC 807F0018 */  lwz     r3, 0x18(r31)
/* 0BB720 800C0CC0 809F0014 */  lwz     r4, 0x14(r31)
/* 0BB724 800C0CC4 4BFE8501 */  bl      DCInvalidateRange
lbl_800C0CC8:
/* 0BB728 800C0CC8 4BFE9AA9 */  bl      OSDisableInterrupts
/* 0BB72C 800C0CCC 38000002 */  li      r0, 2
/* 0BB730 800C0CD0 901F000C */  stw     r0, 0xc(r31)
/* 0BB734 800C0CD4 3BC30000 */  addi    r30, r3, 0
/* 0BB738 800C0CD8 389F0000 */  addi    r4, r31, 0
/* 0BB73C 800C0CDC 38600001 */  li      r3, 1
/* 0BB740 800C0CE0 48000B89 */  bl      __DVDPushWaitingQueue
/* 0BB744 800C0CE4 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB748 800C0CE8 3BE30000 */  addi    r31, r3, 0
/* 0BB74C 800C0CEC 28000000 */  cmplwi  r0, 0
/* 0BB750 800C0CF0 40820014 */  bne     lbl_800C0D04
/* 0BB754 800C0CF4 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB758 800C0CF8 2C000000 */  cmpwi   r0, 0
/* 0BB75C 800C0CFC 40820008 */  bne     lbl_800C0D04
/* 0BB760 800C0D00 4BFFEFD5 */  bl      stateReady
lbl_800C0D04:
/* 0BB764 800C0D04 7FC3F378 */  mr      r3, r30
/* 0BB768 800C0D08 4BFE9A91 */  bl      OSRestoreInterrupts
/* 0BB76C 800C0D0C 7FE3FB78 */  mr      r3, r31
/* 0BB770 800C0D10 8001002C */  lwz     r0, 0x2c(r1)
/* 0BB774 800C0D14 83E10024 */  lwz     r31, 0x24(r1)
/* 0BB778 800C0D18 83C10020 */  lwz     r30, 0x20(r1)
/* 0BB77C 800C0D1C 38210028 */  addi    r1, r1, 0x28
/* 0BB780 800C0D20 7C0803A6 */  mtlr    r0
/* 0BB784 800C0D24 4E800020 */  blr     

glabel DVDCancelStreamAsync
/* 0BB788 800C0D28 7C0802A6 */  mflr    r0
/* 0BB78C 800C0D2C 90010004 */  stw     r0, 4(r1)
/* 0BB790 800C0D30 38000007 */  li      r0, 7
/* 0BB794 800C0D34 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BB798 800C0D38 93E1001C */  stw     r31, 0x1c(r1)
/* 0BB79C 800C0D3C 3BE30000 */  addi    r31, r3, 0
/* 0BB7A0 800C0D40 93C10018 */  stw     r30, 0x18(r1)
/* 0BB7A4 800C0D44 90030008 */  stw     r0, 8(r3)
/* 0BB7A8 800C0D48 90830028 */  stw     r4, 0x28(r3)
/* 0BB7AC 800C0D4C 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB7B0 800C0D50 2C000000 */  cmpwi   r0, 0
/* 0BB7B4 800C0D54 41820030 */  beq     lbl_800C0D84
/* 0BB7B8 800C0D58 807F0008 */  lwz     r3, 8(r31)
/* 0BB7BC 800C0D5C 28030001 */  cmplwi  r3, 1
/* 0BB7C0 800C0D60 41820018 */  beq     lbl_800C0D78
/* 0BB7C4 800C0D64 3803FFFC */  addi    r0, r3, -4
/* 0BB7C8 800C0D68 28000001 */  cmplwi  r0, 1
/* 0BB7CC 800C0D6C 4081000C */  ble     lbl_800C0D78
/* 0BB7D0 800C0D70 2803000E */  cmplwi  r3, 0xe
/* 0BB7D4 800C0D74 40820010 */  bne     lbl_800C0D84
lbl_800C0D78:
/* 0BB7D8 800C0D78 807F0018 */  lwz     r3, 0x18(r31)
/* 0BB7DC 800C0D7C 809F0014 */  lwz     r4, 0x14(r31)
/* 0BB7E0 800C0D80 4BFE8445 */  bl      DCInvalidateRange
lbl_800C0D84:
/* 0BB7E4 800C0D84 4BFE99ED */  bl      OSDisableInterrupts
/* 0BB7E8 800C0D88 38000002 */  li      r0, 2
/* 0BB7EC 800C0D8C 901F000C */  stw     r0, 0xc(r31)
/* 0BB7F0 800C0D90 3BC30000 */  addi    r30, r3, 0
/* 0BB7F4 800C0D94 389F0000 */  addi    r4, r31, 0
/* 0BB7F8 800C0D98 38600001 */  li      r3, 1
/* 0BB7FC 800C0D9C 48000ACD */  bl      __DVDPushWaitingQueue
/* 0BB800 800C0DA0 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB804 800C0DA4 3BE30000 */  addi    r31, r3, 0
/* 0BB808 800C0DA8 28000000 */  cmplwi  r0, 0
/* 0BB80C 800C0DAC 40820014 */  bne     lbl_800C0DC0
/* 0BB810 800C0DB0 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB814 800C0DB4 2C000000 */  cmpwi   r0, 0
/* 0BB818 800C0DB8 40820008 */  bne     lbl_800C0DC0
/* 0BB81C 800C0DBC 4BFFEF19 */  bl      stateReady
lbl_800C0DC0:
/* 0BB820 800C0DC0 7FC3F378 */  mr      r3, r30
/* 0BB824 800C0DC4 4BFE99D5 */  bl      OSRestoreInterrupts
/* 0BB828 800C0DC8 7FE3FB78 */  mr      r3, r31
/* 0BB82C 800C0DCC 80010024 */  lwz     r0, 0x24(r1)
/* 0BB830 800C0DD0 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BB834 800C0DD4 83C10018 */  lwz     r30, 0x18(r1)
/* 0BB838 800C0DD8 38210020 */  addi    r1, r1, 0x20
/* 0BB83C 800C0DDC 7C0803A6 */  mtlr    r0
/* 0BB840 800C0DE0 4E800020 */  blr     

glabel DVDStopStreamAtEndAsync
/* 0BB844 800C0DE4 7C0802A6 */  mflr    r0
/* 0BB848 800C0DE8 90010004 */  stw     r0, 4(r1)
/* 0BB84C 800C0DEC 38000008 */  li      r0, 8
/* 0BB850 800C0DF0 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BB854 800C0DF4 93E1001C */  stw     r31, 0x1c(r1)
/* 0BB858 800C0DF8 3BE30000 */  addi    r31, r3, 0
/* 0BB85C 800C0DFC 93C10018 */  stw     r30, 0x18(r1)
/* 0BB860 800C0E00 90030008 */  stw     r0, 8(r3)
/* 0BB864 800C0E04 90830028 */  stw     r4, 0x28(r3)
/* 0BB868 800C0E08 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB86C 800C0E0C 2C000000 */  cmpwi   r0, 0
/* 0BB870 800C0E10 41820030 */  beq     lbl_800C0E40
/* 0BB874 800C0E14 807F0008 */  lwz     r3, 8(r31)
/* 0BB878 800C0E18 28030001 */  cmplwi  r3, 1
/* 0BB87C 800C0E1C 41820018 */  beq     lbl_800C0E34
/* 0BB880 800C0E20 3803FFFC */  addi    r0, r3, -4
/* 0BB884 800C0E24 28000001 */  cmplwi  r0, 1
/* 0BB888 800C0E28 4081000C */  ble     lbl_800C0E34
/* 0BB88C 800C0E2C 2803000E */  cmplwi  r3, 0xe
/* 0BB890 800C0E30 40820010 */  bne     lbl_800C0E40
lbl_800C0E34:
/* 0BB894 800C0E34 807F0018 */  lwz     r3, 0x18(r31)
/* 0BB898 800C0E38 809F0014 */  lwz     r4, 0x14(r31)
/* 0BB89C 800C0E3C 4BFE8389 */  bl      DCInvalidateRange
lbl_800C0E40:
/* 0BB8A0 800C0E40 4BFE9931 */  bl      OSDisableInterrupts
/* 0BB8A4 800C0E44 38000002 */  li      r0, 2
/* 0BB8A8 800C0E48 901F000C */  stw     r0, 0xc(r31)
/* 0BB8AC 800C0E4C 3BC30000 */  addi    r30, r3, 0
/* 0BB8B0 800C0E50 389F0000 */  addi    r4, r31, 0
/* 0BB8B4 800C0E54 38600001 */  li      r3, 1
/* 0BB8B8 800C0E58 48000A11 */  bl      __DVDPushWaitingQueue
/* 0BB8BC 800C0E5C 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB8C0 800C0E60 3BE30000 */  addi    r31, r3, 0
/* 0BB8C4 800C0E64 28000000 */  cmplwi  r0, 0
/* 0BB8C8 800C0E68 40820014 */  bne     lbl_800C0E7C
/* 0BB8CC 800C0E6C 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB8D0 800C0E70 2C000000 */  cmpwi   r0, 0
/* 0BB8D4 800C0E74 40820008 */  bne     lbl_800C0E7C
/* 0BB8D8 800C0E78 4BFFEE5D */  bl      stateReady
lbl_800C0E7C:
/* 0BB8DC 800C0E7C 7FC3F378 */  mr      r3, r30
/* 0BB8E0 800C0E80 4BFE9919 */  bl      OSRestoreInterrupts
/* 0BB8E4 800C0E84 7FE3FB78 */  mr      r3, r31
/* 0BB8E8 800C0E88 80010024 */  lwz     r0, 0x24(r1)
/* 0BB8EC 800C0E8C 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BB8F0 800C0E90 83C10018 */  lwz     r30, 0x18(r1)
/* 0BB8F4 800C0E94 38210020 */  addi    r1, r1, 0x20
/* 0BB8F8 800C0E98 7C0803A6 */  mtlr    r0
/* 0BB8FC 800C0E9C 4E800020 */  blr     

glabel DVDGetStreamErrorStatusAsync
/* 0BB900 800C0EA0 7C0802A6 */  mflr    r0
/* 0BB904 800C0EA4 90010004 */  stw     r0, 4(r1)
/* 0BB908 800C0EA8 38000009 */  li      r0, 9
/* 0BB90C 800C0EAC 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BB910 800C0EB0 93E1001C */  stw     r31, 0x1c(r1)
/* 0BB914 800C0EB4 3BE30000 */  addi    r31, r3, 0
/* 0BB918 800C0EB8 93C10018 */  stw     r30, 0x18(r1)
/* 0BB91C 800C0EBC 90030008 */  stw     r0, 8(r3)
/* 0BB920 800C0EC0 90830028 */  stw     r4, 0x28(r3)
/* 0BB924 800C0EC4 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BB928 800C0EC8 2C000000 */  cmpwi   r0, 0
/* 0BB92C 800C0ECC 41820030 */  beq     lbl_800C0EFC
/* 0BB930 800C0ED0 807F0008 */  lwz     r3, 8(r31)
/* 0BB934 800C0ED4 28030001 */  cmplwi  r3, 1
/* 0BB938 800C0ED8 41820018 */  beq     lbl_800C0EF0
/* 0BB93C 800C0EDC 3803FFFC */  addi    r0, r3, -4
/* 0BB940 800C0EE0 28000001 */  cmplwi  r0, 1
/* 0BB944 800C0EE4 4081000C */  ble     lbl_800C0EF0
/* 0BB948 800C0EE8 2803000E */  cmplwi  r3, 0xe
/* 0BB94C 800C0EEC 40820010 */  bne     lbl_800C0EFC
lbl_800C0EF0:
/* 0BB950 800C0EF0 807F0018 */  lwz     r3, 0x18(r31)
/* 0BB954 800C0EF4 809F0014 */  lwz     r4, 0x14(r31)
/* 0BB958 800C0EF8 4BFE82CD */  bl      DCInvalidateRange
lbl_800C0EFC:
/* 0BB95C 800C0EFC 4BFE9875 */  bl      OSDisableInterrupts
/* 0BB960 800C0F00 38000002 */  li      r0, 2
/* 0BB964 800C0F04 901F000C */  stw     r0, 0xc(r31)
/* 0BB968 800C0F08 3BC30000 */  addi    r30, r3, 0
/* 0BB96C 800C0F0C 389F0000 */  addi    r4, r31, 0
/* 0BB970 800C0F10 38600001 */  li      r3, 1
/* 0BB974 800C0F14 48000955 */  bl      __DVDPushWaitingQueue
/* 0BB978 800C0F18 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BB97C 800C0F1C 3BE30000 */  addi    r31, r3, 0
/* 0BB980 800C0F20 28000000 */  cmplwi  r0, 0
/* 0BB984 800C0F24 40820014 */  bne     lbl_800C0F38
/* 0BB988 800C0F28 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BB98C 800C0F2C 2C000000 */  cmpwi   r0, 0
/* 0BB990 800C0F30 40820008 */  bne     lbl_800C0F38
/* 0BB994 800C0F34 4BFFEDA1 */  bl      stateReady
lbl_800C0F38:
/* 0BB998 800C0F38 7FC3F378 */  mr      r3, r30
/* 0BB99C 800C0F3C 4BFE985D */  bl      OSRestoreInterrupts
/* 0BB9A0 800C0F40 7FE3FB78 */  mr      r3, r31
/* 0BB9A4 800C0F44 80010024 */  lwz     r0, 0x24(r1)
/* 0BB9A8 800C0F48 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BB9AC 800C0F4C 83C10018 */  lwz     r30, 0x18(r1)
/* 0BB9B0 800C0F50 38210020 */  addi    r1, r1, 0x20
/* 0BB9B4 800C0F54 7C0803A6 */  mtlr    r0
/* 0BB9B8 800C0F58 4E800020 */  blr     

glabel DVDGetStreamErrorStatus
/* 0BB9BC 800C0F5C 7C0802A6 */  mflr    r0
/* 0BB9C0 800C0F60 90010004 */  stw     r0, 4(r1)
/* 0BB9C4 800C0F64 38000009 */  li      r0, 9
/* 0BB9C8 800C0F68 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BB9CC 800C0F6C 93E1001C */  stw     r31, 0x1c(r1)
/* 0BB9D0 800C0F70 93C10018 */  stw     r30, 0x18(r1)
/* 0BB9D4 800C0F74 3BC30000 */  addi    r30, r3, 0
/* 0BB9D8 800C0F78 3C60800C */  lis     r3, cbForGetStreamErrorStatusSync@ha
/* 0BB9DC 800C0F7C 901E0008 */  stw     r0, 8(r30)
/* 0BB9E0 800C0F80 38030FFC */  addi    r0, r3, cbForGetStreamErrorStatusSync@l
/* 0BB9E4 800C0F84 389E0000 */  addi    r4, r30, 0
/* 0BB9E8 800C0F88 901E0028 */  stw     r0, 0x28(r30)
/* 0BB9EC 800C0F8C 38600001 */  li      r3, 1
/* 0BB9F0 800C0F90 4BFFF8CD */  bl      issueCommand
/* 0BB9F4 800C0F94 2C030000 */  cmpwi   r3, 0
/* 0BB9F8 800C0F98 4082000C */  bne     lbl_800C0FA4
/* 0BB9FC 800C0F9C 3860FFFF */  li      r3, -1
/* 0BBA00 800C0FA0 48000044 */  b       lbl_800C0FE4
lbl_800C0FA4:
/* 0BBA04 800C0FA4 4BFE97CD */  bl      OSDisableInterrupts
/* 0BBA08 800C0FA8 7C7F1B78 */  mr      r31, r3
lbl_800C0FAC:
/* 0BBA0C 800C0FAC 807E000C */  lwz     r3, 0xc(r30)
/* 0BBA10 800C0FB0 38030001 */  addi    r0, r3, 1
/* 0BBA14 800C0FB4 28000001 */  cmplwi  r0, 1
/* 0BBA18 800C0FB8 4081000C */  ble     lbl_800C0FC4
/* 0BBA1C 800C0FBC 2C03000A */  cmpwi   r3, 0xa
/* 0BBA20 800C0FC0 4082000C */  bne     lbl_800C0FCC
lbl_800C0FC4:
/* 0BBA24 800C0FC4 83DE0020 */  lwz     r30, 0x20(r30)
/* 0BBA28 800C0FC8 48000010 */  b       lbl_800C0FD8
lbl_800C0FCC:
/* 0BBA2C 800C0FCC 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0BBA30 800C0FD0 4BFECAB1 */  bl      OSSleepThread
/* 0BBA34 800C0FD4 4BFFFFD8 */  b       lbl_800C0FAC
lbl_800C0FD8:
/* 0BBA38 800C0FD8 7FE3FB78 */  mr      r3, r31
/* 0BBA3C 800C0FDC 4BFE97BD */  bl      OSRestoreInterrupts
/* 0BBA40 800C0FE0 7FC3F378 */  mr      r3, r30
lbl_800C0FE4:
/* 0BBA44 800C0FE4 80010024 */  lwz     r0, 0x24(r1)
/* 0BBA48 800C0FE8 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BBA4C 800C0FEC 83C10018 */  lwz     r30, 0x18(r1)
/* 0BBA50 800C0FF0 38210020 */  addi    r1, r1, 0x20
/* 0BBA54 800C0FF4 7C0803A6 */  mtlr    r0
/* 0BBA58 800C0FF8 4E800020 */  blr     

cbForGetStreamErrorStatusSync:
/* 0BBA5C 800C0FFC 7C0802A6 */  mflr    r0
/* 0BBA60 800C1000 90010004 */  stw     r0, 4(r1)
/* 0BBA64 800C1004 9421FFF8 */  stwu    r1, -8(r1)
/* 0BBA68 800C1008 90640020 */  stw     r3, 0x20(r4)
/* 0BBA6C 800C100C 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0BBA70 800C1010 4BFECB5D */  bl      OSWakeupThread
/* 0BBA74 800C1014 8001000C */  lwz     r0, 0xc(r1)
/* 0BBA78 800C1018 38210008 */  addi    r1, r1, 8
/* 0BBA7C 800C101C 7C0803A6 */  mtlr    r0
/* 0BBA80 800C1020 4E800020 */  blr     

glabel DVDInquiryAsync
/* 0BBA84 800C1024 7C0802A6 */  mflr    r0
/* 0BBA88 800C1028 90010004 */  stw     r0, 4(r1)
/* 0BBA8C 800C102C 3800000E */  li      r0, 0xe
/* 0BBA90 800C1030 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0BBA94 800C1034 93E10024 */  stw     r31, 0x24(r1)
/* 0BBA98 800C1038 3BE30000 */  addi    r31, r3, 0
/* 0BBA9C 800C103C 93C10020 */  stw     r30, 0x20(r1)
/* 0BBAA0 800C1040 90030008 */  stw     r0, 8(r3)
/* 0BBAA4 800C1044 38600020 */  li      r3, 0x20
/* 0BBAA8 800C1048 38000000 */  li      r0, 0
/* 0BBAAC 800C104C 909F0018 */  stw     r4, 0x18(r31)
/* 0BBAB0 800C1050 907F0014 */  stw     r3, 0x14(r31)
/* 0BBAB4 800C1054 901F0020 */  stw     r0, 0x20(r31)
/* 0BBAB8 800C1058 90BF0028 */  stw     r5, 0x28(r31)
/* 0BBABC 800C105C 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BBAC0 800C1060 2C000000 */  cmpwi   r0, 0
/* 0BBAC4 800C1064 41820030 */  beq     lbl_800C1094
/* 0BBAC8 800C1068 807F0008 */  lwz     r3, 8(r31)
/* 0BBACC 800C106C 28030001 */  cmplwi  r3, 1
/* 0BBAD0 800C1070 41820018 */  beq     lbl_800C1088
/* 0BBAD4 800C1074 3803FFFC */  addi    r0, r3, -4
/* 0BBAD8 800C1078 28000001 */  cmplwi  r0, 1
/* 0BBADC 800C107C 4081000C */  ble     lbl_800C1088
/* 0BBAE0 800C1080 2803000E */  cmplwi  r3, 0xe
/* 0BBAE4 800C1084 40820010 */  bne     lbl_800C1094
lbl_800C1088:
/* 0BBAE8 800C1088 807F0018 */  lwz     r3, 0x18(r31)
/* 0BBAEC 800C108C 809F0014 */  lwz     r4, 0x14(r31)
/* 0BBAF0 800C1090 4BFE8135 */  bl      DCInvalidateRange
lbl_800C1094:
/* 0BBAF4 800C1094 4BFE96DD */  bl      OSDisableInterrupts
/* 0BBAF8 800C1098 38000002 */  li      r0, 2
/* 0BBAFC 800C109C 901F000C */  stw     r0, 0xc(r31)
/* 0BBB00 800C10A0 3BC30000 */  addi    r30, r3, 0
/* 0BBB04 800C10A4 389F0000 */  addi    r4, r31, 0
/* 0BBB08 800C10A8 38600002 */  li      r3, 2
/* 0BBB0C 800C10AC 480007BD */  bl      __DVDPushWaitingQueue
/* 0BBB10 800C10B0 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BBB14 800C10B4 3BE30000 */  addi    r31, r3, 0
/* 0BBB18 800C10B8 28000000 */  cmplwi  r0, 0
/* 0BBB1C 800C10BC 40820014 */  bne     lbl_800C10D0
/* 0BBB20 800C10C0 800D9324 */  lwz     r0, PauseFlag-_SDA_BASE_(r13)
/* 0BBB24 800C10C4 2C000000 */  cmpwi   r0, 0
/* 0BBB28 800C10C8 40820008 */  bne     lbl_800C10D0
/* 0BBB2C 800C10CC 4BFFEC09 */  bl      stateReady
lbl_800C10D0:
/* 0BBB30 800C10D0 7FC3F378 */  mr      r3, r30
/* 0BBB34 800C10D4 4BFE96C5 */  bl      OSRestoreInterrupts
/* 0BBB38 800C10D8 7FE3FB78 */  mr      r3, r31
/* 0BBB3C 800C10DC 8001002C */  lwz     r0, 0x2c(r1)
/* 0BBB40 800C10E0 83E10024 */  lwz     r31, 0x24(r1)
/* 0BBB44 800C10E4 83C10020 */  lwz     r30, 0x20(r1)
/* 0BBB48 800C10E8 38210028 */  addi    r1, r1, 0x28
/* 0BBB4C 800C10EC 7C0803A6 */  mtlr    r0
/* 0BBB50 800C10F0 4E800020 */  blr     

glabel DVDReset
/* 0BBB54 800C10F4 7C0802A6 */  mflr    r0
/* 0BBB58 800C10F8 90010004 */  stw     r0, 4(r1)
/* 0BBB5C 800C10FC 9421FFF8 */  stwu    r1, -8(r1)
/* 0BBB60 800C1100 4BFFCF49 */  bl      DVDLowReset
/* 0BBB64 800C1104 3C60CC00 */  lis     r3, 0xcc00
/* 0BBB68 800C1108 3800002A */  li      r0, 0x2a
/* 0BBB6C 800C110C 90036000 */  stw     r0, 0x6000(r3)
/* 0BBB70 800C1110 38836000 */  addi    r4, r3, 0x6000
/* 0BBB74 800C1114 38000000 */  li      r0, 0
/* 0BBB78 800C1118 80636004 */  lwz     r3, 0x6004(r3)
/* 0BBB7C 800C111C 90640004 */  stw     r3, 4(r4)
/* 0BBB80 800C1120 900D9350 */  stw     r0, ResetRequired-_SDA_BASE_(r13)
/* 0BBB84 800C1124 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BBB88 800C1128 8001000C */  lwz     r0, 0xc(r1)
/* 0BBB8C 800C112C 38210008 */  addi    r1, r1, 8
/* 0BBB90 800C1130 7C0803A6 */  mtlr    r0
/* 0BBB94 800C1134 4E800020 */  blr     

glabel DVDGetCommandBlockStatus
/* 0BBB98 800C1138 7C0802A6 */  mflr    r0
/* 0BBB9C 800C113C 90010004 */  stw     r0, 4(r1)
/* 0BBBA0 800C1140 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BBBA4 800C1144 93E10014 */  stw     r31, 0x14(r1)
/* 0BBBA8 800C1148 7C7F1B78 */  mr      r31, r3
/* 0BBBAC 800C114C 4BFE9625 */  bl      OSDisableInterrupts
/* 0BBBB0 800C1150 801F000C */  lwz     r0, 0xc(r31)
/* 0BBBB4 800C1154 2C000003 */  cmpwi   r0, 3
/* 0BBBB8 800C1158 4082000C */  bne     lbl_800C1164
/* 0BBBBC 800C115C 3BE00001 */  li      r31, 1
/* 0BBBC0 800C1160 48000008 */  b       lbl_800C1168
lbl_800C1164:
/* 0BBBC4 800C1164 7C1F0378 */  mr      r31, r0
lbl_800C1168:
/* 0BBBC8 800C1168 4BFE9631 */  bl      OSRestoreInterrupts
/* 0BBBCC 800C116C 7FE3FB78 */  mr      r3, r31
/* 0BBBD0 800C1170 8001001C */  lwz     r0, 0x1c(r1)
/* 0BBBD4 800C1174 83E10014 */  lwz     r31, 0x14(r1)
/* 0BBBD8 800C1178 38210018 */  addi    r1, r1, 0x18
/* 0BBBDC 800C117C 7C0803A6 */  mtlr    r0
/* 0BBBE0 800C1180 4E800020 */  blr     

glabel DVDGetDriveStatus
/* 0BBBE4 800C1184 7C0802A6 */  mflr    r0
/* 0BBBE8 800C1188 90010004 */  stw     r0, 4(r1)
/* 0BBBEC 800C118C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BBBF0 800C1190 93E10014 */  stw     r31, 0x14(r1)
/* 0BBBF4 800C1194 93C10010 */  stw     r30, 0x10(r1)
/* 0BBBF8 800C1198 4BFE95D9 */  bl      OSDisableInterrupts
/* 0BBBFC 800C119C 800D9330 */  lwz     r0, FatalErrorFlag-_SDA_BASE_(r13)
/* 0BBC00 800C11A0 3BC30000 */  addi    r30, r3, 0
/* 0BBC04 800C11A4 2C000000 */  cmpwi   r0, 0
/* 0BBC08 800C11A8 4182000C */  beq     lbl_800C11B4
/* 0BBC0C 800C11AC 3BE0FFFF */  li      r31, -1
/* 0BBC10 800C11B0 4800005C */  b       lbl_800C120C
lbl_800C11B4:
/* 0BBC14 800C11B4 800D9328 */  lwz     r0, PausingFlag-_SDA_BASE_(r13)
/* 0BBC18 800C11B8 2C000000 */  cmpwi   r0, 0
/* 0BBC1C 800C11BC 4182000C */  beq     lbl_800C11C8
/* 0BBC20 800C11C0 3BE00008 */  li      r31, 8
/* 0BBC24 800C11C4 48000048 */  b       lbl_800C120C
lbl_800C11C8:
/* 0BBC28 800C11C8 83ED9318 */  lwz     r31, executing-_SDA_BASE_(r13)
/* 0BBC2C 800C11CC 281F0000 */  cmplwi  r31, 0
/* 0BBC30 800C11D0 4082000C */  bne     lbl_800C11DC
/* 0BBC34 800C11D4 3BE00000 */  li      r31, 0
/* 0BBC38 800C11D8 48000034 */  b       lbl_800C120C
lbl_800C11DC:
/* 0BBC3C 800C11DC 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0BBC40 800C11E0 380322E0 */  addi    r0, r3, DummyCommandBlock@l
/* 0BBC44 800C11E4 7C1F0040 */  cmplw   r31, r0
/* 0BBC48 800C11E8 4082000C */  bne     lbl_800C11F4
/* 0BBC4C 800C11EC 3BE00000 */  li      r31, 0
/* 0BBC50 800C11F0 4800001C */  b       lbl_800C120C
lbl_800C11F4:
/* 0BBC54 800C11F4 4BFE957D */  bl      OSDisableInterrupts
/* 0BBC58 800C11F8 83FF000C */  lwz     r31, 0xc(r31)
/* 0BBC5C 800C11FC 2C1F0003 */  cmpwi   r31, 3
/* 0BBC60 800C1200 40820008 */  bne     lbl_800C1208
/* 0BBC64 800C1204 3BE00001 */  li      r31, 1
lbl_800C1208:
/* 0BBC68 800C1208 4BFE9591 */  bl      OSRestoreInterrupts
lbl_800C120C:
/* 0BBC6C 800C120C 7FC3F378 */  mr      r3, r30
/* 0BBC70 800C1210 4BFE9589 */  bl      OSRestoreInterrupts
/* 0BBC74 800C1214 7FE3FB78 */  mr      r3, r31
/* 0BBC78 800C1218 8001001C */  lwz     r0, 0x1c(r1)
/* 0BBC7C 800C121C 83E10014 */  lwz     r31, 0x14(r1)
/* 0BBC80 800C1220 83C10010 */  lwz     r30, 0x10(r1)
/* 0BBC84 800C1224 38210018 */  addi    r1, r1, 0x18
/* 0BBC88 800C1228 7C0803A6 */  mtlr    r0
/* 0BBC8C 800C122C 4E800020 */  blr     

glabel DVDSetAutoInvalidation
/* 0BBC90 800C1230 800D8DDC */  lwz     r0, autoInvalidation-_SDA_BASE_(r13)
/* 0BBC94 800C1234 906D8DDC */  stw     r3, autoInvalidation-_SDA_BASE_(r13)
/* 0BBC98 800C1238 7C030378 */  mr      r3, r0
/* 0BBC9C 800C123C 4E800020 */  blr     

glabel DVDResume
/* 0BBCA0 800C1240 7C0802A6 */  mflr    r0
/* 0BBCA4 800C1244 90010004 */  stw     r0, 4(r1)
/* 0BBCA8 800C1248 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0BBCAC 800C124C 93E1000C */  stw     r31, 0xc(r1)
/* 0BBCB0 800C1250 4BFE9521 */  bl      OSDisableInterrupts
/* 0BBCB4 800C1254 38800000 */  li      r4, 0
/* 0BBCB8 800C1258 908D9324 */  stw     r4, PauseFlag-_SDA_BASE_(r13)
/* 0BBCBC 800C125C 7C7F1B78 */  mr      r31, r3
/* 0BBCC0 800C1260 800D9328 */  lwz     r0, PausingFlag-_SDA_BASE_(r13)
/* 0BBCC4 800C1264 2C000000 */  cmpwi   r0, 0
/* 0BBCC8 800C1268 4182000C */  beq     lbl_800C1274
/* 0BBCCC 800C126C 908D9328 */  stw     r4, PausingFlag-_SDA_BASE_(r13)
/* 0BBCD0 800C1270 4BFFEA65 */  bl      stateReady
lbl_800C1274:
/* 0BBCD4 800C1274 7FE3FB78 */  mr      r3, r31
/* 0BBCD8 800C1278 4BFE9521 */  bl      OSRestoreInterrupts
/* 0BBCDC 800C127C 80010014 */  lwz     r0, 0x14(r1)
/* 0BBCE0 800C1280 83E1000C */  lwz     r31, 0xc(r1)
/* 0BBCE4 800C1284 38210010 */  addi    r1, r1, 0x10
/* 0BBCE8 800C1288 7C0803A6 */  mtlr    r0
/* 0BBCEC 800C128C 4E800020 */  blr     

glabel DVDCancelAsync
/* 0BBCF0 800C1290 7C0802A6 */  mflr    r0
/* 0BBCF4 800C1294 90010004 */  stw     r0, 4(r1)
/* 0BBCF8 800C1298 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0BBCFC 800C129C 93E10024 */  stw     r31, 0x24(r1)
/* 0BBD00 800C12A0 93C10020 */  stw     r30, 0x20(r1)
/* 0BBD04 800C12A4 3BC40000 */  addi    r30, r4, 0
/* 0BBD08 800C12A8 93A1001C */  stw     r29, 0x1c(r1)
/* 0BBD0C 800C12AC 3BA30000 */  addi    r29, r3, 0
/* 0BBD10 800C12B0 4BFE94C1 */  bl      OSDisableInterrupts
/* 0BBD14 800C12B4 809D000C */  lwz     r4, 0xc(r29)
/* 0BBD18 800C12B8 3BE30000 */  addi    r31, r3, 0
/* 0BBD1C 800C12BC 38040001 */  addi    r0, r4, 1
/* 0BBD20 800C12C0 2800000C */  cmplwi  r0, 0xc
/* 0BBD24 800C12C4 41810220 */  bgt     lbl_800C14E4
/* 0BBD28 800C12C8 3C608010 */  lis     r3, jtbl_80100860@ha
/* 0BBD2C 800C12CC 38630860 */  addi    r3, r3, jtbl_80100860@l
/* 0BBD30 800C12D0 5400103A */  slwi    r0, r0, 2
/* 0BBD34 800C12D4 7C03002E */  lwzx    r0, r3, r0
/* 0BBD38 800C12D8 7C0903A6 */  mtctr   r0
/* 0BBD3C 800C12DC 4E800420 */  bctr    
glabel lbl_800C12E0
/* 0BBD40 800C12E0 281E0000 */  cmplwi  r30, 0
/* 0BBD44 800C12E4 41820200 */  beq     lbl_800C14E4
/* 0BBD48 800C12E8 399E0000 */  addi    r12, r30, 0
/* 0BBD4C 800C12EC 7D8803A6 */  mtlr    r12
/* 0BBD50 800C12F0 389D0000 */  addi    r4, r29, 0
/* 0BBD54 800C12F4 38600000 */  li      r3, 0
/* 0BBD58 800C12F8 4E800021 */  blrl    
/* 0BBD5C 800C12FC 480001E8 */  b       lbl_800C14E4
glabel lbl_800C1300
/* 0BBD60 800C1300 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BBD64 800C1304 28000000 */  cmplwi  r0, 0
/* 0BBD68 800C1308 41820014 */  beq     lbl_800C131C
/* 0BBD6C 800C130C 7FE3FB78 */  mr      r3, r31
/* 0BBD70 800C1310 4BFE9489 */  bl      OSRestoreInterrupts
/* 0BBD74 800C1314 38600000 */  li      r3, 0
/* 0BBD78 800C1318 480001D8 */  b       lbl_800C14F0
lbl_800C131C:
/* 0BBD7C 800C131C 38000001 */  li      r0, 1
/* 0BBD80 800C1320 93CD933C */  stw     r30, CancelCallback-_SDA_BASE_(r13)
/* 0BBD84 800C1324 900D9338 */  stw     r0, Canceling-_SDA_BASE_(r13)
/* 0BBD88 800C1328 801D0008 */  lwz     r0, 8(r29)
/* 0BBD8C 800C132C 28000004 */  cmplwi  r0, 4
/* 0BBD90 800C1330 4182000C */  beq     lbl_800C133C
/* 0BBD94 800C1334 28000001 */  cmplwi  r0, 1
/* 0BBD98 800C1338 408201AC */  bne     lbl_800C14E4
lbl_800C133C:
/* 0BBD9C 800C133C 4BFFCDC9 */  bl      DVDLowBreak
/* 0BBDA0 800C1340 480001A4 */  b       lbl_800C14E4
glabel lbl_800C1344
/* 0BBDA4 800C1344 7FA3EB78 */  mr      r3, r29
/* 0BBDA8 800C1348 48000681 */  bl      __DVDDequeueWaitingQueue
/* 0BBDAC 800C134C 3800000A */  li      r0, 0xa
/* 0BBDB0 800C1350 901D000C */  stw     r0, 0xc(r29)
/* 0BBDB4 800C1354 819D0028 */  lwz     r12, 0x28(r29)
/* 0BBDB8 800C1358 280C0000 */  cmplwi  r12, 0
/* 0BBDBC 800C135C 41820014 */  beq     lbl_800C1370
/* 0BBDC0 800C1360 7D8803A6 */  mtlr    r12
/* 0BBDC4 800C1364 389D0000 */  addi    r4, r29, 0
/* 0BBDC8 800C1368 3860FFFD */  li      r3, -3
/* 0BBDCC 800C136C 4E800021 */  blrl    
lbl_800C1370:
/* 0BBDD0 800C1370 281E0000 */  cmplwi  r30, 0
/* 0BBDD4 800C1374 41820170 */  beq     lbl_800C14E4
/* 0BBDD8 800C1378 399E0000 */  addi    r12, r30, 0
/* 0BBDDC 800C137C 7D8803A6 */  mtlr    r12
/* 0BBDE0 800C1380 389D0000 */  addi    r4, r29, 0
/* 0BBDE4 800C1384 38600000 */  li      r3, 0
/* 0BBDE8 800C1388 4E800021 */  blrl    
/* 0BBDEC 800C138C 48000158 */  b       lbl_800C14E4
glabel lbl_800C1390
/* 0BBDF0 800C1390 801D0008 */  lwz     r0, 8(r29)
/* 0BBDF4 800C1394 2C00000D */  cmpwi   r0, 0xd
/* 0BBDF8 800C1398 41820028 */  beq     lbl_800C13C0
/* 0BBDFC 800C139C 40800018 */  bge     lbl_800C13B4
/* 0BBE00 800C13A0 2C000006 */  cmpwi   r0, 6
/* 0BBE04 800C13A4 4080003C */  bge     lbl_800C13E0
/* 0BBE08 800C13A8 2C000004 */  cmpwi   r0, 4
/* 0BBE0C 800C13AC 40800014 */  bge     lbl_800C13C0
/* 0BBE10 800C13B0 48000030 */  b       lbl_800C13E0
lbl_800C13B4:
/* 0BBE14 800C13B4 2C00000F */  cmpwi   r0, 0xf
/* 0BBE18 800C13B8 41820008 */  beq     lbl_800C13C0
/* 0BBE1C 800C13BC 48000024 */  b       lbl_800C13E0
lbl_800C13C0:
/* 0BBE20 800C13C0 281E0000 */  cmplwi  r30, 0
/* 0BBE24 800C13C4 41820120 */  beq     lbl_800C14E4
/* 0BBE28 800C13C8 399E0000 */  addi    r12, r30, 0
/* 0BBE2C 800C13CC 7D8803A6 */  mtlr    r12
/* 0BBE30 800C13D0 389D0000 */  addi    r4, r29, 0
/* 0BBE34 800C13D4 38600000 */  li      r3, 0
/* 0BBE38 800C13D8 4E800021 */  blrl    
/* 0BBE3C 800C13DC 48000108 */  b       lbl_800C14E4
lbl_800C13E0:
/* 0BBE40 800C13E0 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BBE44 800C13E4 28000000 */  cmplwi  r0, 0
/* 0BBE48 800C13E8 41820014 */  beq     lbl_800C13FC
/* 0BBE4C 800C13EC 7FE3FB78 */  mr      r3, r31
/* 0BBE50 800C13F0 4BFE93A9 */  bl      OSRestoreInterrupts
/* 0BBE54 800C13F4 38600000 */  li      r3, 0
/* 0BBE58 800C13F8 480000F8 */  b       lbl_800C14F0
lbl_800C13FC:
/* 0BBE5C 800C13FC 38000001 */  li      r0, 1
/* 0BBE60 800C1400 93CD933C */  stw     r30, CancelCallback-_SDA_BASE_(r13)
/* 0BBE64 800C1404 900D9338 */  stw     r0, Canceling-_SDA_BASE_(r13)
/* 0BBE68 800C1408 480000DC */  b       lbl_800C14E4
glabel lbl_800C140C
/* 0BBE6C 800C140C 4BFFCD0D */  bl      DVDLowClearCallback
/* 0BBE70 800C1410 3C80800C */  lis     r4, cbForStateMotorStopped@ha
/* 0BBE74 800C1414 3804FBF0 */  addi    r0, r4, cbForStateMotorStopped@l
/* 0BBE78 800C1418 7C030040 */  cmplw   r3, r0
/* 0BBE7C 800C141C 41820014 */  beq     lbl_800C1430
/* 0BBE80 800C1420 7FE3FB78 */  mr      r3, r31
/* 0BBE84 800C1424 4BFE9375 */  bl      OSRestoreInterrupts
/* 0BBE88 800C1428 38600000 */  li      r3, 0
/* 0BBE8C 800C142C 480000C4 */  b       lbl_800C14F0
lbl_800C1430:
/* 0BBE90 800C1430 801D000C */  lwz     r0, 0xc(r29)
/* 0BBE94 800C1434 2C000004 */  cmpwi   r0, 4
/* 0BBE98 800C1438 4082000C */  bne     lbl_800C1444
/* 0BBE9C 800C143C 38000003 */  li      r0, 3
/* 0BBEA0 800C1440 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
lbl_800C1444:
/* 0BBEA4 800C1444 801D000C */  lwz     r0, 0xc(r29)
/* 0BBEA8 800C1448 2C000005 */  cmpwi   r0, 5
/* 0BBEAC 800C144C 4082000C */  bne     lbl_800C1458
/* 0BBEB0 800C1450 38000004 */  li      r0, 4
/* 0BBEB4 800C1454 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
lbl_800C1458:
/* 0BBEB8 800C1458 801D000C */  lwz     r0, 0xc(r29)
/* 0BBEBC 800C145C 2C000006 */  cmpwi   r0, 6
/* 0BBEC0 800C1460 4082000C */  bne     lbl_800C146C
/* 0BBEC4 800C1464 38000001 */  li      r0, 1
/* 0BBEC8 800C1468 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
lbl_800C146C:
/* 0BBECC 800C146C 801D000C */  lwz     r0, 0xc(r29)
/* 0BBED0 800C1470 2C00000B */  cmpwi   r0, 0xb
/* 0BBED4 800C1474 4082000C */  bne     lbl_800C1480
/* 0BBED8 800C1478 38000002 */  li      r0, 2
/* 0BBEDC 800C147C 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
lbl_800C1480:
/* 0BBEE0 800C1480 801D000C */  lwz     r0, 0xc(r29)
/* 0BBEE4 800C1484 2C000007 */  cmpwi   r0, 7
/* 0BBEE8 800C1488 4082000C */  bne     lbl_800C1494
/* 0BBEEC 800C148C 38000007 */  li      r0, 7
/* 0BBEF0 800C1490 900D9340 */  stw     r0, ResumeFromHere-_SDA_BASE_(r13)
lbl_800C1494:
/* 0BBEF4 800C1494 3C608014 */  lis     r3, DummyCommandBlock@ha
/* 0BBEF8 800C1498 380322E0 */  addi    r0, r3, DummyCommandBlock@l
/* 0BBEFC 800C149C 900D9318 */  stw     r0, executing-_SDA_BASE_(r13)
/* 0BBF00 800C14A0 3800000A */  li      r0, 0xa
/* 0BBF04 800C14A4 901D000C */  stw     r0, 0xc(r29)
/* 0BBF08 800C14A8 819D0028 */  lwz     r12, 0x28(r29)
/* 0BBF0C 800C14AC 280C0000 */  cmplwi  r12, 0
/* 0BBF10 800C14B0 41820014 */  beq     lbl_800C14C4
/* 0BBF14 800C14B4 7D8803A6 */  mtlr    r12
/* 0BBF18 800C14B8 389D0000 */  addi    r4, r29, 0
/* 0BBF1C 800C14BC 3860FFFD */  li      r3, -3
/* 0BBF20 800C14C0 4E800021 */  blrl    
lbl_800C14C4:
/* 0BBF24 800C14C4 281E0000 */  cmplwi  r30, 0
/* 0BBF28 800C14C8 41820018 */  beq     lbl_800C14E0
/* 0BBF2C 800C14CC 399E0000 */  addi    r12, r30, 0
/* 0BBF30 800C14D0 7D8803A6 */  mtlr    r12
/* 0BBF34 800C14D4 389D0000 */  addi    r4, r29, 0
/* 0BBF38 800C14D8 38600000 */  li      r3, 0
/* 0BBF3C 800C14DC 4E800021 */  blrl    
lbl_800C14E0:
/* 0BBF40 800C14E0 4BFFE7F5 */  bl      stateReady
glabel lbl_800C14E4
/* 0BBF44 800C14E4 7FE3FB78 */  mr      r3, r31
/* 0BBF48 800C14E8 4BFE92B1 */  bl      OSRestoreInterrupts
/* 0BBF4C 800C14EC 38600001 */  li      r3, 1
lbl_800C14F0:
/* 0BBF50 800C14F0 8001002C */  lwz     r0, 0x2c(r1)
/* 0BBF54 800C14F4 83E10024 */  lwz     r31, 0x24(r1)
/* 0BBF58 800C14F8 83C10020 */  lwz     r30, 0x20(r1)
/* 0BBF5C 800C14FC 83A1001C */  lwz     r29, 0x1c(r1)
/* 0BBF60 800C1500 38210028 */  addi    r1, r1, 0x28
/* 0BBF64 800C1504 7C0803A6 */  mtlr    r0
/* 0BBF68 800C1508 4E800020 */  blr     

glabel DVDCancel
/* 0BBF6C 800C150C 7C0802A6 */  mflr    r0
/* 0BBF70 800C1510 3C80800C */  lis     r4, cbForCancelSync@ha
/* 0BBF74 800C1514 90010004 */  stw     r0, 4(r1)
/* 0BBF78 800C1518 388415B8 */  addi    r4, r4, cbForCancelSync@l
/* 0BBF7C 800C151C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BBF80 800C1520 93E10014 */  stw     r31, 0x14(r1)
/* 0BBF84 800C1524 93C10010 */  stw     r30, 0x10(r1)
/* 0BBF88 800C1528 3BC30000 */  addi    r30, r3, 0
/* 0BBF8C 800C152C 4BFFFD65 */  bl      DVDCancelAsync
/* 0BBF90 800C1530 2C030000 */  cmpwi   r3, 0
/* 0BBF94 800C1534 4082000C */  bne     lbl_800C1540
/* 0BBF98 800C1538 3860FFFF */  li      r3, -1
/* 0BBF9C 800C153C 48000064 */  b       lbl_800C15A0
lbl_800C1540:
/* 0BBFA0 800C1540 4BFE9231 */  bl      OSDisableInterrupts
/* 0BBFA4 800C1544 7C7F1B78 */  mr      r31, r3
lbl_800C1548:
/* 0BBFA8 800C1548 807E000C */  lwz     r3, 0xc(r30)
/* 0BBFAC 800C154C 38030001 */  addi    r0, r3, 1
/* 0BBFB0 800C1550 28000001 */  cmplwi  r0, 1
/* 0BBFB4 800C1554 40810040 */  ble     lbl_800C1594
/* 0BBFB8 800C1558 2C03000A */  cmpwi   r3, 0xa
/* 0BBFBC 800C155C 41820038 */  beq     lbl_800C1594
/* 0BBFC0 800C1560 2C030003 */  cmpwi   r3, 3
/* 0BBFC4 800C1564 40820024 */  bne     lbl_800C1588
/* 0BBFC8 800C1568 807E0008 */  lwz     r3, 8(r30)
/* 0BBFCC 800C156C 3803FFFC */  addi    r0, r3, -4
/* 0BBFD0 800C1570 28000001 */  cmplwi  r0, 1
/* 0BBFD4 800C1574 40810020 */  ble     lbl_800C1594
/* 0BBFD8 800C1578 2803000D */  cmplwi  r3, 0xd
/* 0BBFDC 800C157C 41820018 */  beq     lbl_800C1594
/* 0BBFE0 800C1580 2803000F */  cmplwi  r3, 0xf
/* 0BBFE4 800C1584 41820010 */  beq     lbl_800C1594
lbl_800C1588:
/* 0BBFE8 800C1588 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0BBFEC 800C158C 4BFEC4F5 */  bl      OSSleepThread
/* 0BBFF0 800C1590 4BFFFFB8 */  b       lbl_800C1548
lbl_800C1594:
/* 0BBFF4 800C1594 7FE3FB78 */  mr      r3, r31
/* 0BBFF8 800C1598 4BFE9201 */  bl      OSRestoreInterrupts
/* 0BBFFC 800C159C 38600000 */  li      r3, 0
lbl_800C15A0:
/* 0BC000 800C15A0 8001001C */  lwz     r0, 0x1c(r1)
/* 0BC004 800C15A4 83E10014 */  lwz     r31, 0x14(r1)
/* 0BC008 800C15A8 83C10010 */  lwz     r30, 0x10(r1)
/* 0BC00C 800C15AC 38210018 */  addi    r1, r1, 0x18
/* 0BC010 800C15B0 7C0803A6 */  mtlr    r0
/* 0BC014 800C15B4 4E800020 */  blr     

cbForCancelSync:
/* 0BC018 800C15B8 7C0802A6 */  mflr    r0
/* 0BC01C 800C15BC 386D9310 */  addi    r3, r13, __DVDThreadQueue-_SDA_BASE_
/* 0BC020 800C15C0 90010004 */  stw     r0, 4(r1)
/* 0BC024 800C15C4 9421FFF8 */  stwu    r1, -8(r1)
/* 0BC028 800C15C8 4BFEC5A5 */  bl      OSWakeupThread
/* 0BC02C 800C15CC 8001000C */  lwz     r0, 0xc(r1)
/* 0BC030 800C15D0 38210008 */  addi    r1, r1, 8
/* 0BC034 800C15D4 7C0803A6 */  mtlr    r0
/* 0BC038 800C15D8 4E800020 */  blr     

glabel DVDGetCurrentDiskID
/* 0BC03C 800C15DC 3C608000 */  lis     r3, 0x8000
/* 0BC040 800C15E0 4E800020 */  blr     

glabel DVDCheckDisk
/* 0BC044 800C15E4 7C0802A6 */  mflr    r0
/* 0BC048 800C15E8 90010004 */  stw     r0, 4(r1)
/* 0BC04C 800C15EC 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0BC050 800C15F0 93E1000C */  stw     r31, 0xc(r1)
/* 0BC054 800C15F4 4BFE917D */  bl      OSDisableInterrupts
/* 0BC058 800C15F8 800D9330 */  lwz     r0, FatalErrorFlag-_SDA_BASE_(r13)
/* 0BC05C 800C15FC 2C000000 */  cmpwi   r0, 0
/* 0BC060 800C1600 4182000C */  beq     lbl_800C160C
/* 0BC064 800C1604 3880FFFF */  li      r4, -1
/* 0BC068 800C1608 48000048 */  b       lbl_800C1650
lbl_800C160C:
/* 0BC06C 800C160C 800D9328 */  lwz     r0, PausingFlag-_SDA_BASE_(r13)
/* 0BC070 800C1610 2C000000 */  cmpwi   r0, 0
/* 0BC074 800C1614 4182000C */  beq     lbl_800C1620
/* 0BC078 800C1618 38800008 */  li      r4, 8
/* 0BC07C 800C161C 48000034 */  b       lbl_800C1650
lbl_800C1620:
/* 0BC080 800C1620 80AD9318 */  lwz     r5, executing-_SDA_BASE_(r13)
/* 0BC084 800C1624 28050000 */  cmplwi  r5, 0
/* 0BC088 800C1628 4082000C */  bne     lbl_800C1634
/* 0BC08C 800C162C 38800000 */  li      r4, 0
/* 0BC090 800C1630 48000020 */  b       lbl_800C1650
lbl_800C1634:
/* 0BC094 800C1634 3C808014 */  lis     r4, DummyCommandBlock@ha
/* 0BC098 800C1638 380422E0 */  addi    r0, r4, DummyCommandBlock@l
/* 0BC09C 800C163C 7C050040 */  cmplw   r5, r0
/* 0BC0A0 800C1640 4082000C */  bne     lbl_800C164C
/* 0BC0A4 800C1644 38800000 */  li      r4, 0
/* 0BC0A8 800C1648 48000008 */  b       lbl_800C1650
lbl_800C164C:
/* 0BC0AC 800C164C 8085000C */  lwz     r4, 0xc(r5)
lbl_800C1650:
/* 0BC0B0 800C1650 38040001 */  addi    r0, r4, 1
/* 0BC0B4 800C1654 2800000C */  cmplwi  r0, 0xc
/* 0BC0B8 800C1658 41810068 */  bgt     lbl_800C16C0
/* 0BC0BC 800C165C 3C808010 */  lis     r4, jtbl_80100894@ha
/* 0BC0C0 800C1660 38840894 */  addi    r4, r4, jtbl_80100894@l
/* 0BC0C4 800C1664 5400103A */  slwi    r0, r0, 2
/* 0BC0C8 800C1668 7C04002E */  lwzx    r0, r4, r0
/* 0BC0CC 800C166C 7C0903A6 */  mtctr   r0
/* 0BC0D0 800C1670 4E800420 */  bctr    
glabel lbl_800C1674
/* 0BC0D4 800C1674 3BE00001 */  li      r31, 1
/* 0BC0D8 800C1678 48000048 */  b       lbl_800C16C0
glabel lbl_800C167C
/* 0BC0DC 800C167C 3BE00000 */  li      r31, 0
/* 0BC0E0 800C1680 48000040 */  b       lbl_800C16C0
glabel lbl_800C1684
/* 0BC0E4 800C1684 3C80CC00 */  lis     r4, 0xcc00
/* 0BC0E8 800C1688 38846000 */  addi    r4, r4, 0x6000
/* 0BC0EC 800C168C 80840004 */  lwz     r4, 4(r4)
/* 0BC0F0 800C1690 5480F7FF */  rlwinm. r0, r4, 0x1e, 0x1f, 0x1f
/* 0BC0F4 800C1694 4082000C */  bne     lbl_800C16A0
/* 0BC0F8 800C1698 548007FF */  clrlwi. r0, r4, 0x1f
/* 0BC0FC 800C169C 4182000C */  beq     lbl_800C16A8
lbl_800C16A0:
/* 0BC100 800C16A0 3BE00000 */  li      r31, 0
/* 0BC104 800C16A4 4800001C */  b       lbl_800C16C0
lbl_800C16A8:
/* 0BC108 800C16A8 800D9340 */  lwz     r0, ResumeFromHere-_SDA_BASE_(r13)
/* 0BC10C 800C16AC 28000000 */  cmplwi  r0, 0
/* 0BC110 800C16B0 4182000C */  beq     lbl_800C16BC
/* 0BC114 800C16B4 3BE00000 */  li      r31, 0
/* 0BC118 800C16B8 48000008 */  b       lbl_800C16C0
lbl_800C16BC:
/* 0BC11C 800C16BC 3BE00001 */  li      r31, 1
lbl_800C16C0:
/* 0BC120 800C16C0 4BFE90D9 */  bl      OSRestoreInterrupts
/* 0BC124 800C16C4 7FE3FB78 */  mr      r3, r31
/* 0BC128 800C16C8 80010014 */  lwz     r0, 0x14(r1)
/* 0BC12C 800C16CC 83E1000C */  lwz     r31, 0xc(r1)
/* 0BC130 800C16D0 38210010 */  addi    r1, r1, 0x10
/* 0BC134 800C16D4 7C0803A6 */  mtlr    r0
/* 0BC138 800C16D8 4E800020 */  blr     

glabel __DVDPrepareResetAsync
/* 0BC13C 800C16DC 7C0802A6 */  mflr    r0
/* 0BC140 800C16E0 90010004 */  stw     r0, 4(r1)
/* 0BC144 800C16E4 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0BC148 800C16E8 93E1001C */  stw     r31, 0x1c(r1)
/* 0BC14C 800C16EC 93C10018 */  stw     r30, 0x18(r1)
/* 0BC150 800C16F0 7C7E1B78 */  mr      r30, r3
/* 0BC154 800C16F4 93A10014 */  stw     r29, 0x14(r1)
/* 0BC158 800C16F8 4BFE9079 */  bl      OSDisableInterrupts
/* 0BC15C 800C16FC 7C7D1B78 */  mr      r29, r3
/* 0BC160 800C1700 48000131 */  bl      __DVDClearWaitingQueue
/* 0BC164 800C1704 800D9338 */  lwz     r0, Canceling-_SDA_BASE_(r13)
/* 0BC168 800C1708 28000000 */  cmplwi  r0, 0
/* 0BC16C 800C170C 4182000C */  beq     lbl_800C1718
/* 0BC170 800C1710 93CD933C */  stw     r30, CancelCallback-_SDA_BASE_(r13)
/* 0BC174 800C1714 480000C0 */  b       lbl_800C17D4
lbl_800C1718:
/* 0BC178 800C1718 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BC17C 800C171C 28030000 */  cmplwi  r3, 0
/* 0BC180 800C1720 4182000C */  beq     lbl_800C172C
/* 0BC184 800C1724 38000000 */  li      r0, 0
/* 0BC188 800C1728 90030028 */  stw     r0, 0x28(r3)
lbl_800C172C:
/* 0BC18C 800C172C 4BFE9045 */  bl      OSDisableInterrupts
/* 0BC190 800C1730 7C7F1B78 */  mr      r31, r3
/* 0BC194 800C1734 4BFE903D */  bl      OSDisableInterrupts
/* 0BC198 800C1738 800D9318 */  lwz     r0, executing-_SDA_BASE_(r13)
/* 0BC19C 800C173C 38800001 */  li      r4, 1
/* 0BC1A0 800C1740 908D9324 */  stw     r4, PauseFlag-_SDA_BASE_(r13)
/* 0BC1A4 800C1744 28000000 */  cmplwi  r0, 0
/* 0BC1A8 800C1748 40820008 */  bne     lbl_800C1750
/* 0BC1AC 800C174C 908D9328 */  stw     r4, PausingFlag-_SDA_BASE_(r13)
lbl_800C1750:
/* 0BC1B0 800C1750 4BFE9049 */  bl      OSRestoreInterrupts
/* 0BC1B4 800C1754 4800000C */  b       lbl_800C1760
lbl_800C1758:
/* 0BC1B8 800C1758 38800000 */  li      r4, 0
/* 0BC1BC 800C175C 4BFFFB35 */  bl      DVDCancelAsync
lbl_800C1760:
/* 0BC1C0 800C1760 48000171 */  bl      __DVDPopWaitingQueue
/* 0BC1C4 800C1764 28030000 */  cmplwi  r3, 0
/* 0BC1C8 800C1768 4082FFF0 */  bne     lbl_800C1758
/* 0BC1CC 800C176C 806D9318 */  lwz     r3, executing-_SDA_BASE_(r13)
/* 0BC1D0 800C1770 28030000 */  cmplwi  r3, 0
/* 0BC1D4 800C1774 41820010 */  beq     lbl_800C1784
/* 0BC1D8 800C1778 7FC4F378 */  mr      r4, r30
/* 0BC1DC 800C177C 4BFFFB15 */  bl      DVDCancelAsync
/* 0BC1E0 800C1780 48000020 */  b       lbl_800C17A0
lbl_800C1784:
/* 0BC1E4 800C1784 281E0000 */  cmplwi  r30, 0
/* 0BC1E8 800C1788 41820018 */  beq     lbl_800C17A0
/* 0BC1EC 800C178C 399E0000 */  addi    r12, r30, 0
/* 0BC1F0 800C1790 7D8803A6 */  mtlr    r12
/* 0BC1F4 800C1794 38600000 */  li      r3, 0
/* 0BC1F8 800C1798 38800000 */  li      r4, 0
/* 0BC1FC 800C179C 4E800021 */  blrl    
lbl_800C17A0:
/* 0BC200 800C17A0 4BFE8FD1 */  bl      OSDisableInterrupts
/* 0BC204 800C17A4 38800000 */  li      r4, 0
/* 0BC208 800C17A8 908D9324 */  stw     r4, PauseFlag-_SDA_BASE_(r13)
/* 0BC20C 800C17AC 7C7E1B78 */  mr      r30, r3
/* 0BC210 800C17B0 800D9328 */  lwz     r0, PausingFlag-_SDA_BASE_(r13)
/* 0BC214 800C17B4 2C000000 */  cmpwi   r0, 0
/* 0BC218 800C17B8 4182000C */  beq     lbl_800C17C4
/* 0BC21C 800C17BC 908D9328 */  stw     r4, PausingFlag-_SDA_BASE_(r13)
/* 0BC220 800C17C0 4BFFE515 */  bl      stateReady
lbl_800C17C4:
/* 0BC224 800C17C4 7FC3F378 */  mr      r3, r30
/* 0BC228 800C17C8 4BFE8FD1 */  bl      OSRestoreInterrupts
/* 0BC22C 800C17CC 7FE3FB78 */  mr      r3, r31
/* 0BC230 800C17D0 4BFE8FC9 */  bl      OSRestoreInterrupts
lbl_800C17D4:
/* 0BC234 800C17D4 7FA3EB78 */  mr      r3, r29
/* 0BC238 800C17D8 4BFE8FC1 */  bl      OSRestoreInterrupts
/* 0BC23C 800C17DC 80010024 */  lwz     r0, 0x24(r1)
/* 0BC240 800C17E0 83E1001C */  lwz     r31, 0x1c(r1)
/* 0BC244 800C17E4 83C10018 */  lwz     r30, 0x18(r1)
/* 0BC248 800C17E8 83A10014 */  lwz     r29, 0x14(r1)
/* 0BC24C 800C17EC 38210020 */  addi    r1, r1, 0x20
/* 0BC250 800C17F0 7C0803A6 */  mtlr    r0
/* 0BC254 800C17F4 4E800020 */  blr     

glabel __DVDTestAlarm
/* 0BC258 800C17F8 7C0802A6 */  mflr    r0
/* 0BC25C 800C17FC 3C808014 */  lis     r4, ResetAlarm@ha
/* 0BC260 800C1800 90010004 */  stw     r0, 4(r1)
/* 0BC264 800C1804 38042310 */  addi    r0, r4, ResetAlarm@l
/* 0BC268 800C1808 7C030040 */  cmplw   r3, r0
/* 0BC26C 800C180C 9421FFF8 */  stwu    r1, -8(r1)
/* 0BC270 800C1810 4082000C */  bne     lbl_800C181C
/* 0BC274 800C1814 38600001 */  li      r3, 1
/* 0BC278 800C1818 48000008 */  b       lbl_800C1820
lbl_800C181C:
/* 0BC27C 800C181C 4BFFC95D */  bl      __DVDLowTestAlarm
lbl_800C1820:
/* 0BC280 800C1820 8001000C */  lwz     r0, 0xc(r1)
/* 0BC284 800C1824 38210008 */  addi    r1, r1, 8
/* 0BC288 800C1828 7C0803A6 */  mtlr    r0
/* 0BC28C 800C182C 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FD7C8 80100748 0045 */
D_80100748:
    .asciz "<< Dolphin SDK - DVD\trelease build: Jul 23 2003 11:27:57 (0x2301) >>"

.balign 4

/* 000FD810 80100790 000A */
D_80100790:
    .asciz "load fst\n"

.balign 4

/* 000FD81C 8010079C 0034 */
D_8010079C:
    .asciz "DVDChangeDisk(): FST in the new disc is too big.   "

.balign 4

/* 000FD850 801007D0 0040 */
jtbl_801007D0:
    .long lbl_800C01FC
    .long lbl_800BFF70
    .long lbl_800C0010
    .long lbl_800C0034
    .long lbl_800BFF70
    .long lbl_800BFF44
    .long lbl_800C0054
    .long lbl_800C00B8
    .long lbl_800C00E4
    .long lbl_800C0118
    .long lbl_800C013C
    .long lbl_800C0160
    .long lbl_800C0184
    .long lbl_800C01A8
    .long lbl_800C01D0
    .long lbl_800C0044

.balign 4

/* 000FD890 80100810 000C */
ImmCommand:
    .long 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF

.balign 4

/* 000FD89C 8010081C 0041 */
D_8010081C:
    .asciz "DVDChangeDiskAsync(): You can't specify NULL to company name.  \n"

.balign 4

/* 000FD8E0 80100860 0034 */
jtbl_80100860:
    .long lbl_800C12E0
    .long lbl_800C12E0
    .long lbl_800C1300
    .long lbl_800C1344
    .long lbl_800C1390
    .long lbl_800C140C
    .long lbl_800C140C
    .long lbl_800C140C
    .long lbl_800C140C
    .long lbl_800C14E4
    .long lbl_800C14E4
    .long lbl_800C12E0
    .long lbl_800C140C

.balign 4

/* 000FD914 80100894 0034 */
jtbl_80100894:
    .long lbl_800C167C
    .long lbl_800C1684
    .long lbl_800C1674
    .long lbl_800C1674
    .long lbl_800C167C
    .long lbl_800C167C
    .long lbl_800C167C
    .long lbl_800C167C
    .long lbl_800C167C
    .long lbl_800C1684
    .long lbl_800C1674
    .long lbl_800C1674
    .long lbl_800C167C


.section .bss, "wa"

.balign 32

/* 0013F320 801422A0 0020 */
BB2:
    .skip 32

.balign 4

/* 0013F340 801422C0 0020 */
CurrDiskID:
    .skip 32

.balign 4

/* 0013F360 801422E0 0030 */
DummyCommandBlock:
    .skip 48

.balign 4

/* 0013F390 80142310 0028 */
ResetAlarm:
    .skip 40


.section .sdata, "wa"

.balign 8

/* 00100018 801457B8 0004 */
glabel __DVDVersion
    .long D_80100748

.balign 4

/* 0010001C 801457BC 0004 */
autoInvalidation:
    .long 0x00000001

.balign 4

/* 00100020 801457C0 0004 */
checkOptionalCommand:
    .long defaultOptionalCommandChecker

.balign 4

/* 00100024 801457C4 0006 */
D_801457C4:
    .asciz "dvd.c"

.balign 4

/* 0010002C 801457CC 0004 */
DmaCommand:
    .long 0xFFFFFFFF


.section .sbss, "wa"

.balign 8

/* 00100558 80145CF8 0004 */
executing:
    .skip 4

.balign 4

/* 0010055C 80145CFC 0004 */
IDShouldBe:
    .skip 4

.balign 4

/* 00100560 80145D00 0004 */
bootInfo:
    .skip 4

.balign 4

/* 00100564 80145D04 0004 */
PauseFlag:
    .skip 4

.balign 4

/* 00100568 80145D08 0004 */
PausingFlag:
    .skip 4

.balign 4

/* 0010056C 80145D0C 0004 */
AutoFinishing:
    .skip 4

.balign 4

/* 00100570 80145D10 0004 */
FatalErrorFlag:
    .skip 4

.balign 4

/* 00100574 80145D14 0004 */
CurrCommand:
    .skip 4

.balign 4

/* 00100578 80145D18 0004 */
Canceling:
    .skip 4

.balign 4

/* 0010057C 80145D1C 0004 */
CancelCallback:
    .skip 4

.balign 4

/* 00100580 80145D20 0004 */
ResumeFromHere:
    .skip 4

.balign 4

/* 00100584 80145D24 0004 */
CancelLastError:
    .skip 4

.balign 4

/* 00100588 80145D28 0004 */
LastError:
    .skip 4

.balign 4

/* 0010058C 80145D2C 0004 */
NumInternalRetry:
    .skip 4

.balign 4

/* 00100590 80145D30 0004 */
ResetRequired:
    .skip 4

.balign 4

/* 00100594 80145D34 0004 */
FirstTimeInBootrom:
    .skip 4

.balign 4

/* 00100598 80145D38 0004 */
DVDInitialized:
    .skip 4

.balign 4

/* 0010059C 80145D3C 0004 */
glabel LastState
    .skip 4

