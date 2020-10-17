# ram.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel ramEvent
/* 06CA2C 80071FCC 7C0802A6 */  mflr    r0
/* 06CA30 80071FD0 2C040003 */  cmpwi   r4, 3
/* 06CA34 80071FD4 90010004 */  stw     r0, 4(r1)
/* 06CA38 80071FD8 9421FFE0 */  stwu    r1, -0x20(r1)
/* 06CA3C 80071FDC 93E1001C */  stw     r31, 0x1c(r1)
/* 06CA40 80071FE0 3BE50000 */  addi    r31, r5, 0
/* 06CA44 80071FE4 93C10018 */  stw     r30, 0x18(r1)
/* 06CA48 80071FE8 3BC30000 */  addi    r30, r3, 0
/* 06CA4C 80071FEC 418201FC */  beq     lbl_800721E8
/* 06CA50 80071FF0 40800018 */  bge     lbl_80072008
/* 06CA54 80071FF4 2C040002 */  cmpwi   r4, 2
/* 06CA58 80071FF8 40800028 */  bge     lbl_80072020
/* 06CA5C 80071FFC 2C040000 */  cmpwi   r4, 0
/* 06CA60 80072000 408001E8 */  bge     lbl_800721E8
/* 06CA64 80072004 480001DC */  b       lbl_800721E0
lbl_80072008:
/* 06CA68 80072008 2C041003 */  cmpwi   r4, 0x1003
/* 06CA6C 8007200C 418201DC */  beq     lbl_800721E8
/* 06CA70 80072010 408001D0 */  bge     lbl_800721E0
/* 06CA74 80072014 2C041002 */  cmpwi   r4, 0x1002
/* 06CA78 80072018 4080001C */  bge     lbl_80072034
/* 06CA7C 8007201C 480001C4 */  b       lbl_800721E0
lbl_80072020:
/* 06CA80 80072020 38000000 */  li      r0, 0
/* 06CA84 80072024 901E0008 */  stw     r0, 8(r30)
/* 06CA88 80072028 901E0004 */  stw     r0, 4(r30)
/* 06CA8C 8007202C 93FE0000 */  stw     r31, 0(r30)
/* 06CA90 80072030 480001B8 */  b       lbl_800721E8
lbl_80072034:
/* 06CA94 80072034 801F0000 */  lwz     r0, 0(r31)
/* 06CA98 80072038 5400063E */  clrlwi  r0, r0, 0x18
/* 06CA9C 8007203C 2C000001 */  cmpwi   r0, 1
/* 06CAA0 80072040 418200A0 */  beq     lbl_800720E0
/* 06CAA4 80072044 40800010 */  bge     lbl_80072054
/* 06CAA8 80072048 2C000000 */  cmpwi   r0, 0
/* 06CAAC 8007204C 40800014 */  bge     lbl_80072060
/* 06CAB0 80072050 48000198 */  b       lbl_800721E8
lbl_80072054:
/* 06CAB4 80072054 2C000003 */  cmpwi   r0, 3
/* 06CAB8 80072058 40800190 */  bge     lbl_800721E8
/* 06CABC 8007205C 48000104 */  b       lbl_80072160
lbl_80072060:
/* 06CAC0 80072060 807E0000 */  lwz     r3, 0(r30)
/* 06CAC4 80072064 3CA08007 */  lis     r5, ramPut8@ha
/* 06CAC8 80072068 3CC08007 */  lis     r6, ramPut16@ha
/* 06CACC 8007206C 3CE08007 */  lis     r7, ramPut32@ha
/* 06CAD0 80072070 80630024 */  lwz     r3, 0x24(r3)
/* 06CAD4 80072074 3C808007 */  lis     r4, ramPut64@ha
/* 06CAD8 80072078 39042408 */  addi    r8, r4, ramPut64@l
/* 06CADC 8007207C 38A5248C */  addi    r5, r5, ramPut8@l
/* 06CAE0 80072080 38C62464 */  addi    r6, r6, ramPut16@l
/* 06CAE4 80072084 38E7243C */  addi    r7, r7, ramPut32@l
/* 06CAE8 80072088 389F0000 */  addi    r4, r31, 0
/* 06CAEC 8007208C 4BFC2E95 */  bl      cpuSetDevicePut
/* 06CAF0 80072090 2C030000 */  cmpwi   r3, 0
/* 06CAF4 80072094 4082000C */  bne     lbl_800720A0
/* 06CAF8 80072098 38600000 */  li      r3, 0
/* 06CAFC 8007209C 48000150 */  b       lbl_800721EC
lbl_800720A0:
/* 06CB00 800720A0 807E0000 */  lwz     r3, 0(r30)
/* 06CB04 800720A4 3CA08007 */  lis     r5, ramGet8@ha
/* 06CB08 800720A8 3CC08007 */  lis     r6, ramGet16@ha
/* 06CB0C 800720AC 3CE08007 */  lis     r7, ramGet32@ha
/* 06CB10 800720B0 80630024 */  lwz     r3, 0x24(r3)
/* 06CB14 800720B4 3C808007 */  lis     r4, ramGet64@ha
/* 06CB18 800720B8 3904232C */  addi    r8, r4, ramGet64@l
/* 06CB1C 800720BC 38A523D8 */  addi    r5, r5, ramGet8@l
/* 06CB20 800720C0 38C623A4 */  addi    r6, r6, ramGet16@l
/* 06CB24 800720C4 38E72370 */  addi    r7, r7, ramGet32@l
/* 06CB28 800720C8 389F0000 */  addi    r4, r31, 0
/* 06CB2C 800720CC 4BFC2E6D */  bl      cpuSetDeviceGet
/* 06CB30 800720D0 2C030000 */  cmpwi   r3, 0
/* 06CB34 800720D4 40820114 */  bne     lbl_800721E8
/* 06CB38 800720D8 38600000 */  li      r3, 0
/* 06CB3C 800720DC 48000110 */  b       lbl_800721EC
lbl_800720E0:
/* 06CB40 800720E0 807E0000 */  lwz     r3, 0(r30)
/* 06CB44 800720E4 3CA08007 */  lis     r5, ramPutRI8@ha
/* 06CB48 800720E8 3CC08007 */  lis     r6, ramPutRI16@ha
/* 06CB4C 800720EC 3CE08007 */  lis     r7, ramPutRI32@ha
/* 06CB50 800720F0 80630024 */  lwz     r3, 0x24(r3)
/* 06CB54 800720F4 3C808007 */  lis     r4, ramPutRI64@ha
/* 06CB58 800720F8 390424FC */  addi    r8, r4, ramPutRI64@l
/* 06CB5C 800720FC 38A52540 */  addi    r5, r5, ramPutRI8@l
/* 06CB60 80072100 38C62538 */  addi    r6, r6, ramPutRI16@l
/* 06CB64 80072104 38E72504 */  addi    r7, r7, ramPutRI32@l
/* 06CB68 80072108 389F0000 */  addi    r4, r31, 0
/* 06CB6C 8007210C 4BFC2E15 */  bl      cpuSetDevicePut
/* 06CB70 80072110 2C030000 */  cmpwi   r3, 0
/* 06CB74 80072114 4082000C */  bne     lbl_80072120
/* 06CB78 80072118 38600000 */  li      r3, 0
/* 06CB7C 8007211C 480000D0 */  b       lbl_800721EC
lbl_80072120:
/* 06CB80 80072120 807E0000 */  lwz     r3, 0(r30)
/* 06CB84 80072124 3CA08007 */  lis     r5, ramGetRI8@ha
/* 06CB88 80072128 3CC08007 */  lis     r6, ramGetRI16@ha
/* 06CB8C 8007212C 3CE08007 */  lis     r7, ramGetRI32@ha
/* 06CB90 80072130 80630024 */  lwz     r3, 0x24(r3)
/* 06CB94 80072134 3C808007 */  lis     r4, ramGetRI64@ha
/* 06CB98 80072138 390424B0 */  addi    r8, r4, ramGetRI64@l
/* 06CB9C 8007213C 38A524F4 */  addi    r5, r5, ramGetRI8@l
/* 06CBA0 80072140 38C624EC */  addi    r6, r6, ramGetRI16@l
/* 06CBA4 80072144 38E724B8 */  addi    r7, r7, ramGetRI32@l
/* 06CBA8 80072148 389F0000 */  addi    r4, r31, 0
/* 06CBAC 8007214C 4BFC2DED */  bl      cpuSetDeviceGet
/* 06CBB0 80072150 2C030000 */  cmpwi   r3, 0
/* 06CBB4 80072154 40820094 */  bne     lbl_800721E8
/* 06CBB8 80072158 38600000 */  li      r3, 0
/* 06CBBC 8007215C 48000090 */  b       lbl_800721EC
lbl_80072160:
/* 06CBC0 80072160 807E0000 */  lwz     r3, 0(r30)
/* 06CBC4 80072164 3CA08007 */  lis     r5, ramPutControl8@ha
/* 06CBC8 80072168 3CC08007 */  lis     r6, ramPutControl16@ha
/* 06CBCC 8007216C 3CE08007 */  lis     r7, ramPutControl32@ha
/* 06CBD0 80072170 80630024 */  lwz     r3, 0x24(r3)
/* 06CBD4 80072174 3C808007 */  lis     r4, ramPutControl64@ha
/* 06CBD8 80072178 39042594 */  addi    r8, r4, ramPutControl64@l
/* 06CBDC 8007217C 38A525D8 */  addi    r5, r5, ramPutControl8@l
/* 06CBE0 80072180 38C625D0 */  addi    r6, r6, ramPutControl16@l
/* 06CBE4 80072184 38E7259C */  addi    r7, r7, ramPutControl32@l
/* 06CBE8 80072188 389F0000 */  addi    r4, r31, 0
/* 06CBEC 8007218C 4BFC2D95 */  bl      cpuSetDevicePut
/* 06CBF0 80072190 2C030000 */  cmpwi   r3, 0
/* 06CBF4 80072194 4082000C */  bne     lbl_800721A0
/* 06CBF8 80072198 38600000 */  li      r3, 0
/* 06CBFC 8007219C 48000050 */  b       lbl_800721EC
lbl_800721A0:
/* 06CC00 800721A0 807E0000 */  lwz     r3, 0(r30)
/* 06CC04 800721A4 3CA08007 */  lis     r5, ramGetControl8@ha
/* 06CC08 800721A8 3CC08007 */  lis     r6, ramGetControl16@ha
/* 06CC0C 800721AC 3CE08007 */  lis     r7, ramGetControl32@ha
/* 06CC10 800721B0 80630024 */  lwz     r3, 0x24(r3)
/* 06CC14 800721B4 3C808007 */  lis     r4, ramGetControl64@ha
/* 06CC18 800721B8 39042548 */  addi    r8, r4, ramGetControl64@l
/* 06CC1C 800721BC 38A5258C */  addi    r5, r5, ramGetControl8@l
/* 06CC20 800721C0 38C62584 */  addi    r6, r6, ramGetControl16@l
/* 06CC24 800721C4 38E72550 */  addi    r7, r7, ramGetControl32@l
/* 06CC28 800721C8 389F0000 */  addi    r4, r31, 0
/* 06CC2C 800721CC 4BFC2D6D */  bl      cpuSetDeviceGet
/* 06CC30 800721D0 2C030000 */  cmpwi   r3, 0
/* 06CC34 800721D4 40820014 */  bne     lbl_800721E8
/* 06CC38 800721D8 38600000 */  li      r3, 0
/* 06CC3C 800721DC 48000010 */  b       lbl_800721EC
lbl_800721E0:
/* 06CC40 800721E0 38600000 */  li      r3, 0
/* 06CC44 800721E4 48000008 */  b       lbl_800721EC
lbl_800721E8:
/* 06CC48 800721E8 38600001 */  li      r3, 1
lbl_800721EC:
/* 06CC4C 800721EC 80010024 */  lwz     r0, 0x24(r1)
/* 06CC50 800721F0 83E1001C */  lwz     r31, 0x1c(r1)
/* 06CC54 800721F4 83C10018 */  lwz     r30, 0x18(r1)
/* 06CC58 800721F8 7C0803A6 */  mtlr    r0
/* 06CC5C 800721FC 38210020 */  addi    r1, r1, 0x20
/* 06CC60 80072200 4E800020 */  blr     

