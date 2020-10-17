# trigf.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel tanf
/* 0D8C70 800DE210 7C0802A6 */  mflr    r0
/* 0D8C74 800DE214 90010004 */  stw     r0, 4(r1)
/* 0D8C78 800DE218 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0D8C7C 800DE21C DBE10018 */  stfd    f31, 0x18(r1)
/* 0D8C80 800DE220 DBC10010 */  stfd    f30, 0x10(r1)
/* 0D8C84 800DE224 FFC00890 */  fmr     f30, f1
/* 0D8C88 800DE228 4800002D */  bl      cos__Ff
/* 0D8C8C 800DE22C FFE00890 */  fmr     f31, f1
/* 0D8C90 800DE230 FC20F090 */  fmr     f1, f30
/* 0D8C94 800DE234 48000041 */  bl      sin__Ff
/* 0D8C98 800DE238 EC21F824 */  fdivs   f1, f1, f31
/* 0D8C9C 800DE23C 80010024 */  lwz     r0, 0x24(r1)
/* 0D8CA0 800DE240 CBE10018 */  lfd     f31, 0x18(r1)
/* 0D8CA4 800DE244 CBC10010 */  lfd     f30, 0x10(r1)
/* 0D8CA8 800DE248 7C0803A6 */  mtlr    r0
/* 0D8CAC 800DE24C 38210020 */  addi    r1, r1, 0x20
/* 0D8CB0 800DE250 4E800020 */  blr     

glabel cos__Ff
/* 0D8CB4 800DE254 7C0802A6 */  mflr    r0
/* 0D8CB8 800DE258 90010004 */  stw     r0, 4(r1)
/* 0D8CBC 800DE25C 9421FFF8 */  stwu    r1, -8(r1)
/* 0D8CC0 800DE260 48000035 */  bl      cosf
/* 0D8CC4 800DE264 8001000C */  lwz     r0, 0xc(r1)
/* 0D8CC8 800DE268 38210008 */  addi    r1, r1, 8
/* 0D8CCC 800DE26C 7C0803A6 */  mtlr    r0
/* 0D8CD0 800DE270 4E800020 */  blr     

glabel sin__Ff
/* 0D8CD4 800DE274 7C0802A6 */  mflr    r0
/* 0D8CD8 800DE278 90010004 */  stw     r0, 4(r1)
/* 0D8CDC 800DE27C 9421FFF8 */  stwu    r1, -8(r1)
/* 0D8CE0 800DE280 480001A9 */  bl      sinf
/* 0D8CE4 800DE284 8001000C */  lwz     r0, 0xc(r1)
/* 0D8CE8 800DE288 38210008 */  addi    r1, r1, 8
/* 0D8CEC 800DE28C 7C0803A6 */  mtlr    r0
/* 0D8CF0 800DE290 4E800020 */  blr     

