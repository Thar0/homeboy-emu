# OSTime.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel OSGetTime
/* 09CD08 800A22A8 7C6D42E6 */  mftbu	r3
/* 09CD0C 800A22AC 7C8C42E6 */  mftb	r4, 0x10c
/* 09CD10 800A22B0 7CAD42E6 */  mftbu	r5
/* 09CD14 800A22B4 7C032800 */  cmpw	r3, r5
/* 09CD18 800A22B8 4082FFF0 */  bne		OSGetTime
/* 09CD1C 800A22BC 4E800020 */  blr		

glabel OSGetTick
/* 09CD20 800A22C0 7C6C42E6 */  mftb	r3, 0x10c
/* 09CD24 800A22C4 4E800020 */  blr		

glabel __OSGetSystemTime
/* 09CD28 800A22C8 7C0802A6 */  mflr	r0
/* 09CD2C 800A22CC 90010004 */  stw		r0, 4(r1)
/* 09CD30 800A22D0 9421FFE0 */  stwu	r1, -0x20(r1)
/* 09CD34 800A22D4 93E1001C */  stw		r31, 0x1c(r1)
/* 09CD38 800A22D8 93C10018 */  stw		r30, 0x18(r1)
/* 09CD3C 800A22DC 93A10014 */  stw		r29, 0x14(r1)
/* 09CD40 800A22E0 4BFFCA1D */  bl		OSDisableInterrupts
/* 09CD44 800A22E4 7C7F1B78 */  mr		r31, r3
/* 09CD48 800A22E8 4BFFFFC1 */  bl		OSGetTime
/* 09CD4C 800A22EC 3CC08000 */  lis		r6, 0x8000
/* 09CD50 800A22F0 80A630DC */  lwz		r5, 0x30dc(r6)
/* 09CD54 800A22F4 800630D8 */  lwz		r0, 0x30d8(r6)
/* 09CD58 800A22F8 7FA52014 */  addc	r29, r5, r4
/* 09CD5C 800A22FC 7FC01914 */  adde	r30, r0, r3
/* 09CD60 800A2300 7FE3FB78 */  mr		r3, r31
/* 09CD64 800A2304 4BFFCA21 */  bl		OSRestoreInterrupts
/* 09CD68 800A2308 7FA4EB78 */  mr		r4, r29
/* 09CD6C 800A230C 7FC3F378 */  mr		r3, r30
/* 09CD70 800A2310 80010024 */  lwz		r0, 0x24(r1)
/* 09CD74 800A2314 83E1001C */  lwz		r31, 0x1c(r1)
/* 09CD78 800A2318 83C10018 */  lwz		r30, 0x18(r1)
/* 09CD7C 800A231C 83A10014 */  lwz		r29, 0x14(r1)
/* 09CD80 800A2320 38210020 */  addi	r1, r1, 0x20
/* 09CD84 800A2324 7C0803A6 */  mtlr	r0
/* 09CD88 800A2328 4E800020 */  blr		