glabel ramGetSize
/* 06CC64 80072204 28040000 */  cmplwi  r4, 0
/* 06CC68 80072208 4182000C */  beq     lbl_80072214
/* 06CC6C 8007220C 80030008 */  lwz     r0, 8(r3)
/* 06CC70 80072210 90040000 */  stw     r0, 0(r4)
lbl_80072214:
/* 06CC74 80072214 38600001 */  li      r3, 1
/* 06CC78 80072218 4E800020 */  blr     

glabel ramSetSize
/* 06CC7C 8007221C 7C0802A6 */  mflr    r0
/* 06CC80 80072220 90010004 */  stw     r0, 4(r1)
/* 06CC84 80072224 9421FFE8 */  stwu    r1, -0x18(r1)
/* 06CC88 80072228 93E10014 */  stw     r31, 0x14(r1)
/* 06CC8C 8007222C 93C10010 */  stw     r30, 0x10(r1)
/* 06CC90 80072230 7C7E1B78 */  mr      r30, r3
/* 06CC94 80072234 80030004 */  lwz     r0, 4(r3)
/* 06CC98 80072238 28000000 */  cmplwi  r0, 0
/* 06CC9C 8007223C 4182000C */  beq     lbl_80072248
/* 06CCA0 80072240 38600000 */  li      r3, 0
/* 06CCA4 80072244 48000030 */  b       lbl_80072274
lbl_80072248:
/* 06CCA8 80072248 380403FF */  addi    r0, r4, 0x3ff
/* 06CCAC 8007224C 541F002A */  rlwinm  r31, r0, 0, 0, 0x15
/* 06CCB0 80072250 387E0004 */  addi    r3, r30, 4
/* 06CCB4 80072254 67E43000 */  oris    r4, r31, 0x3000
/* 06CCB8 80072258 4BF94E8D */  bl      xlHeapTake
/* 06CCBC 8007225C 2C030000 */  cmpwi   r3, 0
/* 06CCC0 80072260 4082000C */  bne     lbl_8007226C
/* 06CCC4 80072264 38600000 */  li      r3, 0
/* 06CCC8 80072268 4800000C */  b       lbl_80072274
lbl_8007226C:
/* 06CCCC 8007226C 93FE0008 */  stw     r31, 8(r30)
/* 06CCD0 80072270 38600001 */  li      r3, 1
lbl_80072274:
/* 06CCD4 80072274 8001001C */  lwz     r0, 0x1c(r1)
/* 06CCD8 80072278 83E10014 */  lwz     r31, 0x14(r1)
/* 06CCDC 8007227C 83C10010 */  lwz     r30, 0x10(r1)
/* 06CCE0 80072280 7C0803A6 */  mtlr    r0
/* 06CCE4 80072284 38210018 */  addi    r1, r1, 0x18
/* 06CCE8 80072288 4E800020 */  blr     

