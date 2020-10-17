# dvdqueue.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __DVDClearWaitingQueue
/* 0BC290 800C1830 3C608014 */  lis     r3, WaitingQueue@ha
/* 0BC294 800C1834 38632338 */  addi    r3, r3, WaitingQueue@l
/* 0BC298 800C1838 90630000 */  stw     r3, 0(r3)
/* 0BC29C 800C183C 38A30008 */  addi    r5, r3, 8
/* 0BC2A0 800C1840 38830010 */  addi    r4, r3, 0x10
/* 0BC2A4 800C1844 90630004 */  stw     r3, 4(r3)
/* 0BC2A8 800C1848 38630018 */  addi    r3, r3, 0x18
/* 0BC2AC 800C184C 90A50000 */  stw     r5, 0(r5)
/* 0BC2B0 800C1850 90A50004 */  stw     r5, 4(r5)
/* 0BC2B4 800C1854 90840000 */  stw     r4, 0(r4)
/* 0BC2B8 800C1858 90840004 */  stw     r4, 4(r4)
/* 0BC2BC 800C185C 90630000 */  stw     r3, 0(r3)
/* 0BC2C0 800C1860 90630004 */  stw     r3, 4(r3)
/* 0BC2C4 800C1864 4E800020 */  blr     

glabel __DVDPushWaitingQueue
/* 0BC2C8 800C1868 7C0802A6 */  mflr    r0
/* 0BC2CC 800C186C 90010004 */  stw     r0, 4(r1)
/* 0BC2D0 800C1870 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BC2D4 800C1874 93E10014 */  stw     r31, 0x14(r1)
/* 0BC2D8 800C1878 3BE40000 */  addi    r31, r4, 0
/* 0BC2DC 800C187C 93C10010 */  stw     r30, 0x10(r1)
/* 0BC2E0 800C1880 3BC30000 */  addi    r30, r3, 0
/* 0BC2E4 800C1884 4BFE8EED */  bl      OSDisableInterrupts
/* 0BC2E8 800C1888 3C808014 */  lis     r4, WaitingQueue@ha
/* 0BC2EC 800C188C 57C51838 */  slwi    r5, r30, 3
/* 0BC2F0 800C1890 38042338 */  addi    r0, r4, WaitingQueue@l
/* 0BC2F4 800C1894 7CA02A14 */  add     r5, r0, r5
/* 0BC2F8 800C1898 80850004 */  lwz     r4, 4(r5)
/* 0BC2FC 800C189C 93E40000 */  stw     r31, 0(r4)
/* 0BC300 800C18A0 80050004 */  lwz     r0, 4(r5)
/* 0BC304 800C18A4 901F0004 */  stw     r0, 4(r31)
/* 0BC308 800C18A8 90BF0000 */  stw     r5, 0(r31)
/* 0BC30C 800C18AC 93E50004 */  stw     r31, 4(r5)
/* 0BC310 800C18B0 4BFE8EE9 */  bl      OSRestoreInterrupts
/* 0BC314 800C18B4 8001001C */  lwz     r0, 0x1c(r1)
/* 0BC318 800C18B8 38600001 */  li      r3, 1
/* 0BC31C 800C18BC 83E10014 */  lwz     r31, 0x14(r1)
/* 0BC320 800C18C0 83C10010 */  lwz     r30, 0x10(r1)
/* 0BC324 800C18C4 38210018 */  addi    r1, r1, 0x18
/* 0BC328 800C18C8 7C0803A6 */  mtlr    r0
/* 0BC32C 800C18CC 4E800020 */  blr     

glabel __DVDPopWaitingQueue
/* 0BC330 800C18D0 7C0802A6 */  mflr    r0
/* 0BC334 800C18D4 90010004 */  stw     r0, 4(r1)
/* 0BC338 800C18D8 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0BC33C 800C18DC 93E1000C */  stw     r31, 0xc(r1)
/* 0BC340 800C18E0 4BFE8E91 */  bl      OSDisableInterrupts
/* 0BC344 800C18E4 38000004 */  li      r0, 4
/* 0BC348 800C18E8 3C808014 */  lis     r4, WaitingQueue@ha
/* 0BC34C 800C18EC 7C0903A6 */  mtctr   r0
/* 0BC350 800C18F0 38842338 */  addi    r4, r4, WaitingQueue@l
/* 0BC354 800C18F4 3BE00000 */  li      r31, 0
lbl_800C18F8:
/* 0BC358 800C18F8 80040000 */  lwz     r0, 0(r4)
/* 0BC35C 800C18FC 7C002040 */  cmplw   r0, r4
/* 0BC360 800C1900 41820048 */  beq     lbl_800C1948
/* 0BC364 800C1904 4BFE8E95 */  bl      OSRestoreInterrupts
/* 0BC368 800C1908 4BFE8E69 */  bl      OSDisableInterrupts
/* 0BC36C 800C190C 3C808014 */  lis     r4, WaitingQueue@ha
/* 0BC370 800C1910 57E51838 */  slwi    r5, r31, 3
/* 0BC374 800C1914 38042338 */  addi    r0, r4, WaitingQueue@l
/* 0BC378 800C1918 7CA02A14 */  add     r5, r0, r5
/* 0BC37C 800C191C 83E50000 */  lwz     r31, 0(r5)
/* 0BC380 800C1920 801F0000 */  lwz     r0, 0(r31)
/* 0BC384 800C1924 90050000 */  stw     r0, 0(r5)
/* 0BC388 800C1928 809F0000 */  lwz     r4, 0(r31)
/* 0BC38C 800C192C 90A40004 */  stw     r5, 4(r4)
/* 0BC390 800C1930 4BFE8E69 */  bl      OSRestoreInterrupts
/* 0BC394 800C1934 38000000 */  li      r0, 0
/* 0BC398 800C1938 901F0000 */  stw     r0, 0(r31)
/* 0BC39C 800C193C 7FE3FB78 */  mr      r3, r31
/* 0BC3A0 800C1940 901F0004 */  stw     r0, 4(r31)
/* 0BC3A4 800C1944 48000018 */  b       lbl_800C195C
lbl_800C1948:
/* 0BC3A8 800C1948 38840008 */  addi    r4, r4, 8
/* 0BC3AC 800C194C 3BFF0001 */  addi    r31, r31, 1
/* 0BC3B0 800C1950 4200FFA8 */  bdnz    lbl_800C18F8
/* 0BC3B4 800C1954 4BFE8E45 */  bl      OSRestoreInterrupts
/* 0BC3B8 800C1958 38600000 */  li      r3, 0
lbl_800C195C:
/* 0BC3BC 800C195C 80010014 */  lwz     r0, 0x14(r1)
/* 0BC3C0 800C1960 83E1000C */  lwz     r31, 0xc(r1)
/* 0BC3C4 800C1964 38210010 */  addi    r1, r1, 0x10
/* 0BC3C8 800C1968 7C0803A6 */  mtlr    r0
/* 0BC3CC 800C196C 4E800020 */  blr     

