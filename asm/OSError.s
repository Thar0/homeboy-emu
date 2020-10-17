# OSError.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSPanic
/* 0A4B4C 800AA0EC 7C0802A6 */  mflr    r0
/* 0A4B50 800AA0F0 90010004 */  stw     r0, 4(r1)
/* 0A4B54 800AA0F4 9421FF70 */  stwu    r1, -0x90(r1)
/* 0A4B58 800AA0F8 93E1008C */  stw     r31, 0x8c(r1)
/* 0A4B5C 800AA0FC 93C10088 */  stw     r30, 0x88(r1)
/* 0A4B60 800AA100 93A10084 */  stw     r29, 0x84(r1)
/* 0A4B64 800AA104 93810080 */  stw     r28, 0x80(r1)
/* 0A4B68 800AA108 40860024 */  bne     cr1, lbl_800AA12C
/* 0A4B6C 800AA10C D8210028 */  stfd    f1, 0x28(r1)
/* 0A4B70 800AA110 D8410030 */  stfd    f2, 0x30(r1)
/* 0A4B74 800AA114 D8610038 */  stfd    f3, 0x38(r1)
/* 0A4B78 800AA118 D8810040 */  stfd    f4, 0x40(r1)
/* 0A4B7C 800AA11C D8A10048 */  stfd    f5, 0x48(r1)
/* 0A4B80 800AA120 D8C10050 */  stfd    f6, 0x50(r1)
/* 0A4B84 800AA124 D8E10058 */  stfd    f7, 0x58(r1)
/* 0A4B88 800AA128 D9010060 */  stfd    f8, 0x60(r1)
lbl_800AA12C:
/* 0A4B8C 800AA12C 90610008 */  stw     r3, 8(r1)
/* 0A4B90 800AA130 3B830000 */  addi    r28, r3, 0
/* 0A4B94 800AA134 3BC40000 */  addi    r30, r4, 0
/* 0A4B98 800AA138 9081000C */  stw     r4, 0xc(r1)
/* 0A4B9C 800AA13C 3BA50000 */  addi    r29, r5, 0
/* 0A4BA0 800AA140 90A10010 */  stw     r5, 0x10(r1)
/* 0A4BA4 800AA144 90C10014 */  stw     r6, 0x14(r1)
/* 0A4BA8 800AA148 3CC08010 */  lis     r6, D_800FF0A0@ha
/* 0A4BAC 800AA14C 3BE6F0A0 */  addi    r31, r6, D_800FF0A0@l
/* 0A4BB0 800AA150 90E10018 */  stw     r7, 0x18(r1)
/* 0A4BB4 800AA154 9101001C */  stw     r8, 0x1c(r1)
/* 0A4BB8 800AA158 91210020 */  stw     r9, 0x20(r1)
/* 0A4BBC 800AA15C 91410024 */  stw     r10, 0x24(r1)
/* 0A4BC0 800AA160 48000611 */  bl      OSDisableInterrupts
/* 0A4BC4 800AA164 3C000300 */  lis     r0, 0x300
/* 0A4BC8 800AA168 90010074 */  stw     r0, 0x74(r1)
/* 0A4BCC 800AA16C 38010098 */  addi    r0, r1, 0x98
/* 0A4BD0 800AA170 38810074 */  addi    r4, r1, 0x74
/* 0A4BD4 800AA174 90010078 */  stw     r0, 0x78(r1)
/* 0A4BD8 800AA178 38010008 */  addi    r0, r1, 8
/* 0A4BDC 800AA17C 387D0000 */  addi    r3, r29, 0
/* 0A4BE0 800AA180 9001007C */  stw     r0, 0x7c(r1)
/* 0A4BE4 800AA184 48030E91 */  bl      vprintf
/* 0A4BE8 800AA188 387F0000 */  addi    r3, r31, 0
/* 0A4BEC 800AA18C 4CC63182 */  crclr   6
/* 0A4BF0 800AA190 389C0000 */  addi    r4, r28, 0
/* 0A4BF4 800AA194 38BE0000 */  addi    r5, r30, 0
/* 0A4BF8 800AA198 4BFFFED5 */  bl      OSReport
/* 0A4BFC 800AA19C 387F0018 */  addi    r3, r31, 0x18
/* 0A4C00 800AA1A0 4CC63182 */  crclr   6
/* 0A4C04 800AA1A4 4BFFFEC9 */  bl      OSReport
/* 0A4C08 800AA1A8 3BC00000 */  li      r30, 0
/* 0A4C0C 800AA1AC 4BFFFA65 */  bl      OSGetStackPointer
/* 0A4C10 800AA1B0 7C7D1B78 */  mr      r29, r3
/* 0A4C14 800AA1B4 48000020 */  b       lbl_800AA1D4
lbl_800AA1B8:
/* 0A4C18 800AA1B8 80BD0000 */  lwz     r5, 0(r29)
/* 0A4C1C 800AA1BC 7FA4EB78 */  mr      r4, r29
/* 0A4C20 800AA1C0 80DD0004 */  lwz     r6, 4(r29)
/* 0A4C24 800AA1C4 387F0040 */  addi    r3, r31, 0x40
/* 0A4C28 800AA1C8 4CC63182 */  crclr   6
/* 0A4C2C 800AA1CC 4BFFFEA1 */  bl      OSReport
/* 0A4C30 800AA1D0 83BD0000 */  lwz     r29, 0(r29)
lbl_800AA1D4:
/* 0A4C34 800AA1D4 281D0000 */  cmplwi  r29, 0
/* 0A4C38 800AA1D8 4182001C */  beq     lbl_800AA1F4
/* 0A4C3C 800AA1DC 3C1D0001 */  addis   r0, r29, 1
/* 0A4C40 800AA1E0 2800FFFF */  cmplwi  r0, 0xffff
/* 0A4C44 800AA1E4 41820010 */  beq     lbl_800AA1F4
/* 0A4C48 800AA1E8 281E0010 */  cmplwi  r30, 0x10
/* 0A4C4C 800AA1EC 3BDE0001 */  addi    r30, r30, 1
/* 0A4C50 800AA1F0 4180FFC8 */  blt     lbl_800AA1B8
lbl_800AA1F4:
/* 0A4C54 800AA1F4 4BFFD37D */  bl      PPCHalt
/* 0A4C58 800AA1F8 80010094 */  lwz     r0, 0x94(r1)
/* 0A4C5C 800AA1FC 83E1008C */  lwz     r31, 0x8c(r1)
/* 0A4C60 800AA200 83C10088 */  lwz     r30, 0x88(r1)
/* 0A4C64 800AA204 83A10084 */  lwz     r29, 0x84(r1)
/* 0A4C68 800AA208 83810080 */  lwz     r28, 0x80(r1)
/* 0A4C6C 800AA20C 38210090 */  addi    r1, r1, 0x90
/* 0A4C70 800AA210 7C0803A6 */  mtlr    r0
/* 0A4C74 800AA214 4E800020 */  blr     

