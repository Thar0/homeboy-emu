# GXTransform.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel GXSetProjection
/* 0B4C40 800BA1E0 80A284B0 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0B4C44 800BA1E4 2C040001 */  cmpwi   r4, 1
/* 0B4C48 800BA1E8 908504D8 */  stw     r4, 0x4d8(r5)
/* 0B4C4C 800BA1EC C0030000 */  lfs     f0, 0(r3)
/* 0B4C50 800BA1F0 D00504DC */  stfs    f0, 0x4dc(r5)
/* 0B4C54 800BA1F4 C0030014 */  lfs     f0, 0x14(r3)
/* 0B4C58 800BA1F8 D00504E4 */  stfs    f0, 0x4e4(r5)
/* 0B4C5C 800BA1FC C0030028 */  lfs     f0, 0x28(r3)
/* 0B4C60 800BA200 D00504EC */  stfs    f0, 0x4ec(r5)
/* 0B4C64 800BA204 C003002C */  lfs     f0, 0x2c(r3)
/* 0B4C68 800BA208 D00504F0 */  stfs    f0, 0x4f0(r5)
/* 0B4C6C 800BA20C 40820018 */  bne     lbl_800BA224
/* 0B4C70 800BA210 C003000C */  lfs     f0, 0xc(r3)
/* 0B4C74 800BA214 D00504E0 */  stfs    f0, 0x4e0(r5)
/* 0B4C78 800BA218 C003001C */  lfs     f0, 0x1c(r3)
/* 0B4C7C 800BA21C D00504E8 */  stfs    f0, 0x4e8(r5)
/* 0B4C80 800BA220 48000014 */  b       lbl_800BA234
lbl_800BA224:
/* 0B4C84 800BA224 C0030008 */  lfs     f0, 8(r3)
/* 0B4C88 800BA228 D00504E0 */  stfs    f0, 0x4e0(r5)
/* 0B4C8C 800BA22C C0030018 */  lfs     f0, 0x18(r3)
/* 0B4C90 800BA230 D00504E8 */  stfs    f0, 0x4e8(r5)
lbl_800BA234:
/* 0B4C94 800BA234 3CA0CC01 */  lis     r5, 0xcc01
/* 0B4C98 800BA238 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B4C9C 800BA23C 38000010 */  li      r0, 0x10
/* 0B4CA0 800BA240 3C600006 */  lis     r3, 6
/* 0B4CA4 800BA244 98058000 */  stb     r0, -0x8000(r5)
/* 0B4CA8 800BA248 38031020 */  addi    r0, r3, 0x1020
/* 0B4CAC 800BA24C 90058000 */  stw     r0, -0x8000(r5)
/* 0B4CB0 800BA250 38C58000 */  addi    r6, r5, -32768
/* 0B4CB4 800BA254 386404DC */  addi    r3, r4, 0x4dc
/* 0B4CB8 800BA258 E0430000 */  psq_l   f2, 0(r3), 0, qr0
/* 0B4CBC 800BA25C E0230008 */  psq_l   f1, 8(r3), 0, qr0
/* 0B4CC0 800BA260 E0030010 */  psq_l   f0, 16(r3), 0, qr0
/* 0B4CC4 800BA264 F0460000 */  psq_st  f2, 0(r6), 0, qr0
/* 0B4CC8 800BA268 F0260000 */  psq_st  f1, 0(r6), 0, qr0
/* 0B4CCC 800BA26C F0060000 */  psq_st  f0, 0(r6), 0, qr0
/* 0B4CD0 800BA270 806404D8 */  lwz     r3, 0x4d8(r4)
/* 0B4CD4 800BA274 38000001 */  li      r0, 1
/* 0B4CD8 800BA278 90658000 */  stw     r3, -0x8000(r5)
/* 0B4CDC 800BA27C B0040002 */  sth     r0, 2(r4)
/* 0B4CE0 800BA280 4E800020 */  blr     

