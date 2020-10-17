# GXFifo.c
.include "macros.inc"

.section .text, "ax"

.balign 4

GXCPInterruptHandler:
/* 0AFAD8 800B5078 7C0802A6 */  mflr    r0
/* 0AFADC 800B507C 90010004 */  stw     r0, 4(r1)
/* 0AFAE0 800B5080 9421FD20 */  stwu    r1, -0x2e0(r1)
/* 0AFAE4 800B5084 93E102DC */  stw     r31, 0x2dc(r1)
/* 0AFAE8 800B5088 7C9F2378 */  mr      r31, r4
/* 0AFAEC 800B508C 80AD9224 */  lwz     r5, __cpReg-_SDA_BASE_(r13)
/* 0AFAF0 800B5090 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0AFAF4 800B5094 A0050000 */  lhz     r0, 0(r5)
/* 0AFAF8 800B5098 9003000C */  stw     r0, 0xc(r3)
/* 0AFAFC 800B509C 80030008 */  lwz     r0, 8(r3)
/* 0AFB00 800B50A0 5400EFFF */  rlwinm. r0, r0, 0x1d, 0x1f, 0x1f
/* 0AFB04 800B50A4 41820038 */  beq     lbl_800B50DC
/* 0AFB08 800B50A8 8003000C */  lwz     r0, 0xc(r3)
/* 0AFB0C 800B50AC 5400FFFF */  rlwinm. r0, r0, 0x1f, 0x1f, 0x1f
/* 0AFB10 800B50B0 4182002C */  beq     lbl_800B50DC
/* 0AFB14 800B50B4 806D9250 */  lwz     r3, __GXCurrentThread-_SDA_BASE_(r13)
/* 0AFB18 800B50B8 4BFF85D1 */  bl      OSResumeThread
/* 0AFB1C 800B50BC 38000000 */  li      r0, 0
/* 0AFB20 800B50C0 900D9258 */  stw     r0, GXOverflowSuspendInProgress-_SDA_BASE_(r13)
/* 0AFB24 800B50C4 38600001 */  li      r3, 1
/* 0AFB28 800B50C8 38800001 */  li      r4, 1
/* 0AFB2C 800B50CC 48000605 */  bl      __GXWriteFifoIntReset
/* 0AFB30 800B50D0 38600001 */  li      r3, 1
/* 0AFB34 800B50D4 38800000 */  li      r4, 0
/* 0AFB38 800B50D8 480005C9 */  bl      __GXWriteFifoIntEnable
lbl_800B50DC:
/* 0AFB3C 800B50DC 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0AFB40 800B50E0 80030008 */  lwz     r0, 8(r3)
/* 0AFB44 800B50E4 5400F7FF */  rlwinm. r0, r0, 0x1e, 0x1f, 0x1f
/* 0AFB48 800B50E8 41820044 */  beq     lbl_800B512C
/* 0AFB4C 800B50EC 8003000C */  lwz     r0, 0xc(r3)
/* 0AFB50 800B50F0 540007FF */  clrlwi. r0, r0, 0x1f
/* 0AFB54 800B50F4 41820038 */  beq     lbl_800B512C
/* 0AFB58 800B50F8 80AD9260 */  lwz     r5, __GXOverflowCount-_SDA_BASE_(r13)
/* 0AFB5C 800B50FC 38600000 */  li      r3, 0
/* 0AFB60 800B5100 38800001 */  li      r4, 1
/* 0AFB64 800B5104 38050001 */  addi    r0, r5, 1
/* 0AFB68 800B5108 900D9260 */  stw     r0, __GXOverflowCount-_SDA_BASE_(r13)
/* 0AFB6C 800B510C 48000595 */  bl      __GXWriteFifoIntEnable
/* 0AFB70 800B5110 38600001 */  li      r3, 1
/* 0AFB74 800B5114 38800000 */  li      r4, 0
/* 0AFB78 800B5118 480005B9 */  bl      __GXWriteFifoIntReset
/* 0AFB7C 800B511C 38000001 */  li      r0, 1
/* 0AFB80 800B5120 806D9250 */  lwz     r3, __GXCurrentThread-_SDA_BASE_(r13)
/* 0AFB84 800B5124 900D9258 */  stw     r0, GXOverflowSuspendInProgress-_SDA_BASE_(r13)
/* 0AFB88 800B5128 4BFF87E9 */  bl      OSSuspendThread
lbl_800B512C:
/* 0AFB8C 800B512C 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0AFB90 800B5130 80830008 */  lwz     r4, 8(r3)
/* 0AFB94 800B5134 5480DFFF */  rlwinm. r0, r4, 0x1b, 0x1f, 0x1f
/* 0AFB98 800B5138 41820060 */  beq     lbl_800B5198
/* 0AFB9C 800B513C 8003000C */  lwz     r0, 0xc(r3)
/* 0AFBA0 800B5140 5400E7FF */  rlwinm. r0, r0, 0x1c, 0x1f, 0x1f
/* 0AFBA4 800B5144 41820054 */  beq     lbl_800B5198
/* 0AFBA8 800B5148 38000000 */  li      r0, 0
/* 0AFBAC 800B514C 50042EB4 */  rlwimi  r4, r0, 5, 0x1a, 0x1a
/* 0AFBB0 800B5150 90830008 */  stw     r4, 8(r3)
/* 0AFBB4 800B5154 80030008 */  lwz     r0, 8(r3)
/* 0AFBB8 800B5158 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFBBC 800B515C B0030002 */  sth     r0, 2(r3)
/* 0AFBC0 800B5160 800D925C */  lwz     r0, BreakPointCB-_SDA_BASE_(r13)
/* 0AFBC4 800B5164 28000000 */  cmplwi  r0, 0
/* 0AFBC8 800B5168 41820030 */  beq     lbl_800B5198
/* 0AFBCC 800B516C 38610010 */  addi    r3, r1, 0x10
/* 0AFBD0 800B5170 4BFF4AA9 */  bl      OSClearContext
/* 0AFBD4 800B5174 38610010 */  addi    r3, r1, 0x10
/* 0AFBD8 800B5178 4BFF48D9 */  bl      OSSetCurrentContext
/* 0AFBDC 800B517C 818D925C */  lwz     r12, BreakPointCB-_SDA_BASE_(r13)
/* 0AFBE0 800B5180 7D8803A6 */  mtlr    r12
/* 0AFBE4 800B5184 4E800021 */  blrl    
/* 0AFBE8 800B5188 38610010 */  addi    r3, r1, 0x10
/* 0AFBEC 800B518C 4BFF4A8D */  bl      OSClearContext
/* 0AFBF0 800B5190 7FE3FB78 */  mr      r3, r31
/* 0AFBF4 800B5194 4BFF48BD */  bl      OSSetCurrentContext
lbl_800B5198:
/* 0AFBF8 800B5198 800102E4 */  lwz     r0, 0x2e4(r1)
/* 0AFBFC 800B519C 83E102DC */  lwz     r31, 0x2dc(r1)
/* 0AFC00 800B51A0 382102E0 */  addi    r1, r1, 0x2e0
/* 0AFC04 800B51A4 7C0803A6 */  mtlr    r0
/* 0AFC08 800B51A8 4E800020 */  blr     

