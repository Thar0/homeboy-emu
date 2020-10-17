# flush_cache.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRK_flush_cache
/* 0D2430 800D79D0 3CA0FFFF */  lis     r5, 0xffff
/* 0D2434 800D79D4 60A5FFF1 */  ori     r5, r5, 0xfff1
/* 0D2438 800D79D8 7CA51838 */  and     r5, r5, r3
/* 0D243C 800D79DC 7C651850 */  subf    r3, r5, r3
/* 0D2440 800D79E0 7C841A14 */  add     r4, r4, r3
lbl_800D79E4:
/* 0D2444 800D79E4 7C00286C */  dcbst   0, r5
/* 0D2448 800D79E8 7C0028AC */  dcbf    0, r5
/* 0D244C 800D79EC 7C0004AC */  sync    0
/* 0D2450 800D79F0 7C002FAC */  icbi    0, r5
/* 0D2454 800D79F4 30A50008 */  addic   r5, r5, 8
/* 0D2458 800D79F8 3484FFF8 */  addic.  r4, r4, -8
/* 0D245C 800D79FC 4080FFE8 */  bge     lbl_800D79E4
/* 0D2460 800D7A00 4C00012C */  isync   
/* 0D2464 800D7A04 4E800020 */  blr     