glabel cosf
/* 0D8CF4 800DE294 7C0802A6 */  mflr    r0
/* 0D8CF8 800DE298 3C608010 */  lis     r3, __four_over_pi_m1@ha
/* 0D8CFC 800DE29C 90010004 */  stw     r0, 4(r1)
/* 0D8D00 800DE2A0 38632160 */  addi    r3, r3, __four_over_pi_m1@l
/* 0D8D04 800DE2A4 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0D8D08 800DE2A8 DBE10020 */  stfd    f31, 0x20(r1)
/* 0D8D0C 800DE2AC 93E1001C */  stw     r31, 0x1c(r1)
/* 0D8D10 800DE2B0 D0210008 */  stfs    f1, 8(r1)
/* 0D8D14 800DE2B4 C00287A0 */  lfs     f0, D_80146780-_SDA2_BASE_(r2)
/* 0D8D18 800DE2B8 80010008 */  lwz     r0, 8(r1)
/* 0D8D1C 800DE2BC C0C10008 */  lfs     f6, 8(r1)
/* 0D8D20 800DE2C0 54000001 */  rlwinm. r0, r0, 0, 0, 0
/* 0D8D24 800DE2C4 EC2001B2 */  fmuls   f1, f0, f6
/* 0D8D28 800DE2C8 4182001C */  beq     lbl_800DE2E4
/* 0D8D2C 800DE2CC C00287A4 */  lfs     f0, D_80146784-_SDA2_BASE_(r2)
/* 0D8D30 800DE2D0 EC010028 */  fsubs   f0, f1, f0
/* 0D8D34 800DE2D4 FC00001E */  fctiwz  f0, f0
/* 0D8D38 800DE2D8 D8010010 */  stfd    f0, 0x10(r1)
/* 0D8D3C 800DE2DC 80810014 */  lwz     r4, 0x14(r1)
/* 0D8D40 800DE2E0 48000018 */  b       lbl_800DE2F8
lbl_800DE2E4:
/* 0D8D44 800DE2E4 C00287A4 */  lfs     f0, D_80146784-_SDA2_BASE_(r2)
/* 0D8D48 800DE2E8 EC00082A */  fadds   f0, f0, f1
/* 0D8D4C 800DE2EC FC00001E */  fctiwz  f0, f0
/* 0D8D50 800DE2F0 D8010010 */  stfd    f0, 0x10(r1)
/* 0D8D54 800DE2F4 80810014 */  lwz     r4, 0x14(r1)
lbl_800DE2F8:
/* 0D8D58 800DE2F8 5480083C */  slwi    r0, r4, 1
/* 0D8D5C 800DE2FC C82287B0 */  lfd     f1, D_80146790-_SDA2_BASE_(r2)
/* 0D8D60 800DE300 6C008000 */  xoris   r0, r0, 0x8000
/* 0D8D64 800DE304 C0430000 */  lfs     f2, 0(r3)
/* 0D8D68 800DE308 90010014 */  stw     r0, 0x14(r1)
/* 0D8D6C 800DE30C 3C004330 */  lis     r0, 0x4330
/* 0D8D70 800DE310 C0630004 */  lfs     f3, 4(r3)
/* 0D8D74 800DE314 549F07BE */  clrlwi  r31, r4, 0x1e
/* 0D8D78 800DE318 90010010 */  stw     r0, 0x10(r1)
/* 0D8D7C 800DE31C C0830008 */  lfs     f4, 8(r3)
/* 0D8D80 800DE320 C8010010 */  lfd     f0, 0x10(r1)
/* 0D8D84 800DE324 C0A3000C */  lfs     f5, 0xc(r3)
/* 0D8D88 800DE328 EC000828 */  fsubs   f0, f0, f1
/* 0D8D8C 800DE32C EC060028 */  fsubs   f0, f6, f0
/* 0D8D90 800DE330 EC0201BA */  fmadds  f0, f2, f6, f0
/* 0D8D94 800DE334 EC0301BA */  fmadds  f0, f3, f6, f0
/* 0D8D98 800DE338 EC0401BA */  fmadds  f0, f4, f6, f0
/* 0D8D9C 800DE33C EFE501BA */  fmadds  f31, f5, f6, f0
/* 0D8DA0 800DE340 FC20F890 */  fmr     f1, f31
/* 0D8DA4 800DE344 4BFFFCF1 */  bl      fabsf__Ff
/* 0D8DA8 800DE348 C00287A8 */  lfs     f0, D_80146788-_SDA2_BASE_(r2)
/* 0D8DAC 800DE34C FC010040 */  fcmpo   cr0, f1, f0
/* 0D8DB0 800DE350 40800024 */  bge     lbl_800DE374
/* 0D8DB4 800DE354 3C608010 */  lis     r3, __sincos_on_quadrant@ha
/* 0D8DB8 800DE358 57E41838 */  slwi    r4, r31, 3
/* 0D8DBC 800DE35C 38032170 */  addi    r0, r3, __sincos_on_quadrant@l
/* 0D8DC0 800DE360 7C602214 */  add     r3, r0, r4
/* 0D8DC4 800DE364 C0230000 */  lfs     f1, 0(r3)
/* 0D8DC8 800DE368 C0030004 */  lfs     f0, 4(r3)
/* 0D8DCC 800DE36C EC3F007C */  fnmsubs f1, f31, f1, f0
/* 0D8DD0 800DE370 480000A0 */  b       lbl_800DE410
lbl_800DE374:
/* 0D8DD4 800DE374 57E007FF */  clrlwi. r0, r31, 0x1f
/* 0D8DD8 800DE378 EC9F07F2 */  fmuls   f4, f31, f31
/* 0D8DDC 800DE37C 41820050 */  beq     lbl_800DE3CC
/* 0D8DE0 800DE380 3C608010 */  lis     r3, __sincos_poly@ha
/* 0D8DE4 800DE384 38832190 */  addi    r4, r3, __sincos_poly@l
/* 0D8DE8 800DE388 C0440004 */  lfs     f2, 4(r4)
/* 0D8DEC 800DE38C 3C608010 */  lis     r3, __sincos_on_quadrant@ha
/* 0D8DF0 800DE390 C024000C */  lfs     f1, 0xc(r4)
/* 0D8DF4 800DE394 38032170 */  addi    r0, r3, __sincos_on_quadrant@l
/* 0D8DF8 800DE398 C0040014 */  lfs     f0, 0x14(r4)
/* 0D8DFC 800DE39C EC62093A */  fmadds  f3, f2, f4, f1
/* 0D8E00 800DE3A0 C044001C */  lfs     f2, 0x1c(r4)
/* 0D8E04 800DE3A4 C0240024 */  lfs     f1, 0x24(r4)
/* 0D8E08 800DE3A8 57E41838 */  slwi    r4, r31, 3
/* 0D8E0C 800DE3AC 7C602214 */  add     r3, r0, r4
/* 0D8E10 800DE3B0 EC6400FA */  fmadds  f3, f4, f3, f0
/* 0D8E14 800DE3B4 C0030000 */  lfs     f0, 0(r3)
/* 0D8E18 800DE3B8 EC4410FA */  fmadds  f2, f4, f3, f2
/* 0D8E1C 800DE3BC EC2408BE */  fnmadds f1, f4, f2, f1
/* 0D8E20 800DE3C0 EC3F0072 */  fmuls   f1, f31, f1
/* 0D8E24 800DE3C4 EC210032 */  fmuls   f1, f1, f0
/* 0D8E28 800DE3C8 48000048 */  b       lbl_800DE410
lbl_800DE3CC:
/* 0D8E2C 800DE3CC 3C608010 */  lis     r3, __sincos_poly@ha
/* 0D8E30 800DE3D0 38832190 */  addi    r4, r3, __sincos_poly@l
/* 0D8E34 800DE3D4 C0440000 */  lfs     f2, 0(r4)
/* 0D8E38 800DE3D8 3C608010 */  lis     r3, __sincos_on_quadrant@ha
/* 0D8E3C 800DE3DC C0240008 */  lfs     f1, 8(r4)
/* 0D8E40 800DE3E0 38632170 */  addi    r3, r3, __sincos_on_quadrant@l
/* 0D8E44 800DE3E4 57E01838 */  slwi    r0, r31, 3
/* 0D8E48 800DE3E8 EC62093A */  fmadds  f3, f2, f4, f1
/* 0D8E4C 800DE3EC C0040010 */  lfs     f0, 0x10(r4)
/* 0D8E50 800DE3F0 C0440018 */  lfs     f2, 0x18(r4)
/* 0D8E54 800DE3F4 7C630214 */  add     r3, r3, r0
/* 0D8E58 800DE3F8 C0240020 */  lfs     f1, 0x20(r4)
/* 0D8E5C 800DE3FC EC6400FA */  fmadds  f3, f4, f3, f0
/* 0D8E60 800DE400 C0030004 */  lfs     f0, 4(r3)
/* 0D8E64 800DE404 EC4410FA */  fmadds  f2, f4, f3, f2
/* 0D8E68 800DE408 EC2408BA */  fmadds  f1, f4, f2, f1
/* 0D8E6C 800DE40C EC210032 */  fmuls   f1, f1, f0
lbl_800DE410:
/* 0D8E70 800DE410 8001002C */  lwz     r0, 0x2c(r1)
/* 0D8E74 800DE414 CBE10020 */  lfd     f31, 0x20(r1)
/* 0D8E78 800DE418 83E1001C */  lwz     r31, 0x1c(r1)
/* 0D8E7C 800DE41C 7C0803A6 */  mtlr    r0
/* 0D8E80 800DE420 38210028 */  addi    r1, r1, 0x28
/* 0D8E84 800DE424 4E800020 */  blr     

