# peripheral.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel peripheralEvent
/* 09C890 800A1E30 7C0802A6 */  mflr    r0
/* 09C894 800A1E34 2C040003 */  cmpwi   r4, 3
/* 09C898 800A1E38 90010004 */  stw     r0, 4(r1)
/* 09C89C 800A1E3C 9421FFE0 */  stwu    r1, -0x20(r1)
/* 09C8A0 800A1E40 93E1001C */  stw     r31, 0x1c(r1)
/* 09C8A4 800A1E44 3BE50000 */  addi    r31, r5, 0
/* 09C8A8 800A1E48 93C10018 */  stw     r30, 0x18(r1)
/* 09C8AC 800A1E4C 3BC30000 */  addi    r30, r3, 0
/* 09C8B0 800A1E50 418200CC */  beq     lbl_800A1F1C
/* 09C8B4 800A1E54 40800018 */  bge     lbl_800A1E6C
/* 09C8B8 800A1E58 2C040002 */  cmpwi   r4, 2
/* 09C8BC 800A1E5C 40800028 */  bge     lbl_800A1E84
/* 09C8C0 800A1E60 2C040000 */  cmpwi   r4, 0
/* 09C8C4 800A1E64 408000B8 */  bge     lbl_800A1F1C
/* 09C8C8 800A1E68 480000AC */  b       lbl_800A1F14
lbl_800A1E6C:
/* 09C8CC 800A1E6C 2C041003 */  cmpwi   r4, 0x1003
/* 09C8D0 800A1E70 418200AC */  beq     lbl_800A1F1C
/* 09C8D4 800A1E74 408000A0 */  bge     lbl_800A1F14
/* 09C8D8 800A1E78 2C041002 */  cmpwi   r4, 0x1002
/* 09C8DC 800A1E7C 40800018 */  bge     lbl_800A1E94
/* 09C8E0 800A1E80 48000094 */  b       lbl_800A1F14
lbl_800A1E84:
/* 09C8E4 800A1E84 38000000 */  li      r0, 0
/* 09C8E8 800A1E88 901E0004 */  stw     r0, 4(r30)
/* 09C8EC 800A1E8C 93FE0000 */  stw     r31, 0(r30)
/* 09C8F0 800A1E90 4800008C */  b       lbl_800A1F1C
lbl_800A1E94:
/* 09C8F4 800A1E94 807E0000 */  lwz     r3, 0(r30)
/* 09C8F8 800A1E98 3CA0800A */  lis     r5, peripheralPut8@ha
/* 09C8FC 800A1E9C 3CC0800A */  lis     r6, peripheralPut16@ha
/* 09C900 800A1EA0 3CE0800A */  lis     r7, peripheralPut32@ha
/* 09C904 800A1EA4 80630024 */  lwz     r3, 0x24(r3)
/* 09C908 800A1EA8 3C80800A */  lis     r4, peripheralPut64@ha
/* 09C90C 800A1EAC 39042050 */  addi    r8, r4, peripheralPut64@l
/* 09C910 800A1EB0 38A523E4 */  addi    r5, r5, peripheralPut8@l
/* 09C914 800A1EB4 38C623DC */  addi    r6, r6, peripheralPut16@l
/* 09C918 800A1EB8 38E72058 */  addi    r7, r7, peripheralPut32@l
/* 09C91C 800A1EBC 389F0000 */  addi    r4, r31, 0
/* 09C920 800A1EC0 4BF93061 */  bl      cpuSetDevicePut
/* 09C924 800A1EC4 2C030000 */  cmpwi   r3, 0
/* 09C928 800A1EC8 4082000C */  bne     lbl_800A1ED4
/* 09C92C 800A1ECC 38600000 */  li      r3, 0
/* 09C930 800A1ED0 48000050 */  b       lbl_800A1F20
lbl_800A1ED4:
/* 09C934 800A1ED4 807E0000 */  lwz     r3, 0(r30)
/* 09C938 800A1ED8 3CA0800A */  lis     r5, peripheralGet8@ha
/* 09C93C 800A1EDC 3CC0800A */  lis     r6, peripheralGet16@ha
/* 09C940 800A1EE0 3CE0800A */  lis     r7, peripheralGet32@ha
/* 09C944 800A1EE4 80630024 */  lwz     r3, 0x24(r3)
/* 09C948 800A1EE8 3C80800A */  lis     r4, peripheralGet64@ha
/* 09C94C 800A1EEC 39041F38 */  addi    r8, r4, peripheralGet64@l
/* 09C950 800A1EF0 38A52048 */  addi    r5, r5, peripheralGet8@l
/* 09C954 800A1EF4 38C62040 */  addi    r6, r6, peripheralGet16@l
/* 09C958 800A1EF8 38E71F40 */  addi    r7, r7, peripheralGet32@l
/* 09C95C 800A1EFC 389F0000 */  addi    r4, r31, 0
/* 09C960 800A1F00 4BF93039 */  bl      cpuSetDeviceGet
/* 09C964 800A1F04 2C030000 */  cmpwi   r3, 0
/* 09C968 800A1F08 40820014 */  bne     lbl_800A1F1C
/* 09C96C 800A1F0C 38600000 */  li      r3, 0
/* 09C970 800A1F10 48000010 */  b       lbl_800A1F20
lbl_800A1F14:
/* 09C974 800A1F14 38600000 */  li      r3, 0
/* 09C978 800A1F18 48000008 */  b       lbl_800A1F20
lbl_800A1F1C:
/* 09C97C 800A1F1C 38600001 */  li      r3, 1
lbl_800A1F20:
/* 09C980 800A1F20 80010024 */  lwz     r0, 0x24(r1)
/* 09C984 800A1F24 83E1001C */  lwz     r31, 0x1c(r1)
/* 09C988 800A1F28 83C10018 */  lwz     r30, 0x18(r1)
/* 09C98C 800A1F2C 7C0803A6 */  mtlr    r0
/* 09C990 800A1F30 38210020 */  addi    r1, r1, 0x20
/* 09C994 800A1F34 4E800020 */  blr     

