# OSContext.c
.include "macros.inc"

.section .text, "ax"

.balign 4

__OSLoadFPUContext:
/* 0A425C 800A97FC A0A401A2 */  lhz     r5, 0x1a2(r4)
/* 0A4260 800A9800 54A507FF */  clrlwi. r5, r5, 0x1f
/* 0A4264 800A9804 41820118 */  beq     lbl_800A991C
/* 0A4268 800A9808 C8040190 */  lfd     f0, 0x190(r4)
/* 0A426C 800A980C FDFE058E */  mtfsf   0xff, f0
/* 0A4270 800A9810 7CB8E2A6 */  mfspr   r5, 0x398
/* 0A4274 800A9814 54A51FFF */  rlwinm. r5, r5, 3, 0x1f, 0x1f
/* 0A4278 800A9818 41820084 */  beq     lbl_800A989C
/* 0A427C 800A981C E00401C8 */  psq_l   f0, 456(r4), 0, qr0
/* 0A4280 800A9820 E02401D0 */  psq_l   f1, 464(r4), 0, qr0
/* 0A4284 800A9824 E04401D8 */  psq_l   f2, 472(r4), 0, qr0
/* 0A4288 800A9828 E06401E0 */  psq_l   f3, 480(r4), 0, qr0
/* 0A428C 800A982C E08401E8 */  psq_l   f4, 488(r4), 0, qr0
/* 0A4290 800A9830 E0A401F0 */  psq_l   f5, 496(r4), 0, qr0
/* 0A4294 800A9834 E0C401F8 */  psq_l   f6, 504(r4), 0, qr0
/* 0A4298 800A9838 E0E40200 */  psq_l   f7, 512(r4), 0, qr0
/* 0A429C 800A983C E1040208 */  psq_l   f8, 520(r4), 0, qr0
/* 0A42A0 800A9840 E1240210 */  psq_l   f9, 528(r4), 0, qr0
/* 0A42A4 800A9844 E1440218 */  psq_l   f10, 536(r4), 0, qr0
/* 0A42A8 800A9848 E1640220 */  psq_l   f11, 544(r4), 0, qr0
/* 0A42AC 800A984C E1840228 */  psq_l   f12, 552(r4), 0, qr0
/* 0A42B0 800A9850 E1A40230 */  psq_l   f13, 560(r4), 0, qr0
/* 0A42B4 800A9854 E1C40238 */  psq_l   f14, 568(r4), 0, qr0
/* 0A42B8 800A9858 E1E40240 */  psq_l   f15, 576(r4), 0, qr0
/* 0A42BC 800A985C E2040248 */  psq_l   f16, 584(r4), 0, qr0
/* 0A42C0 800A9860 E2240250 */  psq_l   f17, 592(r4), 0, qr0
/* 0A42C4 800A9864 E2440258 */  psq_l   f18, 600(r4), 0, qr0
/* 0A42C8 800A9868 E2640260 */  psq_l   f19, 608(r4), 0, qr0
/* 0A42CC 800A986C E2840268 */  psq_l   f20, 616(r4), 0, qr0
/* 0A42D0 800A9870 E2A40270 */  psq_l   f21, 624(r4), 0, qr0
/* 0A42D4 800A9874 E2C40278 */  psq_l   f22, 632(r4), 0, qr0
/* 0A42D8 800A9878 E2E40280 */  psq_l   f23, 640(r4), 0, qr0
/* 0A42DC 800A987C E3040288 */  psq_l   f24, 648(r4), 0, qr0
/* 0A42E0 800A9880 E3240290 */  psq_l   f25, 656(r4), 0, qr0
/* 0A42E4 800A9884 E3440298 */  psq_l   f26, 664(r4), 0, qr0
/* 0A42E8 800A9888 E36402A0 */  psq_l   f27, 672(r4), 0, qr0
/* 0A42EC 800A988C E38402A8 */  psq_l   f28, 680(r4), 0, qr0
/* 0A42F0 800A9890 E3A402B0 */  psq_l   f29, 688(r4), 0, qr0
/* 0A42F4 800A9894 E3C402B8 */  psq_l   f30, 696(r4), 0, qr0
/* 0A42F8 800A9898 E3E402C0 */  psq_l   f31, 704(r4), 0, qr0
lbl_800A989C:
/* 0A42FC 800A989C C8040090 */  lfd     f0, 0x90(r4)
/* 0A4300 800A98A0 C8240098 */  lfd     f1, 0x98(r4)
/* 0A4304 800A98A4 C84400A0 */  lfd     f2, 0xa0(r4)
/* 0A4308 800A98A8 C86400A8 */  lfd     f3, 0xa8(r4)
/* 0A430C 800A98AC C88400B0 */  lfd     f4, 0xb0(r4)
/* 0A4310 800A98B0 C8A400B8 */  lfd     f5, 0xb8(r4)
/* 0A4314 800A98B4 C8C400C0 */  lfd     f6, 0xc0(r4)
/* 0A4318 800A98B8 C8E400C8 */  lfd     f7, 0xc8(r4)
/* 0A431C 800A98BC C90400D0 */  lfd     f8, 0xd0(r4)
/* 0A4320 800A98C0 C92400D8 */  lfd     f9, 0xd8(r4)
/* 0A4324 800A98C4 C94400E0 */  lfd     f10, 0xe0(r4)
/* 0A4328 800A98C8 C96400E8 */  lfd     f11, 0xe8(r4)
/* 0A432C 800A98CC C98400F0 */  lfd     f12, 0xf0(r4)
/* 0A4330 800A98D0 C9A400F8 */  lfd     f13, 0xf8(r4)
/* 0A4334 800A98D4 C9C40100 */  lfd     f14, 0x100(r4)
/* 0A4338 800A98D8 C9E40108 */  lfd     f15, 0x108(r4)
/* 0A433C 800A98DC CA040110 */  lfd     f16, 0x110(r4)
/* 0A4340 800A98E0 CA240118 */  lfd     f17, 0x118(r4)
/* 0A4344 800A98E4 CA440120 */  lfd     f18, 0x120(r4)
/* 0A4348 800A98E8 CA640128 */  lfd     f19, 0x128(r4)
/* 0A434C 800A98EC CA840130 */  lfd     f20, 0x130(r4)
/* 0A4350 800A98F0 CAA40138 */  lfd     f21, 0x138(r4)
/* 0A4354 800A98F4 CAC40140 */  lfd     f22, 0x140(r4)
/* 0A4358 800A98F8 CAE40148 */  lfd     f23, 0x148(r4)
/* 0A435C 800A98FC CB040150 */  lfd     f24, 0x150(r4)
/* 0A4360 800A9900 CB240158 */  lfd     f25, 0x158(r4)
/* 0A4364 800A9904 CB440160 */  lfd     f26, 0x160(r4)
/* 0A4368 800A9908 CB640168 */  lfd     f27, 0x168(r4)
/* 0A436C 800A990C CB840170 */  lfd     f28, 0x170(r4)
/* 0A4370 800A9910 CBA40178 */  lfd     f29, 0x178(r4)
/* 0A4374 800A9914 CBC40180 */  lfd     f30, 0x180(r4)
/* 0A4378 800A9918 CBE40188 */  lfd     f31, 0x188(r4)
lbl_800A991C:
/* 0A437C 800A991C 4E800020 */  blr     