glabel GXInitFifoBase
/* 0AFC0C 800B51AC 7C0802A6 */  mflr    r0
/* 0AFC10 800B51B0 90010004 */  stw     r0, 4(r1)
/* 0AFC14 800B51B4 3805FFFC */  addi    r0, r5, -4
/* 0AFC18 800B51B8 9421FFE0 */  stwu    r1, -0x20(r1)
/* 0AFC1C 800B51BC 93E1001C */  stw     r31, 0x1c(r1)
/* 0AFC20 800B51C0 3BE40000 */  addi    r31, r4, 0
/* 0AFC24 800B51C4 7C1F0214 */  add     r0, r31, r0
/* 0AFC28 800B51C8 93C10018 */  stw     r30, 0x18(r1)
/* 0AFC2C 800B51CC 3BC30000 */  addi    r30, r3, 0
/* 0AFC30 800B51D0 3885C000 */  addi    r4, r5, -16384
/* 0AFC34 800B51D4 93E30000 */  stw     r31, 0(r3)
/* 0AFC38 800B51D8 90030004 */  stw     r0, 4(r3)
/* 0AFC3C 800B51DC 38000000 */  li      r0, 0
/* 0AFC40 800B51E0 90A30008 */  stw     r5, 8(r3)
/* 0AFC44 800B51E4 54A5F874 */  rlwinm  r5, r5, 0x1f, 1, 0x1a
/* 0AFC48 800B51E8 901E001C */  stw     r0, 0x1c(r30)
/* 0AFC4C 800B51EC 4800009D */  bl      GXInitFifoLimits
/* 0AFC50 800B51F0 387E0000 */  addi    r3, r30, 0
/* 0AFC54 800B51F4 389F0000 */  addi    r4, r31, 0
/* 0AFC58 800B51F8 38BF0000 */  addi    r5, r31, 0
/* 0AFC5C 800B51FC 4800001D */  bl      GXInitFifoPtrs
/* 0AFC60 800B5200 80010024 */  lwz     r0, 0x24(r1)
/* 0AFC64 800B5204 83E1001C */  lwz     r31, 0x1c(r1)
/* 0AFC68 800B5208 83C10018 */  lwz     r30, 0x18(r1)
/* 0AFC6C 800B520C 38210020 */  addi    r1, r1, 0x20
/* 0AFC70 800B5210 7C0803A6 */  mtlr    r0
/* 0AFC74 800B5214 4E800020 */  blr     

glabel GXInitFifoPtrs
/* 0AFC78 800B5218 7C0802A6 */  mflr    r0
/* 0AFC7C 800B521C 90010004 */  stw     r0, 4(r1)
/* 0AFC80 800B5220 9421FFD8 */  stwu    r1, -0x28(r1)
/* 0AFC84 800B5224 93E10024 */  stw     r31, 0x24(r1)
/* 0AFC88 800B5228 3BE50000 */  addi    r31, r5, 0
/* 0AFC8C 800B522C 93C10020 */  stw     r30, 0x20(r1)
/* 0AFC90 800B5230 3BC40000 */  addi    r30, r4, 0
/* 0AFC94 800B5234 93A1001C */  stw     r29, 0x1c(r1)
/* 0AFC98 800B5238 3BA30000 */  addi    r29, r3, 0
/* 0AFC9C 800B523C 4BFF5535 */  bl      OSDisableInterrupts
/* 0AFCA0 800B5240 93DD0014 */  stw     r30, 0x14(r29)
/* 0AFCA4 800B5244 7C1EF850 */  subf    r0, r30, r31
/* 0AFCA8 800B5248 93FD0018 */  stw     r31, 0x18(r29)
/* 0AFCAC 800B524C 901D001C */  stw     r0, 0x1c(r29)
/* 0AFCB0 800B5250 809D001C */  lwz     r4, 0x1c(r29)
/* 0AFCB4 800B5254 2C040000 */  cmpwi   r4, 0
/* 0AFCB8 800B5258 40800010 */  bge     lbl_800B5268
/* 0AFCBC 800B525C 801D0008 */  lwz     r0, 8(r29)
/* 0AFCC0 800B5260 7C040214 */  add     r0, r4, r0
/* 0AFCC4 800B5264 901D001C */  stw     r0, 0x1c(r29)
lbl_800B5268:
/* 0AFCC8 800B5268 4BFF5531 */  bl      OSRestoreInterrupts
/* 0AFCCC 800B526C 8001002C */  lwz     r0, 0x2c(r1)
/* 0AFCD0 800B5270 83E10024 */  lwz     r31, 0x24(r1)
/* 0AFCD4 800B5274 83C10020 */  lwz     r30, 0x20(r1)
/* 0AFCD8 800B5278 83A1001C */  lwz     r29, 0x1c(r1)
/* 0AFCDC 800B527C 38210028 */  addi    r1, r1, 0x28
/* 0AFCE0 800B5280 7C0803A6 */  mtlr    r0
/* 0AFCE4 800B5284 4E800020 */  blr     