glabel GXSetProjectionv
/* 0B4CE4 800BA284 C0228570 */  lfs     f1, D_80146550-_SDA2_BASE_(r2)
/* 0B4CE8 800BA288 C0030000 */  lfs     f0, 0(r3)
/* 0B4CEC 800BA28C FC010000 */  fcmpu   cr0, f1, f0
/* 0B4CF0 800BA290 4082000C */  bne     lbl_800BA29C
/* 0B4CF4 800BA294 38000000 */  li      r0, 0
/* 0B4CF8 800BA298 48000008 */  b       lbl_800BA2A0
lbl_800BA29C:
/* 0B4CFC 800BA29C 38000001 */  li      r0, 1
lbl_800BA2A0:
/* 0B4D00 800BA2A0 80A284B0 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0B4D04 800BA2A4 38630004 */  addi    r3, r3, 4
/* 0B4D08 800BA2A8 900504D8 */  stw     r0, 0x4d8(r5)
/* 0B4D0C 800BA2AC 38C504DC */  addi    r6, r5, 0x4dc
/* 0B4D10 800BA2B0 E0430000 */  psq_l   f2, 0(r3), 0, qr0
/* 0B4D14 800BA2B4 E0230008 */  psq_l   f1, 8(r3), 0, qr0
/* 0B4D18 800BA2B8 E0030010 */  psq_l   f0, 16(r3), 0, qr0
/* 0B4D1C 800BA2BC F0460000 */  psq_st  f2, 0(r6), 0, qr0
/* 0B4D20 800BA2C0 F0260008 */  psq_st  f1, 8(r6), 0, qr0
/* 0B4D24 800BA2C4 F0060010 */  psq_st  f0, 16(r6), 0, qr0
/* 0B4D28 800BA2C8 3C80CC01 */  lis     r4, 0xcc01
/* 0B4D2C 800BA2CC 38000010 */  li      r0, 0x10
/* 0B4D30 800BA2D0 3C600006 */  lis     r3, 6
/* 0B4D34 800BA2D4 98048000 */  stb     r0, -0x8000(r4)
/* 0B4D38 800BA2D8 38031020 */  addi    r0, r3, 0x1020
/* 0B4D3C 800BA2DC 90048000 */  stw     r0, -0x8000(r4)
/* 0B4D40 800BA2E0 38648000 */  addi    r3, r4, -32768
/* 0B4D44 800BA2E4 E0460000 */  psq_l   f2, 0(r6), 0, qr0
/* 0B4D48 800BA2E8 E0260008 */  psq_l   f1, 8(r6), 0, qr0
/* 0B4D4C 800BA2EC E0060010 */  psq_l   f0, 16(r6), 0, qr0
/* 0B4D50 800BA2F0 F0430000 */  psq_st  f2, 0(r3), 0, qr0
/* 0B4D54 800BA2F4 F0230000 */  psq_st  f1, 0(r3), 0, qr0
/* 0B4D58 800BA2F8 F0030000 */  psq_st  f0, 0(r3), 0, qr0
/* 0B4D5C 800BA2FC 806504D8 */  lwz     r3, 0x4d8(r5)
/* 0B4D60 800BA300 38000001 */  li      r0, 1
/* 0B4D64 800BA304 90648000 */  stw     r3, -0x8000(r4)
/* 0B4D68 800BA308 B0050002 */  sth     r0, 2(r5)
/* 0B4D6C 800BA30C 4E800020 */  blr     

glabel GXLoadPosMtxImm
/* 0B4D70 800BA310 3CA0CC01 */  lis     r5, 0xcc01
/* 0B4D74 800BA314 38000010 */  li      r0, 0x10
/* 0B4D78 800BA318 5484103A */  slwi    r4, r4, 2
/* 0B4D7C 800BA31C 98058000 */  stb     r0, -0x8000(r5)
/* 0B4D80 800BA320 6480000B */  oris    r0, r4, 0xb
/* 0B4D84 800BA324 90058000 */  stw     r0, -0x8000(r5)
/* 0B4D88 800BA328 38858000 */  addi    r4, r5, -32768
/* 0B4D8C 800BA32C E0A30000 */  psq_l   f5, 0(r3), 0, qr0
/* 0B4D90 800BA330 E0830008 */  psq_l   f4, 8(r3), 0, qr0
/* 0B4D94 800BA334 E0630010 */  psq_l   f3, 16(r3), 0, qr0
/* 0B4D98 800BA338 E0430018 */  psq_l   f2, 24(r3), 0, qr0
/* 0B4D9C 800BA33C E0230020 */  psq_l   f1, 32(r3), 0, qr0
/* 0B4DA0 800BA340 E0030028 */  psq_l   f0, 40(r3), 0, qr0
/* 0B4DA4 800BA344 F0A40000 */  psq_st  f5, 0(r4), 0, qr0
/* 0B4DA8 800BA348 F0840000 */  psq_st  f4, 0(r4), 0, qr0
/* 0B4DAC 800BA34C F0640000 */  psq_st  f3, 0(r4), 0, qr0
/* 0B4DB0 800BA350 F0440000 */  psq_st  f2, 0(r4), 0, qr0
/* 0B4DB4 800BA354 F0240000 */  psq_st  f1, 0(r4), 0, qr0
/* 0B4DB8 800BA358 F0040000 */  psq_st  f0, 0(r4), 0, qr0
/* 0B4DBC 800BA35C 4E800020 */  blr     

