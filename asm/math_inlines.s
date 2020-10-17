# math_inlines.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel sqrt
/* 0D905C 800DE5FC C80287B8 */  lfd		f0, D_80146798-_SDA2_BASE_(r2)
/* 0D9060 800DE600 FC010040 */  fcmpo	cr0, f1, f0
/* 0D9064 800DE604 40810058 */  ble		lbl_800DE65C
/* 0D9068 800DE608 FC400834 */  frsqrte	f2, f1
/* 0D906C 800DE60C C88287C0 */  lfd		f4, D_801467A0-_SDA2_BASE_(r2)
/* 0D9070 800DE610 C86287C8 */  lfd		f3, D_801467A8-_SDA2_BASE_(r2)
/* 0D9074 800DE614 FC0200B2 */  fmul	f0, f2, f2
/* 0D9078 800DE618 FC4400B2 */  fmul	f2, f4, f2
/* 0D907C 800DE61C FC01183C */  fnmsub	f0, f1, f0, f3
/* 0D9080 800DE620 FC420032 */  fmul	f2, f2, f0
/* 0D9084 800DE624 FC0200B2 */  fmul	f0, f2, f2
/* 0D9088 800DE628 FC4400B2 */  fmul	f2, f4, f2
/* 0D908C 800DE62C FC01183C */  fnmsub	f0, f1, f0, f3
/* 0D9090 800DE630 FC420032 */  fmul	f2, f2, f0
/* 0D9094 800DE634 FC0200B2 */  fmul	f0, f2, f2
/* 0D9098 800DE638 FC4400B2 */  fmul	f2, f4, f2
/* 0D909C 800DE63C FC01183C */  fnmsub	f0, f1, f0, f3
/* 0D90A0 800DE640 FC420032 */  fmul	f2, f2, f0
/* 0D90A4 800DE644 FC0200B2 */  fmul	f0, f2, f2
/* 0D90A8 800DE648 FC4400B2 */  fmul	f2, f4, f2
/* 0D90AC 800DE64C FC01183C */  fnmsub	f0, f1, f0, f3
/* 0D90B0 800DE650 FC020032 */  fmul	f0, f2, f0
/* 0D90B4 800DE654 FC210032 */  fmul	f1, f1, f0
/* 0D90B8 800DE658 4E800020 */  blr		
lbl_800DE65C:
/* 0D90BC 800DE65C FC000800 */  fcmpu	cr0, f0, f1
/* 0D90C0 800DE660 4082000C */  bne		lbl_800DE66C
/* 0D90C4 800DE664 FC200090 */  fmr		f1, f0
/* 0D90C8 800DE668 4E800020 */  blr		
lbl_800DE66C:
/* 0D90CC 800DE66C FC010000 */  fcmpu	cr0, f1, f0
/* 0D90D0 800DE670 41820010 */  beq		lbl_800DE680
/* 0D90D4 800DE674 3C608010 */  lis		r3, __float_nan@ha
/* 0D90D8 800DE678 C0232158 */  lfs		f1, __float_nan@l(r3)
/* 0D90DC 800DE67C 4E800020 */  blr		
lbl_800DE680:
/* 0D90E0 800DE680 3C608010 */  lis		r3, __float_huge@ha
/* 0D90E4 800DE684 C023215C */  lfs		f1, __float_huge@l(r3)
/* 0D90E8 800DE688 4E800020 */  blr		


.section .sdata2, "wa"

.balign 8

/* 00100858 80146798 0008 */
D_80146798:
    .double 0.0

.balign 8

/* 00100860 801467A0 0008 */
D_801467A0:
    .double 0.5

.balign 8

/* 00100868 801467A8 0008 */
D_801467A8:
    .double 3.0