glabel peripheralGet64
/* 09C998 800A1F38 38600000 */  li      r3, 0
/* 09C99C 800A1F3C 4E800020 */  blr     

glabel peripheralGet32
/* 09C9A0 800A1F40 548006BE */  clrlwi  r0, r4, 0x1a
/* 09C9A4 800A1F44 28000030 */  cmplwi  r0, 0x30
/* 09C9A8 800A1F48 418100E8 */  bgt     lbl_800A2030
/* 09C9AC 800A1F4C 3C808010 */  lis     r4, jtbl_800FD7FC@ha
/* 09C9B0 800A1F50 3884D7FC */  addi    r4, r4, jtbl_800FD7FC@l
/* 09C9B4 800A1F54 5400103A */  slwi    r0, r0, 2
/* 09C9B8 800A1F58 7C04002E */  lwzx    r0, r4, r0
/* 09C9BC 800A1F5C 7C0903A6 */  mtctr   r0
/* 09C9C0 800A1F60 4E800420 */  bctr    
glabel lbl_800A1F64
/* 09C9C4 800A1F64 80030028 */  lwz     r0, 0x28(r3)
/* 09C9C8 800A1F68 5400023E */  clrlwi  r0, r0, 8
/* 09C9CC 800A1F6C 90050000 */  stw     r0, 0(r5)
/* 09C9D0 800A1F70 480000C8 */  b       lbl_800A2038
glabel lbl_800A1F74
/* 09C9D4 800A1F74 8003002C */  lwz     r0, 0x2c(r3)
/* 09C9D8 800A1F78 90050000 */  stw     r0, 0(r5)
/* 09C9DC 800A1F7C 480000BC */  b       lbl_800A2038
glabel lbl_800A1F80
/* 09C9E0 800A1F80 80030008 */  lwz     r0, 8(r3)
/* 09C9E4 800A1F84 5400023E */  clrlwi  r0, r0, 8
/* 09C9E8 800A1F88 90050000 */  stw     r0, 0(r5)
/* 09C9EC 800A1F8C 480000AC */  b       lbl_800A2038
glabel lbl_800A1F90
/* 09C9F0 800A1F90 8003000C */  lwz     r0, 0xc(r3)
/* 09C9F4 800A1F94 5400023E */  clrlwi  r0, r0, 8
/* 09C9F8 800A1F98 90050000 */  stw     r0, 0(r5)
/* 09C9FC 800A1F9C 4800009C */  b       lbl_800A2038
glabel lbl_800A1FA0
/* 09CA00 800A1FA0 80030004 */  lwz     r0, 4(r3)
/* 09CA04 800A1FA4 5400077E */  clrlwi  r0, r0, 0x1d
/* 09CA08 800A1FA8 90050000 */  stw     r0, 0(r5)
/* 09CA0C 800A1FAC 4800008C */  b       lbl_800A2038
glabel lbl_800A1FB0
/* 09CA10 800A1FB0 80030010 */  lwz     r0, 0x10(r3)
/* 09CA14 800A1FB4 5400063E */  clrlwi  r0, r0, 0x18
/* 09CA18 800A1FB8 90050000 */  stw     r0, 0(r5)
/* 09CA1C 800A1FBC 4800007C */  b       lbl_800A2038
glabel lbl_800A1FC0
/* 09CA20 800A1FC0 80030030 */  lwz     r0, 0x30(r3)
/* 09CA24 800A1FC4 5400063E */  clrlwi  r0, r0, 0x18
/* 09CA28 800A1FC8 90050000 */  stw     r0, 0(r5)
/* 09CA2C 800A1FCC 4800006C */  b       lbl_800A2038
glabel lbl_800A1FD0
/* 09CA30 800A1FD0 80030020 */  lwz     r0, 0x20(r3)
/* 09CA34 800A1FD4 5400073E */  clrlwi  r0, r0, 0x1c
/* 09CA38 800A1FD8 90050000 */  stw     r0, 0(r5)
/* 09CA3C 800A1FDC 4800005C */  b       lbl_800A2038
glabel lbl_800A1FE0
/* 09CA40 800A1FE0 80030018 */  lwz     r0, 0x18(r3)
/* 09CA44 800A1FE4 540007FE */  clrlwi  r0, r0, 0x1f
/* 09CA48 800A1FE8 90050000 */  stw     r0, 0(r5)
/* 09CA4C 800A1FEC 4800004C */  b       lbl_800A2038
glabel lbl_800A1FF0
/* 09CA50 800A1FF0 80030014 */  lwz     r0, 0x14(r3)
/* 09CA54 800A1FF4 5400063E */  clrlwi  r0, r0, 0x18
/* 09CA58 800A1FF8 90050000 */  stw     r0, 0(r5)
/* 09CA5C 800A1FFC 4800003C */  b       lbl_800A2038
glabel lbl_800A2000
/* 09CA60 800A2000 80030034 */  lwz     r0, 0x34(r3)
/* 09CA64 800A2004 5400063E */  clrlwi  r0, r0, 0x18
/* 09CA68 800A2008 90050000 */  stw     r0, 0(r5)
/* 09CA6C 800A200C 4800002C */  b       lbl_800A2038
glabel lbl_800A2010
/* 09CA70 800A2010 80030024 */  lwz     r0, 0x24(r3)
/* 09CA74 800A2014 5400073E */  clrlwi  r0, r0, 0x1c
/* 09CA78 800A2018 90050000 */  stw     r0, 0(r5)
/* 09CA7C 800A201C 4800001C */  b       lbl_800A2038
glabel lbl_800A2020
/* 09CA80 800A2020 8003001C */  lwz     r0, 0x1c(r3)
/* 09CA84 800A2024 540007FE */  clrlwi  r0, r0, 0x1f
/* 09CA88 800A2028 90050000 */  stw     r0, 0(r5)
/* 09CA8C 800A202C 4800000C */  b       lbl_800A2038
glabel lbl_800A2030
/* 09CA90 800A2030 38600000 */  li      r3, 0
/* 09CA94 800A2034 4E800020 */  blr     
lbl_800A2038:
/* 09CA98 800A2038 38600001 */  li      r3, 1
/* 09CA9C 800A203C 4E800020 */  blr     

