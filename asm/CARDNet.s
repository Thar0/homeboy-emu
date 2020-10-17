# CARDNet.c
.include "macros.inc"

.section .sdata, "wa"

.balign 8

/* 00100078 80145818 0002 */
glabel __CARDVendorID
    .short 0xFFFF

/* 0010007A 8014581A 0001 */
glabel __CARDPermMask
    .byte 0x1C


