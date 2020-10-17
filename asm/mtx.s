# mtx.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel PSMTXIdentity
/* 0AE2A0 800B3840 C0028494 */  lfs     f0, D_80146474-_SDA2_BASE_(r2)
/* 0AE2A4 800B3844 C0228490 */  lfs     f1, D_80146470-_SDA2_BASE_(r2)
/* 0AE2A8 800B3848 F0030008 */  psq_st  f0, 8(r3), 0, qr0
/* 0AE2AC 800B384C 10400C60 */  ps_merge01  f2, f0, f1
/* 0AE2B0 800B3850 F0030018 */  psq_st  f0, 24(r3), 0, qr0
/* 0AE2B4 800B3854 102104A0 */  ps_merge10  f1, f1, f0
/* 0AE2B8 800B3858 F0030020 */  psq_st  f0, 32(r3), 0, qr0
/* 0AE2BC 800B385C F0430010 */  psq_st  f2, 16(r3), 0, qr0
/* 0AE2C0 800B3860 F0230000 */  psq_st  f1, 0(r3), 0, qr0
/* 0AE2C4 800B3864 F0230028 */  psq_st  f1, 40(r3), 0, qr0
/* 0AE2C8 800B3868 4E800020 */  blr     

glabel PSMTXConcat
/* 0AE2CC 800B386C 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0AE2D0 800B3870 E0030000 */  psq_l   f0, 0(r3), 0, qr0
/* 0AE2D4 800B3874 D9C10008 */  stfd    f14, 8(r1)
/* 0AE2D8 800B3878 E0C40000 */  psq_l   f6, 0(r4), 0, qr0
/* 0AE2DC 800B387C 3CC08014 */  lis     r6, Unit01@ha
/* 0AE2E0 800B3880 E0E40008 */  psq_l   f7, 8(r4), 0, qr0
/* 0AE2E4 800B3884 D9E10010 */  stfd    f15, 0x10(r1)
/* 0AE2E8 800B3888 38C65728 */  addi    r6, r6, Unit01@l
/* 0AE2EC 800B388C DBE10028 */  stfd    f31, 0x28(r1)
/* 0AE2F0 800B3890 E1040010 */  psq_l   f8, 16(r4), 0, qr0
/* 0AE2F4 800B3894 11860018 */  ps_muls0    f12, f6, f0
/* 0AE2F8 800B3898 E0430010 */  psq_l   f2, 16(r3), 0, qr0
/* 0AE2FC 800B389C 11A70018 */  ps_muls0    f13, f7, f0
/* 0AE300 800B38A0 E3E60000 */  psq_l   f31, 0(r6), 0, qr0
/* 0AE304 800B38A4 11C60098 */  ps_muls0    f14, f6, f2
/* 0AE308 800B38A8 E1240018 */  psq_l   f9, 24(r4), 0, qr0
/* 0AE30C 800B38AC 11E70098 */  ps_muls0    f15, f7, f2
/* 0AE310 800B38B0 E0230008 */  psq_l   f1, 8(r3), 0, qr0
/* 0AE314 800B38B4 1188601E */  ps_madds1   f12, f8, f0, f12
/* 0AE318 800B38B8 E0630018 */  psq_l   f3, 24(r3), 0, qr0
/* 0AE31C 800B38BC 11C8709E */  ps_madds1   f14, f8, f2, f14
/* 0AE320 800B38C0 E1440020 */  psq_l   f10, 32(r4), 0, qr0
/* 0AE324 800B38C4 11A9681E */  ps_madds1   f13, f9, f0, f13
/* 0AE328 800B38C8 E1640028 */  psq_l   f11, 40(r4), 0, qr0
/* 0AE32C 800B38CC 11E9789E */  ps_madds1   f15, f9, f2, f15
/* 0AE330 800B38D0 E0830020 */  psq_l   f4, 32(r3), 0, qr0
/* 0AE334 800B38D4 E0A30028 */  psq_l   f5, 40(r3), 0, qr0
/* 0AE338 800B38D8 118A605C */  ps_madds0   f12, f10, f1, f12
/* 0AE33C 800B38DC 11AB685C */  ps_madds0   f13, f11, f1, f13
/* 0AE340 800B38E0 11CA70DC */  ps_madds0   f14, f10, f3, f14
/* 0AE344 800B38E4 11EB78DC */  ps_madds0   f15, f11, f3, f15
/* 0AE348 800B38E8 F1850000 */  psq_st  f12, 0(r5), 0, qr0
/* 0AE34C 800B38EC 10460118 */  ps_muls0    f2, f6, f4
/* 0AE350 800B38F0 11BF685E */  ps_madds1   f13, f31, f1, f13
/* 0AE354 800B38F4 10070118 */  ps_muls0    f0, f7, f4
/* 0AE358 800B38F8 F1C50010 */  psq_st  f14, 16(r5), 0, qr0
/* 0AE35C 800B38FC 11FF78DE */  ps_madds1   f15, f31, f3, f15
/* 0AE360 800B3900 F1A50008 */  psq_st  f13, 8(r5), 0, qr0
/* 0AE364 800B3904 1048111E */  ps_madds1   f2, f8, f4, f2
/* 0AE368 800B3908 1009011E */  ps_madds1   f0, f9, f4, f0
/* 0AE36C 800B390C 104A115C */  ps_madds0   f2, f10, f5, f2
/* 0AE370 800B3910 C9C10008 */  lfd     f14, 8(r1)
/* 0AE374 800B3914 F1E50018 */  psq_st  f15, 24(r5), 0, qr0
/* 0AE378 800B3918 100B015C */  ps_madds0   f0, f11, f5, f0
/* 0AE37C 800B391C F0450020 */  psq_st  f2, 32(r5), 0, qr0
/* 0AE380 800B3920 101F015E */  ps_madds1   f0, f31, f5, f0
/* 0AE384 800B3924 C9E10010 */  lfd     f15, 0x10(r1)
/* 0AE388 800B3928 F0050028 */  psq_st  f0, 40(r5), 0, qr0
/* 0AE38C 800B392C CBE10028 */  lfd     f31, 0x28(r1)
/* 0AE390 800B3930 38210040 */  addi    r1, r1, 0x40
/* 0AE394 800B3934 4E800020 */  blr     

