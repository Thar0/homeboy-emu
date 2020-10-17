# dsp_debug.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __DSP_debug_printf
/* 0C1074 800C6614 9421FF90 */  stwu    r1, -0x70(r1)
/* 0C1078 800C6618 40860024 */  bne     cr1, lbl_800C663C
/* 0C107C 800C661C D8210028 */  stfd    f1, 0x28(r1)
/* 0C1080 800C6620 D8410030 */  stfd    f2, 0x30(r1)
/* 0C1084 800C6624 D8610038 */  stfd    f3, 0x38(r1)
/* 0C1088 800C6628 D8810040 */  stfd    f4, 0x40(r1)
/* 0C108C 800C662C D8A10048 */  stfd    f5, 0x48(r1)
/* 0C1090 800C6630 D8C10050 */  stfd    f6, 0x50(r1)
/* 0C1094 800C6634 D8E10058 */  stfd    f7, 0x58(r1)
/* 0C1098 800C6638 D9010060 */  stfd    f8, 0x60(r1)
lbl_800C663C:
/* 0C109C 800C663C 90610008 */  stw     r3, 8(r1)
/* 0C10A0 800C6640 9081000C */  stw     r4, 0xc(r1)
/* 0C10A4 800C6644 90A10010 */  stw     r5, 0x10(r1)
/* 0C10A8 800C6648 90C10014 */  stw     r6, 0x14(r1)
/* 0C10AC 800C664C 90E10018 */  stw     r7, 0x18(r1)
/* 0C10B0 800C6650 9101001C */  stw     r8, 0x1c(r1)
/* 0C10B4 800C6654 91210020 */  stw     r9, 0x20(r1)
/* 0C10B8 800C6658 91410024 */  stw     r10, 0x24(r1)
/* 0C10BC 800C665C 38210070 */  addi    r1, r1, 0x70
/* 0C10C0 800C6660 4E800020 */  blr     


