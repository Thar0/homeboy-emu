# db.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel DBInit
/* 0AE1B4 800B3754 3C808000 */  lis		r4, 0x8000
/* 0AE1B8 800B3758 38040040 */  addi	r0, r4, 0x40
/* 0AE1BC 800B375C 3C60800B */  lis		r3, __DBExceptionDestination@ha
/* 0AE1C0 800B3760 900D9218 */  stw		r0, __DBInterface-_SDA_BASE_(r13)
/* 0AE1C4 800B3764 386337C4 */  addi	r3, r3, __DBExceptionDestination@l
/* 0AE1C8 800B3768 3C038000 */  addis	r0, r3, 0x8000
/* 0AE1CC 800B376C 90040048 */  stw		r0, 0x48(r4)
/* 0AE1D0 800B3770 38000001 */  li		r0, 1
/* 0AE1D4 800B3774 900D921C */  stw		r0, DBVerbose-_SDA_BASE_(r13)
/* 0AE1D8 800B3778 4E800020 */  blr		

glabel __DBExceptionDestinationAux
/* 0AE1DC 800B377C 7C0802A6 */  mflr	r0
/* 0AE1E0 800B3780 3C608010 */  lis		r3, D_800FFAF0@ha
/* 0AE1E4 800B3784 90010004 */  stw		r0, 4(r1)
/* 0AE1E8 800B3788 3863FAF0 */  addi	r3, r3, D_800FFAF0@l
/* 0AE1EC 800B378C 4CC63182 */  crclr	6
/* 0AE1F0 800B3790 9421FFE8 */  stwu	r1, -0x18(r1)
/* 0AE1F4 800B3794 93E10014 */  stw		r31, 0x14(r1)
/* 0AE1F8 800B3798 808000C0 */  lwz		r4, 0xc0(0)
/* 0AE1FC 800B379C 3FE48000 */  addis	r31, r4, 0x8000
/* 0AE200 800B37A0 4BFF68CD */  bl		OSReport
/* 0AE204 800B37A4 7FE3FB78 */  mr		r3, r31
/* 0AE208 800B37A8 4BFF6551 */  bl		OSDumpContext
/* 0AE20C 800B37AC 4BFF3DC5 */  bl		PPCHalt
/* 0AE210 800B37B0 8001001C */  lwz		r0, 0x1c(r1)
/* 0AE214 800B37B4 83E10014 */  lwz		r31, 0x14(r1)
/* 0AE218 800B37B8 38210018 */  addi	r1, r1, 0x18
/* 0AE21C 800B37BC 7C0803A6 */  mtlr	r0
/* 0AE220 800B37C0 4E800020 */  blr		

glabel __DBExceptionDestination
/* 0AE224 800B37C4 7C6000A6 */  mfmsr	r3
/* 0AE228 800B37C8 60630030 */  ori		r3, r3, 0x30
/* 0AE22C 800B37CC 7C600124 */  mtmsr	r3
/* 0AE230 800B37D0 4BFFFFAC */  b		__DBExceptionDestinationAux

glabel __DBIsExceptionMarked
/* 0AE234 800B37D4 808D9218 */  lwz		r4, __DBInterface-_SDA_BASE_(r13)
/* 0AE238 800B37D8 5460063E */  clrlwi	r0, r3, 0x18
/* 0AE23C 800B37DC 38600001 */  li		r3, 1
/* 0AE240 800B37E0 80840004 */  lwz		r4, 4(r4)
/* 0AE244 800B37E4 7C600030 */  slw		r0, r3, r0
/* 0AE248 800B37E8 7C830038 */  and		r3, r4, r0
/* 0AE24C 800B37EC 4E800020 */  blr		

glabel DBPrintf
/* 0AE250 800B37F0 9421FF90 */  stwu	r1, -0x70(r1)
/* 0AE254 800B37F4 40860024 */  bne		cr1, lbl_800B3818
/* 0AE258 800B37F8 D8210028 */  stfd	f1, 0x28(r1)
/* 0AE25C 800B37FC D8410030 */  stfd	f2, 0x30(r1)
/* 0AE260 800B3800 D8610038 */  stfd	f3, 0x38(r1)
/* 0AE264 800B3804 D8810040 */  stfd	f4, 0x40(r1)
/* 0AE268 800B3808 D8A10048 */  stfd	f5, 0x48(r1)
/* 0AE26C 800B380C D8C10050 */  stfd	f6, 0x50(r1)
/* 0AE270 800B3810 D8E10058 */  stfd	f7, 0x58(r1)
/* 0AE274 800B3814 D9010060 */  stfd	f8, 0x60(r1)
lbl_800B3818:
/* 0AE278 800B3818 90610008 */  stw		r3, 8(r1)
/* 0AE27C 800B381C 9081000C */  stw		r4, 0xc(r1)
/* 0AE280 800B3820 90A10010 */  stw		r5, 0x10(r1)
/* 0AE284 800B3824 90C10014 */  stw		r6, 0x14(r1)
/* 0AE288 800B3828 90E10018 */  stw		r7, 0x18(r1)
/* 0AE28C 800B382C 9101001C */  stw		r8, 0x1c(r1)
/* 0AE290 800B3830 91210020 */  stw		r9, 0x20(r1)
/* 0AE294 800B3834 91410024 */  stw		r10, 0x24(r1)
/* 0AE298 800B3838 38210070 */  addi	r1, r1, 0x70
/* 0AE29C 800B383C 4E800020 */  blr		


.section .data, "wa"

.balign 8

/* 000FCB70 800FFAF0 0018 */
D_800FFAF0:
    .asciz "DBExceptionDestination\n"


.section .sbss, "wa"

.balign 8

/* 00100458 80145BF8 0004 */
glabel __DBInterface
    .skip 4

.balign 4

/* 0010045C 80145BFC 0004 */
glabel DBVerbose
    .skip 4