glabel ramWipe
/* 06CCEC 8007228C 7C0802A6 */  mflr    r0
/* 06CCF0 80072290 90010004 */  stw     r0, 4(r1)
/* 06CCF4 80072294 9421FFF8 */  stwu    r1, -8(r1)
/* 06CCF8 80072298 80830008 */  lwz     r4, 8(r3)
/* 06CCFC 8007229C 28040000 */  cmplwi  r4, 0
/* 06CD00 800722A0 41820020 */  beq     lbl_800722C0
/* 06CD04 800722A4 80630004 */  lwz     r3, 4(r3)
/* 06CD08 800722A8 38A00000 */  li      r5, 0
/* 06CD0C 800722AC 4BF9458D */  bl      xlHeapFill32
/* 06CD10 800722B0 2C030000 */  cmpwi   r3, 0
/* 06CD14 800722B4 4082000C */  bne     lbl_800722C0
/* 06CD18 800722B8 38600000 */  li      r3, 0
/* 06CD1C 800722BC 48000008 */  b       lbl_800722C4
lbl_800722C0:
/* 06CD20 800722C0 38600001 */  li      r3, 1
lbl_800722C4:
/* 06CD24 800722C4 8001000C */  lwz     r0, 0xc(r1)
/* 06CD28 800722C8 38210008 */  addi    r1, r1, 8
/* 06CD2C 800722CC 7C0803A6 */  mtlr    r0
/* 06CD30 800722D0 4E800020 */  blr     