glabel GXLoadNrmMtxImm
/* 0B4DC0 800BA360 1CA40003 */  mulli   r5, r4, 3
/* 0B4DC4 800BA364 3C80CC01 */  lis     r4, 0xcc01
/* 0B4DC8 800BA368 38000010 */  li      r0, 0x10
/* 0B4DCC 800BA36C 38A50400 */  addi    r5, r5, 0x400
/* 0B4DD0 800BA370 98048000 */  stb     r0, -0x8000(r4)
/* 0B4DD4 800BA374 64A00008 */  oris    r0, r5, 8
/* 0B4DD8 800BA378 94048000 */  stwu    r0, -0x8000(r4)
/* 0B4DDC 800BA37C E0A30000 */  psq_l   f5, 0(r3), 0, qr0
/* 0B4DE0 800BA380 C0830008 */  lfs     f4, 8(r3)
/* 0B4DE4 800BA384 E0630010 */  psq_l   f3, 16(r3), 0, qr0
/* 0B4DE8 800BA388 C0430018 */  lfs     f2, 0x18(r3)
/* 0B4DEC 800BA38C E0230020 */  psq_l   f1, 32(r3), 0, qr0
/* 0B4DF0 800BA390 C0030028 */  lfs     f0, 0x28(r3)
/* 0B4DF4 800BA394 F0A40000 */  psq_st  f5, 0(r4), 0, qr0
/* 0B4DF8 800BA398 D0840000 */  stfs    f4, 0(r4)
/* 0B4DFC 800BA39C F0640000 */  psq_st  f3, 0(r4), 0, qr0
/* 0B4E00 800BA3A0 D0440000 */  stfs    f2, 0(r4)
/* 0B4E04 800BA3A4 F0240000 */  psq_st  f1, 0(r4), 0, qr0
/* 0B4E08 800BA3A8 D0040000 */  stfs    f0, 0(r4)
/* 0B4E0C 800BA3AC 4E800020 */  blr     

glabel GXSetCurrentMtx
/* 0B4E10 800BA3B0 7C0802A6 */  mflr    r0
/* 0B4E14 800BA3B4 90010004 */  stw     r0, 4(r1)
/* 0B4E18 800BA3B8 9421FFF8 */  stwu    r1, -8(r1)
/* 0B4E1C 800BA3BC 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B4E20 800BA3C0 80040080 */  lwz     r0, 0x80(r4)
/* 0B4E24 800BA3C4 506006BE */  rlwimi  r0, r3, 0, 0x1a, 0x1f
/* 0B4E28 800BA3C8 38600000 */  li      r3, 0
/* 0B4E2C 800BA3CC 90040080 */  stw     r0, 0x80(r4)
/* 0B4E30 800BA3D0 48000321 */  bl      __GXSetMatrixIndex
/* 0B4E34 800BA3D4 8001000C */  lwz     r0, 0xc(r1)
/* 0B4E38 800BA3D8 38210008 */  addi    r1, r1, 8
/* 0B4E3C 800BA3DC 7C0803A6 */  mtlr    r0
/* 0B4E40 800BA3E0 4E800020 */  blr     