__OSSaveFPUContext:
/* 0A4380 800A9920 A06501A2 */  lhz     r3, 0x1a2(r5)
/* 0A4384 800A9924 60630001 */  ori     r3, r3, 1
/* 0A4388 800A9928 B06501A2 */  sth     r3, 0x1a2(r5)
/* 0A438C 800A992C D8050090 */  stfd    f0, 0x90(r5)
/* 0A4390 800A9930 D8250098 */  stfd    f1, 0x98(r5)
/* 0A4394 800A9934 D84500A0 */  stfd    f2, 0xa0(r5)
/* 0A4398 800A9938 D86500A8 */  stfd    f3, 0xa8(r5)
/* 0A439C 800A993C D88500B0 */  stfd    f4, 0xb0(r5)
/* 0A43A0 800A9940 D8A500B8 */  stfd    f5, 0xb8(r5)
/* 0A43A4 800A9944 D8C500C0 */  stfd    f6, 0xc0(r5)
/* 0A43A8 800A9948 D8E500C8 */  stfd    f7, 0xc8(r5)
/* 0A43AC 800A994C D90500D0 */  stfd    f8, 0xd0(r5)
/* 0A43B0 800A9950 D92500D8 */  stfd    f9, 0xd8(r5)
/* 0A43B4 800A9954 D94500E0 */  stfd    f10, 0xe0(r5)
/* 0A43B8 800A9958 D96500E8 */  stfd    f11, 0xe8(r5)
/* 0A43BC 800A995C D98500F0 */  stfd    f12, 0xf0(r5)
/* 0A43C0 800A9960 D9A500F8 */  stfd    f13, 0xf8(r5)
/* 0A43C4 800A9964 D9C50100 */  stfd    f14, 0x100(r5)
/* 0A43C8 800A9968 D9E50108 */  stfd    f15, 0x108(r5)
/* 0A43CC 800A996C DA050110 */  stfd    f16, 0x110(r5)
/* 0A43D0 800A9970 DA250118 */  stfd    f17, 0x118(r5)
/* 0A43D4 800A9974 DA450120 */  stfd    f18, 0x120(r5)
/* 0A43D8 800A9978 DA650128 */  stfd    f19, 0x128(r5)
/* 0A43DC 800A997C DA850130 */  stfd    f20, 0x130(r5)
/* 0A43E0 800A9980 DAA50138 */  stfd    f21, 0x138(r5)
/* 0A43E4 800A9984 DAC50140 */  stfd    f22, 0x140(r5)
/* 0A43E8 800A9988 DAE50148 */  stfd    f23, 0x148(r5)
/* 0A43EC 800A998C DB050150 */  stfd    f24, 0x150(r5)
/* 0A43F0 800A9990 DB250158 */  stfd    f25, 0x158(r5)
/* 0A43F4 800A9994 DB450160 */  stfd    f26, 0x160(r5)
/* 0A43F8 800A9998 DB650168 */  stfd    f27, 0x168(r5)
/* 0A43FC 800A999C DB850170 */  stfd    f28, 0x170(r5)
/* 0A4400 800A99A0 DBA50178 */  stfd    f29, 0x178(r5)
/* 0A4404 800A99A4 DBC50180 */  stfd    f30, 0x180(r5)
/* 0A4408 800A99A8 DBE50188 */  stfd    f31, 0x188(r5)
/* 0A440C 800A99AC FC00048E */  mffs    f0
/* 0A4410 800A99B0 D8050190 */  stfd    f0, 0x190(r5)
/* 0A4414 800A99B4 C8050090 */  lfd     f0, 0x90(r5)
/* 0A4418 800A99B8 7C78E2A6 */  mfspr   r3, 0x398
/* 0A441C 800A99BC 54631FFF */  rlwinm. r3, r3, 3, 0x1f, 0x1f
/* 0A4420 800A99C0 41820084 */  beq     lbl_800A9A44
/* 0A4424 800A99C4 F00501C8 */  psq_st  f0, 456(r5), 0, qr0
/* 0A4428 800A99C8 F02501D0 */  psq_st  f1, 464(r5), 0, qr0
/* 0A442C 800A99CC F04501D8 */  psq_st  f2, 472(r5), 0, qr0
/* 0A4430 800A99D0 F06501E0 */  psq_st  f3, 480(r5), 0, qr0
/* 0A4434 800A99D4 F08501E8 */  psq_st  f4, 488(r5), 0, qr0
/* 0A4438 800A99D8 F0A501F0 */  psq_st  f5, 496(r5), 0, qr0
/* 0A443C 800A99DC F0C501F8 */  psq_st  f6, 504(r5), 0, qr0
/* 0A4440 800A99E0 F0E50200 */  psq_st  f7, 512(r5), 0, qr0
/* 0A4444 800A99E4 F1050208 */  psq_st  f8, 520(r5), 0, qr0
/* 0A4448 800A99E8 F1250210 */  psq_st  f9, 528(r5), 0, qr0
/* 0A444C 800A99EC F1450218 */  psq_st  f10, 536(r5), 0, qr0
/* 0A4450 800A99F0 F1650220 */  psq_st  f11, 544(r5), 0, qr0
/* 0A4454 800A99F4 F1850228 */  psq_st  f12, 552(r5), 0, qr0
/* 0A4458 800A99F8 F1A50230 */  psq_st  f13, 560(r5), 0, qr0
/* 0A445C 800A99FC F1C50238 */  psq_st  f14, 568(r5), 0, qr0
/* 0A4460 800A9A00 F1E50240 */  psq_st  f15, 576(r5), 0, qr0
/* 0A4464 800A9A04 F2050248 */  psq_st  f16, 584(r5), 0, qr0
/* 0A4468 800A9A08 F2250250 */  psq_st  f17, 592(r5), 0, qr0
/* 0A446C 800A9A0C F2450258 */  psq_st  f18, 600(r5), 0, qr0
/* 0A4470 800A9A10 F2650260 */  psq_st  f19, 608(r5), 0, qr0
/* 0A4474 800A9A14 F2850268 */  psq_st  f20, 616(r5), 0, qr0
/* 0A4478 800A9A18 F2A50270 */  psq_st  f21, 624(r5), 0, qr0
/* 0A447C 800A9A1C F2C50278 */  psq_st  f22, 632(r5), 0, qr0
/* 0A4480 800A9A20 F2E50280 */  psq_st  f23, 640(r5), 0, qr0
/* 0A4484 800A9A24 F3050288 */  psq_st  f24, 648(r5), 0, qr0
/* 0A4488 800A9A28 F3250290 */  psq_st  f25, 656(r5), 0, qr0
/* 0A448C 800A9A2C F3450298 */  psq_st  f26, 664(r5), 0, qr0
/* 0A4490 800A9A30 F36502A0 */  psq_st  f27, 672(r5), 0, qr0
/* 0A4494 800A9A34 F38502A8 */  psq_st  f28, 680(r5), 0, qr0
/* 0A4498 800A9A38 F3A502B0 */  psq_st  f29, 688(r5), 0, qr0
/* 0A449C 800A9A3C F3C502B8 */  psq_st  f30, 696(r5), 0, qr0
/* 0A44A0 800A9A40 F3E502C0 */  psq_st  f31, 704(r5), 0, qr0
lbl_800A9A44:
/* 0A44A4 800A9A44 4E800020 */  blr     