glabel OSSetErrorHandler
/* 0A4C78 800AA218 7C0802A6 */  mflr    r0
/* 0A4C7C 800AA21C 90010004 */  stw     r0, 4(r1)
/* 0A4C80 800AA220 9421FFD0 */  stwu    r1, -0x30(r1)
/* 0A4C84 800AA224 93E1002C */  stw     r31, 0x2c(r1)
/* 0A4C88 800AA228 93C10028 */  stw     r30, 0x28(r1)
/* 0A4C8C 800AA22C 93A10024 */  stw     r29, 0x24(r1)
/* 0A4C90 800AA230 3BA30000 */  addi    r29, r3, 0
/* 0A4C94 800AA234 93810020 */  stw     r28, 0x20(r1)
/* 0A4C98 800AA238 3B840000 */  addi    r28, r4, 0
/* 0A4C9C 800AA23C 48000535 */  bl      OSDisableInterrupts
/* 0A4CA0 800AA240 3C808014 */  lis     r4, __OSErrorTable@ha
/* 0A4CA4 800AA244 57A513BA */  rlwinm  r5, r29, 2, 0xe, 0x1d
/* 0A4CA8 800AA248 38040C70 */  addi    r0, r4, __OSErrorTable@l
/* 0A4CAC 800AA24C 57A6043E */  clrlwi  r6, r29, 0x10
/* 0A4CB0 800AA250 7C802A14 */  add     r4, r0, r5
/* 0A4CB4 800AA254 83C40000 */  lwz     r30, 0(r4)
/* 0A4CB8 800AA258 28060010 */  cmplwi  r6, 0x10
/* 0A4CBC 800AA25C 7C7D1B78 */  mr      r29, r3
/* 0A4CC0 800AA260 93840000 */  stw     r28, 0(r4)
/* 0A4CC4 800AA264 408201A0 */  bne     lbl_800AA404
/* 0A4CC8 800AA268 4BFFD2C9 */  bl      PPCMfmsr
/* 0A4CCC 800AA26C 3BE30000 */  addi    r31, r3, 0
/* 0A4CD0 800AA270 63E32000 */  ori     r3, r31, 0x2000
/* 0A4CD4 800AA274 4BFFD2C5 */  bl      PPCMtmsr
/* 0A4CD8 800AA278 4BFFD33D */  bl      PPCMffpscr
/* 0A4CDC 800AA27C 281C0000 */  cmplwi  r28, 0
/* 0A4CE0 800AA280 41820118 */  beq     lbl_800AA398
/* 0A4CE4 800AA284 3CA08000 */  lis     r5, 0x8000
/* 0A4CE8 800AA288 3C806006 */  lis     r4, 0x6006
/* 0A4CEC 800AA28C 80C500DC */  lwz     r6, 0xdc(r5)
/* 0A4CF0 800AA290 3884F8FF */  addi    r4, r4, -1793
/* 0A4CF4 800AA294 480000E8 */  b       lbl_800AA37C
lbl_800AA298:
/* 0A4CF8 800AA298 8006019C */  lwz     r0, 0x19c(r6)
/* 0A4CFC 800AA29C 60000900 */  ori     r0, r0, 0x900
/* 0A4D00 800AA2A0 9006019C */  stw     r0, 0x19c(r6)
/* 0A4D04 800AA2A4 A0A601A2 */  lhz     r5, 0x1a2(r6)
/* 0A4D08 800AA2A8 54A007FF */  clrlwi. r0, r5, 0x1f
/* 0A4D0C 800AA2AC 408200AC */  bne     lbl_800AA358
/* 0A4D10 800AA2B0 60A50001 */  ori     r5, r5, 1
/* 0A4D14 800AA2B4 38000004 */  li      r0, 4
/* 0A4D18 800AA2B8 B0A601A2 */  sth     r5, 0x1a2(r6)
/* 0A4D1C 800AA2BC 7C0903A6 */  mtctr   r0
/* 0A4D20 800AA2C0 38A60000 */  addi    r5, r6, 0
lbl_800AA2C4:
/* 0A4D24 800AA2C4 3800FFFF */  li      r0, -1
/* 0A4D28 800AA2C8 90050094 */  stw     r0, 0x94(r5)
/* 0A4D2C 800AA2CC 90050090 */  stw     r0, 0x90(r5)
/* 0A4D30 800AA2D0 900501CC */  stw     r0, 0x1cc(r5)
/* 0A4D34 800AA2D4 900501C8 */  stw     r0, 0x1c8(r5)
/* 0A4D38 800AA2D8 9005009C */  stw     r0, 0x9c(r5)
/* 0A4D3C 800AA2DC 90050098 */  stw     r0, 0x98(r5)
/* 0A4D40 800AA2E0 900501D4 */  stw     r0, 0x1d4(r5)
/* 0A4D44 800AA2E4 900501D0 */  stw     r0, 0x1d0(r5)
/* 0A4D48 800AA2E8 900500A4 */  stw     r0, 0xa4(r5)
/* 0A4D4C 800AA2EC 900500A0 */  stw     r0, 0xa0(r5)
/* 0A4D50 800AA2F0 900501DC */  stw     r0, 0x1dc(r5)
/* 0A4D54 800AA2F4 900501D8 */  stw     r0, 0x1d8(r5)
/* 0A4D58 800AA2F8 900500AC */  stw     r0, 0xac(r5)
/* 0A4D5C 800AA2FC 900500A8 */  stw     r0, 0xa8(r5)
/* 0A4D60 800AA300 900501E4 */  stw     r0, 0x1e4(r5)
/* 0A4D64 800AA304 900501E0 */  stw     r0, 0x1e0(r5)
/* 0A4D68 800AA308 900500B4 */  stw     r0, 0xb4(r5)
/* 0A4D6C 800AA30C 900500B0 */  stw     r0, 0xb0(r5)
/* 0A4D70 800AA310 900501EC */  stw     r0, 0x1ec(r5)
/* 0A4D74 800AA314 900501E8 */  stw     r0, 0x1e8(r5)
/* 0A4D78 800AA318 900500BC */  stw     r0, 0xbc(r5)
/* 0A4D7C 800AA31C 900500B8 */  stw     r0, 0xb8(r5)
/* 0A4D80 800AA320 900501F4 */  stw     r0, 0x1f4(r5)
/* 0A4D84 800AA324 900501F0 */  stw     r0, 0x1f0(r5)
/* 0A4D88 800AA328 900500C4 */  stw     r0, 0xc4(r5)
/* 0A4D8C 800AA32C 900500C0 */  stw     r0, 0xc0(r5)
/* 0A4D90 800AA330 900501FC */  stw     r0, 0x1fc(r5)
/* 0A4D94 800AA334 900501F8 */  stw     r0, 0x1f8(r5)
/* 0A4D98 800AA338 900500CC */  stw     r0, 0xcc(r5)
/* 0A4D9C 800AA33C 900500C8 */  stw     r0, 0xc8(r5)
/* 0A4DA0 800AA340 90050204 */  stw     r0, 0x204(r5)
/* 0A4DA4 800AA344 90050200 */  stw     r0, 0x200(r5)
/* 0A4DA8 800AA348 38A50040 */  addi    r5, r5, 0x40
/* 0A4DAC 800AA34C 4200FF78 */  bdnz    lbl_800AA2C4
/* 0A4DB0 800AA350 38000004 */  li      r0, 4
/* 0A4DB4 800AA354 90060194 */  stw     r0, 0x194(r6)
lbl_800AA358:
/* 0A4DB8 800AA358 800D8D10 */  lwz     r0, __OSFpscrEnableBits-_SDA_BASE_(r13)
/* 0A4DBC 800AA35C 80A60194 */  lwz     r5, 0x194(r6)
/* 0A4DC0 800AA360 54000638 */  rlwinm  r0, r0, 0, 0x18, 0x1c
/* 0A4DC4 800AA364 7CA00378 */  or      r0, r5, r0
/* 0A4DC8 800AA368 90060194 */  stw     r0, 0x194(r6)
/* 0A4DCC 800AA36C 80060194 */  lwz     r0, 0x194(r6)
/* 0A4DD0 800AA370 7C002038 */  and     r0, r0, r4
/* 0A4DD4 800AA374 90060194 */  stw     r0, 0x194(r6)
/* 0A4DD8 800AA378 80C602FC */  lwz     r6, 0x2fc(r6)
lbl_800AA37C:
/* 0A4DDC 800AA37C 28060000 */  cmplwi  r6, 0
/* 0A4DE0 800AA380 4082FF18 */  bne     lbl_800AA298
/* 0A4DE4 800AA384 800D8D10 */  lwz     r0, __OSFpscrEnableBits-_SDA_BASE_(r13)
/* 0A4DE8 800AA388 63FF0900 */  ori     r31, r31, 0x900
/* 0A4DEC 800AA38C 54000638 */  rlwinm  r0, r0, 0, 0x18, 0x1c
/* 0A4DF0 800AA390 7C630378 */  or      r3, r3, r0
/* 0A4DF4 800AA394 48000058 */  b       lbl_800AA3EC
lbl_800AA398:
/* 0A4DF8 800AA398 3CA08000 */  lis     r5, 0x8000
/* 0A4DFC 800AA39C 3C806006 */  lis     r4, 0x6006
/* 0A4E00 800AA3A0 80C500DC */  lwz     r6, 0xdc(r5)
/* 0A4E04 800AA3A4 3884F8FF */  addi    r4, r4, -1793
/* 0A4E08 800AA3A8 38A0F6FF */  li      r5, -2305
/* 0A4E0C 800AA3AC 4800002C */  b       lbl_800AA3D8
lbl_800AA3B0:
/* 0A4E10 800AA3B0 8006019C */  lwz     r0, 0x19c(r6)
/* 0A4E14 800AA3B4 7C002838 */  and     r0, r0, r5
/* 0A4E18 800AA3B8 9006019C */  stw     r0, 0x19c(r6)
/* 0A4E1C 800AA3BC 80060194 */  lwz     r0, 0x194(r6)
/* 0A4E20 800AA3C0 5400076E */  rlwinm  r0, r0, 0, 0x1d, 0x17
/* 0A4E24 800AA3C4 90060194 */  stw     r0, 0x194(r6)
/* 0A4E28 800AA3C8 80060194 */  lwz     r0, 0x194(r6)
/* 0A4E2C 800AA3CC 7C002038 */  and     r0, r0, r4
/* 0A4E30 800AA3D0 90060194 */  stw     r0, 0x194(r6)
/* 0A4E34 800AA3D4 80C602FC */  lwz     r6, 0x2fc(r6)
lbl_800AA3D8:
/* 0A4E38 800AA3D8 28060000 */  cmplwi  r6, 0
/* 0A4E3C 800AA3DC 4082FFD4 */  bne     lbl_800AA3B0
/* 0A4E40 800AA3E0 3800F6FF */  li      r0, -2305
/* 0A4E44 800AA3E4 5463076E */  rlwinm  r3, r3, 0, 0x1d, 0x17
/* 0A4E48 800AA3E8 7FFF0038 */  and     r31, r31, r0
lbl_800AA3EC:
/* 0A4E4C 800AA3EC 3C806006 */  lis     r4, 0x6006
/* 0A4E50 800AA3F0 3804F8FF */  addi    r0, r4, -1793
/* 0A4E54 800AA3F4 7C630038 */  and     r3, r3, r0
/* 0A4E58 800AA3F8 4BFFD1DD */  bl      PPCMtfpscr
/* 0A4E5C 800AA3FC 7FE3FB78 */  mr      r3, r31
/* 0A4E60 800AA400 4BFFD139 */  bl      PPCMtmsr
lbl_800AA404:
/* 0A4E64 800AA404 7FA3EB78 */  mr      r3, r29
/* 0A4E68 800AA408 48000391 */  bl      OSRestoreInterrupts
/* 0A4E6C 800AA40C 7FC3F378 */  mr      r3, r30
/* 0A4E70 800AA410 80010034 */  lwz     r0, 0x34(r1)
/* 0A4E74 800AA414 83E1002C */  lwz     r31, 0x2c(r1)
/* 0A4E78 800AA418 83C10028 */  lwz     r30, 0x28(r1)
/* 0A4E7C 800AA41C 83A10024 */  lwz     r29, 0x24(r1)
/* 0A4E80 800AA420 83810020 */  lwz     r28, 0x20(r1)
/* 0A4E84 800AA424 38210030 */  addi    r1, r1, 0x30
/* 0A4E88 800AA428 7C0803A6 */  mtlr    r0
/* 0A4E8C 800AA42C 4E800020 */  blr     