glabel ramGetBuffer
/* 06CD34 800722D4 80E30008 */  lwz     r7, 8(r3)
/* 06CD38 800722D8 54A501BE */  clrlwi  r5, r5, 6
/* 06CD3C 800722DC 28070000 */  cmplwi  r7, 0
/* 06CD40 800722E0 4082000C */  bne     lbl_800722EC
/* 06CD44 800722E4 38600000 */  li      r3, 0
/* 06CD48 800722E8 4E800020 */  blr     
lbl_800722EC:
/* 06CD4C 800722EC 28060000 */  cmplwi  r6, 0
/* 06CD50 800722F0 41820028 */  beq     lbl_80072318
/* 06CD54 800722F4 80060000 */  lwz     r0, 0(r6)
/* 06CD58 800722F8 7C050214 */  add     r0, r5, r0
/* 06CD5C 800722FC 7C003840 */  cmplw   r0, r7
/* 06CD60 80072300 41800018 */  blt     lbl_80072318
/* 06CD64 80072304 7C053851 */  subf.   r0, r5, r7
/* 06CD68 80072308 90060000 */  stw     r0, 0(r6)
/* 06CD6C 8007230C 4080000C */  bge     lbl_80072318
/* 06CD70 80072310 38000000 */  li      r0, 0
/* 06CD74 80072314 90060000 */  stw     r0, 0(r6)
lbl_80072318:
/* 06CD78 80072318 80030004 */  lwz     r0, 4(r3)
/* 06CD7C 8007231C 38600001 */  li      r3, 1
/* 06CD80 80072320 7C002A14 */  add     r0, r0, r5
/* 06CD84 80072324 90040000 */  stw     r0, 0(r4)
/* 06CD88 80072328 4E800020 */  blr     