glabel OSSaveFPUContext
/* 0A44A8 800A9A48 38A30000 */  addi    r5, r3, 0
/* 0A44AC 800A9A4C 4BFFFED4 */  b       __OSSaveFPUContext

glabel OSSetCurrentContext
/* 0A44B0 800A9A50 3C808000 */  lis     r4, 0x8000
/* 0A44B4 800A9A54 906400D4 */  stw     r3, 0xd4(r4)
/* 0A44B8 800A9A58 546500BE */  clrlwi  r5, r3, 2
/* 0A44BC 800A9A5C 90A400C0 */  stw     r5, 0xc0(r4)
/* 0A44C0 800A9A60 80A400D8 */  lwz     r5, 0xd8(r4)
/* 0A44C4 800A9A64 7C051800 */  cmpw    r5, r3
/* 0A44C8 800A9A68 40820020 */  bne     lbl_800A9A88
/* 0A44CC 800A9A6C 80C3019C */  lwz     r6, 0x19c(r3)
/* 0A44D0 800A9A70 60C62000 */  ori     r6, r6, 0x2000
/* 0A44D4 800A9A74 90C3019C */  stw     r6, 0x19c(r3)
/* 0A44D8 800A9A78 7CC000A6 */  mfmsr   r6
/* 0A44DC 800A9A7C 60C60002 */  ori     r6, r6, 2
/* 0A44E0 800A9A80 7CC00124 */  mtmsr   r6
/* 0A44E4 800A9A84 4E800020 */  blr     
lbl_800A9A88:
/* 0A44E8 800A9A88 80C3019C */  lwz     r6, 0x19c(r3)
/* 0A44EC 800A9A8C 54C604E2 */  rlwinm  r6, r6, 0, 0x13, 0x11
/* 0A44F0 800A9A90 90C3019C */  stw     r6, 0x19c(r3)
/* 0A44F4 800A9A94 7CC000A6 */  mfmsr   r6
/* 0A44F8 800A9A98 54C604E2 */  rlwinm  r6, r6, 0, 0x13, 0x11
/* 0A44FC 800A9A9C 60C60002 */  ori     r6, r6, 2
/* 0A4500 800A9AA0 7CC00124 */  mtmsr   r6
/* 0A4504 800A9AA4 4C00012C */  isync   
/* 0A4508 800A9AA8 4E800020 */  blr     

glabel OSGetCurrentContext
/* 0A450C 800A9AAC 3C608000 */  lis     r3, 0x8000
/* 0A4510 800A9AB0 806300D4 */  lwz     r3, 0xd4(r3)
/* 0A4514 800A9AB4 4E800020 */  blr     

glabel OSSaveContext
/* 0A4518 800A9AB8 BDA30034 */  stmw    r13, 0x34(r3)
/* 0A451C 800A9ABC 7C11E2A6 */  mfspr   r0, 0x391
/* 0A4520 800A9AC0 900301A8 */  stw     r0, 0x1a8(r3)
/* 0A4524 800A9AC4 7C12E2A6 */  mfspr   r0, 0x392
/* 0A4528 800A9AC8 900301AC */  stw     r0, 0x1ac(r3)
/* 0A452C 800A9ACC 7C13E2A6 */  mfspr   r0, 0x393
/* 0A4530 800A9AD0 900301B0 */  stw     r0, 0x1b0(r3)
/* 0A4534 800A9AD4 7C14E2A6 */  mfspr   r0, 0x394
/* 0A4538 800A9AD8 900301B4 */  stw     r0, 0x1b4(r3)
/* 0A453C 800A9ADC 7C15E2A6 */  mfspr   r0, 0x395
/* 0A4540 800A9AE0 900301B8 */  stw     r0, 0x1b8(r3)
/* 0A4544 800A9AE4 7C16E2A6 */  mfspr   r0, 0x396
/* 0A4548 800A9AE8 900301BC */  stw     r0, 0x1bc(r3)
/* 0A454C 800A9AEC 7C17E2A6 */  mfspr   r0, 0x397
/* 0A4550 800A9AF0 900301C0 */  stw     r0, 0x1c0(r3)
/* 0A4554 800A9AF4 7C000026 */  mfcr    r0
/* 0A4558 800A9AF8 90030080 */  stw     r0, 0x80(r3)
/* 0A455C 800A9AFC 7C0802A6 */  mflr    r0
/* 0A4560 800A9B00 90030084 */  stw     r0, 0x84(r3)
/* 0A4564 800A9B04 90030198 */  stw     r0, 0x198(r3)
/* 0A4568 800A9B08 7C0000A6 */  mfmsr   r0
/* 0A456C 800A9B0C 9003019C */  stw     r0, 0x19c(r3)
/* 0A4570 800A9B10 7C0902A6 */  mfctr   r0
/* 0A4574 800A9B14 90030088 */  stw     r0, 0x88(r3)
/* 0A4578 800A9B18 7C0102A6 */  mfxer   r0
/* 0A457C 800A9B1C 9003008C */  stw     r0, 0x8c(r3)
/* 0A4580 800A9B20 90230004 */  stw     r1, 4(r3)
/* 0A4584 800A9B24 90430008 */  stw     r2, 8(r3)
/* 0A4588 800A9B28 38000001 */  li      r0, 1
/* 0A458C 800A9B2C 9003000C */  stw     r0, 0xc(r3)
/* 0A4590 800A9B30 38600000 */  li      r3, 0
/* 0A4594 800A9B34 4E800020 */  blr     