glabel __OSUnhandledException
/* 0A4E90 800AA430 7C0802A6 */  mflr    r0
/* 0A4E94 800AA434 3D008014 */  lis     r8, __OSErrorTable@ha
/* 0A4E98 800AA438 90010004 */  stw     r0, 4(r1)
/* 0A4E9C 800AA43C 3CE08010 */  lis     r7, D_800FF0A0@ha
/* 0A4EA0 800AA440 9421FFC0 */  stwu    r1, -0x40(r1)
/* 0A4EA4 800AA444 BEC10018 */  stmw    r22, 0x18(r1)
/* 0A4EA8 800AA448 3B030000 */  addi    r24, r3, 0
/* 0A4EAC 800AA44C 3B240000 */  addi    r25, r4, 0
/* 0A4EB0 800AA450 3B450000 */  addi    r26, r5, 0
/* 0A4EB4 800AA454 3B660000 */  addi    r27, r6, 0
/* 0A4EB8 800AA458 3BC80C70 */  addi    r30, r8, __OSErrorTable@l
/* 0A4EBC 800AA45C 3BE7F0A0 */  addi    r31, r7, D_800FF0A0@l
/* 0A4EC0 800AA460 480038BD */  bl      OSGetTime
/* 0A4EC4 800AA464 80B9019C */  lwz     r5, 0x19c(r25)
/* 0A4EC8 800AA468 3B840000 */  addi    r28, r4, 0
/* 0A4ECC 800AA46C 3BA30000 */  addi    r29, r3, 0
/* 0A4ED0 800AA470 54A007BD */  rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 0A4ED4 800AA474 40820018 */  bne     lbl_800AA48C
/* 0A4ED8 800AA478 387F005C */  addi    r3, r31, 0x5c
/* 0A4EDC 800AA47C 4CC63182 */  crclr   6
/* 0A4EE0 800AA480 5704063E */  clrlwi  r4, r24, 0x18
/* 0A4EE4 800AA484 4BFFFBE9 */  bl      OSReport
/* 0A4EE8 800AA488 48000154 */  b       lbl_800AA5DC
lbl_800AA48C:
/* 0A4EEC 800AA48C 5700063E */  clrlwi  r0, r24, 0x18
/* 0A4EF0 800AA490 28000006 */  cmplwi  r0, 6
/* 0A4EF4 800AA494 408200D8 */  bne     lbl_800AA56C
/* 0A4EF8 800AA498 54A002D7 */  rlwinm. r0, r5, 0, 0xb, 0xb
/* 0A4EFC 800AA49C 418200D0 */  beq     lbl_800AA56C
/* 0A4F00 800AA4A0 801E0040 */  lwz     r0, 0x40(r30)
/* 0A4F04 800AA4A4 28000000 */  cmplwi  r0, 0
/* 0A4F08 800AA4A8 418200C4 */  beq     lbl_800AA56C
/* 0A4F0C 800AA4AC 3B000010 */  li      r24, 0x10
/* 0A4F10 800AA4B0 4BFFD081 */  bl      PPCMfmsr
/* 0A4F14 800AA4B4 3AE30000 */  addi    r23, r3, 0
/* 0A4F18 800AA4B8 62E32000 */  ori     r3, r23, 0x2000
/* 0A4F1C 800AA4BC 4BFFD07D */  bl      PPCMtmsr
/* 0A4F20 800AA4C0 3C608000 */  lis     r3, 0x8000
/* 0A4F24 800AA4C4 806300D8 */  lwz     r3, 0xd8(r3)
/* 0A4F28 800AA4C8 28030000 */  cmplwi  r3, 0
/* 0A4F2C 800AA4CC 41820008 */  beq     lbl_800AA4D4
/* 0A4F30 800AA4D0 4BFFF579 */  bl      OSSaveFPUContext
lbl_800AA4D4:
/* 0A4F34 800AA4D4 4BFFD0E1 */  bl      PPCMffpscr
/* 0A4F38 800AA4D8 3C806006 */  lis     r4, 0x6006
/* 0A4F3C 800AA4DC 3AC4F8FF */  addi    r22, r4, -1793
/* 0A4F40 800AA4E0 7C63B038 */  and     r3, r3, r22
/* 0A4F44 800AA4E4 4BFFD0F1 */  bl      PPCMtfpscr
/* 0A4F48 800AA4E8 7EE3BB78 */  mr      r3, r23
/* 0A4F4C 800AA4EC 4BFFD04D */  bl      PPCMtmsr
/* 0A4F50 800AA4F0 3EE08000 */  lis     r23, 0x8000
/* 0A4F54 800AA4F4 801700D8 */  lwz     r0, 0xd8(r23)
/* 0A4F58 800AA4F8 7C00C840 */  cmplw   r0, r25
/* 0A4F5C 800AA4FC 40820054 */  bne     lbl_800AA550
/* 0A4F60 800AA500 480027C5 */  bl      OSDisableScheduler
/* 0A4F64 800AA504 819E0040 */  lwz     r12, 0x40(r30)
/* 0A4F68 800AA508 38990000 */  addi    r4, r25, 0
/* 0A4F6C 800AA50C 38BA0000 */  addi    r5, r26, 0
/* 0A4F70 800AA510 4CC63182 */  crclr   6
/* 0A4F74 800AA514 7D8803A6 */  mtlr    r12
/* 0A4F78 800AA518 38DB0000 */  addi    r6, r27, 0
/* 0A4F7C 800AA51C 38600010 */  li      r3, 0x10
/* 0A4F80 800AA520 4E800021 */  blrl    
/* 0A4F84 800AA524 8079019C */  lwz     r3, 0x19c(r25)
/* 0A4F88 800AA528 38000000 */  li      r0, 0
/* 0A4F8C 800AA52C 546304E2 */  rlwinm  r3, r3, 0, 0x13, 0x11
/* 0A4F90 800AA530 9079019C */  stw     r3, 0x19c(r25)
/* 0A4F94 800AA534 901700D8 */  stw     r0, 0xd8(r23)
/* 0A4F98 800AA538 80190194 */  lwz     r0, 0x194(r25)
/* 0A4F9C 800AA53C 7C00B038 */  and     r0, r0, r22
/* 0A4FA0 800AA540 90190194 */  stw     r0, 0x194(r25)
/* 0A4FA4 800AA544 480027C1 */  bl      OSEnableScheduler
/* 0A4FA8 800AA548 48002C89 */  bl      __OSReschedule
/* 0A4FAC 800AA54C 48000018 */  b       lbl_800AA564
lbl_800AA550:
/* 0A4FB0 800AA550 8079019C */  lwz     r3, 0x19c(r25)
/* 0A4FB4 800AA554 38000000 */  li      r0, 0
/* 0A4FB8 800AA558 546304E2 */  rlwinm  r3, r3, 0, 0x13, 0x11
/* 0A4FBC 800AA55C 9079019C */  stw     r3, 0x19c(r25)
/* 0A4FC0 800AA560 901700D8 */  stw     r0, 0xd8(r23)
lbl_800AA564:
/* 0A4FC4 800AA564 7F23CB78 */  mr      r3, r25
/* 0A4FC8 800AA568 4BFFF5D1 */  bl      OSLoadContext
lbl_800AA56C:
/* 0A4FCC 800AA56C 5717063E */  clrlwi  r23, r24, 0x18
/* 0A4FD0 800AA570 570015BA */  rlwinm  r0, r24, 2, 0x16, 0x1d
/* 0A4FD4 800AA574 7EDE0214 */  add     r22, r30, r0
/* 0A4FD8 800AA578 80160000 */  lwz     r0, 0(r22)
/* 0A4FDC 800AA57C 28000000 */  cmplwi  r0, 0
/* 0A4FE0 800AA580 41820038 */  beq     lbl_800AA5B8
/* 0A4FE4 800AA584 48002741 */  bl      OSDisableScheduler
/* 0A4FE8 800AA588 81960000 */  lwz     r12, 0(r22)
/* 0A4FEC 800AA58C 38770000 */  addi    r3, r23, 0
/* 0A4FF0 800AA590 38990000 */  addi    r4, r25, 0
/* 0A4FF4 800AA594 4CC63182 */  crclr   6
/* 0A4FF8 800AA598 7D8803A6 */  mtlr    r12
/* 0A4FFC 800AA59C 38BA0000 */  addi    r5, r26, 0
/* 0A5000 800AA5A0 38DB0000 */  addi    r6, r27, 0
/* 0A5004 800AA5A4 4E800021 */  blrl    
/* 0A5008 800AA5A8 4800275D */  bl      OSEnableScheduler
/* 0A500C 800AA5AC 48002C25 */  bl      __OSReschedule
/* 0A5010 800AA5B0 7F23CB78 */  mr      r3, r25
/* 0A5014 800AA5B4 4BFFF585 */  bl      OSLoadContext
lbl_800AA5B8:
/* 0A5018 800AA5B8 5700063E */  clrlwi  r0, r24, 0x18
/* 0A501C 800AA5BC 28000008 */  cmplwi  r0, 8
/* 0A5020 800AA5C0 4082000C */  bne     lbl_800AA5CC
/* 0A5024 800AA5C4 7F23CB78 */  mr      r3, r25
/* 0A5028 800AA5C8 4BFFF571 */  bl      OSLoadContext
lbl_800AA5CC:
/* 0A502C 800AA5CC 387F007C */  addi    r3, r31, 0x7c
/* 0A5030 800AA5D0 4CC63182 */  crclr   6
/* 0A5034 800AA5D4 5704063E */  clrlwi  r4, r24, 0x18
/* 0A5038 800AA5D8 4BFFFA95 */  bl      OSReport
lbl_800AA5DC:
/* 0A503C 800AA5DC 386D8D14 */  addi    r3, r13, D_801456F4-_SDA_BASE_
/* 0A5040 800AA5E0 4CC63182 */  crclr   6
/* 0A5044 800AA5E4 4BFFFA89 */  bl      OSReport
/* 0A5048 800AA5E8 7F23CB78 */  mr      r3, r25
/* 0A504C 800AA5EC 4BFFF70D */  bl      OSDumpContext
/* 0A5050 800AA5F0 389A0000 */  addi    r4, r26, 0
/* 0A5054 800AA5F4 4CC63182 */  crclr   6
/* 0A5058 800AA5F8 38BB0000 */  addi    r5, r27, 0
/* 0A505C 800AA5FC 387F0094 */  addi    r3, r31, 0x94
/* 0A5060 800AA600 4BFFFA6D */  bl      OSReport
/* 0A5064 800AA604 38DC0000 */  addi    r6, r28, 0
/* 0A5068 800AA608 4CC63182 */  crclr   6
/* 0A506C 800AA60C 38BD0000 */  addi    r5, r29, 0
/* 0A5070 800AA610 387F00C8 */  addi    r3, r31, 0xc8
/* 0A5074 800AA614 4BFFFA59 */  bl      OSReport
/* 0A5078 800AA618 5700063E */  clrlwi  r0, r24, 0x18
/* 0A507C 800AA61C 2800000F */  cmplwi  r0, 0xf
/* 0A5080 800AA620 418100C4 */  bgt     lbl_800AA6E4
/* 0A5084 800AA624 3C608010 */  lis     r3, jtbl_800FF37C@ha
/* 0A5088 800AA628 3863F37C */  addi    r3, r3, jtbl_800FF37C@l
/* 0A508C 800AA62C 5400103A */  slwi    r0, r0, 2
/* 0A5090 800AA630 7C03002E */  lwzx    r0, r3, r0
/* 0A5094 800AA634 7C0903A6 */  mtctr   r0
/* 0A5098 800AA638 4E800420 */  bctr    
glabel lbl_800AA63C
/* 0A509C 800AA63C 80990198 */  lwz     r4, 0x198(r25)
/* 0A50A0 800AA640 38BB0000 */  addi    r5, r27, 0
/* 0A50A4 800AA644 387F00D8 */  addi    r3, r31, 0xd8
/* 0A50A8 800AA648 4CC63182 */  crclr   6
/* 0A50AC 800AA64C 4BFFFA21 */  bl      OSReport
/* 0A50B0 800AA650 48000094 */  b       lbl_800AA6E4
glabel lbl_800AA654
/* 0A50B4 800AA654 80990198 */  lwz     r4, 0x198(r25)
/* 0A50B8 800AA658 387F0138 */  addi    r3, r31, 0x138
/* 0A50BC 800AA65C 4CC63182 */  crclr   6
/* 0A50C0 800AA660 4BFFFA0D */  bl      OSReport
/* 0A50C4 800AA664 48000080 */  b       lbl_800AA6E4
glabel lbl_800AA668
/* 0A50C8 800AA668 80990198 */  lwz     r4, 0x198(r25)
/* 0A50CC 800AA66C 38BB0000 */  addi    r5, r27, 0
/* 0A50D0 800AA670 387F0184 */  addi    r3, r31, 0x184
/* 0A50D4 800AA674 4CC63182 */  crclr   6
/* 0A50D8 800AA678 4BFFF9F5 */  bl      OSReport
/* 0A50DC 800AA67C 48000068 */  b       lbl_800AA6E4
glabel lbl_800AA680
/* 0A50E0 800AA680 80990198 */  lwz     r4, 0x198(r25)
/* 0A50E4 800AA684 38BB0000 */  addi    r5, r27, 0
/* 0A50E8 800AA688 387F01E8 */  addi    r3, r31, 0x1e8
/* 0A50EC 800AA68C 4CC63182 */  crclr   6
/* 0A50F0 800AA690 4BFFF9DD */  bl      OSReport
/* 0A50F4 800AA694 48000050 */  b       lbl_800AA6E4
glabel lbl_800AA698
/* 0A50F8 800AA698 386D8D14 */  addi    r3, r13, D_801456F4-_SDA_BASE_
/* 0A50FC 800AA69C 4CC63182 */  crclr   6
/* 0A5100 800AA6A0 4BFFF9CD */  bl      OSReport
/* 0A5104 800AA6A4 3F20CC00 */  lis     r25, 0xcc00
/* 0A5108 800AA6A8 4CC63182 */  crclr   6
/* 0A510C 800AA6AC 3B195000 */  addi    r24, r25, 0x5000
/* 0A5110 800AA6B0 A0995030 */  lhz     r4, 0x5030(r25)
/* 0A5114 800AA6B4 387F0248 */  addi    r3, r31, 0x248
/* 0A5118 800AA6B8 A0B95032 */  lhz     r5, 0x5032(r25)
/* 0A511C 800AA6BC 4BFFF9B1 */  bl      OSReport
/* 0A5120 800AA6C0 A0980020 */  lhz     r4, 0x20(r24)
/* 0A5124 800AA6C4 387F0268 */  addi    r3, r31, 0x268
/* 0A5128 800AA6C8 A0B80022 */  lhz     r5, 0x22(r24)
/* 0A512C 800AA6CC 4CC63182 */  crclr   6
/* 0A5130 800AA6D0 4BFFF99D */  bl      OSReport
/* 0A5134 800AA6D4 80996014 */  lwz     r4, 0x6014(r25)
/* 0A5138 800AA6D8 4CC63182 */  crclr   6
/* 0A513C 800AA6DC 387F0288 */  addi    r3, r31, 0x288
/* 0A5140 800AA6E0 4BFFF98D */  bl      OSReport
glabel lbl_800AA6E4
/* 0A5144 800AA6E4 A88D9120 */  lha     r4, __OSLastInterrupt-_SDA_BASE_(r13)
/* 0A5148 800AA6E8 387F02A4 */  addi    r3, r31, 0x2a4
/* 0A514C 800AA6EC 4CC63182 */  crclr   6
/* 0A5150 800AA6F0 80AD911C */  lwz     r5, __OSLastInterruptSrr0-_SDA_BASE_(r13)
/* 0A5154 800AA6F4 80ED9128 */  lwz     r7, __OSLastInterruptTime-_SDA_BASE_(r13)
/* 0A5158 800AA6F8 810D912C */  lwz     r8, (__OSLastInterruptTime + 4)-_SDA_BASE_(r13)
/* 0A515C 800AA6FC 4BFFF971 */  bl      OSReport
/* 0A5160 800AA700 4BFFCE71 */  bl      PPCHalt
/* 0A5164 800AA704 BAC10018 */  lmw     r22, 0x18(r1)
/* 0A5168 800AA708 80010044 */  lwz     r0, 0x44(r1)
/* 0A516C 800AA70C 38210040 */  addi    r1, r1, 0x40
/* 0A5170 800AA710 7C0803A6 */  mtlr    r0
/* 0A5174 800AA714 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FC120 800FF0A0 0016 */
D_800FF0A0:
    .asciz " in \"%s\" on line %d.\n"