glabel PSMTXTrans
/* 0AE398 800B3938 C0028494 */  lfs     f0, D_80146474-_SDA2_BASE_(r2)
/* 0AE39C 800B393C C0828490 */  lfs     f4, D_80146470-_SDA2_BASE_(r2)
/* 0AE3A0 800B3940 D023000C */  stfs    f1, 0xc(r3)
/* 0AE3A4 800B3944 D043001C */  stfs    f2, 0x1c(r3)
/* 0AE3A8 800B3948 F0030004 */  psq_st  f0, 4(r3), 0, qr0
/* 0AE3AC 800B394C F0030020 */  psq_st  f0, 32(r3), 0, qr0
/* 0AE3B0 800B3950 D0030010 */  stfs    f0, 0x10(r3)
/* 0AE3B4 800B3954 D0830014 */  stfs    f4, 0x14(r3)
/* 0AE3B8 800B3958 D0030018 */  stfs    f0, 0x18(r3)
/* 0AE3BC 800B395C D0830028 */  stfs    f4, 0x28(r3)
/* 0AE3C0 800B3960 D063002C */  stfs    f3, 0x2c(r3)
/* 0AE3C4 800B3964 D0830000 */  stfs    f4, 0(r3)
/* 0AE3C8 800B3968 4E800020 */  blr     

glabel PSMTXTransApply
/* 0AE3CC 800B396C E0830000 */  psq_l   f4, 0(r3), 0, qr0
/* 0AE3D0 800B3970 FC200818 */  frsp    f1, f1
/* 0AE3D4 800B3974 E0A30008 */  psq_l   f5, 8(r3), 0, qr0
/* 0AE3D8 800B3978 FC401018 */  frsp    f2, f2
/* 0AE3DC 800B397C E0E30018 */  psq_l   f7, 24(r3), 0, qr0
/* 0AE3E0 800B3980 FC601818 */  frsp    f3, f3
/* 0AE3E4 800B3984 E1030028 */  psq_l   f8, 40(r3), 0, qr0
/* 0AE3E8 800B3988 F0840000 */  psq_st  f4, 0(r4), 0, qr0
/* 0AE3EC 800B398C 10A12956 */  ps_sum1 f5, f1, f5, f5
/* 0AE3F0 800B3990 E0C30010 */  psq_l   f6, 16(r3), 0, qr0
/* 0AE3F4 800B3994 F0A40008 */  psq_st  f5, 8(r4), 0, qr0
/* 0AE3F8 800B3998 10E239D6 */  ps_sum1 f7, f2, f7, f7
/* 0AE3FC 800B399C E1230020 */  psq_l   f9, 32(r3), 0, qr0
/* 0AE400 800B39A0 F0C40010 */  psq_st  f6, 16(r4), 0, qr0
/* 0AE404 800B39A4 11034216 */  ps_sum1 f8, f3, f8, f8
/* 0AE408 800B39A8 F0E40018 */  psq_st  f7, 24(r4), 0, qr0
/* 0AE40C 800B39AC F1240020 */  psq_st  f9, 32(r4), 0, qr0
/* 0AE410 800B39B0 F1040028 */  psq_st  f8, 40(r4), 0, qr0
/* 0AE414 800B39B4 4E800020 */  blr     