glabel OSLoadContext
/* 0A4598 800A9B38 3C80800B */  lis     r4, OSDisableInterrupts@ha
/* 0A459C 800A9B3C 80C30198 */  lwz     r6, 0x198(r3)
/* 0A45A0 800A9B40 38A4A770 */  addi    r5, r4, OSDisableInterrupts@l
/* 0A45A4 800A9B44 7C062840 */  cmplw   r6, r5
/* 0A45A8 800A9B48 40810018 */  ble     lbl_800A9B60
/* 0A45AC 800A9B4C 3C80800B */  lis     r4, __RAS_OSDisableInterrupts_end@ha
/* 0A45B0 800A9B50 3804A77C */  addi    r0, r4, __RAS_OSDisableInterrupts_end@l
/* 0A45B4 800A9B54 7C060040 */  cmplw   r6, r0
/* 0A45B8 800A9B58 40800008 */  bge     lbl_800A9B60
/* 0A45BC 800A9B5C 90A30198 */  stw     r5, 0x198(r3)
lbl_800A9B60:
/* 0A45C0 800A9B60 80030000 */  lwz     r0, 0(r3)
/* 0A45C4 800A9B64 80230004 */  lwz     r1, 4(r3)
/* 0A45C8 800A9B68 80430008 */  lwz     r2, 8(r3)
/* 0A45CC 800A9B6C A08301A2 */  lhz     r4, 0x1a2(r3)
/* 0A45D0 800A9B70 548507BD */  rlwinm. r5, r4, 0, 0x1e, 0x1e
/* 0A45D4 800A9B74 41820014 */  beq     lbl_800A9B88
/* 0A45D8 800A9B78 548407FA */  rlwinm  r4, r4, 0, 0x1f, 0x1d
/* 0A45DC 800A9B7C B08301A2 */  sth     r4, 0x1a2(r3)
/* 0A45E0 800A9B80 B8A30014 */  lmw     r5, 0x14(r3)
/* 0A45E4 800A9B84 48000008 */  b       lbl_800A9B8C
lbl_800A9B88:
/* 0A45E8 800A9B88 B9A30034 */  lmw     r13, 0x34(r3)
lbl_800A9B8C:
/* 0A45EC 800A9B8C 808301A8 */  lwz     r4, 0x1a8(r3)
/* 0A45F0 800A9B90 7C91E3A6 */  mtspr   0x391, r4
/* 0A45F4 800A9B94 808301AC */  lwz     r4, 0x1ac(r3)
/* 0A45F8 800A9B98 7C92E3A6 */  mtspr   0x392, r4
/* 0A45FC 800A9B9C 808301B0 */  lwz     r4, 0x1b0(r3)
/* 0A4600 800A9BA0 7C93E3A6 */  mtspr   0x393, r4
/* 0A4604 800A9BA4 808301B4 */  lwz     r4, 0x1b4(r3)
/* 0A4608 800A9BA8 7C94E3A6 */  mtspr   0x394, r4
/* 0A460C 800A9BAC 808301B8 */  lwz     r4, 0x1b8(r3)
/* 0A4610 800A9BB0 7C95E3A6 */  mtspr   0x395, r4
/* 0A4614 800A9BB4 808301BC */  lwz     r4, 0x1bc(r3)
/* 0A4618 800A9BB8 7C96E3A6 */  mtspr   0x396, r4
/* 0A461C 800A9BBC 808301C0 */  lwz     r4, 0x1c0(r3)
/* 0A4620 800A9BC0 7C97E3A6 */  mtspr   0x397, r4
/* 0A4624 800A9BC4 80830080 */  lwz     r4, 0x80(r3)
/* 0A4628 800A9BC8 7C8FF120 */  mtcrf   0xff, r4
/* 0A462C 800A9BCC 80830084 */  lwz     r4, 0x84(r3)
/* 0A4630 800A9BD0 7C8803A6 */  mtlr    r4
/* 0A4634 800A9BD4 80830088 */  lwz     r4, 0x88(r3)
/* 0A4638 800A9BD8 7C8903A6 */  mtctr   r4
/* 0A463C 800A9BDC 8083008C */  lwz     r4, 0x8c(r3)
/* 0A4640 800A9BE0 7C8103A6 */  mtxer   r4
/* 0A4644 800A9BE4 7C8000A6 */  mfmsr   r4
/* 0A4648 800A9BE8 5484045E */  rlwinm  r4, r4, 0, 0x11, 0xf
/* 0A464C 800A9BEC 548407FA */  rlwinm  r4, r4, 0, 0x1f, 0x1d
/* 0A4650 800A9BF0 7C800124 */  mtmsr   r4
/* 0A4654 800A9BF4 80830198 */  lwz     r4, 0x198(r3)
/* 0A4658 800A9BF8 7C9A03A6 */  mtspr   0x1a, r4
/* 0A465C 800A9BFC 8083019C */  lwz     r4, 0x19c(r3)
/* 0A4660 800A9C00 7C9B03A6 */  mtspr   0x1b, r4
/* 0A4664 800A9C04 80830010 */  lwz     r4, 0x10(r3)
/* 0A4668 800A9C08 8063000C */  lwz     r3, 0xc(r3)
/* 0A466C 800A9C0C 4C000064 */  rfi     

glabel OSGetStackPointer
/* 0A4670 800A9C10 7C230B78 */  mr      r3, r1
/* 0A4674 800A9C14 4E800020 */  blr     

glabel OSClearContext
/* 0A4678 800A9C18 38A00000 */  li      r5, 0
/* 0A467C 800A9C1C B0A301A0 */  sth     r5, 0x1a0(r3)
/* 0A4680 800A9C20 3C808000 */  lis     r4, 0x8000
/* 0A4684 800A9C24 B0A301A2 */  sth     r5, 0x1a2(r3)
/* 0A4688 800A9C28 800400D8 */  lwz     r0, 0xd8(r4)
/* 0A468C 800A9C2C 7C030040 */  cmplw   r3, r0
/* 0A4690 800A9C30 40820008 */  bne     lbl_800A9C38
/* 0A4694 800A9C34 90A400D8 */  stw     r5, 0xd8(r4)
lbl_800A9C38:
/* 0A4698 800A9C38 4E800020 */  blr     