glabel GXLoadTexMtxImm
/* 0B4E44 800BA3E4 28040040 */  cmplwi  r4, 0x40
/* 0B4E48 800BA3E8 41800014 */  blt     lbl_800BA3FC
/* 0B4E4C 800BA3EC 3804FFC0 */  addi    r0, r4, -64
/* 0B4E50 800BA3F0 5404103A */  slwi    r4, r0, 2
/* 0B4E54 800BA3F4 38E40500 */  addi    r7, r4, 0x500
/* 0B4E58 800BA3F8 48000008 */  b       lbl_800BA400
lbl_800BA3FC:
/* 0B4E5C 800BA3FC 5487103A */  slwi    r7, r4, 2
lbl_800BA400:
/* 0B4E60 800BA400 2C050001 */  cmpwi   r5, 1
/* 0B4E64 800BA404 4082000C */  bne     lbl_800BA410
/* 0B4E68 800BA408 38800008 */  li      r4, 8
/* 0B4E6C 800BA40C 48000008 */  b       lbl_800BA414
lbl_800BA410:
/* 0B4E70 800BA410 3880000C */  li      r4, 0xc
lbl_800BA414:
/* 0B4E74 800BA414 3804FFFF */  addi    r0, r4, -1
/* 0B4E78 800BA418 5406801E */  slwi    r6, r0, 0x10
/* 0B4E7C 800BA41C 38000010 */  li      r0, 0x10
/* 0B4E80 800BA420 3C80CC01 */  lis     r4, 0xcc01
/* 0B4E84 800BA424 98048000 */  stb     r0, -0x8000(r4)
/* 0B4E88 800BA428 7CE03378 */  or      r0, r7, r6
/* 0B4E8C 800BA42C 2C050000 */  cmpwi   r5, 0
/* 0B4E90 800BA430 90048000 */  stw     r0, -0x8000(r4)
/* 0B4E94 800BA434 4082003C */  bne     lbl_800BA470
/* 0B4E98 800BA438 38848000 */  addi    r4, r4, -32768
/* 0B4E9C 800BA43C E0A30000 */  psq_l   f5, 0(r3), 0, qr0
/* 0B4EA0 800BA440 E0830008 */  psq_l   f4, 8(r3), 0, qr0
/* 0B4EA4 800BA444 E0630010 */  psq_l   f3, 16(r3), 0, qr0
/* 0B4EA8 800BA448 E0430018 */  psq_l   f2, 24(r3), 0, qr0
/* 0B4EAC 800BA44C E0230020 */  psq_l   f1, 32(r3), 0, qr0
/* 0B4EB0 800BA450 E0030028 */  psq_l   f0, 40(r3), 0, qr0
/* 0B4EB4 800BA454 F0A40000 */  psq_st  f5, 0(r4), 0, qr0
/* 0B4EB8 800BA458 F0840000 */  psq_st  f4, 0(r4), 0, qr0
/* 0B4EBC 800BA45C F0640000 */  psq_st  f3, 0(r4), 0, qr0
/* 0B4EC0 800BA460 F0440000 */  psq_st  f2, 0(r4), 0, qr0
/* 0B4EC4 800BA464 F0240000 */  psq_st  f1, 0(r4), 0, qr0
/* 0B4EC8 800BA468 F0040000 */  psq_st  f0, 0(r4), 0, qr0
/* 0B4ECC 800BA46C 4E800020 */  blr     
lbl_800BA470:
/* 0B4ED0 800BA470 38848000 */  addi    r4, r4, -32768
/* 0B4ED4 800BA474 E0630000 */  psq_l   f3, 0(r3), 0, qr0
/* 0B4ED8 800BA478 E0430008 */  psq_l   f2, 8(r3), 0, qr0
/* 0B4EDC 800BA47C E0230010 */  psq_l   f1, 16(r3), 0, qr0
/* 0B4EE0 800BA480 E0030018 */  psq_l   f0, 24(r3), 0, qr0
/* 0B4EE4 800BA484 F0640000 */  psq_st  f3, 0(r4), 0, qr0
/* 0B4EE8 800BA488 F0440000 */  psq_st  f2, 0(r4), 0, qr0
/* 0B4EEC 800BA48C F0240000 */  psq_st  f1, 0(r4), 0, qr0
/* 0B4EF0 800BA490 F0040000 */  psq_st  f0, 0(r4), 0, qr0
/* 0B4EF4 800BA494 4E800020 */  blr     

