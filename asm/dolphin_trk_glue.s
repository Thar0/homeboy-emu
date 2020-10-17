# dolphin_trk_glue.c
.include "macros.inc"

.section .text, "ax"

.balign 4

glabel TRKLoadContext
/* 0D3FF8 800D9598 80030000 */  lwz     r0, 0(r3)
/* 0D3FFC 800D959C 80230004 */  lwz     r1, 4(r3)
/* 0D4000 800D95A0 80430008 */  lwz     r2, 8(r3)
/* 0D4004 800D95A4 A0A301A2 */  lhz     r5, 0x1a2(r3)
/* 0D4008 800D95A8 54A607BD */  rlwinm. r6, r5, 0, 0x1e, 0x1e
/* 0D400C 800D95AC 41820014 */  beq     lbl_800D95C0
/* 0D4010 800D95B0 54A507FA */  rlwinm  r5, r5, 0, 0x1f, 0x1d
/* 0D4014 800D95B4 B0A301A2 */  sth     r5, 0x1a2(r3)
/* 0D4018 800D95B8 B8A30014 */  lmw     r5, 0x14(r3)
/* 0D401C 800D95BC 48000008 */  b       lbl_800D95C4
lbl_800D95C0:
/* 0D4020 800D95C0 B9A30034 */  lmw     r13, 0x34(r3)
lbl_800D95C4:
/* 0D4024 800D95C4 7C7F1B78 */  mr      r31, r3
/* 0D4028 800D95C8 7C832378 */  mr      r3, r4
/* 0D402C 800D95CC 809F0080 */  lwz     r4, 0x80(r31)
/* 0D4030 800D95D0 7C8FF120 */  mtcrf   0xff, r4
/* 0D4034 800D95D4 809F0084 */  lwz     r4, 0x84(r31)
/* 0D4038 800D95D8 7C8803A6 */  mtlr    r4
/* 0D403C 800D95DC 809F0088 */  lwz     r4, 0x88(r31)
/* 0D4040 800D95E0 7C8903A6 */  mtctr   r4
/* 0D4044 800D95E4 809F008C */  lwz     r4, 0x8c(r31)
/* 0D4048 800D95E8 7C8103A6 */  mtxer   r4
/* 0D404C 800D95EC 7C8000A6 */  mfmsr   r4
/* 0D4050 800D95F0 5484045E */  rlwinm  r4, r4, 0, 0x11, 0xf
/* 0D4054 800D95F4 548407FA */  rlwinm  r4, r4, 0, 0x1f, 0x1d
/* 0D4058 800D95F8 7C800124 */  mtmsr   r4
/* 0D405C 800D95FC 7C5143A6 */  mtspr   0x111, r2
/* 0D4060 800D9600 809F000C */  lwz     r4, 0xc(r31)
/* 0D4064 800D9604 7C9243A6 */  mtspr   0x112, r4
/* 0D4068 800D9608 809F0010 */  lwz     r4, 0x10(r31)
/* 0D406C 800D960C 7C9343A6 */  mtspr   0x113, r4
/* 0D4070 800D9610 805F0198 */  lwz     r2, 0x198(r31)
/* 0D4074 800D9614 809F019C */  lwz     r4, 0x19c(r31)
/* 0D4078 800D9618 83FF007C */  lwz     r31, 0x7c(r31)
/* 0D407C 800D961C 4BFFED8C */  b       TRKInterruptHandler