glabel OSInitContext
/* 0A469C 800A9C3C 90830198 */  stw     r4, 0x198(r3)
/* 0A46A0 800A9C40 90A30004 */  stw     r5, 4(r3)
/* 0A46A4 800A9C44 39600000 */  li      r11, 0
/* 0A46A8 800A9C48 616B9032 */  ori     r11, r11, 0x9032
/* 0A46AC 800A9C4C 9163019C */  stw     r11, 0x19c(r3)
/* 0A46B0 800A9C50 38000000 */  li      r0, 0
/* 0A46B4 800A9C54 90030080 */  stw     r0, 0x80(r3)
/* 0A46B8 800A9C58 9003008C */  stw     r0, 0x8c(r3)
/* 0A46BC 800A9C5C 90430008 */  stw     r2, 8(r3)
/* 0A46C0 800A9C60 91A30034 */  stw     r13, 0x34(r3)
/* 0A46C4 800A9C64 9003000C */  stw     r0, 0xc(r3)
/* 0A46C8 800A9C68 90030010 */  stw     r0, 0x10(r3)
/* 0A46CC 800A9C6C 90030014 */  stw     r0, 0x14(r3)
/* 0A46D0 800A9C70 90030018 */  stw     r0, 0x18(r3)
/* 0A46D4 800A9C74 9003001C */  stw     r0, 0x1c(r3)
/* 0A46D8 800A9C78 90030020 */  stw     r0, 0x20(r3)
/* 0A46DC 800A9C7C 90030024 */  stw     r0, 0x24(r3)
/* 0A46E0 800A9C80 90030028 */  stw     r0, 0x28(r3)
/* 0A46E4 800A9C84 9003002C */  stw     r0, 0x2c(r3)
/* 0A46E8 800A9C88 90030030 */  stw     r0, 0x30(r3)
/* 0A46EC 800A9C8C 90030038 */  stw     r0, 0x38(r3)
/* 0A46F0 800A9C90 9003003C */  stw     r0, 0x3c(r3)
/* 0A46F4 800A9C94 90030040 */  stw     r0, 0x40(r3)
/* 0A46F8 800A9C98 90030044 */  stw     r0, 0x44(r3)
/* 0A46FC 800A9C9C 90030048 */  stw     r0, 0x48(r3)
/* 0A4700 800A9CA0 9003004C */  stw     r0, 0x4c(r3)
/* 0A4704 800A9CA4 90030050 */  stw     r0, 0x50(r3)
/* 0A4708 800A9CA8 90030054 */  stw     r0, 0x54(r3)
/* 0A470C 800A9CAC 90030058 */  stw     r0, 0x58(r3)
/* 0A4710 800A9CB0 9003005C */  stw     r0, 0x5c(r3)
/* 0A4714 800A9CB4 90030060 */  stw     r0, 0x60(r3)
/* 0A4718 800A9CB8 90030064 */  stw     r0, 0x64(r3)
/* 0A471C 800A9CBC 90030068 */  stw     r0, 0x68(r3)
/* 0A4720 800A9CC0 9003006C */  stw     r0, 0x6c(r3)
/* 0A4724 800A9CC4 90030070 */  stw     r0, 0x70(r3)
/* 0A4728 800A9CC8 90030074 */  stw     r0, 0x74(r3)
/* 0A472C 800A9CCC 90030078 */  stw     r0, 0x78(r3)
/* 0A4730 800A9CD0 9003007C */  stw     r0, 0x7c(r3)
/* 0A4734 800A9CD4 900301A4 */  stw     r0, 0x1a4(r3)
/* 0A4738 800A9CD8 900301A8 */  stw     r0, 0x1a8(r3)
/* 0A473C 800A9CDC 900301AC */  stw     r0, 0x1ac(r3)
/* 0A4740 800A9CE0 900301B0 */  stw     r0, 0x1b0(r3)
/* 0A4744 800A9CE4 900301B4 */  stw     r0, 0x1b4(r3)
/* 0A4748 800A9CE8 900301B8 */  stw     r0, 0x1b8(r3)
/* 0A474C 800A9CEC 900301BC */  stw     r0, 0x1bc(r3)
/* 0A4750 800A9CF0 900301C0 */  stw     r0, 0x1c0(r3)
/* 0A4754 800A9CF4 4BFFFF24 */  b       OSClearContext