ramGet64:
/* 06CD8C 8007232C 80030008 */  lwz     r0, 8(r3)
/* 06CD90 80072330 548401BE */  clrlwi  r4, r4, 6
/* 06CD94 80072334 7C040040 */  cmplw   r4, r0
/* 06CD98 80072338 40800024 */  bge     lbl_8007235C
/* 06CD9C 8007233C 80630004 */  lwz     r3, 4(r3)
/* 06CDA0 80072340 54800038 */  rlwinm  r0, r4, 0, 0, 0x1c
/* 06CDA4 80072344 7C630214 */  add     r3, r3, r0
/* 06CDA8 80072348 80030000 */  lwz     r0, 0(r3)
/* 06CDAC 8007234C 80630004 */  lwz     r3, 4(r3)
/* 06CDB0 80072350 90650004 */  stw     r3, 4(r5)
/* 06CDB4 80072354 90050000 */  stw     r0, 0(r5)
/* 06CDB8 80072358 48000010 */  b       lbl_80072368
lbl_8007235C:
/* 06CDBC 8007235C 38000000 */  li      r0, 0
/* 06CDC0 80072360 90050004 */  stw     r0, 4(r5)
/* 06CDC4 80072364 90050000 */  stw     r0, 0(r5)
lbl_80072368:
/* 06CDC8 80072368 38600001 */  li      r3, 1
/* 06CDCC 8007236C 4E800020 */  blr     

ramGet32:
/* 06CDD0 80072370 80030008 */  lwz     r0, 8(r3)
/* 06CDD4 80072374 548401BE */  clrlwi  r4, r4, 6
/* 06CDD8 80072378 7C040040 */  cmplw   r4, r0
/* 06CDDC 8007237C 40800018 */  bge     lbl_80072394
/* 06CDE0 80072380 80630004 */  lwz     r3, 4(r3)
/* 06CDE4 80072384 5480003A */  rlwinm  r0, r4, 0, 0, 0x1d
/* 06CDE8 80072388 7C03002E */  lwzx    r0, r3, r0
/* 06CDEC 8007238C 90050000 */  stw     r0, 0(r5)
/* 06CDF0 80072390 4800000C */  b       lbl_8007239C
lbl_80072394:
/* 06CDF4 80072394 38000000 */  li      r0, 0
/* 06CDF8 80072398 90050000 */  stw     r0, 0(r5)
lbl_8007239C:
/* 06CDFC 8007239C 38600001 */  li      r3, 1
/* 06CE00 800723A0 4E800020 */  blr     