glabel TRKEXICallBack
/* 0D4080 800D9620 7C0802A6 */  mflr    r0
/* 0D4084 800D9624 90010004 */  stw     r0, 4(r1)
/* 0D4088 800D9628 9421FFF0 */  stwu    r1, -0x10(r1)
/* 0D408C 800D962C 93E1000C */  stw     r31, 0xc(r1)
/* 0D4090 800D9630 7C9F2378 */  mr      r31, r4
/* 0D4094 800D9634 4BFD36D1 */  bl      OSEnableScheduler
/* 0D4098 800D9638 7FE3FB78 */  mr      r3, r31
/* 0D409C 800D963C 38800500 */  li      r4, 0x500
/* 0D40A0 800D9640 4BFFFF59 */  bl      TRKLoadContext
/* 0D40A4 800D9644 83E1000C */  lwz     r31, 0xc(r1)
/* 0D40A8 800D9648 38210010 */  addi    r1, r1, 0x10
/* 0D40AC 800D964C 80010004 */  lwz     r0, 4(r1)
/* 0D40B0 800D9650 7C0803A6 */  mtlr    r0
/* 0D40B4 800D9654 4E800020 */  blr     

glabel InitMetroTRKCommTable
/* 0D40B8 800D9658 7C0802A6 */  mflr    r0
/* 0D40BC 800D965C 90010004 */  stw     r0, 4(r1)
/* 0D40C0 800D9660 9421FFF8 */  stwu    r1, -8(r1)
/* 0D40C4 800D9664 2C030001 */  cmpwi   r3, 1
/* 0D40C8 800D9668 40820068 */  bne     lbl_800D96D0
/* 0D40CC 800D966C 48005AD1 */  bl      Hu_IsStub
/* 0D40D0 800D9670 3CA0800E */  lis     r5, DBInitComm@ha
/* 0D40D4 800D9674 3C808010 */  lis     r4, gDBCommTable@ha
/* 0D40D8 800D9678 3805EAA0 */  addi    r0, r5, DBInitComm@l
/* 0D40DC 800D967C 38A41DF8 */  addi    r5, r4, gDBCommTable@l
/* 0D40E0 800D9680 3C80800E */  lis     r4, DBInitInterrupts@ha
/* 0D40E4 800D9684 90050000 */  stw     r0, 0(r5)
/* 0D40E8 800D9688 3804EA4C */  addi    r0, r4, DBInitInterrupts@l
/* 0D40EC 800D968C 3C80800E */  lis     r4, DBQueryData@ha
/* 0D40F0 800D9690 90050004 */  stw     r0, 4(r5)
/* 0D40F4 800D9694 3804E9B0 */  addi    r0, r4, DBQueryData@l
/* 0D40F8 800D9698 3C80800E */  lis     r4, DBRead@ha
/* 0D40FC 800D969C 90050008 */  stw     r0, 8(r5)
/* 0D4100 800D96A0 3804E924 */  addi    r0, r4, DBRead@l
/* 0D4104 800D96A4 3C80800E */  lis     r4, DBWrite@ha
/* 0D4108 800D96A8 9005000C */  stw     r0, 0xc(r5)
/* 0D410C 800D96AC 3804E6C4 */  addi    r0, r4, DBWrite@l
/* 0D4110 800D96B0 3C80800E */  lis     r4, DBOpen@ha
/* 0D4114 800D96B4 90050010 */  stw     r0, 0x10(r5)
/* 0D4118 800D96B8 3804E6C0 */  addi    r0, r4, DBOpen@l
/* 0D411C 800D96BC 3C80800E */  lis     r4, DBClose@ha
/* 0D4120 800D96C0 90050014 */  stw     r0, 0x14(r5)
/* 0D4124 800D96C4 3804E6BC */  addi    r0, r4, DBClose@l
/* 0D4128 800D96C8 90050018 */  stw     r0, 0x18(r5)
/* 0D412C 800D96CC 48000064 */  b       lbl_800D9730
lbl_800D96D0:
/* 0D4130 800D96D0 48004FE5 */  bl      AMC_IsStub
/* 0D4134 800D96D4 3CA0800E */  lis     r5, EXI2_Init@ha
/* 0D4138 800D96D8 3C808010 */  lis     r4, gDBCommTable@ha
/* 0D413C 800D96DC 3805E68C */  addi    r0, r5, EXI2_Init@l
/* 0D4140 800D96E0 38A41DF8 */  addi    r5, r4, gDBCommTable@l
/* 0D4144 800D96E4 3C80800E */  lis     r4, EXI2_EnableInterrupts@ha
/* 0D4148 800D96E8 90050000 */  stw     r0, 0(r5)
/* 0D414C 800D96EC 3804E690 */  addi    r0, r4, EXI2_EnableInterrupts@l
/* 0D4150 800D96F0 3C80800E */  lis     r4, EXI2_Poll@ha
/* 0D4154 800D96F4 90050004 */  stw     r0, 4(r5)
/* 0D4158 800D96F8 3804E694 */  addi    r0, r4, EXI2_Poll@l
/* 0D415C 800D96FC 3C80800E */  lis     r4, EXI2_ReadN@ha
/* 0D4160 800D9700 90050008 */  stw     r0, 8(r5)
/* 0D4164 800D9704 3804E69C */  addi    r0, r4, EXI2_ReadN@l
/* 0D4168 800D9708 3C80800E */  lis     r4, EXI2_WriteN@ha
/* 0D416C 800D970C 9005000C */  stw     r0, 0xc(r5)
/* 0D4170 800D9710 3804E6A4 */  addi    r0, r4, EXI2_WriteN@l
/* 0D4174 800D9714 3C80800E */  lis     r4, EXI2_Reserve@ha
/* 0D4178 800D9718 90050010 */  stw     r0, 0x10(r5)
/* 0D417C 800D971C 3804E6AC */  addi    r0, r4, EXI2_Reserve@l
/* 0D4180 800D9720 3C80800E */  lis     r4, EXI2_Unreserve@ha
/* 0D4184 800D9724 90050014 */  stw     r0, 0x14(r5)
/* 0D4188 800D9728 3804E6B0 */  addi    r0, r4, EXI2_Unreserve@l
/* 0D418C 800D972C 90050018 */  stw     r0, 0x18(r5)
lbl_800D9730:
/* 0D4190 800D9730 38210008 */  addi    r1, r1, 8
/* 0D4194 800D9734 80010004 */  lwz     r0, 4(r1)
/* 0D4198 800D9738 7C0803A6 */  mtlr    r0
/* 0D419C 800D973C 4E800020 */  blr     