glabel GXInitFifoLimits
/* 0AFCE8 800B5288 9083000C */  stw     r4, 0xc(r3)
/* 0AFCEC 800B528C 90A30010 */  stw     r5, 0x10(r3)
/* 0AFCF0 800B5290 4E800020 */  blr     

glabel GXSetCPUFifo
/* 0AFCF4 800B5294 7C0802A6 */  mflr    r0
/* 0AFCF8 800B5298 90010004 */  stw     r0, 4(r1)
/* 0AFCFC 800B529C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0AFD00 800B52A0 93E10014 */  stw     r31, 0x14(r1)
/* 0AFD04 800B52A4 93C10010 */  stw     r30, 0x10(r1)
/* 0AFD08 800B52A8 7C7E1B78 */  mr      r30, r3
/* 0AFD0C 800B52AC 4BFF54C5 */  bl      OSDisableInterrupts
/* 0AFD10 800B52B0 800D924C */  lwz     r0, GPFifo-_SDA_BASE_(r13)
/* 0AFD14 800B52B4 3BE30000 */  addi    r31, r3, 0
/* 0AFD18 800B52B8 93CD9248 */  stw     r30, CPUFifo-_SDA_BASE_(r13)
/* 0AFD1C 800B52BC 7C1E0040 */  cmplw   r30, r0
/* 0AFD20 800B52C0 40820070 */  bne     lbl_800B5330
/* 0AFD24 800B52C4 801E0000 */  lwz     r0, 0(r30)
/* 0AFD28 800B52C8 39000000 */  li      r8, 0
/* 0AFD2C 800B52CC 806D9220 */  lwz     r3, __piReg-_SDA_BASE_(r13)
/* 0AFD30 800B52D0 38C00000 */  li      r6, 0
/* 0AFD34 800B52D4 540000BE */  clrlwi  r0, r0, 2
/* 0AFD38 800B52D8 9003000C */  stw     r0, 0xc(r3)
/* 0AFD3C 800B52DC 38000001 */  li      r0, 1
/* 0AFD40 800B52E0 38600001 */  li      r3, 1
/* 0AFD44 800B52E4 80FE0004 */  lwz     r7, 4(r30)
/* 0AFD48 800B52E8 38800001 */  li      r4, 1
/* 0AFD4C 800B52EC 80AD9220 */  lwz     r5, __piReg-_SDA_BASE_(r13)
/* 0AFD50 800B52F0 54E700BE */  clrlwi  r7, r7, 2
/* 0AFD54 800B52F4 90E50010 */  stw     r7, 0x10(r5)
/* 0AFD58 800B52F8 80FE0018 */  lwz     r7, 0x18(r30)
/* 0AFD5C 800B52FC 80AD9220 */  lwz     r5, __piReg-_SDA_BASE_(r13)
/* 0AFD60 800B5300 50E801B4 */  rlwimi  r8, r7, 0, 6, 0x1a
/* 0AFD64 800B5304 38E80000 */  addi    r7, r8, 0
/* 0AFD68 800B5308 50C7D14A */  rlwimi  r7, r6, 0x1a, 5, 5
/* 0AFD6C 800B530C 90E50014 */  stw     r7, 0x14(r5)
/* 0AFD70 800B5310 980D9254 */  stb     r0, CPGPLinked-_SDA_BASE_(r13)
/* 0AFD74 800B5314 480003BD */  bl      __GXWriteFifoIntReset
/* 0AFD78 800B5318 38600001 */  li      r3, 1
/* 0AFD7C 800B531C 38800000 */  li      r4, 0
/* 0AFD80 800B5320 48000381 */  bl      __GXWriteFifoIntEnable
/* 0AFD84 800B5324 38600001 */  li      r3, 1
/* 0AFD88 800B5328 48000345 */  bl      __GXFifoLink
/* 0AFD8C 800B532C 4800006C */  b       lbl_800B5398
lbl_800B5330:
/* 0AFD90 800B5330 880D9254 */  lbz     r0, CPGPLinked-_SDA_BASE_(r13)
/* 0AFD94 800B5334 28000000 */  cmplwi  r0, 0
/* 0AFD98 800B5338 41820014 */  beq     lbl_800B534C
/* 0AFD9C 800B533C 38600000 */  li      r3, 0
/* 0AFDA0 800B5340 4800032D */  bl      __GXFifoLink
/* 0AFDA4 800B5344 38000000 */  li      r0, 0
/* 0AFDA8 800B5348 980D9254 */  stb     r0, CPGPLinked-_SDA_BASE_(r13)
lbl_800B534C:
/* 0AFDAC 800B534C 38600000 */  li      r3, 0
/* 0AFDB0 800B5350 38800000 */  li      r4, 0
/* 0AFDB4 800B5354 4800034D */  bl      __GXWriteFifoIntEnable
/* 0AFDB8 800B5358 809E0000 */  lwz     r4, 0(r30)
/* 0AFDBC 800B535C 38A00000 */  li      r5, 0
/* 0AFDC0 800B5360 806D9220 */  lwz     r3, __piReg-_SDA_BASE_(r13)
/* 0AFDC4 800B5364 38000000 */  li      r0, 0
/* 0AFDC8 800B5368 548400BE */  clrlwi  r4, r4, 2
/* 0AFDCC 800B536C 9083000C */  stw     r4, 0xc(r3)
/* 0AFDD0 800B5370 809E0004 */  lwz     r4, 4(r30)
/* 0AFDD4 800B5374 806D9220 */  lwz     r3, __piReg-_SDA_BASE_(r13)
/* 0AFDD8 800B5378 548400BE */  clrlwi  r4, r4, 2
/* 0AFDDC 800B537C 90830010 */  stw     r4, 0x10(r3)
/* 0AFDE0 800B5380 809E0018 */  lwz     r4, 0x18(r30)
/* 0AFDE4 800B5384 806D9220 */  lwz     r3, __piReg-_SDA_BASE_(r13)
/* 0AFDE8 800B5388 508501B4 */  rlwimi  r5, r4, 0, 6, 0x1a
/* 0AFDEC 800B538C 38850000 */  addi    r4, r5, 0
/* 0AFDF0 800B5390 5004D14A */  rlwimi  r4, r0, 0x1a, 5, 5
/* 0AFDF4 800B5394 90830014 */  stw     r4, 0x14(r3)
lbl_800B5398:
/* 0AFDF8 800B5398 4BFF21D1 */  bl      PPCSync
/* 0AFDFC 800B539C 7FE3FB78 */  mr      r3, r31
/* 0AFE00 800B53A0 4BFF53F9 */  bl      OSRestoreInterrupts
/* 0AFE04 800B53A4 8001001C */  lwz     r0, 0x1c(r1)
/* 0AFE08 800B53A8 83E10014 */  lwz     r31, 0x14(r1)
/* 0AFE0C 800B53AC 83C10010 */  lwz     r30, 0x10(r1)
/* 0AFE10 800B53B0 38210018 */  addi    r1, r1, 0x18
/* 0AFE14 800B53B4 7C0803A6 */  mtlr    r0
/* 0AFE18 800B53B8 4E800020 */  blr     