glabel OSDumpContext
/* 0A4758 800A9CF8 7C0802A6 */  mflr    r0
/* 0A475C 800A9CFC 90010004 */  stw     r0, 4(r1)
/* 0A4760 800A9D00 9421FD08 */  stwu    r1, -0x2f8(r1)
/* 0A4764 800A9D04 BF2102DC */  stmw    r25, 0x2dc(r1)
/* 0A4768 800A9D08 7C7C1B78 */  mr      r28, r3
/* 0A476C 800A9D0C 3C608010 */  lis     r3, D_800FEEC8@ha
/* 0A4770 800A9D10 4CC63182 */  crclr   6
/* 0A4774 800A9D14 3BE3EEC8 */  addi    r31, r3, D_800FEEC8@l
/* 0A4778 800A9D18 7FE3FB78 */  mr      r3, r31
/* 0A477C 800A9D1C 7F84E378 */  mr      r4, r28
/* 0A4780 800A9D20 4800034D */  bl      OSReport
/* 0A4784 800A9D24 3B200000 */  li      r25, 0
/* 0A4788 800A9D28 5720103A */  slwi    r0, r25, 2
/* 0A478C 800A9D2C 7F7C0214 */  add     r27, r28, r0
/* 0A4790 800A9D30 48000004 */  b       lbl_800A9D34
lbl_800A9D34:
/* 0A4794 800A9D34 48000004 */  b       lbl_800A9D38
lbl_800A9D38:
/* 0A4798 800A9D38 48000004 */  b       lbl_800A9D3C
lbl_800A9D3C:
/* 0A479C 800A9D3C 811B0040 */  lwz     r8, 0x40(r27)
/* 0A47A0 800A9D40 7F24CB78 */  mr      r4, r25
/* 0A47A4 800A9D44 80BB0000 */  lwz     r5, 0(r27)
/* 0A47A8 800A9D48 387F0044 */  addi    r3, r31, 0x44
/* 0A47AC 800A9D4C 4CC63182 */  crclr   6
/* 0A47B0 800A9D50 7CA62B78 */  mr      r6, r5
/* 0A47B4 800A9D54 7D094378 */  mr      r9, r8
/* 0A47B8 800A9D58 38F90010 */  addi    r7, r25, 0x10
/* 0A47BC 800A9D5C 48000311 */  bl      OSReport
/* 0A47C0 800A9D60 3B7B0004 */  addi    r27, r27, 4
/* 0A47C4 800A9D64 3B390001 */  addi    r25, r25, 1
/* 0A47C8 800A9D68 28190010 */  cmplwi  r25, 0x10
/* 0A47CC 800A9D6C 4180FFD0 */  blt     lbl_800A9D3C
/* 0A47D0 800A9D70 809C0084 */  lwz     r4, 0x84(r28)
/* 0A47D4 800A9D74 387F0074 */  addi    r3, r31, 0x74
/* 0A47D8 800A9D78 80BC0080 */  lwz     r5, 0x80(r28)
/* 0A47DC 800A9D7C 4CC63182 */  crclr   6
/* 0A47E0 800A9D80 480002ED */  bl      OSReport
/* 0A47E4 800A9D84 809C0198 */  lwz     r4, 0x198(r28)
/* 0A47E8 800A9D88 387F00A4 */  addi    r3, r31, 0xa4
/* 0A47EC 800A9D8C 80BC019C */  lwz     r5, 0x19c(r28)
/* 0A47F0 800A9D90 4CC63182 */  crclr   6
/* 0A47F4 800A9D94 480002D9 */  bl      OSReport
/* 0A47F8 800A9D98 387F00D4 */  addi    r3, r31, 0xd4
/* 0A47FC 800A9D9C 4CC63182 */  crclr   6
/* 0A4800 800A9DA0 480002CD */  bl      OSReport
/* 0A4804 800A9DA4 3B200000 */  li      r25, 0
/* 0A4808 800A9DA8 5720103A */  slwi    r0, r25, 2
/* 0A480C 800A9DAC 7F7C0214 */  add     r27, r28, r0
/* 0A4810 800A9DB0 48000004 */  b       lbl_800A9DB4
lbl_800A9DB4:
/* 0A4814 800A9DB4 48000004 */  b       lbl_800A9DB8
lbl_800A9DB8:
/* 0A4818 800A9DB8 48000004 */  b       lbl_800A9DBC
lbl_800A9DBC:
/* 0A481C 800A9DBC 80BB01A4 */  lwz     r5, 0x1a4(r27)
/* 0A4820 800A9DC0 7F24CB78 */  mr      r4, r25
/* 0A4824 800A9DC4 80FB01B4 */  lwz     r7, 0x1b4(r27)
/* 0A4828 800A9DC8 387F00E8 */  addi    r3, r31, 0xe8
/* 0A482C 800A9DCC 38D90004 */  addi    r6, r25, 4
/* 0A4830 800A9DD0 4CC63182 */  crclr   6
/* 0A4834 800A9DD4 48000299 */  bl      OSReport
/* 0A4838 800A9DD8 3B7B0004 */  addi    r27, r27, 4
/* 0A483C 800A9DDC 3B390001 */  addi    r25, r25, 1
/* 0A4840 800A9DE0 28190004 */  cmplwi  r25, 4
/* 0A4844 800A9DE4 4180FFD8 */  blt     lbl_800A9DBC
/* 0A4848 800A9DE8 A01C01A2 */  lhz     r0, 0x1a2(r28)
/* 0A484C 800A9DEC 540007FE */  clrlwi  r0, r0, 0x1f
/* 0A4850 800A9DF0 28000000 */  cmplwi  r0, 0
/* 0A4854 800A9DF4 4182013C */  beq     lbl_800A9F30
/* 0A4858 800A9DF8 48000979 */  bl      OSDisableInterrupts
/* 0A485C 800A9DFC 3CC08000 */  lis     r6, 0x8000
/* 0A4860 800A9E00 800600D4 */  lwz     r0, 0xd4(r6)
/* 0A4864 800A9E04 38A00000 */  li      r5, 0
/* 0A4868 800A9E08 38810010 */  addi    r4, r1, 0x10
/* 0A486C 800A9E0C B0A101B0 */  sth     r5, 0x1b0(r1)
/* 0A4870 800A9E10 7C1E0378 */  mr      r30, r0
/* 0A4874 800A9E14 7C7D1B78 */  mr      r29, r3
/* 0A4878 800A9E18 B0A101B2 */  sth     r5, 0x1b2(r1)
/* 0A487C 800A9E1C 800600D8 */  lwz     r0, 0xd8(r6)
/* 0A4880 800A9E20 7C040040 */  cmplw   r4, r0
/* 0A4884 800A9E24 40820008 */  bne     lbl_800A9E2C
/* 0A4888 800A9E28 90A600D8 */  stw     r5, 0xd8(r6)
lbl_800A9E2C:
/* 0A488C 800A9E2C 38610010 */  addi    r3, r1, 0x10
/* 0A4890 800A9E30 4BFFFC21 */  bl      OSSetCurrentContext
/* 0A4894 800A9E34 387F010C */  addi    r3, r31, 0x10c
/* 0A4898 800A9E38 4CC63182 */  crclr   6
/* 0A489C 800A9E3C 48000231 */  bl      OSReport
/* 0A48A0 800A9E40 3B200000 */  li      r25, 0
/* 0A48A4 800A9E44 57201838 */  slwi    r0, r25, 3
/* 0A48A8 800A9E48 7F5C0214 */  add     r26, r28, r0
/* 0A48AC 800A9E4C 48000004 */  b       lbl_800A9E50
lbl_800A9E50:
/* 0A48B0 800A9E50 48000004 */  b       lbl_800A9E54
lbl_800A9E54:
/* 0A48B4 800A9E54 48000004 */  b       lbl_800A9E58
lbl_800A9E58:
/* 0A48B8 800A9E58 C83A0098 */  lfd     f1, 0x98(r26)
/* 0A48BC 800A9E5C 4802FC05 */  bl      __cvt_fp2unsigned
/* 0A48C0 800A9E60 7C7B1B78 */  mr      r27, r3
/* 0A48C4 800A9E64 C83A0090 */  lfd     f1, 0x90(r26)
/* 0A48C8 800A9E68 4802FBF9 */  bl      __cvt_fp2unsigned
/* 0A48CC 800A9E6C 7C651B78 */  mr      r5, r3
/* 0A48D0 800A9E70 4CC63182 */  crclr   6
/* 0A48D4 800A9E74 7F24CB78 */  mr      r4, r25
/* 0A48D8 800A9E78 7F67DB78 */  mr      r7, r27
/* 0A48DC 800A9E7C 387F0120 */  addi    r3, r31, 0x120
/* 0A48E0 800A9E80 38D90001 */  addi    r6, r25, 1
/* 0A48E4 800A9E84 480001E9 */  bl      OSReport
/* 0A48E8 800A9E88 3B5A0010 */  addi    r26, r26, 0x10
/* 0A48EC 800A9E8C 3B390002 */  addi    r25, r25, 2
/* 0A48F0 800A9E90 28190020 */  cmplwi  r25, 0x20
/* 0A48F4 800A9E94 4180FFC4 */  blt     lbl_800A9E58
/* 0A48F8 800A9E98 387F013C */  addi    r3, r31, 0x13c
/* 0A48FC 800A9E9C 4CC63182 */  crclr   6
/* 0A4900 800A9EA0 480001CD */  bl      OSReport
/* 0A4904 800A9EA4 3B200000 */  li      r25, 0
/* 0A4908 800A9EA8 57201838 */  slwi    r0, r25, 3
/* 0A490C 800A9EAC 7F5C0214 */  add     r26, r28, r0
/* 0A4910 800A9EB0 48000004 */  b       lbl_800A9EB4
lbl_800A9EB4:
/* 0A4914 800A9EB4 48000004 */  b       lbl_800A9EB8
lbl_800A9EB8:
/* 0A4918 800A9EB8 48000004 */  b       lbl_800A9EBC
lbl_800A9EBC:
/* 0A491C 800A9EBC C83A01D0 */  lfd     f1, 0x1d0(r26)
/* 0A4920 800A9EC0 4802FBA1 */  bl      __cvt_fp2unsigned
/* 0A4924 800A9EC4 7C7B1B78 */  mr      r27, r3
/* 0A4928 800A9EC8 C83A01C8 */  lfd     f1, 0x1c8(r26)
/* 0A492C 800A9ECC 4802FB95 */  bl      __cvt_fp2unsigned
/* 0A4930 800A9ED0 7C651B78 */  mr      r5, r3
/* 0A4934 800A9ED4 4CC63182 */  crclr   6
/* 0A4938 800A9ED8 7F24CB78 */  mr      r4, r25
/* 0A493C 800A9EDC 7F67DB78 */  mr      r7, r27
/* 0A4940 800A9EE0 387F0150 */  addi    r3, r31, 0x150
/* 0A4944 800A9EE4 38D90001 */  addi    r6, r25, 1
/* 0A4948 800A9EE8 48000185 */  bl      OSReport
/* 0A494C 800A9EEC 3B5A0010 */  addi    r26, r26, 0x10
/* 0A4950 800A9EF0 3B390002 */  addi    r25, r25, 2
/* 0A4954 800A9EF4 28190020 */  cmplwi  r25, 0x20
/* 0A4958 800A9EF8 4180FFC4 */  blt     lbl_800A9EBC
/* 0A495C 800A9EFC 38A00000 */  li      r5, 0
/* 0A4960 800A9F00 B0A101B0 */  sth     r5, 0x1b0(r1)
/* 0A4964 800A9F04 3C608000 */  lis     r3, 0x8000
/* 0A4968 800A9F08 38810010 */  addi    r4, r1, 0x10
/* 0A496C 800A9F0C B0A101B2 */  sth     r5, 0x1b2(r1)
/* 0A4970 800A9F10 800300D8 */  lwz     r0, 0xd8(r3)
/* 0A4974 800A9F14 7C040040 */  cmplw   r4, r0
/* 0A4978 800A9F18 40820008 */  bne     lbl_800A9F20
/* 0A497C 800A9F1C 90A300D8 */  stw     r5, 0xd8(r3)
lbl_800A9F20:
/* 0A4980 800A9F20 7FC3F378 */  mr      r3, r30
/* 0A4984 800A9F24 4BFFFB2D */  bl      OSSetCurrentContext
/* 0A4988 800A9F28 7FA3EB78 */  mr      r3, r29
/* 0A498C 800A9F2C 4800086D */  bl      OSRestoreInterrupts
lbl_800A9F30:
/* 0A4990 800A9F30 387F0170 */  addi    r3, r31, 0x170
/* 0A4994 800A9F34 4CC63182 */  crclr   6
/* 0A4998 800A9F38 48000135 */  bl      OSReport
/* 0A499C 800A9F3C 833C0004 */  lwz     r25, 4(r28)
/* 0A49A0 800A9F40 3B400000 */  li      r26, 0
/* 0A49A4 800A9F44 48000004 */  b       lbl_800A9F48
lbl_800A9F48:
/* 0A49A8 800A9F48 48000004 */  b       lbl_800A9F4C
lbl_800A9F4C:
/* 0A49AC 800A9F4C 48000020 */  b       lbl_800A9F6C
lbl_800A9F50:
/* 0A49B0 800A9F50 80B90000 */  lwz     r5, 0(r25)
/* 0A49B4 800A9F54 7F24CB78 */  mr      r4, r25
/* 0A49B8 800A9F58 80D90004 */  lwz     r6, 4(r25)
/* 0A49BC 800A9F5C 387F0198 */  addi    r3, r31, 0x198
/* 0A49C0 800A9F60 4CC63182 */  crclr   6
/* 0A49C4 800A9F64 48000109 */  bl      OSReport
/* 0A49C8 800A9F68 83390000 */  lwz     r25, 0(r25)
lbl_800A9F6C:
/* 0A49CC 800A9F6C 28190000 */  cmplwi  r25, 0
/* 0A49D0 800A9F70 4182001C */  beq     lbl_800A9F8C
/* 0A49D4 800A9F74 3C190001 */  addis   r0, r25, 1
/* 0A49D8 800A9F78 2800FFFF */  cmplwi  r0, 0xffff
/* 0A49DC 800A9F7C 41820010 */  beq     lbl_800A9F8C
/* 0A49E0 800A9F80 281A0010 */  cmplwi  r26, 0x10
/* 0A49E4 800A9F84 3B5A0001 */  addi    r26, r26, 1
/* 0A49E8 800A9F88 4180FFC8 */  blt     lbl_800A9F50
lbl_800A9F8C:
/* 0A49EC 800A9F8C BB2102DC */  lmw     r25, 0x2dc(r1)
/* 0A49F0 800A9F90 800102FC */  lwz     r0, 0x2fc(r1)
/* 0A49F4 800A9F94 382102F8 */  addi    r1, r1, 0x2f8
/* 0A49F8 800A9F98 7C0803A6 */  mtlr    r0
/* 0A49FC 800A9F9C 4E800020 */  blr     