glabel __GXSetViewport
/* 0B4EF8 800BA498 80C284B0 */  lwz     r6, __GXData-_SDA2_BASE_(r2)
/* 0B4EFC 800BA49C 3C600005 */  lis     r3, 5
/* 0B4F00 800BA4A0 C0228574 */  lfs     f1, D_80146554-_SDA2_BASE_(r2)
/* 0B4F04 800BA4A4 38A00010 */  li      r5, 0x10
/* 0B4F08 800BA4A8 C0660500 */  lfs     f3, 0x500(r6)
/* 0B4F0C 800BA4AC C04604FC */  lfs     f2, 0x4fc(r6)
/* 0B4F10 800BA4B0 3C80CC01 */  lis     r4, 0xcc01
/* 0B4F14 800BA4B4 FC001850 */  fneg    f0, f3
/* 0B4F18 800BA4B8 C0A604F4 */  lfs     f5, 0x4f4(r6)
/* 0B4F1C 800BA4BC ECE20072 */  fmuls   f7, f2, f1
/* 0B4F20 800BA4C0 C08604F8 */  lfs     f4, 0x4f8(r6)
/* 0B4F24 800BA4C4 3803101A */  addi    r0, r3, 0x101a
/* 0B4F28 800BA4C8 EC630072 */  fmuls   f3, f3, f1
/* 0B4F2C 800BA4CC C0460508 */  lfs     f2, 0x508(r6)
/* 0B4F30 800BA4D0 C0C60510 */  lfs     f6, 0x510(r6)
/* 0B4F34 800BA4D4 ED000072 */  fmuls   f8, f0, f1
/* 0B4F38 800BA4D8 C0260504 */  lfs     f1, 0x504(r6)
/* 0B4F3C 800BA4DC C006050C */  lfs     f0, 0x50c(r6)
/* 0B4F40 800BA4E0 ED2201B2 */  fmuls   f9, f2, f6
/* 0B4F44 800BA4E4 EC2101B2 */  fmuls   f1, f1, f6
/* 0B4F48 800BA4E8 C0C28578 */  lfs     f6, D_80146558-_SDA2_BASE_(r2)
/* 0B4F4C 800BA4EC 98A48000 */  stb     r5, -0x8000(r4)
/* 0B4F50 800BA4F0 ECA5382A */  fadds   f5, f5, f7
/* 0B4F54 800BA4F4 90048000 */  stw     r0, -0x8000(r4)
/* 0B4F58 800BA4F8 EC44182A */  fadds   f2, f4, f3
/* 0B4F5C 800BA4FC D0E48000 */  stfs    f7, -0x8000(r4)
/* 0B4F60 800BA500 EC290828 */  fsubs   f1, f9, f1
/* 0B4F64 800BA504 EC66282A */  fadds   f3, f6, f5
/* 0B4F68 800BA508 D1048000 */  stfs    f8, -0x8000(r4)
/* 0B4F6C 800BA50C EC46102A */  fadds   f2, f6, f2
/* 0B4F70 800BA510 D0248000 */  stfs    f1, -0x8000(r4)
/* 0B4F74 800BA514 EC09002A */  fadds   f0, f9, f0
/* 0B4F78 800BA518 D0648000 */  stfs    f3, -0x8000(r4)
/* 0B4F7C 800BA51C D0448000 */  stfs    f2, -0x8000(r4)
/* 0B4F80 800BA520 D0048000 */  stfs    f0, -0x8000(r4)
/* 0B4F84 800BA524 4E800020 */  blr     