glabel GXSetGPFifo
/* 0AFE1C 800B53BC 7C0802A6 */  mflr    r0
/* 0AFE20 800B53C0 90010004 */  stw     r0, 4(r1)
/* 0AFE24 800B53C4 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0AFE28 800B53C8 93E10014 */  stw     r31, 0x14(r1)
/* 0AFE2C 800B53CC 93C10010 */  stw     r30, 0x10(r1)
/* 0AFE30 800B53D0 7C7E1B78 */  mr      r30, r3
/* 0AFE34 800B53D4 4BFF539D */  bl      OSDisableInterrupts
/* 0AFE38 800B53D8 7C7F1B78 */  mr      r31, r3
/* 0AFE3C 800B53DC 4800026D */  bl      __GXFifoReadDisable
/* 0AFE40 800B53E0 38600000 */  li      r3, 0
/* 0AFE44 800B53E4 38800000 */  li      r4, 0
/* 0AFE48 800B53E8 480002B9 */  bl      __GXWriteFifoIntEnable
/* 0AFE4C 800B53EC 93CD924C */  stw     r30, GPFifo-_SDA_BASE_(r13)
/* 0AFE50 800B53F0 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFE54 800B53F4 801E0000 */  lwz     r0, 0(r30)
/* 0AFE58 800B53F8 B0030020 */  sth     r0, 0x20(r3)
/* 0AFE5C 800B53FC 801E0004 */  lwz     r0, 4(r30)
/* 0AFE60 800B5400 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFE64 800B5404 B0030024 */  sth     r0, 0x24(r3)
/* 0AFE68 800B5408 801E001C */  lwz     r0, 0x1c(r30)
/* 0AFE6C 800B540C 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFE70 800B5410 B0030030 */  sth     r0, 0x30(r3)
/* 0AFE74 800B5414 801E0018 */  lwz     r0, 0x18(r30)
/* 0AFE78 800B5418 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFE7C 800B541C B0030034 */  sth     r0, 0x34(r3)
/* 0AFE80 800B5420 801E0014 */  lwz     r0, 0x14(r30)
/* 0AFE84 800B5424 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFE88 800B5428 B0030038 */  sth     r0, 0x38(r3)
/* 0AFE8C 800B542C 801E000C */  lwz     r0, 0xc(r30)
/* 0AFE90 800B5430 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFE94 800B5434 B0030028 */  sth     r0, 0x28(r3)
/* 0AFE98 800B5438 801E0010 */  lwz     r0, 0x10(r30)
/* 0AFE9C 800B543C 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFEA0 800B5440 B003002C */  sth     r0, 0x2c(r3)
/* 0AFEA4 800B5444 801E0000 */  lwz     r0, 0(r30)
/* 0AFEA8 800B5448 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFEAC 800B544C 540084BE */  rlwinm  r0, r0, 0x10, 0x12, 0x1f
/* 0AFEB0 800B5450 B0030022 */  sth     r0, 0x22(r3)
/* 0AFEB4 800B5454 801E0004 */  lwz     r0, 4(r30)
/* 0AFEB8 800B5458 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFEBC 800B545C 540084BE */  rlwinm  r0, r0, 0x10, 0x12, 0x1f
/* 0AFEC0 800B5460 B0030026 */  sth     r0, 0x26(r3)
/* 0AFEC4 800B5464 801E001C */  lwz     r0, 0x1c(r30)
/* 0AFEC8 800B5468 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFECC 800B546C 7C008670 */  srawi   r0, r0, 0x10
/* 0AFED0 800B5470 B0030032 */  sth     r0, 0x32(r3)
/* 0AFED4 800B5474 801E0018 */  lwz     r0, 0x18(r30)
/* 0AFED8 800B5478 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFEDC 800B547C 540084BE */  rlwinm  r0, r0, 0x10, 0x12, 0x1f
/* 0AFEE0 800B5480 B0030036 */  sth     r0, 0x36(r3)
/* 0AFEE4 800B5484 801E0014 */  lwz     r0, 0x14(r30)
/* 0AFEE8 800B5488 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFEEC 800B548C 540084BE */  rlwinm  r0, r0, 0x10, 0x12, 0x1f
/* 0AFEF0 800B5490 B003003A */  sth     r0, 0x3a(r3)
/* 0AFEF4 800B5494 801E000C */  lwz     r0, 0xc(r30)
/* 0AFEF8 800B5498 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFEFC 800B549C 5400843E */  srwi    r0, r0, 0x10
/* 0AFF00 800B54A0 B003002A */  sth     r0, 0x2a(r3)
/* 0AFF04 800B54A4 801E0010 */  lwz     r0, 0x10(r30)
/* 0AFF08 800B54A8 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0AFF0C 800B54AC 5400843E */  srwi    r0, r0, 0x10
/* 0AFF10 800B54B0 B003002E */  sth     r0, 0x2e(r3)
/* 0AFF14 800B54B4 4BFF20B5 */  bl      PPCSync
/* 0AFF18 800B54B8 806D9248 */  lwz     r3, CPUFifo-_SDA_BASE_(r13)
/* 0AFF1C 800B54BC 800D924C */  lwz     r0, GPFifo-_SDA_BASE_(r13)
/* 0AFF20 800B54C0 7C030040 */  cmplw   r3, r0
/* 0AFF24 800B54C4 40820024 */  bne     lbl_800B54E8
/* 0AFF28 800B54C8 38000001 */  li      r0, 1
/* 0AFF2C 800B54CC 980D9254 */  stb     r0, CPGPLinked-_SDA_BASE_(r13)
/* 0AFF30 800B54D0 38600001 */  li      r3, 1
/* 0AFF34 800B54D4 38800000 */  li      r4, 0
/* 0AFF38 800B54D8 480001C9 */  bl      __GXWriteFifoIntEnable
/* 0AFF3C 800B54DC 38600001 */  li      r3, 1
/* 0AFF40 800B54E0 4800018D */  bl      __GXFifoLink
/* 0AFF44 800B54E4 48000020 */  b       lbl_800B5504
lbl_800B54E8:
/* 0AFF48 800B54E8 38000000 */  li      r0, 0
/* 0AFF4C 800B54EC 980D9254 */  stb     r0, CPGPLinked-_SDA_BASE_(r13)
/* 0AFF50 800B54F0 38600000 */  li      r3, 0
/* 0AFF54 800B54F4 38800000 */  li      r4, 0
/* 0AFF58 800B54F8 480001A9 */  bl      __GXWriteFifoIntEnable
/* 0AFF5C 800B54FC 38600000 */  li      r3, 0
/* 0AFF60 800B5500 4800016D */  bl      __GXFifoLink
lbl_800B5504:
/* 0AFF64 800B5504 38600001 */  li      r3, 1
/* 0AFF68 800B5508 38800001 */  li      r4, 1
/* 0AFF6C 800B550C 480001C5 */  bl      __GXWriteFifoIntReset
/* 0AFF70 800B5510 48000115 */  bl      __GXFifoReadEnable
/* 0AFF74 800B5514 7FE3FB78 */  mr      r3, r31
/* 0AFF78 800B5518 4BFF5281 */  bl      OSRestoreInterrupts
/* 0AFF7C 800B551C 8001001C */  lwz     r0, 0x1c(r1)
/* 0AFF80 800B5520 83E10014 */  lwz     r31, 0x14(r1)
/* 0AFF84 800B5524 83C10010 */  lwz     r30, 0x10(r1)
/* 0AFF88 800B5528 38210018 */  addi    r1, r1, 0x18
/* 0AFF8C 800B552C 7C0803A6 */  mtlr    r0
/* 0AFF90 800B5530 4E800020 */  blr     