glabel sinf
/* 0D8E88 800DE428 7C0802A6 */  mflr    r0
/* 0D8E8C 800DE42C 3C608010 */  lis     r3, __four_over_pi_m1@ha
/* 0D8E90 800DE430 90010004 */  stw     r0, 4(r1)
/* 0D8E94 800DE434 38632160 */  addi    r3, r3, __four_over_pi_m1@l
/* 0D8E98 800DE438 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0D8E9C 800DE43C DBE10020 */  stfd    f31, 0x20(r1)
/* 0D8EA0 800DE440 93E1001C */  stw     r31, 0x1c(r1)
/* 0D8EA4 800DE444 D0210008 */  stfs    f1, 8(r1)
/* 0D8EA8 800DE448 C00287A0 */  lfs     f0, D_80146780-_SDA2_BASE_(r2)
/* 0D8EAC 800DE44C 80010008 */  lwz     r0, 8(r1)
/* 0D8EB0 800DE450 C0C10008 */  lfs     f6, 8(r1)
/* 0D8EB4 800DE454 54000001 */  rlwinm. r0, r0, 0, 0, 0
/* 0D8EB8 800DE458 EC2001B2 */  fmuls   f1, f0, f6
/* 0D8EBC 800DE45C 4182001C */  beq     lbl_800DE478
/* 0D8EC0 800DE460 C00287A4 */  lfs     f0, D_80146784-_SDA2_BASE_(r2)
/* 0D8EC4 800DE464 EC010028 */  fsubs   f0, f1, f0
/* 0D8EC8 800DE468 FC00001E */  fctiwz  f0, f0
/* 0D8ECC 800DE46C D8010010 */  stfd    f0, 0x10(r1)
/* 0D8ED0 800DE470 80810014 */  lwz     r4, 0x14(r1)
/* 0D8ED4 800DE474 48000018 */  b       lbl_800DE48C
lbl_800DE478:
/* 0D8ED8 800DE478 C00287A4 */  lfs     f0, D_80146784-_SDA2_BASE_(r2)
/* 0D8EDC 800DE47C EC00082A */  fadds   f0, f0, f1
/* 0D8EE0 800DE480 FC00001E */  fctiwz  f0, f0
/* 0D8EE4 800DE484 D8010010 */  stfd    f0, 0x10(r1)
/* 0D8EE8 800DE488 80810014 */  lwz     r4, 0x14(r1)
lbl_800DE48C:
/* 0D8EEC 800DE48C 5480083C */  slwi    r0, r4, 1
/* 0D8EF0 800DE490 C82287B0 */  lfd     f1, D_80146790-_SDA2_BASE_(r2)
/* 0D8EF4 800DE494 6C008000 */  xoris   r0, r0, 0x8000
/* 0D8EF8 800DE498 C0430000 */  lfs     f2, 0(r3)
/* 0D8EFC 800DE49C 90010014 */  stw     r0, 0x14(r1)
/* 0D8F00 800DE4A0 3C004330 */  lis     r0, 0x4330
/* 0D8F04 800DE4A4 C0630004 */  lfs     f3, 4(r3)
/* 0D8F08 800DE4A8 549F07BE */  clrlwi  r31, r4, 0x1e
/* 0D8F0C 800DE4AC 90010010 */  stw     r0, 0x10(r1)
/* 0D8F10 800DE4B0 C0830008 */  lfs     f4, 8(r3)
/* 0D8F14 800DE4B4 C8010010 */  lfd     f0, 0x10(r1)
/* 0D8F18 800DE4B8 C0A3000C */  lfs     f5, 0xc(r3)
/* 0D8F1C 800DE4BC EC000828 */  fsubs   f0, f0, f1
/* 0D8F20 800DE4C0 EC060028 */  fsubs   f0, f6, f0
/* 0D8F24 800DE4C4 EC0201BA */  fmadds  f0, f2, f6, f0
/* 0D8F28 800DE4C8 EC0301BA */  fmadds  f0, f3, f6, f0
/* 0D8F2C 800DE4CC EC0401BA */  fmadds  f0, f4, f6, f0
/* 0D8F30 800DE4D0 EFE501BA */  fmadds  f31, f5, f6, f0
/* 0D8F34 800DE4D4 FC20F890 */  fmr     f1, f31
/* 0D8F38 800DE4D8 4BFFFB5D */  bl      fabsf__Ff
/* 0D8F3C 800DE4DC C00287A8 */  lfs     f0, D_80146788-_SDA2_BASE_(r2)
/* 0D8F40 800DE4E0 FC010040 */  fcmpo   cr0, f1, f0
/* 0D8F44 800DE4E4 40800034 */  bge     lbl_800DE518
/* 0D8F48 800DE4E8 3C608010 */  lis     r3, __sincos_on_quadrant@ha
/* 0D8F4C 800DE4EC 57E41838 */  slwi    r4, r31, 3
/* 0D8F50 800DE4F0 38032170 */  addi    r0, r3, __sincos_on_quadrant@l
/* 0D8F54 800DE4F4 7C602214 */  add     r3, r0, r4
/* 0D8F58 800DE4F8 C0230004 */  lfs     f1, 4(r3)
/* 0D8F5C 800DE4FC 3C808010 */  lis     r4, __sincos_poly@ha
/* 0D8F60 800DE500 38842190 */  addi    r4, r4, __sincos_poly@l
/* 0D8F64 800DE504 C0030000 */  lfs     f0, 0(r3)
/* 0D8F68 800DE508 EC3F0072 */  fmuls   f1, f31, f1
/* 0D8F6C 800DE50C C0440024 */  lfs     f2, 0x24(r4)
/* 0D8F70 800DE510 EC22007A */  fmadds  f1, f2, f1, f0
/* 0D8F74 800DE514 480000A0 */  b       lbl_800DE5B4
lbl_800DE518:
/* 0D8F78 800DE518 57E007FF */  clrlwi. r0, r31, 0x1f
/* 0D8F7C 800DE51C EC9F07F2 */  fmuls   f4, f31, f31
/* 0D8F80 800DE520 4182004C */  beq     lbl_800DE56C
/* 0D8F84 800DE524 3C608010 */  lis     r3, __sincos_poly@ha
/* 0D8F88 800DE528 38832190 */  addi    r4, r3, __sincos_poly@l
/* 0D8F8C 800DE52C C0440000 */  lfs     f2, 0(r4)
/* 0D8F90 800DE530 3C608010 */  lis     r3, __sincos_on_quadrant@ha
/* 0D8F94 800DE534 C0240008 */  lfs     f1, 8(r4)
/* 0D8F98 800DE538 38032170 */  addi    r0, r3, __sincos_on_quadrant@l
/* 0D8F9C 800DE53C C0040010 */  lfs     f0, 0x10(r4)
/* 0D8FA0 800DE540 EC62093A */  fmadds  f3, f2, f4, f1
/* 0D8FA4 800DE544 C0440018 */  lfs     f2, 0x18(r4)
/* 0D8FA8 800DE548 C0240020 */  lfs     f1, 0x20(r4)
/* 0D8FAC 800DE54C 57E41838 */  slwi    r4, r31, 3
/* 0D8FB0 800DE550 7C602214 */  add     r3, r0, r4
/* 0D8FB4 800DE554 EC6400FA */  fmadds  f3, f4, f3, f0
/* 0D8FB8 800DE558 C0030000 */  lfs     f0, 0(r3)
/* 0D8FBC 800DE55C EC4410FA */  fmadds  f2, f4, f3, f2
/* 0D8FC0 800DE560 EC2408BA */  fmadds  f1, f4, f2, f1
/* 0D8FC4 800DE564 EC210032 */  fmuls   f1, f1, f0
/* 0D8FC8 800DE568 4800004C */  b       lbl_800DE5B4
lbl_800DE56C:
/* 0D8FCC 800DE56C 3C608010 */  lis     r3, __sincos_poly@ha
/* 0D8FD0 800DE570 38832190 */  addi    r4, r3, __sincos_poly@l
/* 0D8FD4 800DE574 C0440004 */  lfs     f2, 4(r4)
/* 0D8FD8 800DE578 3C608010 */  lis     r3, __sincos_on_quadrant@ha
/* 0D8FDC 800DE57C C024000C */  lfs     f1, 0xc(r4)
/* 0D8FE0 800DE580 38632170 */  addi    r3, r3, __sincos_on_quadrant@l
/* 0D8FE4 800DE584 57E01838 */  slwi    r0, r31, 3
/* 0D8FE8 800DE588 EC62093A */  fmadds  f3, f2, f4, f1
/* 0D8FEC 800DE58C C0040014 */  lfs     f0, 0x14(r4)
/* 0D8FF0 800DE590 C044001C */  lfs     f2, 0x1c(r4)
/* 0D8FF4 800DE594 7C630214 */  add     r3, r3, r0
/* 0D8FF8 800DE598 C0240024 */  lfs     f1, 0x24(r4)
/* 0D8FFC 800DE59C EC6400FA */  fmadds  f3, f4, f3, f0
/* 0D9000 800DE5A0 C0030004 */  lfs     f0, 4(r3)
/* 0D9004 800DE5A4 EC4410FA */  fmadds  f2, f4, f3, f2
/* 0D9008 800DE5A8 EC2408BA */  fmadds  f1, f4, f2, f1
/* 0D900C 800DE5AC EC3F0072 */  fmuls   f1, f31, f1
/* 0D9010 800DE5B0 EC210032 */  fmuls   f1, f1, f0
lbl_800DE5B4:
/* 0D9014 800DE5B4 8001002C */  lwz     r0, 0x2c(r1)
/* 0D9018 800DE5B8 CBE10020 */  lfd     f31, 0x20(r1)
/* 0D901C 800DE5BC 83E1001C */  lwz     r31, 0x1c(r1)
/* 0D9020 800DE5C0 7C0803A6 */  mtlr    r0
/* 0D9024 800DE5C4 38210028 */  addi    r1, r1, 0x28
/* 0D9028 800DE5C8 4E800020 */  blr     

