# mtxvec.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel PSMTXMultVec
/* 0AE498 800B3A38 E0040000 */  psq_l   f0, 0(r4), 0, qr0
/* 0AE49C 800B3A3C E0430000 */  psq_l   f2, 0(r3), 0, qr0
/* 0AE4A0 800B3A40 E0248008 */  psq_l   f1, 8(r4), 1, qr0
/* 0AE4A4 800B3A44 10820032 */  ps_mul  f4, f2, f0
/* 0AE4A8 800B3A48 E0630008 */  psq_l   f3, 8(r3), 0, qr0
/* 0AE4AC 800B3A4C 10A3207A */  ps_madd f5, f3, f1, f4
/* 0AE4B0 800B3A50 E1030010 */  psq_l   f8, 16(r3), 0, qr0
/* 0AE4B4 800B3A54 10C52994 */  ps_sum0 f6, f5, f6, f5
/* 0AE4B8 800B3A58 E1230018 */  psq_l   f9, 24(r3), 0, qr0
/* 0AE4BC 800B3A5C 11480032 */  ps_mul  f10, f8, f0
/* 0AE4C0 800B3A60 F0C58000 */  psq_st  f6, 0(r5), 1, qr0
/* 0AE4C4 800B3A64 1169507A */  ps_madd f11, f9, f1, f10
/* 0AE4C8 800B3A68 E0430020 */  psq_l   f2, 32(r3), 0, qr0
/* 0AE4CC 800B3A6C 118B5B14 */  ps_sum0 f12, f11, f12, f11
/* 0AE4D0 800B3A70 E0630028 */  psq_l   f3, 40(r3), 0, qr0
/* 0AE4D4 800B3A74 10820032 */  ps_mul  f4, f2, f0
/* 0AE4D8 800B3A78 F1858004 */  psq_st  f12, 4(r5), 1, qr0
/* 0AE4DC 800B3A7C 10A3207A */  ps_madd f5, f3, f1, f4
/* 0AE4E0 800B3A80 10C52994 */  ps_sum0 f6, f5, f6, f5
/* 0AE4E4 800B3A84 F0C58008 */  psq_st  f6, 8(r5), 1, qr0
/* 0AE4E8 800B3A88 4E800020 */  blr     