OSSwitchFPUContext:
/* 0A4A00 800A9FA0 7CA000A6 */  mfmsr   r5
/* 0A4A04 800A9FA4 60A52000 */  ori     r5, r5, 0x2000
/* 0A4A08 800A9FA8 7CA00124 */  mtmsr   r5
/* 0A4A0C 800A9FAC 4C00012C */  isync   
/* 0A4A10 800A9FB0 80A4019C */  lwz     r5, 0x19c(r4)
/* 0A4A14 800A9FB4 60A52000 */  ori     r5, r5, 0x2000
/* 0A4A18 800A9FB8 7CBB03A6 */  mtspr   0x1b, r5
/* 0A4A1C 800A9FBC 3C608000 */  lis     r3, 0x8000
/* 0A4A20 800A9FC0 80A300D8 */  lwz     r5, 0xd8(r3)
/* 0A4A24 800A9FC4 908300D8 */  stw     r4, 0xd8(r3)
/* 0A4A28 800A9FC8 7C052000 */  cmpw    r5, r4
/* 0A4A2C 800A9FCC 41820014 */  beq     lbl_800A9FE0
/* 0A4A30 800A9FD0 2C050000 */  cmpwi   r5, 0
/* 0A4A34 800A9FD4 41820008 */  beq     lbl_800A9FDC
/* 0A4A38 800A9FD8 4BFFF949 */  bl      __OSSaveFPUContext
lbl_800A9FDC:
/* 0A4A3C 800A9FDC 4BFFF821 */  bl      __OSLoadFPUContext
lbl_800A9FE0:
/* 0A4A40 800A9FE0 80640080 */  lwz     r3, 0x80(r4)
/* 0A4A44 800A9FE4 7C6FF120 */  mtcrf   0xff, r3
/* 0A4A48 800A9FE8 80640084 */  lwz     r3, 0x84(r4)
/* 0A4A4C 800A9FEC 7C6803A6 */  mtlr    r3
/* 0A4A50 800A9FF0 80640198 */  lwz     r3, 0x198(r4)
/* 0A4A54 800A9FF4 7C7A03A6 */  mtspr   0x1a, r3
/* 0A4A58 800A9FF8 80640088 */  lwz     r3, 0x88(r4)
/* 0A4A5C 800A9FFC 7C6903A6 */  mtctr   r3
/* 0A4A60 800AA000 8064008C */  lwz     r3, 0x8c(r4)
/* 0A4A64 800AA004 7C6103A6 */  mtxer   r3
/* 0A4A68 800AA008 A06401A2 */  lhz     r3, 0x1a2(r4)
/* 0A4A6C 800AA00C 546307FA */  rlwinm  r3, r3, 0, 0x1f, 0x1d
/* 0A4A70 800AA010 B06401A2 */  sth     r3, 0x1a2(r4)
/* 0A4A74 800AA014 80A40014 */  lwz     r5, 0x14(r4)
/* 0A4A78 800AA018 8064000C */  lwz     r3, 0xc(r4)
/* 0A4A7C 800AA01C 80840010 */  lwz     r4, 0x10(r4)
/* 0A4A80 800AA020 4C000064 */  rfi     