ramGet16:
/* 06CE04 800723A4 80030008 */  lwz     r0, 8(r3)
/* 06CE08 800723A8 548401BE */  clrlwi  r4, r4, 6
/* 06CE0C 800723AC 7C040040 */  cmplw   r4, r0
/* 06CE10 800723B0 40800018 */  bge     lbl_800723C8
/* 06CE14 800723B4 80630004 */  lwz     r3, 4(r3)
/* 06CE18 800723B8 5480003C */  rlwinm  r0, r4, 0, 0, 0x1e
/* 06CE1C 800723BC 7C0302AE */  lhax    r0, r3, r0
/* 06CE20 800723C0 B0050000 */  sth     r0, 0(r5)
/* 06CE24 800723C4 4800000C */  b       lbl_800723D0
lbl_800723C8:
/* 06CE28 800723C8 38000000 */  li      r0, 0
/* 06CE2C 800723CC B0050000 */  sth     r0, 0(r5)
lbl_800723D0:
/* 06CE30 800723D0 38600001 */  li      r3, 1
/* 06CE34 800723D4 4E800020 */  blr     

ramGet8:
/* 06CE38 800723D8 80030008 */  lwz     r0, 8(r3)
/* 06CE3C 800723DC 548401BE */  clrlwi  r4, r4, 6
/* 06CE40 800723E0 7C040040 */  cmplw   r4, r0
/* 06CE44 800723E4 40800014 */  bge     lbl_800723F8
/* 06CE48 800723E8 80030004 */  lwz     r0, 4(r3)
/* 06CE4C 800723EC 7C0400AE */  lbzx    r0, r4, r0
/* 06CE50 800723F0 98050000 */  stb     r0, 0(r5)
/* 06CE54 800723F4 4800000C */  b       lbl_80072400
lbl_800723F8:
/* 06CE58 800723F8 38000000 */  li      r0, 0
/* 06CE5C 800723FC 98050000 */  stb     r0, 0(r5)
lbl_80072400:
/* 06CE60 80072400 38600001 */  li      r3, 1
/* 06CE64 80072404 4E800020 */  blr     

ramPut64:
/* 06CE68 80072408 80030008 */  lwz     r0, 8(r3)
/* 06CE6C 8007240C 548401BE */  clrlwi  r4, r4, 6
/* 06CE70 80072410 7C040040 */  cmplw   r4, r0
/* 06CE74 80072414 40800020 */  bge     lbl_80072434
/* 06CE78 80072418 80630004 */  lwz     r3, 4(r3)
/* 06CE7C 8007241C 54800038 */  rlwinm  r0, r4, 0, 0, 0x1c
/* 06CE80 80072420 80850000 */  lwz     r4, 0(r5)
/* 06CE84 80072424 80A50004 */  lwz     r5, 4(r5)
/* 06CE88 80072428 7C630214 */  add     r3, r3, r0
/* 06CE8C 8007242C 90A30004 */  stw     r5, 4(r3)
/* 06CE90 80072430 90830000 */  stw     r4, 0(r3)
lbl_80072434:
/* 06CE94 80072434 38600001 */  li      r3, 1
/* 06CE98 80072438 4E800020 */  blr     

ramPut32:
/* 06CE9C 8007243C 80030008 */  lwz     r0, 8(r3)
/* 06CEA0 80072440 548601BE */  clrlwi  r6, r4, 6
/* 06CEA4 80072444 7C060040 */  cmplw   r6, r0
/* 06CEA8 80072448 40800014 */  bge     lbl_8007245C
/* 06CEAC 8007244C 80850000 */  lwz     r4, 0(r5)
/* 06CEB0 80072450 54C0003A */  rlwinm  r0, r6, 0, 0, 0x1d
/* 06CEB4 80072454 80630004 */  lwz     r3, 4(r3)
/* 06CEB8 80072458 7C83012E */  stwx    r4, r3, r0
lbl_8007245C:
/* 06CEBC 8007245C 38600001 */  li      r3, 1
/* 06CEC0 80072460 4E800020 */  blr     