glabel GXSetViewportJitter
/* 0B4F88 800BA528 7C0802A6 */  mflr    r0
/* 0B4F8C 800BA52C 28030000 */  cmplwi  r3, 0
/* 0B4F90 800BA530 90010004 */  stw     r0, 4(r1)
/* 0B4F94 800BA534 9421FFF8 */  stwu    r1, -8(r1)
/* 0B4F98 800BA538 4082000C */  bne     lbl_800BA544
/* 0B4F9C 800BA53C C0028574 */  lfs     f0, D_80146554-_SDA2_BASE_(r2)
/* 0B4FA0 800BA540 EC420028 */  fsubs   f2, f2, f0
lbl_800BA544:
/* 0B4FA4 800BA544 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B4FA8 800BA548 D02304F4 */  stfs    f1, 0x4f4(r3)
/* 0B4FAC 800BA54C D04304F8 */  stfs    f2, 0x4f8(r3)
/* 0B4FB0 800BA550 D06304FC */  stfs    f3, 0x4fc(r3)
/* 0B4FB4 800BA554 D0830500 */  stfs    f4, 0x500(r3)
/* 0B4FB8 800BA558 D0A30504 */  stfs    f5, 0x504(r3)
/* 0B4FBC 800BA55C D0C30508 */  stfs    f6, 0x508(r3)
/* 0B4FC0 800BA560 4BFFFF39 */  bl      __GXSetViewport
/* 0B4FC4 800BA564 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B4FC8 800BA568 38000001 */  li      r0, 1
/* 0B4FCC 800BA56C B0030002 */  sth     r0, 2(r3)
/* 0B4FD0 800BA570 8001000C */  lwz     r0, 0xc(r1)
/* 0B4FD4 800BA574 38210008 */  addi    r1, r1, 8
/* 0B4FD8 800BA578 7C0803A6 */  mtlr    r0
/* 0B4FDC 800BA57C 4E800020 */  blr     

glabel GXSetViewport
/* 0B4FE0 800BA580 7C0802A6 */  mflr    r0
/* 0B4FE4 800BA584 90010004 */  stw     r0, 4(r1)
/* 0B4FE8 800BA588 9421FFF8 */  stwu    r1, -8(r1)
/* 0B4FEC 800BA58C 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B4FF0 800BA590 D02304F4 */  stfs    f1, 0x4f4(r3)
/* 0B4FF4 800BA594 D04304F8 */  stfs    f2, 0x4f8(r3)
/* 0B4FF8 800BA598 D06304FC */  stfs    f3, 0x4fc(r3)
/* 0B4FFC 800BA59C D0830500 */  stfs    f4, 0x500(r3)
/* 0B5000 800BA5A0 D0A30504 */  stfs    f5, 0x504(r3)
/* 0B5004 800BA5A4 D0C30508 */  stfs    f6, 0x508(r3)
/* 0B5008 800BA5A8 4BFFFEF1 */  bl      __GXSetViewport
/* 0B500C 800BA5AC 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B5010 800BA5B0 38000001 */  li      r0, 1
/* 0B5014 800BA5B4 B0030002 */  sth     r0, 2(r3)
/* 0B5018 800BA5B8 8001000C */  lwz     r0, 0xc(r1)
/* 0B501C 800BA5BC 38210008 */  addi    r1, r1, 8
/* 0B5020 800BA5C0 7C0803A6 */  mtlr    r0
/* 0B5024 800BA5C4 4E800020 */  blr     