__sinit_trigf_c:
/* 0D902C 800DE5CC 3C60800E */  lis     r3, tmp_float@ha
/* 0D9030 800DE5D0 3883F870 */  addi    r4, r3, tmp_float@l
/* 0D9034 800DE5D4 C0040000 */  lfs     f0, 0(r4)
/* 0D9038 800DE5D8 3C608010 */  lis     r3, __four_over_pi_m1@ha
/* 0D903C 800DE5DC D4032160 */  stfsu   f0, __four_over_pi_m1@l(r3)
/* 0D9040 800DE5E0 C0040004 */  lfs     f0, 4(r4)
/* 0D9044 800DE5E4 D0030004 */  stfs    f0, 4(r3)
/* 0D9048 800DE5E8 C0040008 */  lfs     f0, 8(r4)
/* 0D904C 800DE5EC D0030008 */  stfs    f0, 8(r3)
/* 0D9050 800DE5F0 C004000C */  lfs     f0, 0xc(r4)
/* 0D9054 800DE5F4 D003000C */  stfs    f0, 0xc(r3)
/* 0D9058 800DE5F8 4E800020 */  blr     


.section .ctors, "a"

.balign 4

/* 000DC1E0 800DF160 0004 */
glabel _ctors
    .long __sinit_trigf_c


.section .rodata, "a"

.balign 8

/* 000DC8F0 800DF870 0010 */
tmp_float:
    .long 0x3E800000, 0x3CBE6080, 0x34372200, 0x2DA44152


.section .data, "wa"

.balign 8

/* 000FF1E0 80102160 0010 */
__four_over_pi_m1:
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000


.section .sdata2, "wa"

.balign 8

/* 00100840 80146780 0004 */
D_80146780:
    .float 0.6366197466850281

.balign 4

/* 00100844 80146784 0004 */
D_80146784:
    .float 0.5

.balign 4

/* 00100848 80146788 0004 */
D_80146788:
    .float 0.0003452669770922512

.balign 8

/* 00100850 80146790 0008 */
D_80146790:
    .double 4503601774854144.0