ramPut16:
/* 06CEC4 80072464 80030008 */  lwz     r0, 8(r3)
/* 06CEC8 80072468 548601BE */  clrlwi  r6, r4, 6
/* 06CECC 8007246C 7C060040 */  cmplw   r6, r0
/* 06CED0 80072470 40800014 */  bge     lbl_80072484
/* 06CED4 80072474 A0850000 */  lhz     r4, 0(r5)
/* 06CED8 80072478 54C0003C */  rlwinm  r0, r6, 0, 0, 0x1e
/* 06CEDC 8007247C 80630004 */  lwz     r3, 4(r3)
/* 06CEE0 80072480 7C83032E */  sthx    r4, r3, r0
lbl_80072484:
/* 06CEE4 80072484 38600001 */  li      r3, 1
/* 06CEE8 80072488 4E800020 */  blr     

ramPut8:
/* 06CEEC 8007248C 80030008 */  lwz     r0, 8(r3)
/* 06CEF0 80072490 548601BE */  clrlwi  r6, r4, 6
/* 06CEF4 80072494 7C060040 */  cmplw   r6, r0
/* 06CEF8 80072498 40800010 */  bge     lbl_800724A8
/* 06CEFC 8007249C 88850000 */  lbz     r4, 0(r5)
/* 06CF00 800724A0 80030004 */  lwz     r0, 4(r3)
/* 06CF04 800724A4 7C8601AE */  stbx    r4, r6, r0
lbl_800724A8:
/* 06CF08 800724A8 38600001 */  li      r3, 1
/* 06CF0C 800724AC 4E800020 */  blr     

ramGetRI64:
/* 06CF10 800724B0 38600000 */  li      r3, 0
/* 06CF14 800724B4 4E800020 */  blr     

ramGetRI32:
/* 06CF18 800724B8 548006FE */  clrlwi  r0, r4, 0x1b
/* 06CF1C 800724BC 2800001C */  cmplwi  r0, 0x1c
/* 06CF20 800724C0 4181001C */  bgt     lbl_800724DC
/* 06CF24 800724C4 3C608010 */  lis     r3, jtbl_800F9F50@ha
/* 06CF28 800724C8 38639F50 */  addi    r3, r3, jtbl_800F9F50@l
/* 06CF2C 800724CC 5400103A */  slwi    r0, r0, 2
/* 06CF30 800724D0 7C03002E */  lwzx    r0, r3, r0
/* 06CF34 800724D4 7C0903A6 */  mtctr   r0
/* 06CF38 800724D8 4E800420 */  bctr    
glabel lbl_800724DC
/* 06CF3C 800724DC 38600000 */  li      r3, 0
/* 06CF40 800724E0 4E800020 */  blr     
glabel lbl_800724E4
/* 06CF44 800724E4 38600001 */  li      r3, 1
/* 06CF48 800724E8 4E800020 */  blr     

ramGetRI16:
/* 06CF4C 800724EC 38600000 */  li      r3, 0
/* 06CF50 800724F0 4E800020 */  blr     

ramGetRI8:
/* 06CF54 800724F4 38600000 */  li      r3, 0
/* 06CF58 800724F8 4E800020 */  blr     

ramPutRI64:
/* 06CF5C 800724FC 38600000 */  li      r3, 0
/* 06CF60 80072500 4E800020 */  blr     

ramPutRI32:
/* 06CF64 80072504 548006FE */  clrlwi  r0, r4, 0x1b
/* 06CF68 80072508 2800001C */  cmplwi  r0, 0x1c
/* 06CF6C 8007250C 4181001C */  bgt     lbl_80072528
/* 06CF70 80072510 3C608010 */  lis     r3, jtbl_800F9FC4@ha
/* 06CF74 80072514 38639FC4 */  addi    r3, r3, jtbl_800F9FC4@l
/* 06CF78 80072518 5400103A */  slwi    r0, r0, 2
/* 06CF7C 8007251C 7C03002E */  lwzx    r0, r3, r0
/* 06CF80 80072520 7C0903A6 */  mtctr   r0
/* 06CF84 80072524 4E800420 */  bctr    
glabel lbl_80072528
/* 06CF88 80072528 38600000 */  li      r3, 0
/* 06CF8C 8007252C 4E800020 */  blr     
glabel lbl_80072530
/* 06CF90 80072530 38600001 */  li      r3, 1
/* 06CF94 80072534 4E800020 */  blr     