glabel TRKUARTInterruptHandler
/* 0D41A0 800D9740 4E800020 */  blr     

glabel TRKInitializeIntDrivenUART
/* 0D41A4 800D9744 7C0802A6 */  mflr    r0
/* 0D41A8 800D9748 90010004 */  stw     r0, 4(r1)
/* 0D41AC 800D974C 9421FFF8 */  stwu    r1, -8(r1)
/* 0D41B0 800D9750 3C608010 */  lis     r3, gDBCommTable@ha
/* 0D41B4 800D9754 38631DF8 */  addi    r3, r3, gDBCommTable@l
/* 0D41B8 800D9758 3C80800E */  lis     r4, TRKEXICallBack@ha
/* 0D41BC 800D975C 81830000 */  lwz     r12, 0(r3)
/* 0D41C0 800D9760 38849620 */  addi    r4, r4, TRKEXICallBack@l
/* 0D41C4 800D9764 7CC33378 */  mr      r3, r6
/* 0D41C8 800D9768 7D8803A6 */  mtlr    r12
/* 0D41CC 800D976C 4E800021 */  blrl    
/* 0D41D0 800D9770 38600000 */  li      r3, 0
/* 0D41D4 800D9774 38210008 */  addi    r1, r1, 8
/* 0D41D8 800D9778 80010004 */  lwz     r0, 4(r1)
/* 0D41DC 800D977C 7C0803A6 */  mtlr    r0
/* 0D41E0 800D9780 4E800020 */  blr     

