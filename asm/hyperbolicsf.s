# hyperbolicsf.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel fabsf__Ff
/* 0D8A94 800DE034 FC200A10 */  fabs	f1, f1
/* 0D8A98 800DE038 4E800020 */  blr		