glabel peripheralGet16
/* 09CAA0 800A2040 38600000 */  li      r3, 0
/* 09CAA4 800A2044 4E800020 */  blr     

glabel peripheralGet8
/* 09CAA8 800A2048 38600000 */  li      r3, 0
/* 09CAAC 800A204C 4E800020 */  blr     

glabel peripheralPut64
/* 09CAB0 800A2050 38600000 */  li      r3, 0
/* 09CAB4 800A2054 4E800020 */  blr     

glabel peripheralPut32
/* 09CAB8 800A2058 7C0802A6 */  mflr    r0
/* 09CABC 800A205C 90010004 */  stw     r0, 4(r1)
/* 09CAC0 800A2060 548006BE */  clrlwi  r0, r4, 0x1a
/* 09CAC4 800A2064 28000030 */  cmplwi  r0, 0x30
/* 09CAC8 800A2068 9421FFE0 */  stwu    r1, -0x20(r1)
/* 09CACC 800A206C 93E1001C */  stw     r31, 0x1c(r1)
/* 09CAD0 800A2070 3BE00001 */  li      r31, 1
/* 09CAD4 800A2074 93C10018 */  stw     r30, 0x18(r1)
/* 09CAD8 800A2078 3BC30000 */  addi    r30, r3, 0
/* 09CADC 800A207C 4181033C */  bgt     lbl_800A23B8
/* 09CAE0 800A2080 3C608010 */  lis     r3, jtbl_800FD8C0@ha
/* 09CAE4 800A2084 3863D8C0 */  addi    r3, r3, jtbl_800FD8C0@l
/* 09CAE8 800A2088 5400103A */  slwi    r0, r0, 2
/* 09CAEC 800A208C 7C03002E */  lwzx    r0, r3, r0
/* 09CAF0 800A2090 7C0903A6 */  mtctr   r0
/* 09CAF4 800A2094 4E800420 */  bctr    
glabel lbl_800A2098
/* 09CAF8 800A2098 80050000 */  lwz     r0, 0(r5)
/* 09CAFC 800A209C 5400023E */  clrlwi  r0, r0, 8
/* 09CB00 800A20A0 901E0028 */  stw     r0, 0x28(r30)
/* 09CB04 800A20A4 4800031C */  b       lbl_800A23C0
glabel lbl_800A20A8
/* 09CB08 800A20A8 80050000 */  lwz     r0, 0(r5)
/* 09CB0C 800A20AC 901E002C */  stw     r0, 0x2c(r30)
/* 09CB10 800A20B0 48000310 */  b       lbl_800A23C0
glabel lbl_800A20B4
/* 09CB14 800A20B4 80650000 */  lwz     r3, 0(r5)
/* 09CB18 800A20B8 3C000500 */  lis     r0, 0x500
/* 09CB1C 800A20BC 5463023E */  clrlwi  r3, r3, 8
/* 09CB20 800A20C0 907E0008 */  stw     r3, 8(r30)
/* 09CB24 800A20C4 809E002C */  lwz     r4, 0x2c(r30)
/* 09CB28 800A20C8 7C002000 */  cmpw    r0, r4
/* 09CB2C 800A20CC 41810014 */  bgt     lbl_800A20E0
/* 09CB30 800A20D0 3C600600 */  lis     r3, 0x600
/* 09CB34 800A20D4 3803FFFF */  addi    r0, r3, -1
/* 09CB38 800A20D8 7C040000 */  cmpw    r4, r0
/* 09CB3C 800A20DC 408100C4 */  ble     lbl_800A21A0
lbl_800A20E0:
/* 09CB40 800A20E0 3C000600 */  lis     r0, 0x600
/* 09CB44 800A20E4 7C002000 */  cmpw    r0, r4
/* 09CB48 800A20E8 41810014 */  bgt     lbl_800A20FC
/* 09CB4C 800A20EC 3C600800 */  lis     r3, 0x800
/* 09CB50 800A20F0 3803FFFF */  addi    r0, r3, -1
/* 09CB54 800A20F4 7C040000 */  cmpw    r4, r0
/* 09CB58 800A20F8 408100A8 */  ble     lbl_800A21A0
lbl_800A20FC:
/* 09CB5C 800A20FC 3C000800 */  lis     r0, 0x800
/* 09CB60 800A2100 7C002000 */  cmpw    r0, r4
/* 09CB64 800A2104 4181009C */  bgt     lbl_800A21A0
/* 09CB68 800A2108 3C601000 */  lis     r3, 0x1000
/* 09CB6C 800A210C 3803FFFF */  addi    r0, r3, -1
/* 09CB70 800A2110 7C040000 */  cmpw    r4, r0
/* 09CB74 800A2114 4181008C */  bgt     lbl_800A21A0
/* 09CB78 800A2118 807E0000 */  lwz     r3, 0(r30)
/* 09CB7C 800A211C 38810014 */  addi    r4, r1, 0x14
/* 09CB80 800A2120 4BF8AD01 */  bl      systemGetStorageDevice
/* 09CB84 800A2124 2C030000 */  cmpwi   r3, 0
/* 09CB88 800A2128 4082000C */  bne     lbl_800A2134
/* 09CB8C 800A212C 38600000 */  li      r3, 0
/* 09CB90 800A2130 48000294 */  b       lbl_800A23C4
lbl_800A2134:
/* 09CB94 800A2134 80010014 */  lwz     r0, 0x14(r1)
/* 09CB98 800A2138 2C000009 */  cmpwi   r0, 9
/* 09CB9C 800A213C 40820030 */  bne     lbl_800A216C
/* 09CBA0 800A2140 807E0000 */  lwz     r3, 0(r30)
/* 09CBA4 800A2144 80BE0008 */  lwz     r5, 8(r30)
/* 09CBA8 800A2148 80630048 */  lwz     r3, 0x48(r3)
/* 09CBAC 800A214C 809E0028 */  lwz     r4, 0x28(r30)
/* 09CBB0 800A2150 38C50001 */  addi    r6, r5, 1
/* 09CBB4 800A2154 80BE002C */  lwz     r5, 0x2c(r30)
/* 09CBB8 800A2158 4BFF6809 */  bl      sramTransferSRAM
/* 09CBBC 800A215C 2C030000 */  cmpwi   r3, 0
/* 09CBC0 800A2160 40820040 */  bne     lbl_800A21A0
/* 09CBC4 800A2164 38600000 */  li      r3, 0
/* 09CBC8 800A2168 4800025C */  b       lbl_800A23C4
lbl_800A216C:
/* 09CBCC 800A216C 2C000008 */  cmpwi   r0, 8
/* 09CBD0 800A2170 40820030 */  bne     lbl_800A21A0
/* 09CBD4 800A2174 807E0000 */  lwz     r3, 0(r30)
/* 09CBD8 800A2178 80BE0008 */  lwz     r5, 8(r30)
/* 09CBDC 800A217C 80630044 */  lwz     r3, 0x44(r3)
/* 09CBE0 800A2180 809E0028 */  lwz     r4, 0x28(r30)
/* 09CBE4 800A2184 38C50001 */  addi    r6, r5, 1
/* 09CBE8 800A2188 80BE002C */  lwz     r5, 0x2c(r30)
/* 09CBEC 800A218C 4BFF62FD */  bl      flashTransferFLASH
/* 09CBF0 800A2190 2C030000 */  cmpwi   r3, 0
/* 09CBF4 800A2194 4082000C */  bne     lbl_800A21A0
/* 09CBF8 800A2198 38600000 */  li      r3, 0
/* 09CBFC 800A219C 48000228 */  b       lbl_800A23C4
lbl_800A21A0:
/* 09CC00 800A21A0 807E0000 */  lwz     r3, 0(r30)
/* 09CC04 800A21A4 38801000 */  li      r4, 0x1000
/* 09CC08 800A21A8 38A00009 */  li      r5, 9
/* 09CC0C 800A21AC 4BF660A9 */  bl      xlObjectEvent
/* 09CC10 800A21B0 48000210 */  b       lbl_800A23C0
glabel lbl_800A21B4
/* 09CC14 800A21B4 80650000 */  lwz     r3, 0(r5)
/* 09CC18 800A21B8 3C000500 */  lis     r0, 0x500
/* 09CC1C 800A21BC 5463023E */  clrlwi  r3, r3, 8
/* 09CC20 800A21C0 907E000C */  stw     r3, 0xc(r30)
/* 09CC24 800A21C4 809E002C */  lwz     r4, 0x2c(r30)
/* 09CC28 800A21C8 7C002000 */  cmpw    r0, r4
/* 09CC2C 800A21CC 41810014 */  bgt     lbl_800A21E0
/* 09CC30 800A21D0 3C600600 */  lis     r3, 0x600
/* 09CC34 800A21D4 3803FFFF */  addi    r0, r3, -1
/* 09CC38 800A21D8 7C040000 */  cmpw    r4, r0
/* 09CC3C 800A21DC 40810120 */  ble     lbl_800A22FC
lbl_800A21E0:
/* 09CC40 800A21E0 3C000600 */  lis     r0, 0x600
/* 09CC44 800A21E4 7C002000 */  cmpw    r0, r4
/* 09CC48 800A21E8 41810014 */  bgt     lbl_800A21FC
/* 09CC4C 800A21EC 3C600800 */  lis     r3, 0x800
/* 09CC50 800A21F0 3803FFFF */  addi    r0, r3, -1
/* 09CC54 800A21F4 7C040000 */  cmpw    r4, r0
/* 09CC58 800A21F8 40810104 */  ble     lbl_800A22FC
lbl_800A21FC:
/* 09CC5C 800A21FC 3C000800 */  lis     r0, 0x800
/* 09CC60 800A2200 7C002000 */  cmpw    r0, r4
/* 09CC64 800A2204 4181009C */  bgt     lbl_800A22A0
/* 09CC68 800A2208 3C601000 */  lis     r3, 0x1000
/* 09CC6C 800A220C 3803FFFF */  addi    r0, r3, -1
/* 09CC70 800A2210 7C040000 */  cmpw    r4, r0
/* 09CC74 800A2214 4181008C */  bgt     lbl_800A22A0
/* 09CC78 800A2218 807E0000 */  lwz     r3, 0(r30)
/* 09CC7C 800A221C 38810014 */  addi    r4, r1, 0x14
/* 09CC80 800A2220 4BF8AC01 */  bl      systemGetStorageDevice
/* 09CC84 800A2224 2C030000 */  cmpwi   r3, 0
/* 09CC88 800A2228 4082000C */  bne     lbl_800A2234
/* 09CC8C 800A222C 38600000 */  li      r3, 0
/* 09CC90 800A2230 48000194 */  b       lbl_800A23C4
lbl_800A2234:
/* 09CC94 800A2234 80010014 */  lwz     r0, 0x14(r1)
/* 09CC98 800A2238 2C000009 */  cmpwi   r0, 9
/* 09CC9C 800A223C 40820030 */  bne     lbl_800A226C
/* 09CCA0 800A2240 807E0000 */  lwz     r3, 0(r30)
/* 09CCA4 800A2244 80BE000C */  lwz     r5, 0xc(r30)
/* 09CCA8 800A2248 80630048 */  lwz     r3, 0x48(r3)
/* 09CCAC 800A224C 809E0028 */  lwz     r4, 0x28(r30)
/* 09CCB0 800A2250 38C50001 */  addi    r6, r5, 1
/* 09CCB4 800A2254 80BE002C */  lwz     r5, 0x2c(r30)
/* 09CCB8 800A2258 4BFF6781 */  bl      sramCopySRAM
/* 09CCBC 800A225C 2C030000 */  cmpwi   r3, 0
/* 09CCC0 800A2260 4082009C */  bne     lbl_800A22FC
/* 09CCC4 800A2264 38600000 */  li      r3, 0
/* 09CCC8 800A2268 4800015C */  b       lbl_800A23C4
lbl_800A226C:
/* 09CCCC 800A226C 2C000008 */  cmpwi   r0, 8
/* 09CCD0 800A2270 4082008C */  bne     lbl_800A22FC
/* 09CCD4 800A2274 807E0000 */  lwz     r3, 0(r30)
/* 09CCD8 800A2278 80BE000C */  lwz     r5, 0xc(r30)
/* 09CCDC 800A227C 80630044 */  lwz     r3, 0x44(r3)
/* 09CCE0 800A2280 809E0028 */  lwz     r4, 0x28(r30)
/* 09CCE4 800A2284 38C50001 */  addi    r6, r5, 1
/* 09CCE8 800A2288 80BE002C */  lwz     r5, 0x2c(r30)
/* 09CCEC 800A228C 4BFF6311 */  bl      flashCopyFLASH
/* 09CCF0 800A2290 2C030000 */  cmpwi   r3, 0
/* 09CCF4 800A2294 40820068 */  bne     lbl_800A22FC
/* 09CCF8 800A2298 38600000 */  li      r3, 0
/* 09CCFC 800A229C 48000128 */  b       lbl_800A23C4
lbl_800A22A0:
/* 09CD00 800A22A0 3C001000 */  lis     r0, 0x1000
/* 09CD04 800A22A4 7C002000 */  cmpw    r0, r4
/* 09CD08 800A22A8 41810054 */  bgt     lbl_800A22FC
/* 09CD0C 800A22AC 3C601FC0 */  lis     r3, 0x1fc0
/* 09CD10 800A22B0 3803FFFF */  addi    r0, r3, -1
/* 09CD14 800A22B4 7C040000 */  cmpw    r4, r0
/* 09CD18 800A22B8 41810044 */  bgt     lbl_800A22FC
/* 09CD1C 800A22BC 801E0004 */  lwz     r0, 4(r30)
/* 09CD20 800A22C0 3C60800A */  lis     r3, peripheralDMA_Complete@ha
/* 09CD24 800A22C4 38E323EC */  addi    r7, r3, peripheralDMA_Complete@l
/* 09CD28 800A22C8 60000003 */  ori     r0, r0, 3
/* 09CD2C 800A22CC 901E0004 */  stw     r0, 4(r30)
/* 09CD30 800A22D0 3BE00000 */  li      r31, 0
/* 09CD34 800A22D4 80BE000C */  lwz     r5, 0xc(r30)
/* 09CD38 800A22D8 807E0000 */  lwz     r3, 0(r30)
/* 09CD3C 800A22DC 38C50001 */  addi    r6, r5, 1
/* 09CD40 800A22E0 809E0028 */  lwz     r4, 0x28(r30)
/* 09CD44 800A22E4 80BE002C */  lwz     r5, 0x2c(r30)
/* 09CD48 800A22E8 4BF8AD0D */  bl      systemCopyROM
/* 09CD4C 800A22EC 2C030000 */  cmpwi   r3, 0
/* 09CD50 800A22F0 4082000C */  bne     lbl_800A22FC
/* 09CD54 800A22F4 38600000 */  li      r3, 0
/* 09CD58 800A22F8 480000CC */  b       lbl_800A23C4
lbl_800A22FC:
/* 09CD5C 800A22FC 2C1F0000 */  cmpwi   r31, 0
/* 09CD60 800A2300 418200C0 */  beq     lbl_800A23C0
/* 09CD64 800A2304 807E0000 */  lwz     r3, 0(r30)
/* 09CD68 800A2308 38801000 */  li      r4, 0x1000
/* 09CD6C 800A230C 38A00009 */  li      r5, 9
/* 09CD70 800A2310 4BF65F45 */  bl      xlObjectEvent
/* 09CD74 800A2314 480000AC */  b       lbl_800A23C0
glabel lbl_800A2318
/* 09CD78 800A2318 80050000 */  lwz     r0, 0(r5)
/* 09CD7C 800A231C 540007BD */  rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 09CD80 800A2320 418200A0 */  beq     lbl_800A23C0
/* 09CD84 800A2324 807E0000 */  lwz     r3, 0(r30)
/* 09CD88 800A2328 38801001 */  li      r4, 0x1001
/* 09CD8C 800A232C 38A00009 */  li      r5, 9
/* 09CD90 800A2330 4BF65F25 */  bl      xlObjectEvent
/* 09CD94 800A2334 4800008C */  b       lbl_800A23C0
glabel lbl_800A2338
/* 09CD98 800A2338 80050000 */  lwz     r0, 0(r5)
/* 09CD9C 800A233C 5400063E */  clrlwi  r0, r0, 0x18
/* 09CDA0 800A2340 901E0010 */  stw     r0, 0x10(r30)
/* 09CDA4 800A2344 4800007C */  b       lbl_800A23C0
glabel lbl_800A2348
/* 09CDA8 800A2348 80050000 */  lwz     r0, 0(r5)
/* 09CDAC 800A234C 5400063E */  clrlwi  r0, r0, 0x18
/* 09CDB0 800A2350 901E0030 */  stw     r0, 0x30(r30)
/* 09CDB4 800A2354 4800006C */  b       lbl_800A23C0
glabel lbl_800A2358
/* 09CDB8 800A2358 80050000 */  lwz     r0, 0(r5)
/* 09CDBC 800A235C 5400073E */  clrlwi  r0, r0, 0x1c
/* 09CDC0 800A2360 901E0020 */  stw     r0, 0x20(r30)
/* 09CDC4 800A2364 4800005C */  b       lbl_800A23C0
glabel lbl_800A2368
/* 09CDC8 800A2368 80050000 */  lwz     r0, 0(r5)
/* 09CDCC 800A236C 540007FE */  clrlwi  r0, r0, 0x1f
/* 09CDD0 800A2370 901E0018 */  stw     r0, 0x18(r30)
/* 09CDD4 800A2374 4800004C */  b       lbl_800A23C0
glabel lbl_800A2378
/* 09CDD8 800A2378 80050000 */  lwz     r0, 0(r5)
/* 09CDDC 800A237C 5400063E */  clrlwi  r0, r0, 0x18
/* 09CDE0 800A2380 901E0014 */  stw     r0, 0x14(r30)
/* 09CDE4 800A2384 4800003C */  b       lbl_800A23C0
glabel lbl_800A2388
/* 09CDE8 800A2388 80050000 */  lwz     r0, 0(r5)
/* 09CDEC 800A238C 5400063E */  clrlwi  r0, r0, 0x18
/* 09CDF0 800A2390 901E0034 */  stw     r0, 0x34(r30)
/* 09CDF4 800A2394 4800002C */  b       lbl_800A23C0
glabel lbl_800A2398
/* 09CDF8 800A2398 80050000 */  lwz     r0, 0(r5)
/* 09CDFC 800A239C 5400073E */  clrlwi  r0, r0, 0x1c
/* 09CE00 800A23A0 901E0024 */  stw     r0, 0x24(r30)
/* 09CE04 800A23A4 4800001C */  b       lbl_800A23C0
glabel lbl_800A23A8
/* 09CE08 800A23A8 80050000 */  lwz     r0, 0(r5)
/* 09CE0C 800A23AC 540007FE */  clrlwi  r0, r0, 0x1f
/* 09CE10 800A23B0 901E001C */  stw     r0, 0x1c(r30)
/* 09CE14 800A23B4 4800000C */  b       lbl_800A23C0
glabel lbl_800A23B8
/* 09CE18 800A23B8 38600000 */  li      r3, 0
/* 09CE1C 800A23BC 48000008 */  b       lbl_800A23C4
lbl_800A23C0:
/* 09CE20 800A23C0 38600001 */  li      r3, 1
lbl_800A23C4:
/* 09CE24 800A23C4 80010024 */  lwz     r0, 0x24(r1)
/* 09CE28 800A23C8 83E1001C */  lwz     r31, 0x1c(r1)
/* 09CE2C 800A23CC 83C10018 */  lwz     r30, 0x18(r1)
/* 09CE30 800A23D0 7C0803A6 */  mtlr    r0
/* 09CE34 800A23D4 38210020 */  addi    r1, r1, 0x20
/* 09CE38 800A23D8 4E800020 */  blr     