glabel EnableEXI2Interrupts
/* 0D41E4 800D9784 7C0802A6 */  mflr    r0
/* 0D41E8 800D9788 90010004 */  stw     r0, 4(r1)
/* 0D41EC 800D978C 9421FFF8 */  stwu    r1, -8(r1)
/* 0D41F0 800D9790 3C608010 */  lis     r3, gDBCommTable@ha
/* 0D41F4 800D9794 38631DF8 */  addi    r3, r3, gDBCommTable@l
/* 0D41F8 800D9798 81830004 */  lwz     r12, 4(r3)
/* 0D41FC 800D979C 7D8803A6 */  mtlr    r12
/* 0D4200 800D97A0 4E800021 */  blrl    
/* 0D4204 800D97A4 38210008 */  addi    r1, r1, 8
/* 0D4208 800D97A8 80010004 */  lwz     r0, 4(r1)
/* 0D420C 800D97AC 7C0803A6 */  mtlr    r0
/* 0D4210 800D97B0 4E800020 */  blr     

glabel TRKPollUART
/* 0D4214 800D97B4 7C0802A6 */  mflr    r0
/* 0D4218 800D97B8 90010004 */  stw     r0, 4(r1)
/* 0D421C 800D97BC 9421FFF8 */  stwu    r1, -8(r1)
/* 0D4220 800D97C0 3C608010 */  lis     r3, gDBCommTable@ha
/* 0D4224 800D97C4 38631DF8 */  addi    r3, r3, gDBCommTable@l
/* 0D4228 800D97C8 81830008 */  lwz     r12, 8(r3)
/* 0D422C 800D97CC 7D8803A6 */  mtlr    r12
/* 0D4230 800D97D0 4E800021 */  blrl    
/* 0D4234 800D97D4 38210008 */  addi    r1, r1, 8
/* 0D4238 800D97D8 80010004 */  lwz     r0, 4(r1)
/* 0D423C 800D97DC 7C0803A6 */  mtlr    r0
/* 0D4240 800D97E0 4E800020 */  blr     

glabel TRK_ReadUARTN
/* 0D4244 800D97E4 7C0802A6 */  mflr    r0
/* 0D4248 800D97E8 90010004 */  stw     r0, 4(r1)
/* 0D424C 800D97EC 9421FFF8 */  stwu    r1, -8(r1)
/* 0D4250 800D97F0 3CA08010 */  lis     r5, gDBCommTable@ha
/* 0D4254 800D97F4 38A51DF8 */  addi    r5, r5, gDBCommTable@l
/* 0D4258 800D97F8 8185000C */  lwz     r12, 0xc(r5)
/* 0D425C 800D97FC 7D8803A6 */  mtlr    r12
/* 0D4260 800D9800 4E800021 */  blrl    
/* 0D4264 800D9804 2C030000 */  cmpwi   r3, 0
/* 0D4268 800D9808 4082000C */  bne     lbl_800D9814
/* 0D426C 800D980C 38600000 */  li      r3, 0
/* 0D4270 800D9810 48000008 */  b       lbl_800D9818
lbl_800D9814:
/* 0D4274 800D9814 3860FFFF */  li      r3, -1
lbl_800D9818:
/* 0D4278 800D9818 38210008 */  addi    r1, r1, 8
/* 0D427C 800D981C 80010004 */  lwz     r0, 4(r1)
/* 0D4280 800D9820 7C0803A6 */  mtlr    r0
/* 0D4284 800D9824 4E800020 */  blr     