glabel PSMTXScale
/* 0AE418 800B39B8 C0028494 */  lfs     f0, D_80146474-_SDA2_BASE_(r2)
/* 0AE41C 800B39BC D0230000 */  stfs    f1, 0(r3)
/* 0AE420 800B39C0 F0030004 */  psq_st  f0, 4(r3), 0, qr0
/* 0AE424 800B39C4 F003000C */  psq_st  f0, 12(r3), 0, qr0
/* 0AE428 800B39C8 D0430014 */  stfs    f2, 0x14(r3)
/* 0AE42C 800B39CC F0030018 */  psq_st  f0, 24(r3), 0, qr0
/* 0AE430 800B39D0 F0030020 */  psq_st  f0, 32(r3), 0, qr0
/* 0AE434 800B39D4 D0630028 */  stfs    f3, 0x28(r3)
/* 0AE438 800B39D8 D003002C */  stfs    f0, 0x2c(r3)
/* 0AE43C 800B39DC 4E800020 */  blr     

glabel PSMTXScaleApply
/* 0AE440 800B39E0 FC200818 */  frsp    f1, f1
/* 0AE444 800B39E4 E0830000 */  psq_l   f4, 0(r3), 0, qr0
/* 0AE448 800B39E8 FC401018 */  frsp    f2, f2
/* 0AE44C 800B39EC E0A30008 */  psq_l   f5, 8(r3), 0, qr0
/* 0AE450 800B39F0 FC601818 */  frsp    f3, f3
/* 0AE454 800B39F4 10840058 */  ps_muls0    f4, f4, f1
/* 0AE458 800B39F8 E0C30010 */  psq_l   f6, 16(r3), 0, qr0
/* 0AE45C 800B39FC 10A50058 */  ps_muls0    f5, f5, f1
/* 0AE460 800B3A00 E0E30018 */  psq_l   f7, 24(r3), 0, qr0
/* 0AE464 800B3A04 10C60098 */  ps_muls0    f6, f6, f2
/* 0AE468 800B3A08 E1030020 */  psq_l   f8, 32(r3), 0, qr0
/* 0AE46C 800B3A0C F0840000 */  psq_st  f4, 0(r4), 0, qr0
/* 0AE470 800B3A10 10E70098 */  ps_muls0    f7, f7, f2
/* 0AE474 800B3A14 E0430028 */  psq_l   f2, 40(r3), 0, qr0
/* 0AE478 800B3A18 F0A40008 */  psq_st  f5, 8(r4), 0, qr0
/* 0AE47C 800B3A1C 110800D8 */  ps_muls0    f8, f8, f3
/* 0AE480 800B3A20 F0C40010 */  psq_st  f6, 16(r4), 0, qr0
/* 0AE484 800B3A24 104200D8 */  ps_muls0    f2, f2, f3
/* 0AE488 800B3A28 F0E40018 */  psq_st  f7, 24(r4), 0, qr0
/* 0AE48C 800B3A2C F1040020 */  psq_st  f8, 32(r4), 0, qr0
/* 0AE490 800B3A30 F0440028 */  psq_st  f2, 40(r4), 0, qr0
/* 0AE494 800B3A34 4E800020 */  blr     


.section .sdata, "wa"

.balign 8

/* 000FFF88 80145728 0008 */
Unit01:
    .long 0x00000000, 0x3F800000


.section .sdata2, "wa"

.balign 8

/* 00100530 80146470 0004 */
D_80146470:
    .float 1.0

.balign 4

/* 00100534 80146474 0004 */
D_80146474:
    .float 0.0