glabel peripheralPut16
/* 09CE3C 800A23DC 38600000 */  li      r3, 0
/* 09CE40 800A23E0 4E800020 */  blr     

glabel peripheralPut8
/* 09CE44 800A23E4 38600000 */  li      r3, 0
/* 09CE48 800A23E8 4E800020 */  blr     

peripheralDMA_Complete:
/* 09CE4C 800A23EC 7C0802A6 */  mflr    r0
/* 09CE50 800A23F0 38801000 */  li      r4, 0x1000
/* 09CE54 800A23F4 90010004 */  stw     r0, 4(r1)
/* 09CE58 800A23F8 38A00009 */  li      r5, 9
/* 09CE5C 800A23FC 9421FFF8 */  stwu    r1, -8(r1)
/* 09CE60 800A2400 806D8EE0 */  lwz     r3, gpSystem-_SDA_BASE_(r13)
/* 09CE64 800A2404 8063005C */  lwz     r3, 0x5c(r3)
/* 09CE68 800A2408 80030004 */  lwz     r0, 4(r3)
/* 09CE6C 800A240C 5400003A */  rlwinm  r0, r0, 0, 0, 0x1d
/* 09CE70 800A2410 90030004 */  stw     r0, 4(r3)
/* 09CE74 800A2414 80630000 */  lwz     r3, 0(r3)
/* 09CE78 800A2418 4BF65E3D */  bl      xlObjectEvent
/* 09CE7C 800A241C 8001000C */  lwz     r0, 0xc(r1)
/* 09CE80 800A2420 38600001 */  li      r3, 1
/* 09CE84 800A2424 38210008 */  addi    r1, r1, 8
/* 09CE88 800A2428 7C0803A6 */  mtlr    r0
/* 09CE8C 800A242C 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FA860 800FD7E0 000B */
D_800FD7E0:
    .asciz "PERIPHERAL"

.balign 4

/* 000FA86C 800FD7EC 0010 */
glabel gClassPeripheral
    .long D_800FD7E0, 0x00000038, 0x00000000, peripheralEvent

.balign 4

/* 000FA87C 800FD7FC 00C4 */
jtbl_800FD7FC:
    .long lbl_800A1F64
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1F74
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1F80
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1F90
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1FA0
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1FB0
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1FC0
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1FD0
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1FE0
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A1FF0
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2000
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2010
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2030
    .long lbl_800A2020

.balign 4

/* 000FA940 800FD8C0 00C4 */
jtbl_800FD8C0:
    .long lbl_800A2098
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A20A8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A20B4
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A21B4
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2318
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2338
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2348
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2358
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2368
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2378
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2388
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A2398
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23B8
    .long lbl_800A23A8


