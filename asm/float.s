# float.c
.include "macros.inc"

.section .data, "wa"

.balign 8

/* 000FF1D8 80102158 0004 */
glabel __float_nan
    .float nan

.balign 4

/* 000FF1DC 8010215C 0004 */
glabel __float_huge
    .float inf