glabel GXGetGPStatus
/* 0AFF94 800B5534 812D9224 */  lwz     r9, __cpReg-_SDA_BASE_(r13)
/* 0AFF98 800B5538 810284B0 */  lwz     r8, __GXData-_SDA2_BASE_(r2)
/* 0AFF9C 800B553C A0090000 */  lhz     r0, 0(r9)
/* 0AFFA0 800B5540 9008000C */  stw     r0, 0xc(r8)
/* 0AFFA4 800B5544 8008000C */  lwz     r0, 0xc(r8)
/* 0AFFA8 800B5548 540007FE */  clrlwi  r0, r0, 0x1f
/* 0AFFAC 800B554C 98030000 */  stb     r0, 0(r3)
/* 0AFFB0 800B5550 8008000C */  lwz     r0, 0xc(r8)
/* 0AFFB4 800B5554 5400FFFE */  rlwinm  r0, r0, 0x1f, 0x1f, 0x1f
/* 0AFFB8 800B5558 98040000 */  stb     r0, 0(r4)
/* 0AFFBC 800B555C 8008000C */  lwz     r0, 0xc(r8)
/* 0AFFC0 800B5560 5400F7FE */  rlwinm  r0, r0, 0x1e, 0x1f, 0x1f
/* 0AFFC4 800B5564 98050000 */  stb     r0, 0(r5)
/* 0AFFC8 800B5568 8008000C */  lwz     r0, 0xc(r8)
/* 0AFFCC 800B556C 5400EFFE */  rlwinm  r0, r0, 0x1d, 0x1f, 0x1f
/* 0AFFD0 800B5570 98060000 */  stb     r0, 0(r6)
/* 0AFFD4 800B5574 8008000C */  lwz     r0, 0xc(r8)
/* 0AFFD8 800B5578 5400E7FE */  rlwinm  r0, r0, 0x1c, 0x1f, 0x1f
/* 0AFFDC 800B557C 98070000 */  stb     r0, 0(r7)
/* 0AFFE0 800B5580 4E800020 */  blr     