ramPutRI16:
/* 06CF98 80072538 38600000 */  li      r3, 0
/* 06CF9C 8007253C 4E800020 */  blr     

ramPutRI8:
/* 06CFA0 80072540 38600000 */  li      r3, 0
/* 06CFA4 80072544 4E800020 */  blr     

ramGetControl64:
/* 06CFA8 80072548 38600000 */  li      r3, 0
/* 06CFAC 8007254C 4E800020 */  blr     

ramGetControl32:
/* 06CFB0 80072550 548006BE */  clrlwi  r0, r4, 0x1a
/* 06CFB4 80072554 28000024 */  cmplwi  r0, 0x24
/* 06CFB8 80072558 4181001C */  bgt     lbl_80072574
/* 06CFBC 8007255C 3C608010 */  lis     r3, jtbl_800FA038@ha
/* 06CFC0 80072560 3863A038 */  addi    r3, r3, jtbl_800FA038@l
/* 06CFC4 80072564 5400103A */  slwi    r0, r0, 2
/* 06CFC8 80072568 7C03002E */  lwzx    r0, r3, r0
/* 06CFCC 8007256C 7C0903A6 */  mtctr   r0
/* 06CFD0 80072570 4E800420 */  bctr    
glabel lbl_80072574
/* 06CFD4 80072574 38600000 */  li      r3, 0
/* 06CFD8 80072578 4E800020 */  blr     
glabel lbl_8007257C
/* 06CFDC 8007257C 38600001 */  li      r3, 1
/* 06CFE0 80072580 4E800020 */  blr     

ramGetControl16:
/* 06CFE4 80072584 38600000 */  li      r3, 0
/* 06CFE8 80072588 4E800020 */  blr     

ramGetControl8:
/* 06CFEC 8007258C 38600000 */  li      r3, 0
/* 06CFF0 80072590 4E800020 */  blr     

ramPutControl64:
/* 06CFF4 80072594 38600000 */  li      r3, 0
/* 06CFF8 80072598 4E800020 */  blr     

ramPutControl32:
/* 06CFFC 8007259C 548006BE */  clrlwi  r0, r4, 0x1a
/* 06D000 800725A0 28000024 */  cmplwi  r0, 0x24
/* 06D004 800725A4 4181001C */  bgt     lbl_800725C0
/* 06D008 800725A8 3C608010 */  lis     r3, jtbl_800FA0CC@ha
/* 06D00C 800725AC 3863A0CC */  addi    r3, r3, jtbl_800FA0CC@l
/* 06D010 800725B0 5400103A */  slwi    r0, r0, 2
/* 06D014 800725B4 7C03002E */  lwzx    r0, r3, r0
/* 06D018 800725B8 7C0903A6 */  mtctr   r0
/* 06D01C 800725BC 4E800420 */  bctr    
glabel lbl_800725C0
/* 06D020 800725C0 38600000 */  li      r3, 0
/* 06D024 800725C4 4E800020 */  blr     
glabel lbl_800725C8
/* 06D028 800725C8 38600001 */  li      r3, 1
/* 06D02C 800725CC 4E800020 */  blr     

ramPutControl16:
/* 06D030 800725D0 38600000 */  li      r3, 0
/* 06D034 800725D4 4E800020 */  blr     

ramPutControl8:
/* 06D038 800725D8 38600000 */  li      r3, 0
/* 06D03C 800725DC 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000F6FC0 800F9F40 0010 */
glabel gClassRAM
    .long D_801454C0, 0x0000000C, 0x00000000, ramEvent

.balign 4

/* 000F6FD0 800F9F50 0074 */
jtbl_800F9F50:
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724DC
    .long lbl_800724E4

.balign 4

/* 000F7044 800F9FC4 0074 */
jtbl_800F9FC4:
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072528
    .long lbl_80072530

.balign 4

/* 000F70B8 800FA038 0094 */
jtbl_800FA038:
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_80072574
    .long lbl_8007257C

.balign 4

/* 000F714C 800FA0CC 0094 */
jtbl_800FA0CC:
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C0
    .long lbl_800725C8


.section .sdata, "wa"

.balign 8

/* 000FFD20 801454C0 0004 */
D_801454C0:
    .asciz "RAM"