.balign 4

/* 000FC138 800FF0B8 0026 */
D_800FF0B8:
    .asciz "\nAddress:      Back Chain    LR Save\n"

.balign 4

/* 000FC160 800FF0E0 001C */
D_800FF0E0:
    .asciz "0x%08x:   0x%08x    0x%08x\n"

.balign 4

/* 000FC17C 800FF0FC 001D */
D_800FF0FC:
    .asciz "Non-recoverable Exception %d"

.balign 4

/* 000FC19C 800FF11C 0017 */
D_800FF11C:
    .asciz "Unhandled Exception %d"

.balign 4

/* 000FC1B4 800FF134 0031 */
D_800FF134:
    .asciz "\nDSISR = 0x%08x                   DAR  = 0x%08x\n"

.balign 4

/* 000FC1E8 800FF168 0010 */
D_800FF168:
    .asciz "TB = 0x%016llx\n"

.balign 4

/* 000FC1F8 800FF178 0060 */
D_800FF178:
    .asciz "\nInstruction at 0x%x (read from SRR0) attempted to access invalid address 0x%x (read from DAR)\n"

.balign 4

/* 000FC258 800FF1D8 004C */
D_800FF1D8:
    .asciz "\nAttempted to fetch instruction from invalid address 0x%x (read from SRR0)\n"