GetDates:
/* 09CD8C 800A232C 3CA09249 */  lis		r5, 0x9249
/* 09CD90 800A2330 38052493 */  addi	r0, r5, 0x2493
/* 09CD94 800A2334 38E30006 */  addi	r7, r3, 6
/* 09CD98 800A2338 7CC03896 */  mulhw	r6, r0, r7
/* 09CD9C 800A233C 3CA0B38D */  lis		r5, 0xb38d
/* 09CDA0 800A2340 3805F9B1 */  addi	r0, r5, -1615
/* 09CDA4 800A2344 7C001896 */  mulhw	r0, r0, r3
/* 09CDA8 800A2348 7CA63A14 */  add		r5, r6, r7
/* 09CDAC 800A234C 7CA51670 */  srawi	r5, r5, 2
/* 09CDB0 800A2350 54A60FFE */  srwi	r6, r5, 0x1f
/* 09CDB4 800A2354 7CA53214 */  add		r5, r5, r6
/* 09CDB8 800A2358 7C001A14 */  add		r0, r0, r3
/* 09CDBC 800A235C 1CC50007 */  mulli	r6, r5, 7
/* 09CDC0 800A2360 7C004670 */  srawi	r0, r0, 8
/* 09CDC4 800A2364 54050FFE */  srwi	r5, r0, 0x1f
/* 09CDC8 800A2368 7CA02A14 */  add		r5, r0, r5
/* 09CDCC 800A236C 7C063850 */  subf	r0, r6, r7
/* 09CDD0 800A2370 1D65016D */  mulli	r11, r5, 0x16d
/* 09CDD4 800A2374 90040018 */  stw		r0, 0x18(r4)
/* 09CDD8 800A2378 48000004 */  b		lbl_800A237C
lbl_800A237C:
/* 09CDDC 800A237C 3CC051EC */  lis		r6, 0x51ec
/* 09CDE0 800A2380 3946851F */  addi	r10, r6, -31457
/* 09CDE4 800A2384 48000004 */  b		lbl_800A2388
lbl_800A2388:
/* 09CDE8 800A2388 4800000C */  b		lbl_800A2394
lbl_800A238C:
/* 09CDEC 800A238C 396BFE93 */  addi	r11, r11, -365
/* 09CDF0 800A2390 38A5FFFF */  addi	r5, r5, -1
lbl_800A2394:
/* 09CDF4 800A2394 2C050001 */  cmpwi	r5, 1
/* 09CDF8 800A2398 4080000C */  bge		lbl_800A23A4
/* 09CDFC 800A239C 38000000 */  li		r0, 0
/* 09CE00 800A23A0 48000038 */  b		lbl_800A23D8
lbl_800A23A4:
/* 09CE04 800A23A4 3805FFFF */  addi	r0, r5, -1
/* 09CE08 800A23A8 7C0A0096 */  mulhw	r0, r10, r0
/* 09CE0C 800A23AC 7C083E70 */  srawi	r8, r0, 7
/* 09CE10 800A23B0 7C062E70 */  srawi	r6, r0, 5
/* 09CE14 800A23B4 38050003 */  addi	r0, r5, 3
/* 09CE18 800A23B8 54C70FFE */  srwi	r7, r6, 0x1f
/* 09CE1C 800A23BC 7C001670 */  srawi	r0, r0, 2
/* 09CE20 800A23C0 55090FFE */  srwi	r9, r8, 0x1f
/* 09CE24 800A23C4 7CC63A14 */  add		r6, r6, r7
/* 09CE28 800A23C8 7C000194 */  addze	r0, r0
/* 09CE2C 800A23CC 7CE84A14 */  add		r7, r8, r9
/* 09CE30 800A23D0 7C060050 */  subf	r0, r6, r0
/* 09CE34 800A23D4 7C070214 */  add		r0, r7, r0
lbl_800A23D8:
/* 09CE38 800A23D8 7C0B0214 */  add		r0, r11, r0
/* 09CE3C 800A23DC 7C030000 */  cmpw	r3, r0
/* 09CE40 800A23E0 4180FFAC */  blt		lbl_800A238C
/* 09CE44 800A23E4 7CA61670 */  srawi	r6, r5, 2
/* 09CE48 800A23E8 90A40014 */  stw		r5, 0x14(r4)
/* 09CE4C 800A23EC 7CC60194 */  addze	r6, r6
/* 09CE50 800A23F0 54C6103A */  slwi	r6, r6, 2
/* 09CE54 800A23F4 7CC62810 */  subfc	r6, r6, r5
/* 09CE58 800A23F8 7C001850 */  subf	r0, r0, r3
/* 09CE5C 800A23FC 2C060000 */  cmpwi	r6, 0
/* 09CE60 800A2400 9004001C */  stw		r0, 0x1c(r4)
/* 09CE64 800A2404 38E00001 */  li		r7, 1
/* 09CE68 800A2408 39000000 */  li		r8, 0
/* 09CE6C 800A240C 40820030 */  bne		lbl_800A243C
/* 09CE70 800A2410 3C6051EC */  lis		r3, 0x51ec
/* 09CE74 800A2414 3863851F */  addi	r3, r3, -31457
/* 09CE78 800A2418 7C632896 */  mulhw	r3, r3, r5
/* 09CE7C 800A241C 7C632E70 */  srawi	r3, r3, 5
/* 09CE80 800A2420 54660FFE */  srwi	r6, r3, 0x1f
/* 09CE84 800A2424 7C633214 */  add		r3, r3, r6
/* 09CE88 800A2428 1C630064 */  mulli	r3, r3, 0x64
/* 09CE8C 800A242C 7C632850 */  subf	r3, r3, r5
/* 09CE90 800A2430 2C030000 */  cmpwi	r3, 0
/* 09CE94 800A2434 41820008 */  beq		lbl_800A243C
/* 09CE98 800A2438 7CE83B78 */  mr		r8, r7
lbl_800A243C:
/* 09CE9C 800A243C 2C080000 */  cmpwi	r8, 0
/* 09CEA0 800A2440 40820030 */  bne		lbl_800A2470
/* 09CEA4 800A2444 3C6051EC */  lis		r3, 0x51ec
/* 09CEA8 800A2448 3863851F */  addi	r3, r3, -31457
/* 09CEAC 800A244C 7C632896 */  mulhw	r3, r3, r5
/* 09CEB0 800A2450 7C633E70 */  srawi	r3, r3, 7
/* 09CEB4 800A2454 54660FFE */  srwi	r6, r3, 0x1f
/* 09CEB8 800A2458 7C633214 */  add		r3, r3, r6
/* 09CEBC 800A245C 1C630190 */  mulli	r3, r3, 0x190
/* 09CEC0 800A2460 7C632850 */  subf	r3, r3, r5
/* 09CEC4 800A2464 2C030000 */  cmpwi	r3, 0
/* 09CEC8 800A2468 41820008 */  beq		lbl_800A2470
/* 09CECC 800A246C 38E00000 */  li		r7, 0
lbl_800A2470:
/* 09CED0 800A2470 2C070000 */  cmpwi	r7, 0
/* 09CED4 800A2474 41820010 */  beq		lbl_800A2484
/* 09CED8 800A2478 3C60800F */  lis		r3, LeapYearDays@ha
/* 09CEDC 800A247C 38C313E0 */  addi	r6, r3, LeapYearDays@l
/* 09CEE0 800A2480 4800000C */  b		lbl_800A248C
lbl_800A2484:
/* 09CEE4 800A2484 3C60800F */  lis		r3, YearDays@ha
/* 09CEE8 800A2488 38C313B0 */  addi	r6, r3, YearDays@l
lbl_800A248C:
/* 09CEEC 800A248C 38E0000C */  li		r7, 0xc
/* 09CEF0 800A2490 38600030 */  li		r3, 0x30
/* 09CEF4 800A2494 48000004 */  b		lbl_800A2498
lbl_800A2498:
/* 09CEF8 800A2498 48000004 */  b		lbl_800A249C
lbl_800A249C:
/* 09CEFC 800A249C 3863FFFC */  addi	r3, r3, -4
/* 09CF00 800A24A0 7CA6182E */  lwzx	r5, r6, r3
/* 09CF04 800A24A4 38E7FFFF */  addi	r7, r7, -1
/* 09CF08 800A24A8 7C002800 */  cmpw	r0, r5
/* 09CF0C 800A24AC 4180FFF0 */  blt		lbl_800A249C
/* 09CF10 800A24B0 90E40010 */  stw		r7, 0x10(r4)
/* 09CF14 800A24B4 7C66182E */  lwzx	r3, r6, r3
/* 09CF18 800A24B8 7C630050 */  subf	r3, r3, r0
/* 09CF1C 800A24BC 38030001 */  addi	r0, r3, 1
/* 09CF20 800A24C0 9004000C */  stw		r0, 0xc(r4)
/* 09CF24 800A24C4 4E800020 */  blr		

