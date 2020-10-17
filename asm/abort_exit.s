# abort_exit.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel exit
/* 0D4BD0 800DA170 7C0802A6 */  mflr    r0
/* 0D4BD4 800DA174 90010004 */  stw     r0, 4(r1)
/* 0D4BD8 800DA178 9421FFE8 */  stwu    r1, -0x18(r1)
/* 0D4BDC 800DA17C 93E10014 */  stw     r31, 0x14(r1)
/* 0D4BE0 800DA180 800D95C0 */  lwz     r0, __aborting-_SDA_BASE_(r13)
/* 0D4BE4 800DA184 2C000000 */  cmpwi   r0, 0
/* 0D4BE8 800DA188 40820084 */  bne     lbl_800DA20C
/* 0D4BEC 800DA18C 3C608014 */  lis     r3, atexit_funcs@ha
/* 0D4BF0 800DA190 3BE347D8 */  addi    r31, r3, atexit_funcs@l
/* 0D4BF4 800DA194 48000024 */  b       lbl_800DA1B8
lbl_800DA198:
/* 0D4BF8 800DA198 806D95C4 */  lwz     r3, atexit_curr_func-_SDA_BASE_(r13)
/* 0D4BFC 800DA19C 3863FFFF */  addi    r3, r3, -1
/* 0D4C00 800DA1A0 5460103A */  slwi    r0, r3, 2
/* 0D4C04 800DA1A4 906D95C4 */  stw     r3, atexit_curr_func-_SDA_BASE_(r13)
/* 0D4C08 800DA1A8 7C7F0214 */  add     r3, r31, r0
/* 0D4C0C 800DA1AC 81830000 */  lwz     r12, 0(r3)
/* 0D4C10 800DA1B0 7D8803A6 */  mtlr    r12
/* 0D4C14 800DA1B4 4E800021 */  blrl    
lbl_800DA1B8:
/* 0D4C18 800DA1B8 800D95C4 */  lwz     r0, atexit_curr_func-_SDA_BASE_(r13)
/* 0D4C1C 800DA1BC 2C000000 */  cmpwi   r0, 0
/* 0D4C20 800DA1C0 4181FFD8 */  bgt     lbl_800DA198
/* 0D4C24 800DA1C4 4BFFF855 */  bl      __destroy_global_chain
/* 0D4C28 800DA1C8 3C60800E */  lis     r3, _dtors@ha
/* 0D4C2C 800DA1CC 3803F180 */  addi    r0, r3, _dtors@l
/* 0D4C30 800DA1D0 7C1F0378 */  mr      r31, r0
/* 0D4C34 800DA1D4 48000010 */  b       lbl_800DA1E4
lbl_800DA1D8:
/* 0D4C38 800DA1D8 7D8803A6 */  mtlr    r12
/* 0D4C3C 800DA1DC 4E800021 */  blrl    
/* 0D4C40 800DA1E0 3BFF0004 */  addi    r31, r31, 4
lbl_800DA1E4:
/* 0D4C44 800DA1E4 819F0000 */  lwz     r12, 0(r31)
/* 0D4C48 800DA1E8 280C0000 */  cmplwi  r12, 0
/* 0D4C4C 800DA1EC 4082FFEC */  bne     lbl_800DA1D8
/* 0D4C50 800DA1F0 818D95CC */  lwz     r12, __stdio_exit-_SDA_BASE_(r13)
/* 0D4C54 800DA1F4 280C0000 */  cmplwi  r12, 0
/* 0D4C58 800DA1F8 41820014 */  beq     lbl_800DA20C
/* 0D4C5C 800DA1FC 7D8803A6 */  mtlr    r12
/* 0D4C60 800DA200 4E800021 */  blrl    
/* 0D4C64 800DA204 38000000 */  li      r0, 0
/* 0D4C68 800DA208 900D95CC */  stw     r0, __stdio_exit-_SDA_BASE_(r13)
lbl_800DA20C:
/* 0D4C6C 800DA20C 3C608014 */  lis     r3, __atexit_funcs@ha
/* 0D4C70 800DA210 3BE348D8 */  addi    r31, r3, __atexit_funcs@l
/* 0D4C74 800DA214 48000024 */  b       lbl_800DA238
lbl_800DA218:
/* 0D4C78 800DA218 806D95C8 */  lwz     r3, __atexit_curr_func-_SDA_BASE_(r13)
/* 0D4C7C 800DA21C 3863FFFF */  addi    r3, r3, -1
/* 0D4C80 800DA220 5460103A */  slwi    r0, r3, 2
/* 0D4C84 800DA224 906D95C8 */  stw     r3, __atexit_curr_func-_SDA_BASE_(r13)
/* 0D4C88 800DA228 7C7F0214 */  add     r3, r31, r0
/* 0D4C8C 800DA22C 81830000 */  lwz     r12, 0(r3)
/* 0D4C90 800DA230 7D8803A6 */  mtlr    r12
/* 0D4C94 800DA234 4E800021 */  blrl    
lbl_800DA238:
/* 0D4C98 800DA238 800D95C8 */  lwz     r0, __atexit_curr_func-_SDA_BASE_(r13)
/* 0D4C9C 800DA23C 2C000000 */  cmpwi   r0, 0
/* 0D4CA0 800DA240 4181FFD8 */  bgt     lbl_800DA218
/* 0D4CA4 800DA244 480004ED */  bl      __kill_critical_regions
/* 0D4CA8 800DA248 818D95D0 */  lwz     r12, __console_exit-_SDA_BASE_(r13)
/* 0D4CAC 800DA24C 280C0000 */  cmplwi  r12, 0
/* 0D4CB0 800DA250 41820014 */  beq     lbl_800DA264
/* 0D4CB4 800DA254 7D8803A6 */  mtlr    r12
/* 0D4CB8 800DA258 4E800021 */  blrl    
/* 0D4CBC 800DA25C 38000000 */  li      r0, 0
/* 0D4CC0 800DA260 900D95D0 */  stw     r0, __console_exit-_SDA_BASE_(r13)
lbl_800DA264:
/* 0D4CC4 800DA264 4BFD3F55 */  bl      _ExitProcess
/* 0D4CC8 800DA268 8001001C */  lwz     r0, 0x1c(r1)
/* 0D4CCC 800DA26C 83E10014 */  lwz     r31, 0x14(r1)
/* 0D4CD0 800DA270 38210018 */  addi    r1, r1, 0x18
/* 0D4CD4 800DA274 7C0803A6 */  mtlr    r0
/* 0D4CD8 800DA278 4E800020 */  blr     


.section .dtors, "a"

.balign 4

/* 000DC200 800DF180 0004 */
glabel _dtors
    .long __destroy_global_chain


.section .bss, "wa"

.balign 8

/* 00141858 801447D8 0100 */
atexit_funcs:
    .skip 256

.balign 4

/* 00141958 801448D8 0100 */
__atexit_funcs:
    .skip 256


.section .sbss, "wa"

.balign 8

/* 00100800 80145FA0 0004 */
glabel __aborting
    .skip 4

.balign 4

/* 00100804 80145FA4 0004 */
atexit_curr_func:
    .skip 4

.balign 4

/* 00100808 80145FA8 0004 */
__atexit_curr_func:
    .skip 4

.balign 4

/* 0010080C 80145FAC 0004 */
glabel __stdio_exit
    .skip 4

.balign 4

/* 00100810 80145FB0 0004 */
glabel __console_exit
    .skip 4


