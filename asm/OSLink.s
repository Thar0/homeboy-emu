# OSLink.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel __OSModuleInit
/* 0A5A3C 800AAFDC 3C808000 */  lis		r4, 0x8000
/* 0A5A40 800AAFE0 38000000 */  li		r0, 0
/* 0A5A44 800AAFE4 900430CC */  stw		r0, 0x30cc(r4)
/* 0A5A48 800AAFE8 900430C8 */  stw		r0, 0x30c8(r4)
/* 0A5A4C 800AAFEC 900430D0 */  stw		r0, 0x30d0(r4)
/* 0A5A50 800AAFF0 4E800020 */  blr		