glabel GXSetScissor
/* 0B5028 800BA5C8 80E284B0 */  lwz     r7, __GXData-_SDA2_BASE_(r2)
/* 0B502C 800BA5CC 38840156 */  addi    r4, r4, 0x156
/* 0B5030 800BA5D0 38C6FFFF */  addi    r6, r6, -1
/* 0B5034 800BA5D4 800700F8 */  lwz     r0, 0xf8(r7)
/* 0B5038 800BA5D8 5080057E */  rlwimi  r0, r4, 0, 0x15, 0x1f
/* 0B503C 800BA5DC 38630156 */  addi    r3, r3, 0x156
/* 0B5040 800BA5E0 900700F8 */  stw     r0, 0xf8(r7)
/* 0B5044 800BA5E4 3905FFFF */  addi    r8, r5, -1
/* 0B5048 800BA5E8 7CC43214 */  add     r6, r4, r6
/* 0B504C 800BA5EC 800700F8 */  lwz     r0, 0xf8(r7)
/* 0B5050 800BA5F0 50606266 */  rlwimi  r0, r3, 0xc, 9, 0x13
/* 0B5054 800BA5F4 7D034214 */  add     r8, r3, r8
/* 0B5058 800BA5F8 900700F8 */  stw     r0, 0xf8(r7)
/* 0B505C 800BA5FC 38A00061 */  li      r5, 0x61
/* 0B5060 800BA600 3C80CC01 */  lis     r4, 0xcc01
/* 0B5064 800BA604 806700FC */  lwz     r3, 0xfc(r7)
/* 0B5068 800BA608 50C3057E */  rlwimi  r3, r6, 0, 0x15, 0x1f
/* 0B506C 800BA60C 38000000 */  li      r0, 0
/* 0B5070 800BA610 906700FC */  stw     r3, 0xfc(r7)
/* 0B5074 800BA614 806700FC */  lwz     r3, 0xfc(r7)
/* 0B5078 800BA618 51036266 */  rlwimi  r3, r8, 0xc, 9, 0x13
/* 0B507C 800BA61C 906700FC */  stw     r3, 0xfc(r7)
/* 0B5080 800BA620 98A48000 */  stb     r5, -0x8000(r4)
/* 0B5084 800BA624 806700F8 */  lwz     r3, 0xf8(r7)
/* 0B5088 800BA628 90648000 */  stw     r3, -0x8000(r4)
/* 0B508C 800BA62C 98A48000 */  stb     r5, -0x8000(r4)
/* 0B5090 800BA630 806700FC */  lwz     r3, 0xfc(r7)
/* 0B5094 800BA634 90648000 */  stw     r3, -0x8000(r4)
/* 0B5098 800BA638 B0070002 */  sth     r0, 2(r7)
/* 0B509C 800BA63C 4E800020 */  blr     

glabel GXGetScissor
/* 0B50A0 800BA640 810284B0 */  lwz     r8, __GXData-_SDA2_BASE_(r2)
/* 0B50A4 800BA644 80E800F8 */  lwz     r7, 0xf8(r8)
/* 0B50A8 800BA648 810800FC */  lwz     r8, 0xfc(r8)
/* 0B50AC 800BA64C 54E9A57E */  rlwinm  r9, r7, 0x14, 0x15, 0x1f
/* 0B50B0 800BA650 3809FEAA */  addi    r0, r9, -342
/* 0B50B4 800BA654 90030000 */  stw     r0, 0(r3)
/* 0B50B8 800BA658 54E7057E */  clrlwi  r7, r7, 0x15
/* 0B50BC 800BA65C 3867FEAA */  addi    r3, r7, -342
/* 0B50C0 800BA660 90640000 */  stw     r3, 0(r4)
/* 0B50C4 800BA664 5500A57E */  rlwinm  r0, r8, 0x14, 0x15, 0x1f
/* 0B50C8 800BA668 7C690050 */  subf    r3, r9, r0
/* 0B50CC 800BA66C 38030001 */  addi    r0, r3, 1
/* 0B50D0 800BA670 5504057E */  clrlwi  r4, r8, 0x15
/* 0B50D4 800BA674 90050000 */  stw     r0, 0(r5)
/* 0B50D8 800BA678 7C672050 */  subf    r3, r7, r4
/* 0B50DC 800BA67C 38030001 */  addi    r0, r3, 1
/* 0B50E0 800BA680 90060000 */  stw     r0, 0(r6)
/* 0B50E4 800BA684 4E800020 */  blr     

glabel GXSetScissorBoxOffset
/* 0B50E8 800BA688 38A30156 */  addi    r5, r3, 0x156
/* 0B50EC 800BA68C 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B50F0 800BA690 38040156 */  addi    r0, r4, 0x156
/* 0B50F4 800BA694 38800000 */  li      r4, 0
/* 0B50F8 800BA698 50A4FDBE */  rlwimi  r4, r5, 0x1f, 0x16, 0x1f
/* 0B50FC 800BA69C 38A40000 */  addi    r5, r4, 0
/* 0B5100 800BA6A0 50054B2A */  rlwimi  r5, r0, 9, 0xc, 0x15
/* 0B5104 800BA6A4 38000061 */  li      r0, 0x61
/* 0B5108 800BA6A8 3C80CC01 */  lis     r4, 0xcc01
/* 0B510C 800BA6AC 98048000 */  stb     r0, -0x8000(r4)
/* 0B5110 800BA6B0 38000059 */  li      r0, 0x59
/* 0B5114 800BA6B4 5005C00E */  rlwimi  r5, r0, 0x18, 0, 7
/* 0B5118 800BA6B8 90A48000 */  stw     r5, -0x8000(r4)
/* 0B511C 800BA6BC 38000000 */  li      r0, 0
/* 0B5120 800BA6C0 B0030002 */  sth     r0, 2(r3)
/* 0B5124 800BA6C4 4E800020 */  blr     

