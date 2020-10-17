# common_float_tables.c
.include "macros.inc"

.section .data, "wa"

.balign 8

/* 000FF1F0 80102170 0020 */
glabel __sincos_on_quadrant
    .long 0x00000000, 0x3F800000, 0x3F800000, 0x00000000, 0x00000000, 0xBF800000, 0xBF800000, 0x00000000

.balign 4

/* 000FF210 80102190 0028 */
glabel __sincos_poly
    .long 0x366CCFAA, 0x34A5E129, 0xB9AAE275, 0xB8196543, 0x3C81E0ED, 0x3B2335DD, 0xBE9DE9E6, 0xBDA55DE7
    .long 0x3F800000, 0x3F490FDB