glabel __OSContextInit
/* 0A4A84 800AA024 7C0802A6 */  mflr    r0
/* 0A4A88 800AA028 90010004 */  stw     r0, 4(r1)
/* 0A4A8C 800AA02C 9421FFF8 */  stwu    r1, -8(r1)
/* 0A4A90 800AA030 3C60800B */  lis     r3, OSSwitchFPUContext@ha
/* 0A4A94 800AA034 38839FA0 */  addi    r4, r3, OSSwitchFPUContext@l
/* 0A4A98 800AA038 38600007 */  li      r3, 7
/* 0A4A9C 800AA03C 4BFFDF3D */  bl      __OSSetExceptionHandler
/* 0A4AA0 800AA040 38000000 */  li      r0, 0
/* 0A4AA4 800AA044 4CC63182 */  crclr   6
/* 0A4AA8 800AA048 3C808000 */  lis     r4, 0x8000
/* 0A4AAC 800AA04C 3C608010 */  lis     r3, D_800FF07C@ha
/* 0A4AB0 800AA050 900400D8 */  stw     r0, 0xd8(r4)
/* 0A4AB4 800AA054 3863F07C */  addi    r3, r3, D_800FF07C@l
/* 0A4AB8 800AA058 48009799 */  bl      DBPrintf
/* 0A4ABC 800AA05C 8001000C */  lwz     r0, 0xc(r1)
/* 0A4AC0 800AA060 38210008 */  addi    r1, r1, 8
/* 0A4AC4 800AA064 7C0803A6 */  mtlr    r0
/* 0A4AC8 800AA068 4E800020 */  blr     

glabel OSReport
/* 0A4ACC 800AA06C 7C0802A6 */  mflr    r0
/* 0A4AD0 800AA070 90010004 */  stw     r0, 4(r1)
/* 0A4AD4 800AA074 9421FF88 */  stwu    r1, -0x78(r1)
/* 0A4AD8 800AA078 40860024 */  bne     cr1, lbl_800AA09C
/* 0A4ADC 800AA07C D8210028 */  stfd    f1, 0x28(r1)
/* 0A4AE0 800AA080 D8410030 */  stfd    f2, 0x30(r1)
/* 0A4AE4 800AA084 D8610038 */  stfd    f3, 0x38(r1)
/* 0A4AE8 800AA088 D8810040 */  stfd    f4, 0x40(r1)
/* 0A4AEC 800AA08C D8A10048 */  stfd    f5, 0x48(r1)
/* 0A4AF0 800AA090 D8C10050 */  stfd    f6, 0x50(r1)
/* 0A4AF4 800AA094 D8E10058 */  stfd    f7, 0x58(r1)
/* 0A4AF8 800AA098 D9010060 */  stfd    f8, 0x60(r1)
lbl_800AA09C:
/* 0A4AFC 800AA09C 90610008 */  stw     r3, 8(r1)
/* 0A4B00 800AA0A0 3C000100 */  lis     r0, 0x100
/* 0A4B04 800AA0A4 9081000C */  stw     r4, 0xc(r1)
/* 0A4B08 800AA0A8 3881006C */  addi    r4, r1, 0x6c
/* 0A4B0C 800AA0AC 90A10010 */  stw     r5, 0x10(r1)
/* 0A4B10 800AA0B0 90C10014 */  stw     r6, 0x14(r1)
/* 0A4B14 800AA0B4 90E10018 */  stw     r7, 0x18(r1)
/* 0A4B18 800AA0B8 9101001C */  stw     r8, 0x1c(r1)
/* 0A4B1C 800AA0BC 91210020 */  stw     r9, 0x20(r1)
/* 0A4B20 800AA0C0 91410024 */  stw     r10, 0x24(r1)
/* 0A4B24 800AA0C4 9001006C */  stw     r0, 0x6c(r1)
/* 0A4B28 800AA0C8 38010080 */  addi    r0, r1, 0x80
/* 0A4B2C 800AA0CC 90010070 */  stw     r0, 0x70(r1)
/* 0A4B30 800AA0D0 38010008 */  addi    r0, r1, 8
/* 0A4B34 800AA0D4 90010074 */  stw     r0, 0x74(r1)
/* 0A4B38 800AA0D8 48030F3D */  bl      vprintf
/* 0A4B3C 800AA0DC 8001007C */  lwz     r0, 0x7c(r1)
/* 0A4B40 800AA0E0 38210078 */  addi    r1, r1, 0x78
/* 0A4B44 800AA0E4 7C0803A6 */  mtlr    r0
/* 0A4B48 800AA0E8 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FBF48 800FEEC8 0044 */
D_800FEEC8:
    .asciz "------------------------- Context 0x%08x -------------------------\n"

.balign 4

/* 000FBF8C 800FEF0C 0030 */
D_800FEF0C:
    .asciz "r%-2d  = 0x%08x (%14d)  r%-2d  = 0x%08x (%14d)\n"

.balign 4

/* 000FBFBC 800FEF3C 002F */
D_800FEF3C:
    .asciz "LR   = 0x%08x                   CR   = 0x%08x\n"

.balign 4

/* 000FBFEC 800FEF6C 002F */
D_800FEF6C:
    .asciz "SRR0 = 0x%08x                   SRR1 = 0x%08x\n"

.balign 4

/* 000FC01C 800FEF9C 0011 */
D_800FEF9C:
    .asciz "\nGQRs----------\n"

.balign 4

/* 000FC030 800FEFB0 0021 */
D_800FEFB0:
    .asciz "gqr%d = 0x%08x \t gqr%d = 0x%08x\n"

.balign 4

/* 000FC054 800FEFD4 0012 */
D_800FEFD4:
    .asciz "\n\nFPRs----------\n"

.balign 4

/* 000FC068 800FEFE8 0019 */
D_800FEFE8:
    .asciz "fr%d \t= %d \t fr%d \t= %d\n"

.balign 4

/* 000FC084 800FF004 0012 */
D_800FF004:
    .asciz "\n\nPSFs----------\n"

.balign 4

/* 000FC098 800FF018 001D */
D_800FF018:
    .asciz "ps%d \t= 0x%x \t ps%d \t= 0x%x\n"

.balign 4

/* 000FC0B8 800FF038 0026 */
D_800FF038:
    .asciz "\nAddress:      Back Chain    LR Save\n"

.balign 4

/* 000FC0E0 800FF060 001C */
D_800FF060:
    .asciz "0x%08x:   0x%08x    0x%08x\n"

.balign 4

/* 000FC0FC 800FF07C 0023 */
D_800FF07C:
    .asciz "FPU-unavailable handler installed\n"