glabel GXGetFifoBase
/* 0AFFE4 800B5584 80630000 */  lwz     r3, 0(r3)
/* 0AFFE8 800B5588 4E800020 */  blr     

glabel GXGetFifoSize
/* 0AFFEC 800B558C 80630008 */  lwz     r3, 8(r3)
/* 0AFFF0 800B5590 4E800020 */  blr     

glabel GXSetBreakPtCallback
/* 0AFFF4 800B5594 7C0802A6 */  mflr    r0
/* 0AFFF8 800B5598 90010004 */  stw     r0, 4(r1)
/* 0AFFFC 800B559C 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0B0000 800B55A0 93E10014 */  stw     r31, 0x14(r1)
/* 0B0004 800B55A4 93C10010 */  stw     r30, 0x10(r1)
/* 0B0008 800B55A8 7C7E1B78 */  mr      r30, r3
/* 0B000C 800B55AC 83ED925C */  lwz     r31, BreakPointCB-_SDA_BASE_(r13)
/* 0B0010 800B55B0 4BFF51C1 */  bl      OSDisableInterrupts
/* 0B0014 800B55B4 93CD925C */  stw     r30, BreakPointCB-_SDA_BASE_(r13)
/* 0B0018 800B55B8 4BFF51E1 */  bl      OSRestoreInterrupts
/* 0B001C 800B55BC 7FE3FB78 */  mr      r3, r31
/* 0B0020 800B55C0 8001001C */  lwz     r0, 0x1c(r1)
/* 0B0024 800B55C4 83E10014 */  lwz     r31, 0x14(r1)
/* 0B0028 800B55C8 83C10010 */  lwz     r30, 0x10(r1)
/* 0B002C 800B55CC 38210018 */  addi    r1, r1, 0x18
/* 0B0030 800B55D0 7C0803A6 */  mtlr    r0
/* 0B0034 800B55D4 4E800020 */  blr     

glabel __GXFifoInit
/* 0B0038 800B55D8 7C0802A6 */  mflr    r0
/* 0B003C 800B55DC 3C60800B */  lis     r3, GXCPInterruptHandler@ha
/* 0B0040 800B55E0 90010004 */  stw     r0, 4(r1)
/* 0B0044 800B55E4 38835078 */  addi    r4, r3, GXCPInterruptHandler@l
/* 0B0048 800B55E8 38600011 */  li      r3, 0x11
/* 0B004C 800B55EC 9421FFF8 */  stwu    r1, -8(r1)
/* 0B0050 800B55F0 4BFF51CD */  bl      __OSSetInterruptHandler
/* 0B0054 800B55F4 38604000 */  li      r3, 0x4000
/* 0B0058 800B55F8 4BFF55C9 */  bl      __OSUnmaskInterrupts
/* 0B005C 800B55FC 4BFF76BD */  bl      OSGetCurrentThread
/* 0B0060 800B5600 38000000 */  li      r0, 0
/* 0B0064 800B5604 906D9250 */  stw     r3, __GXCurrentThread-_SDA_BASE_(r13)
/* 0B0068 800B5608 900D9258 */  stw     r0, GXOverflowSuspendInProgress-_SDA_BASE_(r13)
/* 0B006C 800B560C 900D9248 */  stw     r0, CPUFifo-_SDA_BASE_(r13)
/* 0B0070 800B5610 900D924C */  stw     r0, GPFifo-_SDA_BASE_(r13)
/* 0B0074 800B5614 8001000C */  lwz     r0, 0xc(r1)
/* 0B0078 800B5618 38210008 */  addi    r1, r1, 8
/* 0B007C 800B561C 7C0803A6 */  mtlr    r0
/* 0B0080 800B5620 4E800020 */  blr     

__GXFifoReadEnable:
/* 0B0084 800B5624 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B0088 800B5628 38000001 */  li      r0, 1
/* 0B008C 800B562C 80640008 */  lwz     r3, 8(r4)
/* 0B0090 800B5630 500307FE */  rlwimi  r3, r0, 0, 0x1f, 0x1f
/* 0B0094 800B5634 90640008 */  stw     r3, 8(r4)
/* 0B0098 800B5638 80040008 */  lwz     r0, 8(r4)
/* 0B009C 800B563C 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0B00A0 800B5640 B0030002 */  sth     r0, 2(r3)
/* 0B00A4 800B5644 4E800020 */  blr     

