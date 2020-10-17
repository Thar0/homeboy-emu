# codeGCN.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel codeEvent
/* 0177F4 8001CD94 2C040003 */  cmpwi   r4, 3
/* 0177F8 8001CD98 41820048 */  beq     lbl_8001CDE0
/* 0177FC 8001CD9C 40800018 */  bge     lbl_8001CDB4
/* 017800 8001CDA0 2C040002 */  cmpwi   r4, 2
/* 017804 8001CDA4 40800024 */  bge     lbl_8001CDC8
/* 017808 8001CDA8 2C040000 */  cmpwi   r4, 0
/* 01780C 8001CDAC 40800034 */  bge     lbl_8001CDE0
/* 017810 8001CDB0 48000028 */  b       lbl_8001CDD8
lbl_8001CDB4:
/* 017814 8001CDB4 2C040007 */  cmpwi   r4, 7
/* 017818 8001CDB8 40800020 */  bge     lbl_8001CDD8
/* 01781C 8001CDBC 2C040005 */  cmpwi   r4, 5
/* 017820 8001CDC0 40800020 */  bge     lbl_8001CDE0
/* 017824 8001CDC4 48000014 */  b       lbl_8001CDD8
lbl_8001CDC8:
/* 017828 8001CDC8 38000000 */  li      r0, 0
/* 01782C 8001CDCC 900D8F70 */  stw     r0, gpBufferFunction-_SDA_BASE_(r13)
/* 017830 8001CDD0 900D8F74 */  stw     r0, ganDataCode-_SDA_BASE_(r13)
/* 017834 8001CDD4 4800000C */  b       lbl_8001CDE0
lbl_8001CDD8:
/* 017838 8001CDD8 38600000 */  li      r3, 0
/* 01783C 8001CDDC 4E800020 */  blr     
lbl_8001CDE0:
/* 017840 8001CDE0 38600001 */  li      r3, 1
/* 017844 8001CDE4 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F3998 800F6918 0010 */
glabel gClassCode
    .long D_80144AD0, 0x00000004, 0x00000000, codeEvent


.section .sdata, "wa"

.balign 8

/* 000FF330 80144AD0 0005 */
D_80144AD0:
    .asciz "Code"


.section .sbss, "wa"

.balign 8

/* 001001B0 80145950 0004 */
gpBufferFunction:
    .skip 4

.balign 4

/* 001001B4 80145954 0004 */
ganDataCode:
    .skip 4


