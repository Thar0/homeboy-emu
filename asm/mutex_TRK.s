# mutex_TRK.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKInitializeMutex
/* 0D2340 800D78E0 38600000 */  li		r3, 0
/* 0D2344 800D78E4 4E800020 */  blr		

glabel TRKAcquireMutex
/* 0D2348 800D78E8 38600000 */  li		r3, 0
/* 0D234C 800D78EC 4E800020 */  blr		

glabel TRKReleaseMutex
/* 0D2350 800D78F0 38600000 */  li		r3, 0
/* 0D2354 800D78F4 4E800020 */  blr		