__GXFifoReadDisable:
/* 0B00A8 800B5648 808284B0 */  lwz     r4, __GXData-_SDA2_BASE_(r2)
/* 0B00AC 800B564C 38000000 */  li      r0, 0
/* 0B00B0 800B5650 80640008 */  lwz     r3, 8(r4)
/* 0B00B4 800B5654 500307FE */  rlwimi  r3, r0, 0, 0x1f, 0x1f
/* 0B00B8 800B5658 90640008 */  stw     r3, 8(r4)
/* 0B00BC 800B565C 80040008 */  lwz     r0, 8(r4)
/* 0B00C0 800B5660 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0B00C4 800B5664 B0030002 */  sth     r0, 2(r3)
/* 0B00C8 800B5668 4E800020 */  blr     

__GXFifoLink:
/* 0B00CC 800B566C 5460063F */  clrlwi. r0, r3, 0x18
/* 0B00D0 800B5670 4182000C */  beq     lbl_800B567C
/* 0B00D4 800B5674 38800001 */  li      r4, 1
/* 0B00D8 800B5678 48000008 */  b       lbl_800B5680
lbl_800B567C:
/* 0B00DC 800B567C 38800000 */  li      r4, 0
lbl_800B5680:
/* 0B00E0 800B5680 806284B0 */  lwz     r3, __GXData-_SDA2_BASE_(r2)
/* 0B00E4 800B5684 80030008 */  lwz     r0, 8(r3)
/* 0B00E8 800B5688 508026F6 */  rlwimi  r0, r4, 4, 0x1b, 0x1b
/* 0B00EC 800B568C 90030008 */  stw     r0, 8(r3)
/* 0B00F0 800B5690 80030008 */  lwz     r0, 8(r3)
/* 0B00F4 800B5694 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0B00F8 800B5698 B0030002 */  sth     r0, 2(r3)
/* 0B00FC 800B569C 4E800020 */  blr     

__GXWriteFifoIntEnable:
/* 0B0100 800B56A0 80A284B0 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0B0104 800B56A4 5480063E */  clrlwi  r0, r4, 0x18
/* 0B0108 800B56A8 80850008 */  lwz     r4, 8(r5)
/* 0B010C 800B56AC 5064177A */  rlwimi  r4, r3, 2, 0x1d, 0x1d
/* 0B0110 800B56B0 90850008 */  stw     r4, 8(r5)
/* 0B0114 800B56B4 80650008 */  lwz     r3, 8(r5)
/* 0B0118 800B56B8 50031F38 */  rlwimi  r3, r0, 3, 0x1c, 0x1c
/* 0B011C 800B56BC 90650008 */  stw     r3, 8(r5)
/* 0B0120 800B56C0 80050008 */  lwz     r0, 8(r5)
/* 0B0124 800B56C4 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0B0128 800B56C8 B0030002 */  sth     r0, 2(r3)
/* 0B012C 800B56CC 4E800020 */  blr     

__GXWriteFifoIntReset:
/* 0B0130 800B56D0 80A284B0 */  lwz     r5, __GXData-_SDA2_BASE_(r2)
/* 0B0134 800B56D4 5480063E */  clrlwi  r0, r4, 0x18
/* 0B0138 800B56D8 80850010 */  lwz     r4, 0x10(r5)
/* 0B013C 800B56DC 506407FE */  rlwimi  r4, r3, 0, 0x1f, 0x1f
/* 0B0140 800B56E0 90850010 */  stw     r4, 0x10(r5)
/* 0B0144 800B56E4 80650010 */  lwz     r3, 0x10(r5)
/* 0B0148 800B56E8 50030FBC */  rlwimi  r3, r0, 1, 0x1e, 0x1e
/* 0B014C 800B56EC 90650010 */  stw     r3, 0x10(r5)
/* 0B0150 800B56F0 80050010 */  lwz     r0, 0x10(r5)
/* 0B0154 800B56F4 806D9224 */  lwz     r3, __cpReg-_SDA_BASE_(r13)
/* 0B0158 800B56F8 B0030004 */  sth     r0, 4(r3)
/* 0B015C 800B56FC 4E800020 */  blr     