glabel TRK_WriteUARTN
/* 0D4288 800D9828 7C0802A6 */  mflr    r0
/* 0D428C 800D982C 90010004 */  stw     r0, 4(r1)
/* 0D4290 800D9830 9421FFF8 */  stwu    r1, -8(r1)
/* 0D4294 800D9834 3CA08010 */  lis     r5, gDBCommTable@ha
/* 0D4298 800D9838 38A51DF8 */  addi    r5, r5, gDBCommTable@l
/* 0D429C 800D983C 81850010 */  lwz     r12, 0x10(r5)
/* 0D42A0 800D9840 7D8803A6 */  mtlr    r12
/* 0D42A4 800D9844 4E800021 */  blrl    
/* 0D42A8 800D9848 2C030000 */  cmpwi   r3, 0
/* 0D42AC 800D984C 4082000C */  bne     lbl_800D9858
/* 0D42B0 800D9850 38600000 */  li      r3, 0
/* 0D42B4 800D9854 48000008 */  b       lbl_800D985C
lbl_800D9858:
/* 0D42B8 800D9858 3860FFFF */  li      r3, -1
lbl_800D985C:
/* 0D42BC 800D985C 38210008 */  addi    r1, r1, 8
/* 0D42C0 800D9860 80010004 */  lwz     r0, 4(r1)
/* 0D42C4 800D9864 7C0803A6 */  mtlr    r0
/* 0D42C8 800D9868 4E800020 */  blr     

glabel ReserveEXI2Port
/* 0D42CC 800D986C 7C0802A6 */  mflr    r0
/* 0D42D0 800D9870 90010004 */  stw     r0, 4(r1)
/* 0D42D4 800D9874 9421FFF8 */  stwu    r1, -8(r1)
/* 0D42D8 800D9878 3C608010 */  lis     r3, gDBCommTable@ha
/* 0D42DC 800D987C 38631DF8 */  addi    r3, r3, gDBCommTable@l
/* 0D42E0 800D9880 81830014 */  lwz     r12, 0x14(r3)
/* 0D42E4 800D9884 7D8803A6 */  mtlr    r12
/* 0D42E8 800D9888 4E800021 */  blrl    
/* 0D42EC 800D988C 38210008 */  addi    r1, r1, 8
/* 0D42F0 800D9890 80010004 */  lwz     r0, 4(r1)
/* 0D42F4 800D9894 7C0803A6 */  mtlr    r0
/* 0D42F8 800D9898 4E800020 */  blr     

glabel UnreserveEXI2Port
/* 0D42FC 800D989C 7C0802A6 */  mflr    r0
/* 0D4300 800D98A0 90010004 */  stw     r0, 4(r1)
/* 0D4304 800D98A4 9421FFF8 */  stwu    r1, -8(r1)
/* 0D4308 800D98A8 3C608010 */  lis     r3, gDBCommTable@ha
/* 0D430C 800D98AC 38631DF8 */  addi    r3, r3, gDBCommTable@l
/* 0D4310 800D98B0 81830018 */  lwz     r12, 0x18(r3)
/* 0D4314 800D98B4 7D8803A6 */  mtlr    r12
/* 0D4318 800D98B8 4E800021 */  blrl    
/* 0D431C 800D98BC 38210008 */  addi    r1, r1, 8
/* 0D4320 800D98C0 80010004 */  lwz     r0, 4(r1)
/* 0D4324 800D98C4 7C0803A6 */  mtlr    r0
/* 0D4328 800D98C8 4E800020 */  blr     

glabel TRK_board_display
/* 0D432C 800D98CC 7C0802A6 */  mflr    r0
/* 0D4330 800D98D0 90010004 */  stw     r0, 4(r1)
/* 0D4334 800D98D4 9421FFF8 */  stwu    r1, -8(r1)
/* 0D4338 800D98D8 4CC63182 */  crclr   6
/* 0D433C 800D98DC 4BFD0791 */  bl      OSReport
/* 0D4340 800D98E0 38210008 */  addi    r1, r1, 8
/* 0D4344 800D98E4 80010004 */  lwz     r0, 4(r1)
/* 0D4348 800D98E8 7C0803A6 */  mtlr    r0
/* 0D434C 800D98EC 4E800020 */  blr     


.section .data, "wa"

.balign 8

/* 000FEE78 80101DF8 001C */
glabel gDBCommTable
    .long 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000