glabel OSTicksToCalendarTime
/* 09CF28 800A24C8 7C0802A6 */  mflr	r0
/* 09CF2C 800A24CC 90010004 */  stw		r0, 4(r1)
/* 09CF30 800A24D0 9421FFC8 */  stwu	r1, -0x38(r1)
/* 09CF34 800A24D4 BF21001C */  stmw	r25, 0x1c(r1)
/* 09CF38 800A24D8 7C7D1B78 */  mr		r29, r3
/* 09CF3C 800A24DC 7C9E2378 */  mr		r30, r4
/* 09CF40 800A24E0 7CBF2B78 */  mr		r31, r5
/* 09CF44 800A24E4 3F608000 */  lis		r27, 0x8000
/* 09CF48 800A24E8 801B00F8 */  lwz		r0, 0xf8(r27)
/* 09CF4C 800A24EC 7FA3EB78 */  mr		r3, r29
/* 09CF50 800A24F0 7FC4F378 */  mr		r4, r30
/* 09CF54 800A24F4 5406F0BE */  srwi	r6, r0, 2
/* 09CF58 800A24F8 38A00000 */  li		r5, 0
/* 09CF5C 800A24FC 4802B73D */  bl		__mod2i
/* 09CF60 800A2500 7C7A1B78 */  mr		r26, r3
/* 09CF64 800A2504 38A00000 */  li		r5, 0
/* 09CF68 800A2508 7C992378 */  mr		r25, r4
/* 09CF6C 800A250C 6F448000 */  xoris	r4, r26, 0x8000
/* 09CF70 800A2510 6CA38000 */  xoris	r3, r5, 0x8000
/* 09CF74 800A2514 7C05C810 */  subfc	r0, r5, r25
/* 09CF78 800A2518 7C632110 */  subfe	r3, r3, r4
/* 09CF7C 800A251C 7C642110 */  subfe	r3, r4, r4
/* 09CF80 800A2520 7C6300D0 */  neg		r3, r3
/* 09CF84 800A2524 2C030000 */  cmpwi	r3, 0
/* 09CF88 800A2528 41820014 */  beq		lbl_800A253C
/* 09CF8C 800A252C 801B00F8 */  lwz		r0, 0xf8(r27)
/* 09CF90 800A2530 5400F0BE */  srwi	r0, r0, 2
/* 09CF94 800A2534 7F390014 */  addc	r25, r25, r0
/* 09CF98 800A2538 7F5A2914 */  adde	r26, r26, r5
lbl_800A253C:
/* 09CF9C 800A253C 38800008 */  li		r4, 8
/* 09CFA0 800A2540 7C7A21D6 */  mullw	r3, r26, r4
/* 09CFA4 800A2544 7C192016 */  mulhwu	r0, r25, r4
/* 09CFA8 800A2548 3F608000 */  lis		r27, 0x8000
/* 09CFAC 800A254C 80DB00F8 */  lwz		r6, 0xf8(r27)
/* 09CFB0 800A2550 3CA0431C */  lis		r5, 0x431c
/* 09CFB4 800A2554 38A5DE83 */  addi	r5, r5, -8573
/* 09CFB8 800A2558 54C6F0BE */  srwi	r6, r6, 2
/* 09CFBC 800A255C 7CA53016 */  mulhwu	r5, r5, r6
/* 09CFC0 800A2560 54A68BFE */  srwi	r6, r5, 0xf
/* 09CFC4 800A2564 3B800000 */  li		r28, 0
/* 09CFC8 800A2568 7C630214 */  add		r3, r3, r0
/* 09CFCC 800A256C 7C19E1D6 */  mullw	r0, r25, r28
/* 09CFD0 800A2570 7C9921D6 */  mullw	r4, r25, r4
/* 09CFD4 800A2574 7C630214 */  add		r3, r3, r0
/* 09CFD8 800A2578 38A00000 */  li		r5, 0
/* 09CFDC 800A257C 4802B4A1 */  bl		__div2i
/* 09CFE0 800A2580 38A00000 */  li		r5, 0
/* 09CFE4 800A2584 38C003E8 */  li		r6, 0x3e8
/* 09CFE8 800A2588 4802B6B1 */  bl		__mod2i
/* 09CFEC 800A258C 909F0024 */  stw		r4, 0x24(r31)
/* 09CFF0 800A2590 3C601062 */  lis		r3, 0x1062
/* 09CFF4 800A2594 38A34DD3 */  addi	r5, r3, 0x4dd3
/* 09CFF8 800A2598 801B00F8 */  lwz		r0, 0xf8(r27)
/* 09CFFC 800A259C 7F43D378 */  mr		r3, r26
/* 09D000 800A25A0 7F24CB78 */  mr		r4, r25
/* 09D004 800A25A4 5400F0BE */  srwi	r0, r0, 2
/* 09D008 800A25A8 7C050016 */  mulhwu	r0, r5, r0
/* 09D00C 800A25AC 5406D1BE */  srwi	r6, r0, 6
/* 09D010 800A25B0 38A00000 */  li		r5, 0
/* 09D014 800A25B4 4802B469 */  bl		__div2i
/* 09D018 800A25B8 38A00000 */  li		r5, 0
/* 09D01C 800A25BC 38C003E8 */  li		r6, 0x3e8
/* 09D020 800A25C0 4802B679 */  bl		__mod2i
/* 09D024 800A25C4 909F0020 */  stw		r4, 0x20(r31)
/* 09D028 800A25C8 7FD9F010 */  subfc	r30, r25, r30
/* 09D02C 800A25CC 7FBAE910 */  subfe	r29, r26, r29
/* 09D030 800A25D0 801B00F8 */  lwz		r0, 0xf8(r27)
/* 09D034 800A25D4 3CA00001 */  lis		r5, 1
/* 09D038 800A25D8 3B255180 */  addi	r25, r5, 0x5180
/* 09D03C 800A25DC 7FA3EB78 */  mr		r3, r29
/* 09D040 800A25E0 5406F0BE */  srwi	r6, r0, 2
/* 09D044 800A25E4 7FC4F378 */  mr		r4, r30
/* 09D048 800A25E8 38A00000 */  li		r5, 0
/* 09D04C 800A25EC 4802B431 */  bl		__div2i
/* 09D050 800A25F0 7F26CB78 */  mr		r6, r25
/* 09D054 800A25F4 38A00000 */  li		r5, 0
/* 09D058 800A25F8 4802B425 */  bl		__div2i
/* 09D05C 800A25FC 3CA0000B */  lis		r5, 0xb
/* 09D060 800A2600 801B00F8 */  lwz		r0, 0xf8(r27)
/* 09D064 800A2604 38A52575 */  addi	r5, r5, 0x2575
/* 09D068 800A2608 7F442814 */  addc	r26, r4, r5
/* 09D06C 800A260C 5406F0BE */  srwi	r6, r0, 2
/* 09D070 800A2610 7C03E114 */  adde	r0, r3, r28
/* 09D074 800A2614 7FA3EB78 */  mr		r3, r29
/* 09D078 800A2618 7FC4F378 */  mr		r4, r30
/* 09D07C 800A261C 38A00000 */  li		r5, 0
/* 09D080 800A2620 4802B3FD */  bl		__div2i
/* 09D084 800A2624 7F26CB78 */  mr		r6, r25
/* 09D088 800A2628 38A00000 */  li		r5, 0
/* 09D08C 800A262C 4802B60D */  bl		__mod2i
/* 09D090 800A2630 7C9B2378 */  mr		r27, r4
/* 09D094 800A2634 2C1B0000 */  cmpwi	r27, 0
/* 09D098 800A2638 40800010 */  bge		lbl_800A2648
/* 09D09C 800A263C 3F7B0001 */  addis	r27, r27, 1
/* 09D0A0 800A2640 3B5AFFFF */  addi	r26, r26, -1
/* 09D0A4 800A2644 3B7B5180 */  addi	r27, r27, 0x5180
lbl_800A2648:
/* 09D0A8 800A2648 7F43D378 */  mr		r3, r26
/* 09D0AC 800A264C 7FE4FB78 */  mr		r4, r31
/* 09D0B0 800A2650 4BFFFCDD */  bl		GetDates
/* 09D0B4 800A2654 3C608889 */  lis		r3, 0x8889
/* 09D0B8 800A2658 38A38889 */  addi	r5, r3, -30583
/* 09D0BC 800A265C 7C05D896 */  mulhw	r0, r5, r27
/* 09D0C0 800A2660 7C80DA14 */  add		r4, r0, r27
/* 09D0C4 800A2664 7C802E70 */  srawi	r0, r4, 5
/* 09D0C8 800A2668 54030FFE */  srwi	r3, r0, 0x1f
/* 09D0CC 800A266C 7CE01A14 */  add		r7, r0, r3
/* 09D0D0 800A2670 7C053896 */  mulhw	r0, r5, r7
/* 09D0D4 800A2674 7C003A14 */  add		r0, r0, r7
/* 09D0D8 800A2678 7C052E70 */  srawi	r5, r0, 5
/* 09D0DC 800A267C 7C002E70 */  srawi	r0, r0, 5
/* 09D0E0 800A2680 54030FFE */  srwi	r3, r0, 0x1f
/* 09D0E4 800A2684 7C601A14 */  add		r3, r0, r3
/* 09D0E8 800A2688 7C802E70 */  srawi	r0, r4, 5
/* 09D0EC 800A268C 54A60FFE */  srwi	r6, r5, 0x1f
/* 09D0F0 800A2690 1C83003C */  mulli	r4, r3, 0x3c
/* 09D0F4 800A2694 54030FFE */  srwi	r3, r0, 0x1f
/* 09D0F8 800A2698 7CA53214 */  add		r5, r5, r6
/* 09D0FC 800A269C 7C001A14 */  add		r0, r0, r3
/* 09D100 800A26A0 90BF0008 */  stw		r5, 8(r31)
/* 09D104 800A26A4 1C00003C */  mulli	r0, r0, 0x3c
/* 09D108 800A26A8 7C643850 */  subf	r3, r4, r7
/* 09D10C 800A26AC 907F0004 */  stw		r3, 4(r31)
/* 09D110 800A26B0 7C00D850 */  subf	r0, r0, r27
/* 09D114 800A26B4 901F0000 */  stw		r0, 0(r31)
/* 09D118 800A26B8 BB21001C */  lmw		r25, 0x1c(r1)
/* 09D11C 800A26BC 8001003C */  lwz		r0, 0x3c(r1)
/* 09D120 800A26C0 38210038 */  addi	r1, r1, 0x38
/* 09D124 800A26C4 7C0803A6 */  mtlr	r0
/* 09D128 800A26C8 4E800020 */  blr		


.section .data, "wa"

.balign 8

/* 000EE430 800F13B0 0030 */
YearDays:
    .long 0x00000000, 0x0000001F, 0x0000003B, 0x0000005A, 0x00000078, 0x00000097, 0x000000B5, 0x000000D4
    .long 0x000000F3, 0x00000111, 0x00000130, 0x0000014E

.balign 4

/* 000EE460 800F13E0 0030 */
LeapYearDays:
    .long 0x00000000, 0x0000001F, 0x0000003C, 0x0000005B, 0x00000079, 0x00000098, 0x000000B6, 0x000000D5
    .long 0x000000F4, 0x00000112, 0x00000131, 0x0000014F