glabel __GXCleanGPFifo
/* 0B0160 800B5700 7C0802A6 */  mflr    r0
/* 0B0164 800B5704 90010004 */  stw     r0, 4(r1)
/* 0B0168 800B5708 9421FF58 */  stwu    r1, -0xa8(r1)
/* 0B016C 800B570C 93E100A4 */  stw     r31, 0xa4(r1)
/* 0B0170 800B5710 93C100A0 */  stw     r30, 0xa0(r1)
/* 0B0174 800B5714 93A1009C */  stw     r29, 0x9c(r1)
/* 0B0178 800B5718 480000F1 */  bl      GXGetGPFifo
/* 0B017C 800B571C 7C7F1B79 */  or.     r31, r3, r3
/* 0B0180 800B5720 418200C4 */  beq     lbl_800B57E4
/* 0B0184 800B5724 480000DD */  bl      GXGetCPUFifo
/* 0B0188 800B5728 38000010 */  li      r0, 0x10
/* 0B018C 800B572C 83BF0000 */  lwz     r29, 0(r31)
/* 0B0190 800B5730 7C0903A6 */  mtctr   r0
/* 0B0194 800B5734 3BC30000 */  addi    r30, r3, 0
/* 0B0198 800B5738 38A1000C */  addi    r5, r1, 0xc
/* 0B019C 800B573C 389FFFF8 */  addi    r4, r31, -8
lbl_800B5740:
/* 0B01A0 800B5740 84640008 */  lwzu    r3, 8(r4)
/* 0B01A4 800B5744 80040004 */  lwz     r0, 4(r4)
/* 0B01A8 800B5748 94650008 */  stwu    r3, 8(r5)
/* 0B01AC 800B574C 90050004 */  stw     r0, 4(r5)
/* 0B01B0 800B5750 4200FFF0 */  bdnz    lbl_800B5740
/* 0B01B4 800B5754 4BFF501D */  bl      OSDisableInterrupts
/* 0B01B8 800B5758 93A10028 */  stw     r29, 0x28(r1)
/* 0B01BC 800B575C 38000000 */  li      r0, 0
/* 0B01C0 800B5760 93A1002C */  stw     r29, 0x2c(r1)
/* 0B01C4 800B5764 90010030 */  stw     r0, 0x30(r1)
/* 0B01C8 800B5768 80810030 */  lwz     r4, 0x30(r1)
/* 0B01CC 800B576C 2C040000 */  cmpwi   r4, 0
/* 0B01D0 800B5770 40800010 */  bge     lbl_800B5780
/* 0B01D4 800B5774 8001001C */  lwz     r0, 0x1c(r1)
/* 0B01D8 800B5778 7C040214 */  add     r0, r4, r0
/* 0B01DC 800B577C 90010030 */  stw     r0, 0x30(r1)
lbl_800B5780:
/* 0B01E0 800B5780 4BFF5019 */  bl      OSRestoreInterrupts
/* 0B01E4 800B5784 38610014 */  addi    r3, r1, 0x14
/* 0B01E8 800B5788 4BFFFC35 */  bl      GXSetGPFifo
/* 0B01EC 800B578C 7C1EF840 */  cmplw   r30, r31
/* 0B01F0 800B5790 4082000C */  bne     lbl_800B579C
/* 0B01F4 800B5794 38610014 */  addi    r3, r1, 0x14
/* 0B01F8 800B5798 4BFFFAFD */  bl      GXSetCPUFifo
lbl_800B579C:
/* 0B01FC 800B579C 4BFF4FD5 */  bl      OSDisableInterrupts
/* 0B0200 800B57A0 93BF0014 */  stw     r29, 0x14(r31)
/* 0B0204 800B57A4 38000000 */  li      r0, 0
/* 0B0208 800B57A8 93BF0018 */  stw     r29, 0x18(r31)
/* 0B020C 800B57AC 901F001C */  stw     r0, 0x1c(r31)
/* 0B0210 800B57B0 809F001C */  lwz     r4, 0x1c(r31)
/* 0B0214 800B57B4 2C040000 */  cmpwi   r4, 0
/* 0B0218 800B57B8 40800010 */  bge     lbl_800B57C8
/* 0B021C 800B57BC 801F0008 */  lwz     r0, 8(r31)
/* 0B0220 800B57C0 7C040214 */  add     r0, r4, r0
/* 0B0224 800B57C4 901F001C */  stw     r0, 0x1c(r31)
lbl_800B57C8:
/* 0B0228 800B57C8 4BFF4FD1 */  bl      OSRestoreInterrupts
/* 0B022C 800B57CC 7FE3FB78 */  mr      r3, r31
/* 0B0230 800B57D0 4BFFFBED */  bl      GXSetGPFifo
/* 0B0234 800B57D4 7C1EF840 */  cmplw   r30, r31
/* 0B0238 800B57D8 4082000C */  bne     lbl_800B57E4
/* 0B023C 800B57DC 7FC3F378 */  mr      r3, r30
/* 0B0240 800B57E0 4BFFFAB5 */  bl      GXSetCPUFifo
lbl_800B57E4:
/* 0B0244 800B57E4 800100AC */  lwz     r0, 0xac(r1)
/* 0B0248 800B57E8 83E100A4 */  lwz     r31, 0xa4(r1)
/* 0B024C 800B57EC 83C100A0 */  lwz     r30, 0xa0(r1)
/* 0B0250 800B57F0 83A1009C */  lwz     r29, 0x9c(r1)
/* 0B0254 800B57F4 382100A8 */  addi    r1, r1, 0xa8
/* 0B0258 800B57F8 7C0803A6 */  mtlr    r0
/* 0B025C 800B57FC 4E800020 */  blr     

glabel GXGetCPUFifo
/* 0B0260 800B5800 806D9248 */  lwz     r3, CPUFifo-_SDA_BASE_(r13)
/* 0B0264 800B5804 4E800020 */  blr     

glabel GXGetGPFifo
/* 0B0268 800B5808 806D924C */  lwz     r3, GPFifo-_SDA_BASE_(r13)
/* 0B026C 800B580C 4E800020 */  blr     


.section .sbss, "wa"

.balign 8

/* 00100488 80145C28 0004 */
CPUFifo:
    .skip 4

.balign 4

/* 0010048C 80145C2C 0004 */
GPFifo:
    .skip 4

.balign 4

/* 00100490 80145C30 0004 */
__GXCurrentThread:
    .skip 4

.balign 4

/* 00100494 80145C34 0001 */
CPGPLinked:
    .skip 1

.balign 4

/* 00100498 80145C38 0004 */
GXOverflowSuspendInProgress:
    .skip 4

.balign 4

/* 0010049C 80145C3C 0004 */
BreakPointCB:
    .skip 4

.balign 4

/* 001004A0 80145C40 0004 */
__GXOverflowCount:
    .skip 4