glabel __DVDCheckWaitingQueue
/* 0BC3D0 800C1970 7C0802A6 */  mflr    r0
/* 0BC3D4 800C1974 90010004 */  stw     r0, 4(r1)
/* 0BC3D8 800C1978 9421FFF8 */  stwu    r1, -8(r1)
/* 0BC3DC 800C197C 4BFE8DF5 */  bl      OSDisableInterrupts
/* 0BC3E0 800C1980 38000004 */  li      r0, 4
/* 0BC3E4 800C1984 3C808014 */  lis     r4, WaitingQueue@ha
/* 0BC3E8 800C1988 7C0903A6 */  mtctr   r0
/* 0BC3EC 800C198C 38842338 */  addi    r4, r4, WaitingQueue@l
lbl_800C1990:
/* 0BC3F0 800C1990 80040000 */  lwz     r0, 0(r4)
/* 0BC3F4 800C1994 7C002040 */  cmplw   r0, r4
/* 0BC3F8 800C1998 41820010 */  beq     lbl_800C19A8
/* 0BC3FC 800C199C 4BFE8DFD */  bl      OSRestoreInterrupts
/* 0BC400 800C19A0 38600001 */  li      r3, 1
/* 0BC404 800C19A4 48000014 */  b       lbl_800C19B8
lbl_800C19A8:
/* 0BC408 800C19A8 38840008 */  addi    r4, r4, 8
/* 0BC40C 800C19AC 4200FFE4 */  bdnz    lbl_800C1990
/* 0BC410 800C19B0 4BFE8DE9 */  bl      OSRestoreInterrupts
/* 0BC414 800C19B4 38600000 */  li      r3, 0
lbl_800C19B8:
/* 0BC418 800C19B8 8001000C */  lwz     r0, 0xc(r1)
/* 0BC41C 800C19BC 38210008 */  addi    r1, r1, 8
/* 0BC420 800C19C0 7C0803A6 */  mtlr    r0
/* 0BC424 800C19C4 4E800020 */  blr     

glabel __DVDDequeueWaitingQueue
/* 0BC428 800C19C8 7C0802A6 */  mflr    r0
/* 0BC42C 800C19CC 90010004 */  stw     r0, 4(r1)
/* 0BC430 800C19D0 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0BC434 800C19D4 93E10014 */  stw     r31, 0x14(r1)
/* 0BC438 800C19D8 7C7F1B78 */  mr      r31, r3
/* 0BC43C 800C19DC 4BFE8D95 */  bl      OSDisableInterrupts
/* 0BC440 800C19E0 809F0004 */  lwz     r4, 4(r31)
/* 0BC444 800C19E4 80BF0000 */  lwz     r5, 0(r31)
/* 0BC448 800C19E8 28040000 */  cmplwi  r4, 0
/* 0BC44C 800C19EC 4182000C */  beq     lbl_800C19F8
/* 0BC450 800C19F0 28050000 */  cmplwi  r5, 0
/* 0BC454 800C19F4 40820010 */  bne     lbl_800C1A04
lbl_800C19F8:
/* 0BC458 800C19F8 4BFE8DA1 */  bl      OSRestoreInterrupts
/* 0BC45C 800C19FC 38600000 */  li      r3, 0
/* 0BC460 800C1A00 48000014 */  b       lbl_800C1A14
lbl_800C1A04:
/* 0BC464 800C1A04 90A40000 */  stw     r5, 0(r4)
/* 0BC468 800C1A08 90850004 */  stw     r4, 4(r5)
/* 0BC46C 800C1A0C 4BFE8D8D */  bl      OSRestoreInterrupts
/* 0BC470 800C1A10 38600001 */  li      r3, 1
lbl_800C1A14:
/* 0BC474 800C1A14 8001001C */  lwz     r0, 0x1c(r1)
/* 0BC478 800C1A18 83E10014 */  lwz     r31, 0x14(r1)
/* 0BC47C 800C1A1C 38210018 */  addi    r1, r1, 0x18
/* 0BC480 800C1A20 7C0803A6 */  mtlr    r0
/* 0BC484 800C1A24 4E800020 */  blr     


.section .bss, "wa"

.balign 4

/* 0013F3B8 80142338 0020 */
WaitingQueue:
    .skip 32