glabel GXSetClipMode
/* 0B5128 800BA6C8 38000010 */  li      r0, 0x10
/* 0B512C 800BA6CC 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B5130 800BA6D0 3CC0CC01 */  lis     r6, 0xcc01
/* 0B5134 800BA6D4 98068000 */  stb     r0, -0x8000(r6)
/* 0B5138 800BA6D8 38A01005 */  li      r5, 0x1005
/* 0B513C 800BA6DC 38000001 */  li      r0, 1
/* 0B5140 800BA6E0 90A68000 */  stw     r5, -0x8000(r6)
/* 0B5144 800BA6E4 90668000 */  stw     r3, -0x8000(r6)
/* 0B5148 800BA6E8 B0040002 */  sth     r0, 2(r4)
/* 0B514C 800BA6EC 4E800020 */  blr     

glabel __GXSetMatrixIndex
/* 0B5150 800BA6F0 2C030005 */  cmpwi   r3, 5
/* 0B5154 800BA6F4 4080003C */  bge     lbl_800BA730
/* 0B5158 800BA6F8 38000008 */  li      r0, 8
/* 0B515C 800BA6FC 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B5160 800BA700 3CA0CC01 */  lis     r5, 0xcc01
/* 0B5164 800BA704 98058000 */  stb     r0, -0x8000(r5)
/* 0B5168 800BA708 38000030 */  li      r0, 0x30
/* 0B516C 800BA70C 38600010 */  li      r3, 0x10
/* 0B5170 800BA710 98058000 */  stb     r0, -0x8000(r5)
/* 0B5174 800BA714 38001018 */  li      r0, 0x1018
/* 0B5178 800BA718 80840080 */  lwz     r4, 0x80(r4)
/* 0B517C 800BA71C 90858000 */  stw     r4, -0x8000(r5)
/* 0B5180 800BA720 98658000 */  stb     r3, -0x8000(r5)
/* 0B5184 800BA724 90058000 */  stw     r0, -0x8000(r5)
/* 0B5188 800BA728 90858000 */  stw     r4, -0x8000(r5)
/* 0B518C 800BA72C 48000038 */  b       lbl_800BA764
lbl_800BA730:
/* 0B5190 800BA730 38000008 */  li      r0, 8
/* 0B5194 800BA734 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B5198 800BA738 3CA0CC01 */  lis     r5, 0xcc01
/* 0B519C 800BA73C 98058000 */  stb     r0, -0x8000(r5)
/* 0B51A0 800BA740 38000040 */  li      r0, 0x40
/* 0B51A4 800BA744 38600010 */  li      r3, 0x10
/* 0B51A8 800BA748 98058000 */  stb     r0, -0x8000(r5)
/* 0B51AC 800BA74C 38001019 */  li      r0, 0x1019
/* 0B51B0 800BA750 80840084 */  lwz     r4, 0x84(r4)
/* 0B51B4 800BA754 90858000 */  stw     r4, -0x8000(r5)
/* 0B51B8 800BA758 98658000 */  stb     r3, -0x8000(r5)
/* 0B51BC 800BA75C 90058000 */  stw     r0, -0x8000(r5)
/* 0B51C0 800BA760 90858000 */  stw     r4, -0x8000(r5)
lbl_800BA764:
/* 0B51C4 800BA764 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B51C8 800BA768 38000001 */  li      r0, 1
/* 0B51CC 800BA76C B0030002 */  sth     r0, 2(r3)
/* 0B51D0 800BA770 4E800020 */  blr     


.section .sdata2, "wa"

.balign 8

/* 00100610 80146550 0004 */
D_80146550:
    .float 0.0

.balign 4

/* 00100614 80146554 0004 */
D_80146554:
    .float 0.5

.balign 4

/* 00100618 80146558 0004 */
D_80146558:
    .float 342.0