.balign 4

/* 000FC2A4 800FF224 0062 */
D_800FF224:
    .asciz "\nInstruction at 0x%x (read from SRR0) attempted to access unaligned address 0x%x (read from DAR)\n"

.balign 4

/* 000FC308 800FF288 0060 */
D_800FF288:
    .asciz "\nProgram exception : Possible illegal instruction/operation at or around 0x%x (read from SRR0)\n"

.balign 4

/* 000FC368 800FF2E8 001F */
D_800FF2E8:
    .asciz "AI DMA Address =   0x%04x%04x\n"

.balign 4

/* 000FC388 800FF308 001F */
D_800FF308:
    .asciz "ARAM DMA Address = 0x%04x%04x\n"

.balign 4

/* 000FC3A8 800FF328 001B */
D_800FF328:
    .asciz "DI DMA Address =   0x%08x\n"

.balign 4

/* 000FC3C4 800FF344 0035 */
D_800FF344:
    .asciz "\nLast interrupt (%d): SRR0 = 0x%08x  TB = 0x%016llx\n"

.balign 4

/* 000FC3FC 800FF37C 0040 */
jtbl_800FF37C:
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA63C
    .long lbl_800AA654
    .long lbl_800AA6E4
    .long lbl_800AA668
    .long lbl_800AA680
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA6E4
    .long lbl_800AA698


.section .bss, "wa"

.balign 4

/* 0013DCF0 80140C70 0044 */
glabel __OSErrorTable
    .skip 68


.section .sdata, "wa"

.balign 8

/* 000FFF50 801456F0 0004 */
glabel __OSFpscrEnableBits
    .long 0x000000F8

.balign 4

/* 000FFF54 801456F4 0002 */
D_801456F4:
    .asciz "\n"


