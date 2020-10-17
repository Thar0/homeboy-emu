# e_asin.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel fabs__Fd
/* 0D7CA0 800DD240 FC200A10 */  fabs    f1, f1
/* 0D7CA4 800DD244 4E800020 */  blr     


