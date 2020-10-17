#ifndef __FUNCTIONS_H_
#define __FUNCTIONS_H_

/*
 * Local symbols included but should not be uncommented when types are discovered
 */

#include <unk.h>

// ======================= xlCoreGCN.c ================================================
/* 800055A0 global */ extern UNK_TYPE xlCoreBeforeRender(UNK_TYPE...);
/* 80005674 global */ extern UNK_TYPE main(UNK_TYPE...);
/* 800058E0 global */ extern UNK_TYPE xlCoreHiResolution(UNK_TYPE...);
/* 800058E8 global */ extern UNK_TYPE xlCoreGetArgument(UNK_TYPE...);
/* 8000591C global */ extern UNK_TYPE xlCoreGetArgumentCount(UNK_TYPE...);
/* 80005924 local  */ extern UNK_TYPE xlCoreInitGX(UNK_TYPE...);
/* 80005A60 local  */ extern UNK_TYPE xlCoreInitMem(UNK_TYPE...);
/* 80005B38 local  */ extern UNK_TYPE xlCoreInitRenderMode(UNK_TYPE...);
/* 80005CE0 global */ extern UNK_TYPE xlCoreReset(UNK_TYPE...);
// ======================= xlPostGCN.c ================================================
/* 80005D1C global */ extern UNK_TYPE xlPostReset(UNK_TYPE...);
/* 80005D24 global */ extern UNK_TYPE xlPostSetup(UNK_TYPE...);
/* 80005D2C global */ extern UNK_TYPE xlPostText(UNK_TYPE...);
// ======================= xlFileGCN.c ================================================
/* 80005D80 global */ extern UNK_TYPE xlFileEvent(UNK_TYPE...);
/* 80005E58 global */ extern UNK_TYPE xlFileGetPosition(UNK_TYPE...);
/* 80005E70 global */ extern UNK_TYPE xlFileSetPosition(UNK_TYPE...);
/* 80005E98 global */ extern UNK_TYPE xlFileGet(UNK_TYPE...);
/* 80005F9C global */ extern UNK_TYPE xlFileClose(UNK_TYPE...);
/* 80005FD0 global */ extern UNK_TYPE xlFileOpen(UNK_TYPE...);
/* 800060A4 global */ extern UNK_TYPE xlFileSetRead(UNK_TYPE...);
/* 800060B0 global */ extern UNK_TYPE xlFileSetOpen(UNK_TYPE...);
// ======================= xlText.c ===================================================
/* 800060BC global */ extern UNK_TYPE xlTextMatch(UNK_TYPE...);
/* 80006178 global */ extern UNK_TYPE xlTextCopy(UNK_TYPE...);
// ======================= xlList.c ===================================================
/* 800061B0 global */ extern UNK_TYPE xlListReset(UNK_TYPE...);
/* 800061B8 global */ extern UNK_TYPE xlListSetup(UNK_TYPE...);
/* 800061E0 global */ extern UNK_TYPE xlListTestItem(UNK_TYPE...);
/* 8000626C global */ extern UNK_TYPE xlListFreeItem(UNK_TYPE...);
/* 80006318 global */ extern UNK_TYPE xlListMakeItem(UNK_TYPE...);
/* 800063C4 global */ extern UNK_TYPE xlListFree(UNK_TYPE...);
/* 80006480 global */ extern UNK_TYPE xlListMake(UNK_TYPE...);
// ======================= xlHeap.c ===================================================
/* 80006578 global */ extern UNK_TYPE xlHeapReset(UNK_TYPE...);
/* 800065E0 global */ extern UNK_TYPE xlHeapSetup(UNK_TYPE...);
/* 800067A0 global */ extern UNK_TYPE xlHeapGetFree(UNK_TYPE...);
/* 80006838 global */ extern UNK_TYPE xlHeapFill32(UNK_TYPE...);
/* 80006A20 global */ extern UNK_TYPE xlHeapCopy(UNK_TYPE...);
/* 80006E98 global */ extern UNK_TYPE xlHeapCompact(UNK_TYPE...);
/* 80006FC8 global */ extern UNK_TYPE xlHeapFree(UNK_TYPE...);
/* 800070E4 global */ extern UNK_TYPE xlHeapTake(UNK_TYPE...);
/* 8000736C local  */ extern UNK_TYPE xlHeapFindUpperBlock(UNK_TYPE...);
/* 80007470 local  */ extern UNK_TYPE xlHeapBlockCacheReset(UNK_TYPE...);
/* 8000757C local  */ extern UNK_TYPE xlHeapBlockCacheClear(UNK_TYPE...);
/* 80007688 local  */ extern UNK_TYPE xlHeapBlockCacheAdd(UNK_TYPE...);
/* 800078F0 local  */ extern UNK_TYPE xlHeapBlockCacheGet(UNK_TYPE...);
// ======================= xlFile.c ===================================================
/* 80007AF0 global */ extern UNK_TYPE xlFileGetLineSave(UNK_TYPE...);
/* 80007B3C global */ extern UNK_TYPE xlFileMatchToken(UNK_TYPE...);
/* 80007C0C global */ extern UNK_TYPE xlFileGetToken(UNK_TYPE...);
/* 80007ECC global */ extern UNK_TYPE xlFileSkipLine(UNK_TYPE...);
/* 80007EDC global */ extern UNK_TYPE xlTokenGetInteger(UNK_TYPE...);
/* 80008000 global */ extern UNK_TYPE xlFileGetLine(UNK_TYPE...);
/* 80008130 global */ extern UNK_TYPE xlFileGetSize(UNK_TYPE...);
// ======================= xlObject.c =================================================
/* 800081A8 global */ extern UNK_TYPE xlObjectReset(UNK_TYPE...);
/* 80008218 global */ extern UNK_TYPE xlObjectSetup(UNK_TYPE...);
/* 80008254 global */ extern UNK_TYPE xlObjectEvent(UNK_TYPE...);
/* 8000830C global */ extern UNK_TYPE xlObjectTest(UNK_TYPE...);
/* 80008374 global */ extern UNK_TYPE xlObjectFree(UNK_TYPE...);
/* 8000840C global */ extern UNK_TYPE xlObjectMake(UNK_TYPE...);
// ======================= simGCN.c ===================================================
/* 80008568 global */ extern UNK_TYPE xlMain(UNK_TYPE...);
/* 80008B5C global */ extern UNK_TYPE simulatorGetArgument(UNK_TYPE...);
/* 80008B9C local  */ extern UNK_TYPE simulatorParseArguments(UNK_TYPE...);
/* 80008D00 local  */ extern UNK_TYPE simulatorDrawCursor(UNK_TYPE...);
/* 80008F08 global */ extern UNK_TYPE simulatorMCardPollDrawFormatBar(UNK_TYPE...);
/* 80009038 global */ extern UNK_TYPE simulatorMCardPollDrawBar(UNK_TYPE...);
/* 80009168 global */ extern UNK_TYPE simulatorDrawMCardText(UNK_TYPE...);
/* 80009200 global */ extern UNK_TYPE simulatorTestReset(UNK_TYPE...);
/* 800093E0 global */ extern UNK_TYPE simulatorRumbleStop(UNK_TYPE...);
/* 80009408 global */ extern UNK_TYPE simulatorRumbleStart(UNK_TYPE...);
/* 80009430 global */ extern UNK_TYPE simulatorWriteFLASH(UNK_TYPE...);
/* 80009464 global */ extern UNK_TYPE simulatorReadFLASH(UNK_TYPE...);
/* 80009498 global */ extern UNK_TYPE simulatorWriteSRAM(UNK_TYPE...);
/* 800094CC global */ extern UNK_TYPE simulatorReadSRAM(UNK_TYPE...);
/* 80009500 global */ extern UNK_TYPE simulatorWriteEEPROM(UNK_TYPE...);
/* 80009570 global */ extern UNK_TYPE simulatorReadEEPROM(UNK_TYPE...);
/* 800095E0 global */ extern UNK_TYPE simulatorWritePak(UNK_TYPE...);
/* 8000965C global */ extern UNK_TYPE simulatorReadPak(UNK_TYPE...);
/* 800096D8 global */ extern UNK_TYPE simulatorDetectController(UNK_TYPE...);
/* 8000972C global */ extern UNK_TYPE simulatorShowLoad(UNK_TYPE...);
/* 80009734 global */ extern UNK_TYPE simulatorReadController(UNK_TYPE...);
/* 80009D88 global */ extern UNK_TYPE simulatorCopyControllerMap(UNK_TYPE...);
/* 80009E50 global */ extern UNK_TYPE simulatorSetControllerMap(UNK_TYPE...);
/* 80009F28 global */ extern UNK_TYPE simulatorResetAndPlayMovie(UNK_TYPE...);
/* 8000A084 global */ extern UNK_TYPE simulatorReset(UNK_TYPE...);
/* 8000A134 global */ extern UNK_TYPE simulatorDrawErrorMessageWait(UNK_TYPE...);
/* 8000D424 global */ extern UNK_TYPE simulatorDrawYesNoMessage(UNK_TYPE...);
/* 8000D874 global */ extern UNK_TYPE simulatorDrawYesNoMessageLoop(UNK_TYPE...);
/* 8000DB40 global */ extern UNK_TYPE simulatorPrepareMessage(UNK_TYPE...);
/* 8000DD18 global */ extern UNK_TYPE simulatorDrawErrorMessage(UNK_TYPE...);
/* 8000DF48 global */ extern UNK_TYPE simulatorDrawOKImage(UNK_TYPE...);
/* 8000E788 global */ extern UNK_TYPE simulatorDrawYesNoImage(UNK_TYPE...);
/* 8000F344 global */ extern UNK_TYPE simulatorDrawImage(UNK_TYPE...);
/* 8000FB74 global */ extern UNK_TYPE simulatorPlayMovie(UNK_TYPE...);
/* 8000FBE0 global */ extern UNK_TYPE simulatorDVDRead(UNK_TYPE...);
/* 8000FCC4 global */ extern UNK_TYPE simulatorDVDOpen(UNK_TYPE...);
/* 8000FD34 global */ extern UNK_TYPE simulatorDVDShowError(UNK_TYPE...);
/* 8000FF3C global */ extern UNK_TYPE simulatorDEMODoneRender(UNK_TYPE...);
/* 8000FFD8 global */ extern UNK_TYPE simulatorUnpackTexPalette(UNK_TYPE...);
// ======================= movie.c ====================================================
/* 800100B4 global */ extern UNK_TYPE MovieDraw(UNK_TYPE...);
/* 800100EC global */ extern UNK_TYPE MovieInit(UNK_TYPE...);
// ======================= THPPlayer.c ================================================
/* 800101C4 global */ extern UNK_TYPE THPPlayerInit(UNK_TYPE...);
/* 800102FC global */ extern UNK_TYPE THPPlayerOpen(UNK_TYPE...);
/* 80010574 global */ extern UNK_TYPE THPPlayerCalcNeedMemory(UNK_TYPE...);
/* 8001061C global */ extern UNK_TYPE THPPlayerSetBuffer(UNK_TYPE...);
/* 80010858 local  */ extern UNK_TYPE InitAllMessageQueue(UNK_TYPE...);
/* 80010924 global */ extern UNK_TYPE PrepareReady(UNK_TYPE...);
/* 80010954 global */ extern UNK_TYPE THPPlayerPrepare(UNK_TYPE...);
/* 80010BC8 global */ extern UNK_TYPE THPPlayerPlay(UNK_TYPE...);
/* 80010C24 local  */ extern UNK_TYPE PlayControl(UNK_TYPE...);
/* 80010EC0 local  */ extern UNK_TYPE ProperTimingForStart(UNK_TYPE...);
/* 80010F2C local  */ extern UNK_TYPE ProperTimingForGettingNextFrame(UNK_TYPE...);
/* 80011050 global */ extern UNK_TYPE THPPlayerDrawCurrentFrame(UNK_TYPE...);
/* 8001111C local  */ extern UNK_TYPE PushUsedTextureSet(UNK_TYPE...);
/* 8001114C global */ extern UNK_TYPE THPPlayerDrawDone(UNK_TYPE...);
/* 800111BC local  */ extern UNK_TYPE THPAudioMixCallback(UNK_TYPE...);
/* 80011334 local  */ extern UNK_TYPE MixAudio(UNK_TYPE...);
// ======================= THPAudioDecode.c ===========================================
/* 800116D0 global */ extern UNK_TYPE CreateAudioDecodeThread(UNK_TYPE...);
/* 800117B0 global */ extern UNK_TYPE AudioDecodeThreadStart(UNK_TYPE...);
/* 800117E4 local  */ extern UNK_TYPE AudioDecoder(UNK_TYPE...);
/* 8001180C local  */ extern UNK_TYPE AudioDecoderForOnMemory(UNK_TYPE...);
/* 800118BC local  */ extern UNK_TYPE AudioDecode(UNK_TYPE...);
/* 80011994 global */ extern UNK_TYPE PopFreeAudioBuffer(UNK_TYPE...);
/* 800119C8 global */ extern UNK_TYPE PushFreeAudioBuffer(UNK_TYPE...);
/* 800119F8 global */ extern UNK_TYPE PopDecodedAudioBuffer(UNK_TYPE...);
/* 80011A3C global */ extern UNK_TYPE PushDecodedAudioBuffer(UNK_TYPE...);
// ======================= THPDraw.c ==================================================
/* 80011A6C global */ extern UNK_TYPE THPGXRestore(UNK_TYPE...);
/* 80011B84 global */ extern UNK_TYPE THPGXYuv2RgbSetup(UNK_TYPE...);
/* 80012088 global */ extern UNK_TYPE THPGXYuv2RgbDraw(UNK_TYPE...);
// ======================= THPRead.c ==================================================
/* 8001226C global */ extern UNK_TYPE PushReadedBuffer2(UNK_TYPE...);
/* 8001229C global */ extern UNK_TYPE PopReadedBuffer2(UNK_TYPE...);
/* 800122D0 global */ extern UNK_TYPE PushFreeReadBuffer(UNK_TYPE...);
/* 80012300 global */ extern UNK_TYPE PopReadedBuffer(UNK_TYPE...);
/* 80012334 local  */ extern UNK_TYPE Reader(UNK_TYPE...);
/* 80012460 global */ extern UNK_TYPE ReadThreadStart(UNK_TYPE...);
/* 80012494 global */ extern UNK_TYPE CreateReadThread(UNK_TYPE...);
/* 80012540 global */ extern UNK_TYPE movieReset(UNK_TYPE...);
/* 800125E0 global */ extern UNK_TYPE movieTestReset(UNK_TYPE...);
/* 80012794 global */ extern UNK_TYPE movieDVDRead(UNK_TYPE...);
/* 80012844 global */ extern UNK_TYPE movieDVDShowError(UNK_TYPE...);
/* 80012AA4 global */ extern UNK_TYPE movieDrawErrorMessage(UNK_TYPE...);
/* 80012C68 global */ extern UNK_TYPE movieDrawImage(UNK_TYPE...);
/* 80013184 global */ extern UNK_TYPE movieGXInit(UNK_TYPE...);
// ======================= THPVideoDecode.c ===========================================
/* 80013854 global */ extern UNK_TYPE CreateVideoDecodeThread(UNK_TYPE...);
/* 80013938 global */ extern UNK_TYPE VideoDecodeThreadStart(UNK_TYPE...);
/* 8001396C local  */ extern UNK_TYPE VideoDecoder(UNK_TYPE...);
/* 80013A48 local  */ extern UNK_TYPE VideoDecoderForOnMemory(UNK_TYPE...);
/* 80013B7C local  */ extern UNK_TYPE VideoDecode(UNK_TYPE...);
/* 80013C9C global */ extern UNK_TYPE PopFreeTextureSet(UNK_TYPE...);
/* 80013CD0 global */ extern UNK_TYPE PushFreeTextureSet(UNK_TYPE...);
/* 80013D00 global */ extern UNK_TYPE PopDecodedTextureSet(UNK_TYPE...);
/* 80013D44 global */ extern UNK_TYPE PushDecodedTextureSet(UNK_TYPE...);
// ======================= mcardGCN.c =================================================
/* 80013D74 local  */ // extern UNK_TYPE mcardLoadZelda2Camera(UNK_TYPE...);
/* 80013E78 global */ extern UNK_TYPE mcardSaveCamera(UNK_TYPE...);
/* 80013F6C local  */ // extern UNK_TYPE convert_i5i8(UNK_TYPE...);
/* 80013FEC local  */ // extern UNK_TYPE convert_i8i5(UNK_TYPE...);
/* 80014068 global */ extern UNK_TYPE mcardUpdate(UNK_TYPE...);
/* 800142C4 global */ extern UNK_TYPE mcardStore(UNK_TYPE...);
/* 80015048 global */ extern UNK_TYPE mcardOpenDuringGame(UNK_TYPE...);
/* 80015B98 global */ extern UNK_TYPE mcardOpen(UNK_TYPE...);
/* 800168F4 global */ extern UNK_TYPE mcardWrite(UNK_TYPE...);
/* 80017250 global */ extern UNK_TYPE mcardOpenDuringGameError(UNK_TYPE...);
/* 80017330 global */ extern UNK_TYPE mcardOpenError(UNK_TYPE...);
/* 80017410 global */ extern UNK_TYPE mcardMenu(UNK_TYPE...);
/* 80017DB4 global */ extern UNK_TYPE mcardRead(UNK_TYPE...);
/* 80017DE4 global */ extern UNK_TYPE mcardGameRelease(UNK_TYPE...);
/* 80017E68 global */ extern UNK_TYPE mcardGameErase(UNK_TYPE...);
/* 80018010 global */ extern UNK_TYPE mcardFileErase(UNK_TYPE...);
/* 800181A0 global */ extern UNK_TYPE mcardCardErase(UNK_TYPE...);
/* 800182D8 global */ extern UNK_TYPE mcardGameCreate(UNK_TYPE...);
/* 80018A64 global */ extern UNK_TYPE mcardFileCreate(UNK_TYPE...);
/* 80019218 global */ extern UNK_TYPE mcardGameSet(UNK_TYPE...);
/* 800195C4 global */ extern UNK_TYPE mcardGameSetNoSave(UNK_TYPE...);
/* 800196BC global */ extern UNK_TYPE mcardFileSet(UNK_TYPE...);
/* 80019AE0 global */ extern UNK_TYPE mcardInit(UNK_TYPE...);
/* 80019B38 global */ extern UNK_TYPE mcardReInit(UNK_TYPE...);
/* 80019CB4 global */ extern UNK_TYPE mcardWriteGameDataReset(UNK_TYPE...);
/* 80019D1C global */ extern UNK_TYPE mcardReadGameData(UNK_TYPE...);
/* 8001A0B4 local  */ extern UNK_TYPE mcardWriteTimeAsynch(UNK_TYPE...);
/* 8001A2B8 local  */ // extern UNK_TYPE mcardWriteTimePrepareWriteBuffer(UNK_TYPE...);
/* 8001A74C local  */ extern UNK_TYPE mcardWriteConfigAsynch(UNK_TYPE...);
/* 8001A910 local  */ extern UNK_TYPE mcardReadBufferAsynch(UNK_TYPE...);
/* 8001AAB4 local  */ extern UNK_TYPE mcardWriteBufferAsynch(UNK_TYPE...);
/* 8001AC78 local  */ extern UNK_TYPE mcardWriteFileHeaderInitial(UNK_TYPE...);
/* 8001AE9C local  */ extern UNK_TYPE mcardReadFileHeaderInitial(UNK_TYPE...);
/* 8001AFF4 local  */ extern UNK_TYPE mcardWriteFileHeader(UNK_TYPE...);
/* 8001B3B0 local  */ extern UNK_TYPE mcardReadFileHeader(UNK_TYPE...);
/* 8001B5D4 local  */ extern UNK_TYPE mcardWriteAnywherePartial(UNK_TYPE...);
/* 8001B780 local  */ extern UNK_TYPE mcardWriteAnywhere(UNK_TYPE...);
/* 8001B91C local  */ extern UNK_TYPE mcardReadAnywhere(UNK_TYPE...);
/* 8001BA8C local  */ extern UNK_TYPE mcardReadyCard(UNK_TYPE...);
/* 8001BC20 local  */ extern UNK_TYPE mcardPoll(UNK_TYPE...);
/* 8001BD0C local  */ extern UNK_TYPE mcardVerifyChecksumFileHeader(UNK_TYPE...);
/* 8001BF38 local  */ extern UNK_TYPE mcardCheckChecksumFileHeader(UNK_TYPE...);
/* 8001C24C local  */ extern UNK_TYPE mcardReplaceFileBlock(UNK_TYPE...);
/* 8001C6CC local  */ extern UNK_TYPE mcardSaveChecksumFileHeader(UNK_TYPE...);
/* 8001CA28 local  */ extern UNK_TYPE mcardCalculateChecksumFileBlock2(UNK_TYPE...);
/* 8001CB90 local  */ extern UNK_TYPE mcardCalculateChecksum(UNK_TYPE...);
/* 8001CBF0 local  */ extern UNK_TYPE mcardGCErrorHandler(UNK_TYPE...);
// ======================= codeGCN.c ==================================================
/* 8001CD94 global */ extern UNK_TYPE codeEvent(UNK_TYPE...);
// ======================= soundGCN.c =================================================
/* 8001CDE8 global */ extern UNK_TYPE soundEvent(UNK_TYPE...);
/* 8001CFE0 global */ extern UNK_TYPE soundPlayOcarinaTune(UNK_TYPE...);
/* 8001D024 global */ extern UNK_TYPE soundPlayBeep(UNK_TYPE...);
/* 8001D0A0 global */ extern UNK_TYPE soundLoadBeep(UNK_TYPE...);
/* 8001D1B8 local  */ extern UNK_TYPE soundCallbackBeep(UNK_TYPE...);
/* 8001D214 global */ extern UNK_TYPE soundSetBufferSize(UNK_TYPE...);
/* 8001D390 global */ extern UNK_TYPE soundGetDMABuffer(UNK_TYPE...);
/* 8001D3C4 global */ extern UNK_TYPE soundSetAddress(UNK_TYPE...);
/* 8001D3D0 global */ extern UNK_TYPE soundSetDACRate(UNK_TYPE...);
/* 8001D3F0 global */ extern UNK_TYPE soundSetLength(UNK_TYPE...);
/* 8001D428 local  */ extern UNK_TYPE soundMakeBuffer(UNK_TYPE...);
/* 8001D614 local  */ extern UNK_TYPE soundCallbackDMA(UNK_TYPE...);
/* 8001D63C local  */ extern UNK_TYPE soundPlayBuffer(UNK_TYPE...);
/* 8001D6FC local  */ extern UNK_TYPE soundMakeRamp(UNK_TYPE...);
/* 8001DBC0 global */ extern UNK_TYPE soundWipeBuffers(UNK_TYPE...);
// ======================= frame.c ====================================================
/* 8001DCBC global */ extern UNK_TYPE PSMTX44MultVecNoW(UNK_TYPE...);
/* 8001DD0C global */ extern UNK_TYPE frameGetTextureInfo(UNK_TYPE...);
/* 8001DE28 global */ extern UNK_TYPE frameInvalidateCache(UNK_TYPE...);
/* 8001DF94 global */ extern UNK_TYPE frameSetMatrixHint(UNK_TYPE...);
/* 8001E0B0 global */ extern UNK_TYPE frameFixMatrixHint(UNK_TYPE...);
/* 8001E168 global */ extern UNK_TYPE frameSetBuffer(UNK_TYPE...);
/* 8001E1A0 global */ extern UNK_TYPE frameResetUCode(UNK_TYPE...);
/* 8001E250 global */ extern UNK_TYPE frameSetViewport(UNK_TYPE...);
/* 8001E3E4 global */ extern UNK_TYPE frameSetLookAt(UNK_TYPE...);
/* 8001E494 global */ extern UNK_TYPE frameSetLight(UNK_TYPE...);
/* 8001E5BC global */ extern UNK_TYPE frameSetLightCount(UNK_TYPE...);
/* 8001E5C8 global */ extern UNK_TYPE frameLoadTMEM(UNK_TYPE...);
/* 8001F4C4 global */ extern UNK_TYPE frameLoadTLUT(UNK_TYPE...);
/* 8001F5A4 global */ extern UNK_TYPE frameCullDL(UNK_TYPE...);
/* 8001F6F0 global */ extern UNK_TYPE frameLoadVertex(UNK_TYPE...);
/* 80020174 global */ extern UNK_TYPE frameGetMatrix(UNK_TYPE...);
/* 80020294 global */ extern UNK_TYPE frameSetMatrix(UNK_TYPE...);
/* 80020920 global */ extern UNK_TYPE frameGetMode(UNK_TYPE...);
/* 80020938 global */ extern UNK_TYPE frameSetMode(UNK_TYPE...);
/* 80020ACC global */ extern UNK_TYPE frameSetSize(UNK_TYPE...);
/* 80020BF4 global */ extern UNK_TYPE frameSetFill(UNK_TYPE...);
/* 80020C20 global */ extern UNK_TYPE frameDrawReset(UNK_TYPE...);
/* 80020C64 local  */ extern UNK_TYPE frameLoadTile(UNK_TYPE...);
/* 80021088 local  */ extern UNK_TYPE frameUpdateCache(UNK_TYPE...);
/* 8002127C local  */ extern UNK_TYPE frameSetupCache(UNK_TYPE...);
/* 80021744 local  */ extern UNK_TYPE frameMakeTexture(UNK_TYPE...);
/* 80021860 local  */ extern UNK_TYPE packFreeBlocks(UNK_TYPE...);
/* 800218C8 local  */ extern UNK_TYPE packTakeBlocks(UNK_TYPE...);
/* 80021994 local  */ extern UNK_TYPE frameConvertYUVtoRGB(UNK_TYPE...);
/* 80021A60 global */ extern UNK_TYPE frameScaleMatrix(UNK_TYPE...);
/* 80021B28 local  */ extern UNK_TYPE frameEvent(UNK_TYPE...);
/* 80021E70 global */ extern UNK_TYPE frameGetDepth(UNK_TYPE...);
/* 800220E0 global */ extern UNK_TYPE frameHackCIMG_Zelda2_Camera(UNK_TYPE...);
/* 800221EC global */ extern UNK_TYPE frameHackCIMG_Zelda2_Shrink(UNK_TYPE...);
/* 80022354 global */ extern UNK_TYPE frameHackCIMG_Zelda(UNK_TYPE...);
/* 80022794 global */ extern UNK_TYPE frameHackCIMG_Zelda2(UNK_TYPE...);
/* 80022D00 global */ extern UNK_TYPE frameHackTIMG_Zelda(UNK_TYPE...);
/* 80022EC8 global */ extern UNK_TYPE ZeldaDrawFrameCamera(UNK_TYPE...);
/* 800232C4 global */ extern UNK_TYPE ZeldaEraseCamera(UNK_TYPE...);
/* 80023310 global */ extern UNK_TYPE ZeldaDrawFrameShrink(UNK_TYPE...);
/* 8002381C local  */ extern UNK_TYPE ZeldaGreyScaleConvert(UNK_TYPE...);
/* 80023BAC global */ extern UNK_TYPE WriteZValue(UNK_TYPE...);
/* 800240B8 global */ extern UNK_TYPE frameCopyLensTexture(UNK_TYPE...);
/* 800241EC global */ extern UNK_TYPE CopyZValue(UNK_TYPE...);
/* 80024298 global */ extern UNK_TYPE CopyAndConvertCFB(UNK_TYPE...);
/* 800245DC global */ extern UNK_TYPE CopyCFB(UNK_TYPE...);
/* 8002466C global */ extern UNK_TYPE ZeldaDrawFrame(UNK_TYPE...);
/* 8002494C global */ extern UNK_TYPE ZeldaDrawFrameBlur(UNK_TYPE...);
/* 80024C30 global */ extern UNK_TYPE _frameDrawRectangle(UNK_TYPE...);
/* 80024D58 global */ extern UNK_TYPE frameEnd(UNK_TYPE...);
/* 80024F18 global */ extern UNK_TYPE frameBegin(UNK_TYPE...);
/* 800251A8 global */ extern UNK_TYPE frameBeginOK(UNK_TYPE...);
/* 800251C4 global */ extern UNK_TYPE frameSetColor(UNK_TYPE...);
/* 800252C0 global */ extern UNK_TYPE frameSetDepth(UNK_TYPE...);
/* 800252D0 global */ extern UNK_TYPE frameSetScissor(UNK_TYPE...);
/* 800253F8 global */ extern UNK_TYPE frameShow(UNK_TYPE...);
/* 80025400 local  */ extern UNK_TYPE frameDrawRectTexture_Setup(UNK_TYPE...);
/* 8002576C local  */ extern UNK_TYPE frameDrawRectTexture(UNK_TYPE...);
/* 80025CA0 local  */ extern UNK_TYPE frameDrawRectFill_Setup(UNK_TYPE...);
/* 80025D50 local  */ extern UNK_TYPE frameDrawRectFill(UNK_TYPE...);
/* 80025FE4 local  */ extern UNK_TYPE frameDrawLine_Setup(UNK_TYPE...);
/* 800260C0 local  */ extern UNK_TYPE frameDrawLine_C2T2(UNK_TYPE...);
/* 800262DC local  */ extern UNK_TYPE frameDrawLine_C1T2(UNK_TYPE...);
/* 800264E8 local  */ extern UNK_TYPE frameDrawLine_C0T2(UNK_TYPE...);
/* 800266A0 local  */ extern UNK_TYPE frameDrawLine_C2T0(UNK_TYPE...);
/* 80026878 local  */ extern UNK_TYPE frameDrawLine_C1T0(UNK_TYPE...);
/* 80026A40 local  */ extern UNK_TYPE frameDrawLine_C0T0(UNK_TYPE...);
/* 80026BB4 local  */ extern UNK_TYPE frameDrawTriangle_Setup(UNK_TYPE...);
/* 80026C90 local  */ extern UNK_TYPE frameDrawTriangle_C3T3(UNK_TYPE...);
/* 80026E34 local  */ extern UNK_TYPE frameCheckTriangleDivide(UNK_TYPE...);
/* 80027CF8 local  */ extern UNK_TYPE frameDrawTriangle_C1T3(UNK_TYPE...);
/* 80027EE8 local  */ extern UNK_TYPE frameDrawTriangle_C0T3(UNK_TYPE...);
/* 80028074 local  */ extern UNK_TYPE frameDrawTriangle_C3T0(UNK_TYPE...);
/* 80028230 local  */ extern UNK_TYPE frameDrawTriangle_C1T0(UNK_TYPE...);
/* 800283CC local  */ extern UNK_TYPE frameDrawTriangle_C0T0(UNK_TYPE...);
/* 80028504 local  */ extern UNK_TYPE frameDrawSetupDP(UNK_TYPE...);
/* 80028A18 local  */ extern UNK_TYPE frameGetCombineAlpha(UNK_TYPE...);
/* 80028AA8 local  */ extern UNK_TYPE frameGetCombineColor(UNK_TYPE...);
/* 80028BA4 local  */ extern UNK_TYPE frameDrawSetupSP(UNK_TYPE...);
/* 800295A8 global */ extern UNK_TYPE frameDrawSetup2D(UNK_TYPE...);
/* 800297C0 local  */ extern UNK_TYPE frameLoadTexture(UNK_TYPE...);
/* 80029A9C local  */ extern UNK_TYPE frameMakePixels(UNK_TYPE...);
/* 8002B490 local  */ extern UNK_TYPE frameMakeTLUT(UNK_TYPE...);
/* 8002B5FC local  */ extern UNK_TYPE frameDrawDone(UNK_TYPE...);
/* 8002B678 local  */ extern UNK_TYPE frameDrawSyncCallback(UNK_TYPE...);
/* 8002B690 local  */ extern UNK_TYPE frameDrawSetupFog_Default(UNK_TYPE...);
/* 8002B994 local  */ extern UNK_TYPE frameDrawSetupFog_Zelda1(UNK_TYPE...);
/* 8002BEA0 local  */ // extern UNK_TYPE frameDrawSetupFog_StarFox(UNK_TYPE...);
/* 8002BFD4 local  */ // extern UNK_TYPE frameDrawSetupFog_MarioKart(UNK_TYPE...);
// ======================= system.c ===================================================
/* 8002C108 global */ extern UNK_TYPE systemEvent(UNK_TYPE...);
/* 8002C9DC global */ extern UNK_TYPE systemExceptionPending(UNK_TYPE...);
/* 8002CA14 global */ extern UNK_TYPE systemCheckInterrupts(UNK_TYPE...);
/* 8002CB6C global */ extern UNK_TYPE systemExecute(UNK_TYPE...);
/* 8002CC68 global */ extern UNK_TYPE systemReset(UNK_TYPE...);
/* 8002CE20 global */ extern UNK_TYPE systemGetStorageDevice(UNK_TYPE...);
/* 8002CE30 global */ extern UNK_TYPE systemSetStorageDevice(UNK_TYPE...);
/* 8002CF1C global */ extern UNK_TYPE systemGetMode(UNK_TYPE...);
/* 8002CF84 global */ extern UNK_TYPE systemSetMode(UNK_TYPE...);
/* 8002CFF4 global */ extern UNK_TYPE systemCopyROM(UNK_TYPE...);
/* 8002D0E8 local  */ extern UNK_TYPE __systemCopyROM_Complete(UNK_TYPE...);
/* 8002D220 local  */ extern UNK_TYPE systemPut64(UNK_TYPE...);
/* 8002D228 local  */ extern UNK_TYPE systemPut32(UNK_TYPE...);
/* 8002D230 local  */ extern UNK_TYPE systemPut16(UNK_TYPE...);
/* 8002D238 local  */ extern UNK_TYPE systemPut8(UNK_TYPE...);
/* 8002D240 local  */ extern UNK_TYPE systemGet64(UNK_TYPE...);
/* 8002D254 local  */ extern UNK_TYPE systemGet32(UNK_TYPE...);
/* 8002D264 local  */ extern UNK_TYPE systemGet16(UNK_TYPE...);
/* 8002D274 local  */ extern UNK_TYPE systemGet8(UNK_TYPE...);
/* 8002D284 local  */ extern UNK_TYPE systemGetException(UNK_TYPE...);
/* 8002D460 local  */ extern UNK_TYPE systemSetupGameALL(UNK_TYPE...);
/* 8002FEC4 global */ extern UNK_TYPE systemGetInitialConfiguration(UNK_TYPE...);
/* 80030848 local  */ extern UNK_TYPE systemSetupGameRAM(UNK_TYPE...);
// ======================= cpu.c ======================================================
/* 80030C84 local  */ extern UNK_TYPE cpuOpcodeChecksum(UNK_TYPE...);
/* 80030D98 local  */ extern UNK_TYPE treePrintNode(UNK_TYPE...);
/* 80030F7C local  */ extern UNK_TYPE treeForceCleanNodes(UNK_TYPE...);
/* 80031150 local  */ extern UNK_TYPE treeCleanNodes(UNK_TYPE...);
/* 80031430 local  */ extern UNK_TYPE treeCleanUp(UNK_TYPE...);
/* 80031560 local  */ extern UNK_TYPE treeTimerCheck(UNK_TYPE...);
/* 80031674 local  */ extern UNK_TYPE treeKillReason(UNK_TYPE...);
/* 80031704 local  */ extern UNK_TYPE treeKillRange(UNK_TYPE...);
/* 80031EB4 local  */ extern UNK_TYPE treeSearchNode(UNK_TYPE...);
/* 80031F18 local  */ extern UNK_TYPE treeAdjustRoot(UNK_TYPE...);
/* 80032104 local  */ extern UNK_TYPE treeBalance(UNK_TYPE...);
/* 8003229C local  */ extern UNK_TYPE treeInsertNode(UNK_TYPE...);
/* 80032384 global */ extern UNK_TYPE treeInsert(UNK_TYPE...);
/* 800324A0 local  */ extern UNK_TYPE treeDeleteNode(UNK_TYPE...);
/* 80032800 local  */ extern UNK_TYPE treeKillNodes(UNK_TYPE...);
/* 80032AC4 local  */ extern UNK_TYPE treeKill(UNK_TYPE...);
/* 80032D84 local  */ extern UNK_TYPE treeInitNode(UNK_TYPE...);
/* 80032EA0 local  */ extern UNK_TYPE treeInit(UNK_TYPE...);
/* 80032EF8 local  */ extern UNK_TYPE treeCallerCheck(UNK_TYPE...);
/* 80032FFC local  */ extern UNK_TYPE cpuDMAUpdateFunction(UNK_TYPE...);
/* 8003315C global */ extern UNK_TYPE cpuFindFunction(UNK_TYPE...);
/* 80033CE0 local  */ extern UNK_TYPE cpuTreeTake(UNK_TYPE...);
/* 80033D94 global */ extern UNK_TYPE cpuHeapFree(UNK_TYPE...);
/* 80033E80 global */ extern UNK_TYPE cpuHeapTake(UNK_TYPE...);
/* 800340E0 local  */ extern UNK_TYPE cpuHeapReset(UNK_TYPE...);
/* 8003417C global */ extern UNK_TYPE cpuGetFunctionChecksum(UNK_TYPE...);
/* 800343BC global */ extern UNK_TYPE cpuInvalidateCache(UNK_TYPE...);
/* 80034448 global */ extern UNK_TYPE cpuGetOffsetAddress(UNK_TYPE...);
/* 800345D8 global */ extern UNK_TYPE cpuGetAddressBuffer(UNK_TYPE...);
/* 80034650 global */ extern UNK_TYPE cpuGetAddressOffset(UNK_TYPE...);
/* 800346BC global */ extern UNK_TYPE cpuEvent(UNK_TYPE...);
/* 800348C4 global */ extern UNK_TYPE cpuSetXPC(UNK_TYPE...);
/* 80034940 global */ extern UNK_TYPE cpuReset(UNK_TYPE...);
/* 80034EB4 global */ extern UNK_TYPE cpuSetCodeHack(UNK_TYPE...);
/* 80034F20 global */ extern UNK_TYPE cpuSetDevicePut(UNK_TYPE...);
/* 80034F38 global */ extern UNK_TYPE cpuSetDeviceGet(UNK_TYPE...);
/* 80034F50 global */ extern UNK_TYPE cpuMapObject(UNK_TYPE...);
/* 80035100 global */ extern UNK_TYPE __cpuBreak(UNK_TYPE...);
/* 80035114 global */ extern UNK_TYPE __cpuERET(UNK_TYPE...);
/* 800351B0 global */ extern UNK_TYPE cpuGetRegisterCP0(UNK_TYPE...);
/* 80035458 global */ extern UNK_TYPE cpuSetRegisterCP0(UNK_TYPE...);
/* 80035624 local  */ extern UNK_TYPE cpuSetCP0_Status(UNK_TYPE...);
/* 800356B8 local  */ extern UNK_TYPE cpuGetSize(UNK_TYPE...);
/* 800357FC local  */ extern UNK_TYPE cpuGetMode(UNK_TYPE...);
/* 800358D4 local  */ extern UNK_TYPE cpuSetTLB(UNK_TYPE...);
/* 80035BB8 local  */ extern UNK_TYPE cpuMapAddress(UNK_TYPE...);
/* 80035D80 local  */ extern UNK_TYPE cpuFreeDevice(UNK_TYPE...);
/* 80035E24 local  */ extern UNK_TYPE cpuMakeDevice(UNK_TYPE...);
/* 80035F34 global */ extern UNK_TYPE cpuException(UNK_TYPE...);
/* 800361F4 global */ extern UNK_TYPE cpuTestInterrupt(UNK_TYPE...);
/* 800362D0 local  */ extern UNK_TYPE cpuFindCachedAddress(UNK_TYPE...);
/* 800364AC global */ extern UNK_TYPE cpuFreeCachedAddress(UNK_TYPE...);
/* 80036540 local  */ extern UNK_TYPE cpuHackHandler(UNK_TYPE...);
/* 80036758 global */ extern UNK_TYPE cpuExecute(UNK_TYPE...);
/* 800373C4 local  */ extern UNK_TYPE cpuMakeLink(UNK_TYPE...);
/* 80037684 local  */ extern UNK_TYPE cpuExecuteLoadStoreF(UNK_TYPE...);
/* 800381E0 local  */ extern UNK_TYPE cpuExecuteLoadStore(UNK_TYPE...);
/* 80039040 local  */ extern UNK_TYPE cpuExecuteCall(UNK_TYPE...);
/* 800392A0 local  */ extern UNK_TYPE cpuExecuteJump(UNK_TYPE...);
/* 80039370 local  */ extern UNK_TYPE cpuExecuteIdle(UNK_TYPE...);
/* 8003947C local  */ extern UNK_TYPE cpuExecuteOpcode(UNK_TYPE...);
/* 8003DEF8 local  */ // extern UNK_TYPE cpuPrintOpcode(UNK_TYPE...);
/* 800431AC local  */ extern UNK_TYPE cpuExecuteUpdate(UNK_TYPE...);
/* 8004347C local  */ extern UNK_TYPE cpuRetraceCallback(UNK_TYPE...);
/* 8004348C local  */ extern UNK_TYPE cpuNextInstruction(UNK_TYPE...);
/* 80043750 local  */ extern UNK_TYPE cpuFindAddress(UNK_TYPE...);
/* 80043BEC global */ extern UNK_TYPE cpuMakeFunction(UNK_TYPE...);
/* 8004408C local  */ extern UNK_TYPE cpuGetPPC(UNK_TYPE...);
/* 8006D46C local  */ extern UNK_TYPE cpuCheckDelaySlot(UNK_TYPE...);
/* 8006D59C local  */ extern UNK_TYPE cpuCompile_LWR(UNK_TYPE...);
/* 8006D728 local  */ extern UNK_TYPE cpuCompile_LWL(UNK_TYPE...);
/* 8006D8B8 local  */ extern UNK_TYPE cpuCompile_SDC(UNK_TYPE...);
/* 8006DA40 local  */ extern UNK_TYPE cpuCompile_LDC(UNK_TYPE...);
/* 8006DBC8 local  */ extern UNK_TYPE cpuCompile_SW(UNK_TYPE...);
/* 8006DD24 local  */ extern UNK_TYPE cpuCompile_SH(UNK_TYPE...);
/* 8006DE80 local  */ extern UNK_TYPE cpuCompile_SB(UNK_TYPE...);
/* 8006DFDC local  */ extern UNK_TYPE cpuCompile_LHU(UNK_TYPE...);
/* 8006E134 local  */ extern UNK_TYPE cpuCompile_LBU(UNK_TYPE...);
/* 8006E28C local  */ extern UNK_TYPE cpuCompile_LW(UNK_TYPE...);
/* 8006E3E4 local  */ extern UNK_TYPE cpuCompile_LH(UNK_TYPE...);
/* 8006E550 local  */ extern UNK_TYPE cpuCompile_LB(UNK_TYPE...);
/* 8006E6BC local  */ extern UNK_TYPE cpuCompile_FLOOR_W(UNK_TYPE...);
/* 8006E878 local  */ extern UNK_TYPE cpuCompile_CEIL_W(UNK_TYPE...);
/* 8006EA34 local  */ extern UNK_TYPE cpuCompile_L_CVT_SD(UNK_TYPE...);
/* 8006EFB4 local  */ extern UNK_TYPE cpuCompile_W_CVT_SD(UNK_TYPE...);
/* 8006F164 local  */ extern UNK_TYPE cpuCompile_D_SQRT(UNK_TYPE...);
/* 8006F598 local  */ extern UNK_TYPE cpuCompile_S_SQRT(UNK_TYPE...);
/* 8006F8D8 local  */ extern UNK_TYPE cpuCompile_DDIVU(UNK_TYPE...);
/* 8006FCF4 local  */ extern UNK_TYPE cpuCompile_DDIV(UNK_TYPE...);
/* 800702B0 local  */ extern UNK_TYPE cpuCompile_DMULTU(UNK_TYPE...);
/* 800705C4 local  */ extern UNK_TYPE cpuCompile_DMULT(UNK_TYPE...);
/* 80070AC8 local  */ extern UNK_TYPE cpuCompile_DSRAV(UNK_TYPE...);
/* 80070CCC local  */ extern UNK_TYPE cpuCompile_DSRLV(UNK_TYPE...);
/* 80070EB4 local  */ extern UNK_TYPE cpuCompile_DSLLV(UNK_TYPE...);
// ======================= pif.c ======================================================
/* 8007109C global */ extern UNK_TYPE pifEvent(UNK_TYPE...);
/* 800712C4 global */ extern UNK_TYPE pifGetData(UNK_TYPE...);
/* 80071330 global */ extern UNK_TYPE pifSetData(UNK_TYPE...);
/* 80071390 global */ extern UNK_TYPE pifProcessOutputData(UNK_TYPE...);
/* 8007152C global */ extern UNK_TYPE pifProcessInputData(UNK_TYPE...);
/* 800716BC global */ extern UNK_TYPE pifExecuteCommand(UNK_TYPE...);
/* 80071960 local  */ extern UNK_TYPE pifGet64(UNK_TYPE...);
/* 800719B4 local  */ extern UNK_TYPE pifGet32(UNK_TYPE...);
/* 800719F0 local  */ extern UNK_TYPE pifGet16(UNK_TYPE...);
/* 80071A2C local  */ extern UNK_TYPE pifGet8(UNK_TYPE...);
/* 80071A60 local  */ extern UNK_TYPE pifPut64(UNK_TYPE...);
/* 80071A94 local  */ extern UNK_TYPE pifPut32(UNK_TYPE...);
/* 80071ABC local  */ extern UNK_TYPE pifPut16(UNK_TYPE...);
/* 80071AE4 local  */ extern UNK_TYPE pifPut8(UNK_TYPE...);
/* 80071B08 global */ extern UNK_TYPE pifGetEEPROMSize(UNK_TYPE...);
/* 80071B4C global */ extern UNK_TYPE pifSetEEPROMType(UNK_TYPE...);
/* 80071BB0 global */ extern UNK_TYPE pifGetEControllerType(UNK_TYPE...);
/* 80071BC8 global */ extern UNK_TYPE pifSetControllerType(UNK_TYPE...);
/* 80071CD8 local  */ extern UNK_TYPE pifContDataCrc(UNK_TYPE...);
/* 80071E50 global */ extern UNK_TYPE pifWriteRumble(UNK_TYPE...);
/* 80071EA8 global */ extern UNK_TYPE pifReadRumble(UNK_TYPE...);
// ======================= ram.c ======================================================
/* 80071FCC global */ extern UNK_TYPE ramEvent(UNK_TYPE...);
/* 80072204 global */ extern UNK_TYPE ramGetSize(UNK_TYPE...);
/* 8007221C global */ extern UNK_TYPE ramSetSize(UNK_TYPE...);
/* 8007228C global */ extern UNK_TYPE ramWipe(UNK_TYPE...);
/* 800722D4 global */ extern UNK_TYPE ramGetBuffer(UNK_TYPE...);
/* 8007232C local  */ extern UNK_TYPE ramGet64(UNK_TYPE...);
/* 80072370 local  */ extern UNK_TYPE ramGet32(UNK_TYPE...);
/* 800723A4 local  */ extern UNK_TYPE ramGet16(UNK_TYPE...);
/* 800723D8 local  */ extern UNK_TYPE ramGet8(UNK_TYPE...);
/* 80072408 local  */ extern UNK_TYPE ramPut64(UNK_TYPE...);
/* 8007243C local  */ extern UNK_TYPE ramPut32(UNK_TYPE...);
/* 80072464 local  */ extern UNK_TYPE ramPut16(UNK_TYPE...);
/* 8007248C local  */ extern UNK_TYPE ramPut8(UNK_TYPE...);
/* 800724B0 local  */ extern UNK_TYPE ramGetRI64(UNK_TYPE...);
/* 800724B8 local  */ extern UNK_TYPE ramGetRI32(UNK_TYPE...);
/* 800724EC local  */ extern UNK_TYPE ramGetRI16(UNK_TYPE...);
/* 800724F4 local  */ extern UNK_TYPE ramGetRI8(UNK_TYPE...);
/* 800724FC local  */ extern UNK_TYPE ramPutRI64(UNK_TYPE...);
/* 80072504 local  */ extern UNK_TYPE ramPutRI32(UNK_TYPE...);
/* 80072538 local  */ extern UNK_TYPE ramPutRI16(UNK_TYPE...);
/* 80072540 local  */ extern UNK_TYPE ramPutRI8(UNK_TYPE...);
/* 80072548 local  */ extern UNK_TYPE ramGetControl64(UNK_TYPE...);
/* 80072550 local  */ extern UNK_TYPE ramGetControl32(UNK_TYPE...);
/* 80072584 local  */ extern UNK_TYPE ramGetControl16(UNK_TYPE...);
/* 8007258C local  */ extern UNK_TYPE ramGetControl8(UNK_TYPE...);
/* 80072594 local  */ extern UNK_TYPE ramPutControl64(UNK_TYPE...);
/* 8007259C local  */ extern UNK_TYPE ramPutControl32(UNK_TYPE...);
/* 800725D0 local  */ extern UNK_TYPE ramPutControl16(UNK_TYPE...);
/* 800725D8 local  */ extern UNK_TYPE ramPutControl8(UNK_TYPE...);
// ======================= rom.c ======================================================
/* 800725E0 global */ extern UNK_TYPE romEvent(UNK_TYPE...);
/* 80072810 global */ extern UNK_TYPE romGetImage(UNK_TYPE...);
/* 80072858 global */ extern UNK_TYPE romSetImage(UNK_TYPE...);
/* 80072BC8 global */ extern UNK_TYPE romSetCacheSize(UNK_TYPE...);
/* 80072C64 global */ extern UNK_TYPE romUpdate(UNK_TYPE...);
/* 80072DC4 global */ extern UNK_TYPE romCopyImmediate(UNK_TYPE...);
/* 8007306C global */ extern UNK_TYPE romCopy(UNK_TYPE...);
/* 80073304 local  */ extern UNK_TYPE romGetDebug64(UNK_TYPE...);
/* 80073318 local  */ extern UNK_TYPE romGetDebug32(UNK_TYPE...);
/* 80073328 local  */ extern UNK_TYPE romGetDebug16(UNK_TYPE...);
/* 80073338 local  */ extern UNK_TYPE romGetDebug8(UNK_TYPE...);
/* 80073348 local  */ extern UNK_TYPE romPutDebug64(UNK_TYPE...);
/* 80073350 local  */ extern UNK_TYPE romPutDebug32(UNK_TYPE...);
/* 80073358 local  */ extern UNK_TYPE romPutDebug16(UNK_TYPE...);
/* 80073360 local  */ extern UNK_TYPE romPutDebug8(UNK_TYPE...);
/* 80073368 local  */ extern UNK_TYPE romGet64(UNK_TYPE...);
/* 800733E4 local  */ extern UNK_TYPE romGet32(UNK_TYPE...);
/* 80073454 local  */ extern UNK_TYPE romGet16(UNK_TYPE...);
/* 800734C4 local  */ extern UNK_TYPE romGet8(UNK_TYPE...);
/* 80073534 local  */ extern UNK_TYPE romPut64(UNK_TYPE...);
/* 8007353C local  */ extern UNK_TYPE romPut32(UNK_TYPE...);
/* 80073544 local  */ extern UNK_TYPE romPut16(UNK_TYPE...);
/* 8007354C local  */ extern UNK_TYPE romPut8(UNK_TYPE...);
/* 80073554 global */ extern UNK_TYPE romTestCode(UNK_TYPE...);
/* 800736C8 global */ extern UNK_TYPE romGetCode(UNK_TYPE...);
/* 800736FC global */ extern UNK_TYPE romGetPC(UNK_TYPE...);
/* 800738F8 local  */ extern UNK_TYPE romLoadFullOrPart(UNK_TYPE...);
/* 80074694 local  */ // extern UNK_TYPE romCacheAllBlocks(UNK_TYPE...);
/* 8007478C local  */ extern UNK_TYPE romCopyUpdate(UNK_TYPE...);
/* 80074A10 local  */ extern UNK_TYPE __romCopyUpdate_Complete(UNK_TYPE...);
/* 80074A2C local  */ extern UNK_TYPE romLoadUpdate(UNK_TYPE...);
/* 80074B8C local  */ extern UNK_TYPE __romLoadUpdate_Complete(UNK_TYPE...);
/* 80074BA8 local  */ extern UNK_TYPE romCacheGame(UNK_TYPE...);
/* 80076498 local  */ // extern UNK_TYPE romCacheGame_OTHER(UNK_TYPE...);
/* 800767C0 local  */ // extern UNK_TYPE romCacheEnding_ZELDA(UNK_TYPE...);
/* 80076F70 local  */ extern UNK_TYPE romCacheGame_ZELDA(UNK_TYPE...);
/* 80077208 global */ extern UNK_TYPE romReloadRange(UNK_TYPE...);
/* 8007919C local  */ // extern UNK_TYPE romLoadRangeBlock(UNK_TYPE...);
/* 800792B8 local  */ extern UNK_TYPE romLoadRange(UNK_TYPE...);
/* 800793EC local  */ extern UNK_TYPE romLoadBlock(UNK_TYPE...);
/* 800794E8 local  */ extern UNK_TYPE __romLoadBlock_CompleteGCN(UNK_TYPE...);
/* 80079504 local  */ extern UNK_TYPE __romLoadBlock_Complete(UNK_TYPE...);
/* 800795F8 local  */ extern UNK_TYPE romSetBlockCache(UNK_TYPE...);
/* 80079850 local  */ extern UNK_TYPE romMakeFreeCache(UNK_TYPE...);
/* 80079A64 local  */ extern UNK_TYPE romFindOldestBlock(UNK_TYPE...);
/* 80079C14 local  */ extern UNK_TYPE romFindFreeCache(UNK_TYPE...);
/* 80079CD8 local  */ // extern UNK_TYPE romGetTagToken(UNK_TYPE...);
// ======================= rdp.c ======================================================
/* 8007A388 global */ extern UNK_TYPE rdpEvent(UNK_TYPE...);
/* 8007A52C local  */ extern UNK_TYPE rdpGetSpan64(UNK_TYPE...);
/* 8007A534 local  */ extern UNK_TYPE rdpGetSpan32(UNK_TYPE...);
/* 8007A5A4 local  */ extern UNK_TYPE rdpGetSpan16(UNK_TYPE...);
/* 8007A5AC local  */ extern UNK_TYPE rdpGetSpan8(UNK_TYPE...);
/* 8007A5B4 local  */ extern UNK_TYPE rdpPutSpan64(UNK_TYPE...);
/* 8007A5BC local  */ extern UNK_TYPE rdpPutSpan32(UNK_TYPE...);
/* 8007A620 local  */ extern UNK_TYPE rdpPutSpan16(UNK_TYPE...);
/* 8007A628 local  */ extern UNK_TYPE rdpPutSpan8(UNK_TYPE...);
/* 8007A630 local  */ extern UNK_TYPE rdpGet64(UNK_TYPE...);
/* 8007A638 local  */ extern UNK_TYPE rdpGet32(UNK_TYPE...);
/* 8007A6DC local  */ extern UNK_TYPE rdpGet16(UNK_TYPE...);
/* 8007A6E4 local  */ extern UNK_TYPE rdpGet8(UNK_TYPE...);
/* 8007A6EC local  */ extern UNK_TYPE rdpPut64(UNK_TYPE...);
/* 8007A6F4 local  */ extern UNK_TYPE rdpPut32(UNK_TYPE...);
/* 8007A7F8 local  */ extern UNK_TYPE rdpPut16(UNK_TYPE...);
/* 8007A800 local  */ extern UNK_TYPE rdpPut8(UNK_TYPE...);
/* 8007A808 global */ extern UNK_TYPE rdpParseGBI(UNK_TYPE...);
// ======================= rdb.c ======================================================
/* 8007B9A4 global */ extern UNK_TYPE rdbEvent(UNK_TYPE...);
/* 8007BAAC local  */ extern UNK_TYPE rdbGet64(UNK_TYPE...);
/* 8007BAB4 local  */ extern UNK_TYPE rdbGet32(UNK_TYPE...);
/* 8007BAE8 local  */ extern UNK_TYPE rdbGet16(UNK_TYPE...);
/* 8007BAF0 local  */ extern UNK_TYPE rdbGet8(UNK_TYPE...);
/* 8007BAF8 local  */ extern UNK_TYPE rdbPut64(UNK_TYPE...);
/* 8007BB00 local  */ extern UNK_TYPE rdbPut32(UNK_TYPE...);
/* 8007BF7C local  */ extern UNK_TYPE rdbPut16(UNK_TYPE...);
/* 8007BF84 local  */ extern UNK_TYPE rdbPut8(UNK_TYPE...);
// ======================= rsp.c ======================================================
/* 8007BF8C global */ extern UNK_TYPE rspEvent(UNK_TYPE...);
/* 8007C160 global */ extern UNK_TYPE rspUpdate(UNK_TYPE...);
/* 8007C340 global */ extern UNK_TYPE rspFrameComplete(UNK_TYPE...);
/* 8007C394 global */ extern UNK_TYPE rspEnableABI(UNK_TYPE...);
/* 8007C3B4 global */ extern UNK_TYPE rspInvalidateCache(UNK_TYPE...);
/* 8007C48C global */ extern UNK_TYPE rspGet64(UNK_TYPE...);
/* 8007C4F8 global */ extern UNK_TYPE rspGet32(UNK_TYPE...);
/* 8007C644 global */ extern UNK_TYPE rspGet16(UNK_TYPE...);
/* 8007C698 global */ extern UNK_TYPE rspGet8(UNK_TYPE...);
/* 8007C6EC global */ extern UNK_TYPE rspPut64(UNK_TYPE...);
/* 8007C758 global */ extern UNK_TYPE rspPut32(UNK_TYPE...);
/* 8007CD88 global */ extern UNK_TYPE rspPut16(UNK_TYPE...);
/* 8007CDDC global */ extern UNK_TYPE rspPut8(UNK_TYPE...);
/* 8007CE30 local  */ extern UNK_TYPE rspParseGBI(UNK_TYPE...);
/* 8007CFE4 local  */ extern UNK_TYPE rspParseGBI_Setup(UNK_TYPE...);
/* 8007D140 local  */ extern UNK_TYPE rspLoadYield(UNK_TYPE...);
/* 8007D2C8 local  */ extern UNK_TYPE rspSaveYield(UNK_TYPE...);
/* 8007D440 local  */ extern UNK_TYPE rspFindUCode(UNK_TYPE...);
/* 8007E5A0 local  */ extern UNK_TYPE rspLoadMatrix(UNK_TYPE...);
/* 8007E828 local  */ extern UNK_TYPE rspParseGBI_F3DEX2(UNK_TYPE...);
/* 800803CC local  */ extern UNK_TYPE rspGeometryMode(UNK_TYPE...);
/* 800804B4 local  */ extern UNK_TYPE rspParseGBI_F3DEX1(UNK_TYPE...);
/* 80081B38 local  */ extern UNK_TYPE rspSetGeometryMode1(UNK_TYPE...);
/* 80081BF8 local  */ extern UNK_TYPE rspSetupS2DEX(UNK_TYPE...);
/* 80081D58 local  */ extern UNK_TYPE rspObjMatrix(UNK_TYPE...);
/* 80081EC0 global */ extern UNK_TYPE rspBgRectCopy(UNK_TYPE...);
/* 80082060 local  */ extern UNK_TYPE rspObjRectangleR(UNK_TYPE...);
/* 80082B14 local  */ extern UNK_TYPE rspObjSprite(UNK_TYPE...);
/* 800835DC local  */ extern UNK_TYPE rspObjRectangle(UNK_TYPE...);
/* 80083B78 local  */ extern UNK_TYPE rspObjLoadTxtr(UNK_TYPE...);
/* 80083FC4 global */ extern UNK_TYPE rspFillObjTxtr(UNK_TYPE...);
/* 80084124 local  */ extern UNK_TYPE guS2DEmuBgRect1Cyc(UNK_TYPE...);
/* 80084860 local  */ extern UNK_TYPE tmemLoad(UNK_TYPE...);
/* 80084AD0 local  */ extern UNK_TYPE tmemLoad_A(UNK_TYPE...);
/* 80084B7C local  */ extern UNK_TYPE tmemLoad_B(UNK_TYPE...);
/* 80084C90 global */ extern UNK_TYPE rspFillObjBg(UNK_TYPE...);
/* 80084D88 global */ extern UNK_TYPE rspFillObjBgScale(UNK_TYPE...);
/* 80084E68 local  */ extern UNK_TYPE rspFillObjSprite(UNK_TYPE...);
/* 80084F30 local  */ extern UNK_TYPE Matrix4by4Identity(UNK_TYPE...);
/* 80084F80 local  */ extern UNK_TYPE rspParseJPEG_DecodeZ(UNK_TYPE...);
/* 8008507C local  */ extern UNK_TYPE rspParseJPEG_EncodeZ(UNK_TYPE...);
/* 80085178 global */ extern UNK_TYPE rspRecon420Z(UNK_TYPE...);
/* 80085558 global */ extern UNK_TYPE rspUndoRecon420Z(UNK_TYPE...);
/* 80085960 global */ extern UNK_TYPE rspUndoLoadColorBufferZ(UNK_TYPE...);
/* 800859F4 global */ extern UNK_TYPE rspUndoDCTZ(UNK_TYPE...);
/* 80085CC4 global */ extern UNK_TYPE rspUndoZigzagDataZ(UNK_TYPE...);
/* 800860EC global */ extern UNK_TYPE rspUndoQuantizeZ(UNK_TYPE...);
/* 800866B8 global */ extern UNK_TYPE rspZigzagDataZ(UNK_TYPE...);
/* 80086BE0 local  */ extern UNK_TYPE rspQuantizeZ(UNK_TYPE...);
/* 8008720C local  */ extern UNK_TYPE rspDCTZ(UNK_TYPE...);
/* 800874DC local  */ extern UNK_TYPE rspCreateJPEGArraysZ(UNK_TYPE...);
/* 800877D4 local  */ extern UNK_TYPE rspParseJPEG_Decode(UNK_TYPE...);
/* 80088020 local  */ extern UNK_TYPE rspParseJPEG_Encode(UNK_TYPE...);
/* 80088A58 global */ extern UNK_TYPE rspFormatYUV(UNK_TYPE...);
/* 80088C08 global */ extern UNK_TYPE rspUndoYUVtoDCTBuf(UNK_TYPE...);
/* 80089390 global */ extern UNK_TYPE rspUndoDCT(UNK_TYPE...);
/* 8008967C global */ extern UNK_TYPE rspUndoQuantize(UNK_TYPE...);
/* 80089800 local  */ extern UNK_TYPE rspQuantize(UNK_TYPE...);
/* 8008997C local  */ extern UNK_TYPE rspDCT(UNK_TYPE...);
/* 80089C4C local  */ extern UNK_TYPE rspYUVtoDCTBuf(UNK_TYPE...);
/* 8008A33C local  */ extern UNK_TYPE rspConvertRGBAtoYUV(UNK_TYPE...);
/* 8008A4D4 local  */ extern UNK_TYPE rspCreateJPEGArrays(UNK_TYPE...);
/* 8008ADB8 local  */ extern UNK_TYPE rspParseABI4(UNK_TYPE...);
/* 8008B478 local  */ // extern UNK_TYPE rspAInterleave4(UNK_TYPE...);
/* 8008B778 local  */ extern UNK_TYPE rspInitAudioDMEM4(UNK_TYPE...);
/* 8008CBDC local  */ extern UNK_TYPE rspParseABI3(UNK_TYPE...);
/* 8008D14C local  */ extern UNK_TYPE rspAMix3(UNK_TYPE...);
/* 8008D1E4 local  */ extern UNK_TYPE rspAEnvMixer3(UNK_TYPE...);
/* 8008D418 local  */ extern UNK_TYPE rspInitAudioDMEM3(UNK_TYPE...);
/* 8008E854 local  */ extern UNK_TYPE rspParseABI2(UNK_TYPE...);
/* 8008EF3C local  */ extern UNK_TYPE rspAPCM8Dec2(UNK_TYPE...);
/* 8008F7D0 local  */ extern UNK_TYPE rspAEnvMixer2(UNK_TYPE...);
/* 8008FAA8 local  */ extern UNK_TYPE rspADistFilter2(UNK_TYPE...);
/* 8008FBA4 local  */ extern UNK_TYPE rspAInterleave2(UNK_TYPE...);
/* 8008FDF0 local  */ extern UNK_TYPE rspAMix2(UNK_TYPE...);
/* 8008FE78 local  */ extern UNK_TYPE rspAFirFilter2(UNK_TYPE...);
/* 80090C28 local  */ extern UNK_TYPE rspAResample2(UNK_TYPE...);
/* 80090E58 local  */ extern UNK_TYPE rspANMix2(UNK_TYPE...);
/* 80090EC4 local  */ extern UNK_TYPE rspANoise2(UNK_TYPE...);
/* 80091190 local  */ extern UNK_TYPE rspAADPCMDec2Fast(UNK_TYPE...);
/* 80091AC8 local  */ extern UNK_TYPE rspInitAudioDMEM2(UNK_TYPE...);
/* 80092D90 local  */ extern UNK_TYPE rspParseABI1(UNK_TYPE...);
/* 800930F0 local  */ extern UNK_TYPE rspParseABI(UNK_TYPE...);
/* 8009331C local  */ extern UNK_TYPE rspASetVolume1(UNK_TYPE...);
/* 800933B4 local  */ extern UNK_TYPE rspASetBuffer1(UNK_TYPE...);
/* 800934BC local  */ extern UNK_TYPE rspAResample1(UNK_TYPE...);
/* 800937B4 local  */ extern UNK_TYPE rspAMix1(UNK_TYPE...);
/* 8009384C local  */ extern UNK_TYPE rspAEnvMixer1(UNK_TYPE...);
/* 80094424 local  */ extern UNK_TYPE rspAPoleFilter1(UNK_TYPE...);
/* 80094D88 local  */ extern UNK_TYPE rspAADPCMDec1Fast(UNK_TYPE...);
/* 80095628 local  */ extern UNK_TYPE rspLoadADPCMCoefTable2(UNK_TYPE...);
/* 800957A4 local  */ extern UNK_TYPE rspLoadADPCMCoefTable1(UNK_TYPE...);
/* 80095920 global */ extern UNK_TYPE rspMultPolef(UNK_TYPE...);
/* 80095D10 global */ extern UNK_TYPE rspDotProduct8x15MatrixBy15x1Vector(UNK_TYPE...);
/* 80096184 local  */ extern UNK_TYPE rspInitAudioDMEM1(UNK_TYPE...);
/* 800974B4 local  */ extern UNK_TYPE rspVMADN(UNK_TYPE...);
/* 80097658 local  */ extern UNK_TYPE rspVMUDN(UNK_TYPE...);
// ======================= mips.c =====================================================
/* 800977F0 global */ extern UNK_TYPE mipsEvent(UNK_TYPE...);
/* 80097900 global */ extern UNK_TYPE mipsGet64(UNK_TYPE...);
/* 80097908 global */ extern UNK_TYPE mipsGet32(UNK_TYPE...);
/* 80097970 global */ extern UNK_TYPE mipsGet16(UNK_TYPE...);
/* 80097978 global */ extern UNK_TYPE mipsGet8(UNK_TYPE...);
/* 80097980 global */ extern UNK_TYPE mipsPut64(UNK_TYPE...);
/* 80097988 global */ extern UNK_TYPE mipsPut32(UNK_TYPE...);
/* 80097B90 global */ extern UNK_TYPE mipsPut16(UNK_TYPE...);
/* 80097B98 global */ extern UNK_TYPE mipsPut8(UNK_TYPE...);
/* 80097BA0 global */ extern UNK_TYPE mipsResetInterrupt(UNK_TYPE...);
/* 80097C44 global */ extern UNK_TYPE mipsSetInterrupt(UNK_TYPE...);
// ======================= disk.c =====================================================
/* 80097D30 global */ extern UNK_TYPE diskEvent(UNK_TYPE...);
/* 80097ECC local  */ extern UNK_TYPE diskGetDrive64(UNK_TYPE...);
/* 80097ED4 local  */ extern UNK_TYPE diskGetDrive32(UNK_TYPE...);
/* 80097F0C local  */ extern UNK_TYPE diskGetDrive16(UNK_TYPE...);
/* 80097F14 local  */ extern UNK_TYPE diskGetDrive8(UNK_TYPE...);
/* 80097F1C local  */ extern UNK_TYPE diskPutDrive64(UNK_TYPE...);
/* 80097F24 local  */ extern UNK_TYPE diskPutDrive32(UNK_TYPE...);
/* 80097F50 local  */ extern UNK_TYPE diskPutDrive16(UNK_TYPE...);
/* 80097F58 local  */ extern UNK_TYPE diskPutDrive8(UNK_TYPE...);
/* 80097F60 local  */ extern UNK_TYPE diskGetROM64(UNK_TYPE...);
/* 80097F74 local  */ extern UNK_TYPE diskGetROM32(UNK_TYPE...);
/* 80097F84 local  */ extern UNK_TYPE diskGetROM16(UNK_TYPE...);
/* 80097F94 local  */ extern UNK_TYPE diskGetROM8(UNK_TYPE...);
/* 80097FA4 local  */ extern UNK_TYPE diskPutROM64(UNK_TYPE...);
/* 80097FAC local  */ extern UNK_TYPE diskPutROM32(UNK_TYPE...);
/* 80097FB4 local  */ extern UNK_TYPE diskPutROM16(UNK_TYPE...);
/* 80097FBC local  */ extern UNK_TYPE diskPutROM8(UNK_TYPE...);
// ======================= flash.c ====================================================
/* 80097FC4 global */ extern UNK_TYPE flashEvent(UNK_TYPE...);
/* 800980E4 local  */ extern UNK_TYPE flashGet64(UNK_TYPE...);
/* 800980EC local  */ extern UNK_TYPE flashGet32(UNK_TYPE...);
/* 80098190 local  */ extern UNK_TYPE flashGet16(UNK_TYPE...);
/* 80098198 local  */ extern UNK_TYPE flashGet8(UNK_TYPE...);
/* 800981A0 local  */ extern UNK_TYPE flashPut64(UNK_TYPE...);
/* 800981A8 local  */ extern UNK_TYPE flashPut32(UNK_TYPE...);
/* 80098478 local  */ extern UNK_TYPE flashPut16(UNK_TYPE...);
/* 80098480 local  */ extern UNK_TYPE flashPut8(UNK_TYPE...);
/* 80098488 global */ extern UNK_TYPE flashTransferFLASH(UNK_TYPE...);
/* 8009859C global */ extern UNK_TYPE flashCopyFLASH(UNK_TYPE...);
// ======================= sram.c =====================================================
/* 800986E0 global */ extern UNK_TYPE sramEvent(UNK_TYPE...);
/* 800987E0 local  */ extern UNK_TYPE sramGet64(UNK_TYPE...);
/* 80098810 local  */ extern UNK_TYPE sramGet32(UNK_TYPE...);
/* 80098840 local  */ extern UNK_TYPE sramGet16(UNK_TYPE...);
/* 80098870 local  */ extern UNK_TYPE sramGet8(UNK_TYPE...);
/* 800988A0 local  */ extern UNK_TYPE sramPut64(UNK_TYPE...);
/* 800988D0 local  */ extern UNK_TYPE sramPut32(UNK_TYPE...);
/* 80098900 local  */ extern UNK_TYPE sramPut16(UNK_TYPE...);
/* 80098930 local  */ extern UNK_TYPE sramPut8(UNK_TYPE...);
/* 80098960 global */ extern UNK_TYPE sramTransferSRAM(UNK_TYPE...);
/* 800989D8 global */ extern UNK_TYPE sramCopySRAM(UNK_TYPE...);
// ======================= audio.c ====================================================
/* 80098A50 global */ extern UNK_TYPE audioEvent(UNK_TYPE...);
/* 80098B70 global */ extern UNK_TYPE audioEnable(UNK_TYPE...);
/* 80098BC8 global */ extern UNK_TYPE audioGet64(UNK_TYPE...);
/* 80098BD0 global */ extern UNK_TYPE audioGet32(UNK_TYPE...);
/* 80098CD8 global */ extern UNK_TYPE audioGet16(UNK_TYPE...);
/* 80098CE0 global */ extern UNK_TYPE audioGet8(UNK_TYPE...);
/* 80098CE8 global */ extern UNK_TYPE audioPut64(UNK_TYPE...);
/* 80098CF0 global */ extern UNK_TYPE audioPut32(UNK_TYPE...);
/* 80098E38 global */ extern UNK_TYPE audioPut16(UNK_TYPE...);
/* 80098E40 global */ extern UNK_TYPE audioPut8(UNK_TYPE...);
// ======================= video.c ====================================================
/* 80098E48 global */ extern UNK_TYPE videoEvent(UNK_TYPE...);
/* 80098F9C global */ extern UNK_TYPE videoForceRetrace(UNK_TYPE...);
/* 80099008 global */ extern UNK_TYPE videoGet64(UNK_TYPE...);
/* 80099010 global */ extern UNK_TYPE videoGet32(UNK_TYPE...);
/* 8009912C global */ extern UNK_TYPE videoGet16(UNK_TYPE...);
/* 80099134 global */ extern UNK_TYPE videoGet8(UNK_TYPE...);
/* 8009913C global */ extern UNK_TYPE videoPut64(UNK_TYPE...);
/* 80099144 global */ extern UNK_TYPE videoPut32(UNK_TYPE...);
/* 800993D0 global */ extern UNK_TYPE videoPut16(UNK_TYPE...);
/* 800993D8 global */ extern UNK_TYPE videoPut8(UNK_TYPE...);
// ======================= serial.c ===================================================
/* 800993E0 global */ extern UNK_TYPE serialEvent(UNK_TYPE...);
/* 800994E0 global */ extern UNK_TYPE serialGet64(UNK_TYPE...);
/* 800994E8 global */ extern UNK_TYPE serialGet32(UNK_TYPE...);
/* 8009954C global */ extern UNK_TYPE serialGet16(UNK_TYPE...);
/* 80099554 global */ extern UNK_TYPE serialGet8(UNK_TYPE...);
/* 8009955C global */ extern UNK_TYPE serialPut64(UNK_TYPE...);
/* 80099564 global */ extern UNK_TYPE serialPut32(UNK_TYPE...);
/* 800996A4 global */ extern UNK_TYPE serialPut16(UNK_TYPE...);
/* 800996AC global */ extern UNK_TYPE serialPut8(UNK_TYPE...);
// ======================= library.c ==================================================
/* 800996B4 global */ extern UNK_TYPE libraryEvent(UNK_TYPE...);
/* 800997F4 global */ extern UNK_TYPE libraryCall(UNK_TYPE...);
/* 800998EC global */ extern UNK_TYPE libraryFunctionReplaced(UNK_TYPE...);
/* 800999E0 local  */ extern UNK_TYPE librarySearch(UNK_TYPE...);
/* 80099B44 global */ extern UNK_TYPE libraryTestFunction(UNK_TYPE...);
/* 8009A188 local  */ extern UNK_TYPE libraryFindFunctions(UNK_TYPE...);
/* 8009A698 local  */ extern UNK_TYPE libraryFindVariables(UNK_TYPE...);
/* 8009ADCC local  */ extern UNK_TYPE libraryFindException(UNK_TYPE...);
/* 8009B0CC global */ extern UNK_TYPE zeldaLoadSZS_Exit(UNK_TYPE...);
/* 8009B0E0 global */ extern UNK_TYPE zeldaLoadSZS_Entry(UNK_TYPE...);
/* 8009B0F4 global */ extern UNK_TYPE osViSwapBuffer_Entry(UNK_TYPE...);
/* 8009B15C global */ extern UNK_TYPE dmaSoundRomHandler_ZELDA2(UNK_TYPE...);
/* 8009B17C global */ extern UNK_TYPE dmaSoundRomHandler_ZELDA1(UNK_TYPE...);
/* 8009B2A4 global */ extern UNK_TYPE pictureSnap_Zelda2(UNK_TYPE...);
/* 8009B2B4 global */ extern UNK_TYPE starfoxCopy(UNK_TYPE...);
/* 8009B41C global */ extern UNK_TYPE osGetCount(UNK_TYPE...);
/* 8009B474 global */ extern UNK_TYPE osEepromLongWrite(UNK_TYPE...);
/* 8009B520 global */ extern UNK_TYPE osEepromLongRead(UNK_TYPE...);
/* 8009B5CC global */ extern UNK_TYPE osEepromWrite(UNK_TYPE...);
/* 8009B644 global */ extern UNK_TYPE osEepromRead(UNK_TYPE...);
/* 8009B6BC global */ extern UNK_TYPE __osEepStatus(UNK_TYPE...);
/* 8009B794 global */ extern UNK_TYPE osAiSetNextBuffer(UNK_TYPE...);
/* 8009B8A0 global */ extern UNK_TYPE osAiSetFrequency(UNK_TYPE...);
/* 8009B9CC global */ extern UNK_TYPE guLookAtReflect(UNK_TYPE...);
/* 8009BFA0 global */ extern UNK_TYPE guLookAtReflectF(UNK_TYPE...);
/* 8009C4F4 global */ extern UNK_TYPE guLookAtHilite(UNK_TYPE...);
/* 8009CEC8 global */ extern UNK_TYPE guLookAtHiliteF(UNK_TYPE...);
/* 8009D81C global */ extern UNK_TYPE guLookAt(UNK_TYPE...);
/* 8009DC34 global */ extern UNK_TYPE guLookAtF(UNK_TYPE...);
/* 8009DFC0 global */ extern UNK_TYPE guRotate(UNK_TYPE...);
/* 8009E30C global */ extern UNK_TYPE guRotateF(UNK_TYPE...);
/* 8009E61C global */ extern UNK_TYPE guTranslate(UNK_TYPE...);
/* 8009E808 global */ extern UNK_TYPE guTranslateF(UNK_TYPE...);
/* 8009E928 global */ extern UNK_TYPE guScale(UNK_TYPE...);
/* 8009EB14 global */ extern UNK_TYPE guScaleF(UNK_TYPE...);
/* 8009EC3C global */ extern UNK_TYPE GenPerspective_1080(UNK_TYPE...);
/* 8009ECEC global */ extern UNK_TYPE guPerspective(UNK_TYPE...);
/* 8009EFB0 global */ extern UNK_TYPE guPerspectiveF(UNK_TYPE...);
/* 8009F20C global */ extern UNK_TYPE guOrtho(UNK_TYPE...);
/* 8009F4E8 global */ extern UNK_TYPE guOrthoF(UNK_TYPE...);
/* 8009F758 global */ extern UNK_TYPE guMtxIdent(UNK_TYPE...);
/* 8009F80C global */ extern UNK_TYPE guMtxIdentF(UNK_TYPE...);
/* 8009F8E0 global */ extern UNK_TYPE guMtxF2L(UNK_TYPE...);
/* 8009FAE8 global */ extern UNK_TYPE guMtxCatF(UNK_TYPE...);
/* 8009FE00 global */ extern UNK_TYPE osVirtualToPhysical(UNK_TYPE...);
/* 8009FE74 global */ extern UNK_TYPE osPhysicalToVirtual(UNK_TYPE...);
/* 8009FE84 global */ extern UNK_TYPE _memcpy(UNK_TYPE...);
/* 8009FEE0 global */ extern UNK_TYPE _bcopy(UNK_TYPE...);
/* 8009FF3C global */ extern UNK_TYPE _bzero(UNK_TYPE...);
/* 8009FF80 local  */ extern UNK_TYPE __sinf(UNK_TYPE...);
/* 8009FFB4 local  */ extern UNK_TYPE __cosf(UNK_TYPE...);
/* 8009FFE8 local  */ extern UNK_TYPE __osSpSetStatus(UNK_TYPE...);
/* 800A0038 local  */ extern UNK_TYPE __osRestoreInt(UNK_TYPE...);
/* 800A00C4 local  */ extern UNK_TYPE __osDisableInt(UNK_TYPE...);
/* 800A0154 local  */ extern UNK_TYPE osInvalICache(UNK_TYPE...);
/* 800A01DC local  */ extern UNK_TYPE osGetMemSize(UNK_TYPE...);
/* 800A0230 local  */ extern UNK_TYPE __osDispatchThread(UNK_TYPE...);
/* 800A07D4 local  */ extern UNK_TYPE __osPopThread(UNK_TYPE...);
/* 800A08A8 local  */ extern UNK_TYPE __osEnqueueThread(UNK_TYPE...);
/* 800A0AD0 local  */ extern UNK_TYPE __osEnqueueAndYield(UNK_TYPE...);
/* 800A0DBC local  */ extern UNK_TYPE send_mesg(UNK_TYPE...);
/* 800A114C local  */ extern UNK_TYPE __osException(UNK_TYPE...);
// ======================= peripheral.c ===============================================
/* 800A1E30 global */ extern UNK_TYPE peripheralEvent(UNK_TYPE...);
/* 800A1F38 global */ extern UNK_TYPE peripheralGet64(UNK_TYPE...);
/* 800A1F40 global */ extern UNK_TYPE peripheralGet32(UNK_TYPE...);
/* 800A2040 global */ extern UNK_TYPE peripheralGet16(UNK_TYPE...);
/* 800A2048 global */ extern UNK_TYPE peripheralGet8(UNK_TYPE...);
/* 800A2050 global */ extern UNK_TYPE peripheralPut64(UNK_TYPE...);
/* 800A2058 global */ extern UNK_TYPE peripheralPut32(UNK_TYPE...);
/* 800A23DC global */ extern UNK_TYPE peripheralPut16(UNK_TYPE...);
/* 800A23E4 global */ extern UNK_TYPE peripheralPut8(UNK_TYPE...);
/* 800A23EC local  */ extern UNK_TYPE peripheralDMA_Complete(UNK_TYPE...);
// ======================= _frameGCNcc.c ==============================================
/* 800A2430 global */ extern UNK_TYPE SetTevStageTable(UNK_TYPE...);
/* 800A24F0 global */ extern UNK_TYPE SetTevStages(UNK_TYPE...);
/* 800A2874 global */ extern UNK_TYPE SetNumTexGensChans(UNK_TYPE...);
/* 800A2A34 local  */ extern UNK_TYPE SetTableTevStages(UNK_TYPE...);
// ======================= _buildtev.c ================================================
/* 800A2D38 global */ extern UNK_TYPE BuildCombineModeTev(UNK_TYPE...);
/* 800A317C global */ extern UNK_TYPE BuildCycle(UNK_TYPE...);
/* 800A3268 global */ extern UNK_TYPE SetupStage(UNK_TYPE...);
/* 800A5D58 local  */ extern UNK_TYPE AddAlphaTevOrder(UNK_TYPE...);
/* 800A5E78 global */ extern UNK_TYPE SetAlpha(UNK_TYPE...);
/* 800A5FB0 global */ extern UNK_TYPE SetColor(UNK_TYPE...);
// ======================= snddvdtrk.c ================================================
/* 800A6148 global */ extern UNK_TYPE PauseDVDTrack(UNK_TYPE...);
/* 800A6200 global */ extern UNK_TYPE UpdateDVDTrackList(UNK_TYPE...);
/* 800A674C local  */ // extern UNK_TYPE ErrorCallBack(UNK_TYPE...);
/* 800A6784 global */ extern UNK_TYPE PlayDVDTrack(UNK_TYPE...);
/* 800A6884 global */ extern UNK_TYPE AddDVDTrack(UNK_TYPE...);
/* 800A6918 global */ extern UNK_TYPE InitDVDTrackList(UNK_TYPE...);
/* 800A6A0C local  */ // extern UNK_TYPE DVDTrackFadeOutUpdate(UNK_TYPE...);
/* 800A6BB0 local  */ // extern UNK_TYPE DVDTrackCancelStreamCallback(UNK_TYPE...);
/* 800A6C04 local  */ // extern UNK_TYPE DVDTrackPrepareStreamCallback(UNK_TYPE...);
/* 800A6DE8 local  */ // extern UNK_TYPE DVDTrackStopCallback(UNK_TYPE...);
/* 800A6DEC local  */ // extern UNK_TYPE CheckErrorStatus(UNK_TYPE...);
/* 800A6E28 local  */ // extern UNK_TYPE CheckForStopDVDTrack(UNK_TYPE...);
// ======================= sndspecial.c ===============================================
/* 800A6EC4 global */ extern UNK_TYPE UpdateSpecial(UNK_TYPE...);
/* 800A6FB0 local  */ // extern UNK_TYPE DrawSpecialScreen(UNK_TYPE...);
/* 800A7318 local  */ // extern UNK_TYPE DrawStuff(UNK_TYPE...);
// ======================= PPCArch.c ==================================================
/* 800A7530 global */ extern UNK_TYPE PPCMfmsr(UNK_TYPE...);
/* 800A7538 global */ extern UNK_TYPE PPCMtmsr(UNK_TYPE...);
/* 800A7540 global */ extern UNK_TYPE PPCMfhid0(UNK_TYPE...);
/* 800A7548 global */ extern UNK_TYPE PPCMthid0(UNK_TYPE...);
/* 800A7550 global */ extern UNK_TYPE PPCMfl2cr(UNK_TYPE...);
/* 800A7558 global */ extern UNK_TYPE PPCMtl2cr(UNK_TYPE...);
/* 800A7560 weak   */ extern UNK_TYPE PPCMtdec(UNK_TYPE...);
/* 800A7568 global */ extern UNK_TYPE PPCSync(UNK_TYPE...);
/* 800A7570 weak   */ extern UNK_TYPE PPCHalt(UNK_TYPE...);
/* 800A7584 global */ extern UNK_TYPE PPCMtmmcr0(UNK_TYPE...);
/* 800A758C global */ extern UNK_TYPE PPCMtmmcr1(UNK_TYPE...);
/* 800A7594 global */ extern UNK_TYPE PPCMtpmc1(UNK_TYPE...);
/* 800A759C global */ extern UNK_TYPE PPCMtpmc2(UNK_TYPE...);
/* 800A75A4 global */ extern UNK_TYPE PPCMtpmc3(UNK_TYPE...);
/* 800A75AC global */ extern UNK_TYPE PPCMtpmc4(UNK_TYPE...);
/* 800A75B4 global */ extern UNK_TYPE PPCMffpscr(UNK_TYPE...);
/* 800A75D4 global */ extern UNK_TYPE PPCMtfpscr(UNK_TYPE...);
/* 800A75FC global */ extern UNK_TYPE PPCMfhid2(UNK_TYPE...);
/* 800A7604 global */ extern UNK_TYPE PPCMthid2(UNK_TYPE...);
/* 800A760C global */ extern UNK_TYPE PPCMtwpar(UNK_TYPE...);
/* 800A7614 global */ extern UNK_TYPE PPCDisableSpeculation(UNK_TYPE...);
/* 800A763C global */ extern UNK_TYPE PPCSetFpNonIEEEMode(UNK_TYPE...);
// ======================= OS.c =======================================================
/* 800A7644 global */ extern UNK_TYPE __OSFPRInit(UNK_TYPE...);
/* 800A776C global */ extern u32 OSGetConsoleType(void);
/* 800A7794 local  */ extern UNK_TYPE ClearArena(UNK_TYPE...);
/* 800A78BC local  */ extern UNK_TYPE InquiryCallback(UNK_TYPE...);
/* 800A78F8 global */ extern void OSInit(void);
/* 800A7CD0 local  */ extern UNK_TYPE OSExceptionInit(UNK_TYPE...);
/* 800A7F50 local  */ extern UNK_TYPE __OSDBIntegrator(UNK_TYPE...);
/* 800A7F74 local  */ extern UNK_TYPE __OSDBJump(UNK_TYPE...);
/* 800A7F78 global */ extern __OSExceptionHandler __OSSetExceptionHandler(__OSException exception, __OSExceptionHandler handler);
/* 800A7F94 global */ extern __OSExceptionHandler __OSGetExceptionHandler(__OSException exception);
/* 800A7FA8 local  */ extern UNK_TYPE OSExceptionVector(UNK_TYPE...);
/* 800A8044 global */ extern UNK_TYPE OSDefaultExceptionHandler(UNK_TYPE...);
/* 800A809C global */ extern UNK_TYPE __OSPSInit(UNK_TYPE...);
/* 800A80F0 global */ extern UNK_TYPE __OSGetDIConfig(UNK_TYPE...);
/* 800A8104 global */ extern void OSRegisterVersion(const char* id);
// ======================= OSAlarm.c ==================================================
/* 800A8130 global */ extern UNK_TYPE OSInitAlarm(UNK_TYPE...);
/* 800A8188 global */ extern void OSCreateAlarm(OSAlarm* alarm);
/* 800A8198 local  */ extern UNK_TYPE InsertAlarm(UNK_TYPE...);
/* 800A83E8 global */ extern void OSSetAlarm(OSAlarm* alarm, OSTime tick, OSAlarmHandler handler);
/* 800A8450 global */ extern void OSCancelAlarm(OSAlarm* alarm);
/* 800A856C local  */ extern UNK_TYPE DecrementerExceptionCallback(UNK_TYPE...);
/* 800A879C local  */ extern UNK_TYPE DecrementerExceptionHandler(UNK_TYPE...);
/* 800A87EC local  */ extern UNK_TYPE OnReset(UNK_TYPE...);
// ======================= OSAlloc.c ==================================================
/* 800A888C local  */ extern UNK_TYPE DLInsert(UNK_TYPE...);
/* 800A8938 global */ extern void* OSAllocFromHeap(OSHeapHandle heap, u32 size);
/* 800A8A34 global */ extern void OSFreeToHeap(OSHeapHandle heap, void* ptr);
/* 800A8AB0 global */ extern OSHeapHandle OSSetCurrentHeap(OSHeapHandle heap);
/* 800A8AC0 global */ extern void* OSInitAlloc(void* arenaStart, void* arenaEnd, int maxHeaps);
/* 800A8B30 global */ extern OSHeapHandle OSCreateHeap(void* start, void* end);
/* 800A8B9C global */ extern s32 OSCheckHeap(OSHeapHandle heap);
// ======================= OSArena.c ==================================================
/* 800A8EFC global */ extern void* OSGetArenaHi(void);
/* 800A8F04 global */ extern void* OSGetArenaLo(void);
/* 800A8F0C global */ extern void OSSetArenaHi(void* newHi);
/* 800A8F14 global */ extern void OSSetArenaLo(void* newLo);
// ======================= OSAudioSystem.c ============================================
/* 800A8F1C global */ extern UNK_TYPE __OSInitAudioSystem(UNK_TYPE...);
/* 800A90D8 global */ extern UNK_TYPE __OSStopAudioSystem(UNK_TYPE...);
// ======================= OSCache.c ==================================================
/* 800A91B0 global */ extern void DCEnable(void);
/* 800A91C4 global */ extern void DCInvalidateRange(void* addr, u32 nBytes);
/* 800A91F0 global */ extern void DCFlushRange(void* addr, u32 nBytes);
/* 800A9220 global */ extern void DCStoreRange(void* addr, u32 nBytes);
/* 800A9250 global */ extern void DCFlushRangeNoSync(void* addr, u32 nBytes);
/* 800A927C global */ extern void DCZeroRange(void* addr, u32 nBytes);
/* 800A92A8 global */ extern void ICInvalidateRange(void* addr, u32 nBytes);
/* 800A92DC global */ extern void ICFlashInvalidate(void);
/* 800A92EC global */ extern void ICEnable(void);
/* 800A9300 local  */ extern UNK_TYPE __LCEnable(UNK_TYPE...);
/* 800A93CC global */ extern void LCEnable(void);
/* 800A9404 global */ extern void LCDisable(void);
/* 800A942C global */ extern void LCStoreBlocks(void* destAddr, void* srcTag, u32 numBlocks);
/* 800A9450 global */ extern u32 LCStoreData(void* destAddr, void* srcAddr, u32 nBytes);
/* 800A94FC global */ extern void LCQueueWait(u32 len);
/* 800A9510 global */ extern void L2GlobalInvalidate(void);
/* 800A95A8 global */ extern UNK_TYPE DMAErrorHandler(UNK_TYPE...);
/* 800A9708 global */ extern UNK_TYPE __OSCacheInit(UNK_TYPE...);
// ======================= OSContext.c ================================================
/* 800A97FC local  */ extern UNK_TYPE __OSLoadFPUContext(UNK_TYPE...);
/* 800A9920 local  */ extern UNK_TYPE __OSSaveFPUContext(UNK_TYPE...);
/* 800A9A48 global */ extern void OSSaveFPUContext(OSContext* context);
/* 800A9A50 global */ extern void OSSetCurrentContext(OSContext* context);
/* 800A9AAC global */ extern OSContext* OSGetCurrentContext(void);
/* 800A9AB8 global */ extern u32 OSSaveContext(OSContext* context);
/* 800A9B38 global */ extern void OSLoadContext(OSContext* context);
/* 800A9C10 global */ extern u32 OSGetStackPointer(void);
/* 800A9C18 global */ extern void OSClearContext(OSContext* context);
/* 800A9C3C global */ extern void OSInitContext(OSContext* context, u32 pc, u32 sp);
/* 800A9CF8 global */ extern void OSDumpContext(OSContext* context);
/* 800A9FA0 local  */ extern UNK_TYPE OSSwitchFPUContext(UNK_TYPE...);
/* 800AA024 global */ extern UNK_TYPE __OSContextInit(UNK_TYPE...);
/* 800AA06C weak   */ extern UNK_TYPE OSReport(UNK_TYPE...);
// ======================= OSError.c ==================================================
/* 800AA0EC weak   */ extern UNK_TYPE OSPanic(UNK_TYPE...);
/* 800AA218 global */ extern OSErrorHandler OSSetErrorHandler(OSError error, OSErrorHandler handler);
/* 800AA430 global */ extern UNK_TYPE __OSUnhandledException(UNK_TYPE...);
// ======================= OSFont.c ===================================================
/* 800AA718 global */ extern u16 OSGetFontEncode(void);
// ======================= OSInterrupt.c ==============================================
/* 800AA770 global */ extern BOOL OSDisableInterrupts(void);
/* 800AA784 global */ extern BOOL OSEnableInterrupts(void);
/* 800AA798 global */ extern BOOL OSRestoreInterrupts(BOOL level);
/* 800AA7BC global */ extern __OSInterruptHandler __OSSetInterruptHandler(__OSInterrupt interrupt, __OSInterruptHandler handler);
/* 800AA7D8 global */ extern __OSInterruptHandler __OSGetInterruptHandler(__OSInterrupt interrupt);
/* 800AA7EC global */ extern UNK_TYPE __OSInterruptInit(UNK_TYPE...);
/* 800AA860 local  */ // extern UNK_TYPE SetInterruptMask(UNK_TYPE...);
/* 800AAB38 global */ extern OSInterruptMask __OSMaskInterrupts(OSInterruptMask mask);
/* 800AABC0 global */ extern OSInterruptMask __OSUnmaskInterrupts(OSInterruptMask mask);
/* 800AAC48 global */ extern void __OSDispatchInterrupt(__OSException exception, OSContext* context);
/* 800AAF8C local  */ extern UNK_TYPE ExternalInterruptHandler(UNK_TYPE...);
// ======================= OSLink.c ===================================================
/* 800AAFDC global */ extern UNK_TYPE __OSModuleInit(UNK_TYPE...);
// ======================= OSMessage.c ================================================
/* 800AAFF4 global */ extern void OSInitMessageQueue(OSMessageQueue* mq, OSMessage* msgArray, s32 msgCount);
/* 800AB054 global */ extern BOOL OSSendMessage(OSMessageQueue* mq, OSMessage msg, s32 flags);
/* 800AB11C global */ extern BOOL OSReceiveMessage(OSMessageQueue* mq, OSMessage* msg, s32 flags);
// ======================= OSMemory.c =================================================
/* 800AB1F8 local  */ extern UNK_TYPE OnReset(UNK_TYPE...);
/* 800AB234 local  */ extern UNK_TYPE MEMIntrruptHandler(UNK_TYPE...);
/* 800AB2A0 local  */ extern UNK_TYPE Config24MB(UNK_TYPE...);
/* 800AB320 local  */ extern UNK_TYPE Config48MB(UNK_TYPE...);
/* 800AB3A0 local  */ extern UNK_TYPE RealMode(UNK_TYPE...);
/* 800AB3B8 global */ extern UNK_TYPE __OSInitMemoryProtection(UNK_TYPE...);
// ======================= OSMutex.c ==================================================
/* 800AB4D0 global */ extern UNK_TYPE __OSUnlockAllMutex(UNK_TYPE...);
// ======================= OSReboot.c =================================================
/* 800AB540 local  */ extern UNK_TYPE Run(UNK_TYPE...);
/* 800AB550 local  */ extern UNK_TYPE Callback(UNK_TYPE...);
/* 800AB55C global */ extern UNK_TYPE __OSReboot(UNK_TYPE...);
// ======================= OSReset.c ==================================================
/* 800AB89C global */ extern void OSRegisterResetFunction(OSResetFunctionInfo* info);
/* 800AB920 local  */ extern UNK_TYPE Reset(UNK_TYPE...);
/* 800AB990 global */ extern UNK_TYPE __OSDoHotReset(UNK_TYPE...);
/* 800AB9D8 global */ extern void OSResetSystem(int reset, u32 resetCode, BOOL forceMenu);
/* 800ABC90 global */ extern u32 OSGetResetCode(void);
// ======================= OSResetSW.c ================================================
/* 800ABCC0 global */ extern UNK_TYPE __OSResetSWInterruptHandler(UNK_TYPE...);
/* 800ABDB4 global */ extern BOOL OSGetResetButtonState(void);
// ======================= OSRtc.c ====================================================
/* 800AC04C local  */ extern UNK_TYPE WriteSramCallback(UNK_TYPE...);
/* 800AC0AC local  */ extern UNK_TYPE WriteSram(UNK_TYPE...);
/* 800AC1C4 global */ extern UNK_TYPE __OSInitSram(UNK_TYPE...);
/* 800AC300 global */ extern UNK_TYPE __OSLockSram(UNK_TYPE...);
/* 800AC35C global */ extern UNK_TYPE __OSLockSramEx(UNK_TYPE...);
/* 800AC3B8 local  */ extern UNK_TYPE UnlockSram(UNK_TYPE...);
/* 800AC6F4 global */ extern UNK_TYPE __OSUnlockSram(UNK_TYPE...);
/* 800AC718 global */ extern UNK_TYPE __OSUnlockSramEx(UNK_TYPE...);
/* 800AC73C global */ extern UNK_TYPE __OSSyncSram(UNK_TYPE...);
/* 800AC74C global */ extern UNK_TYPE OSGetSoundMode(UNK_TYPE...);
/* 800AC7CC global */ extern UNK_TYPE OSSetSoundMode(UNK_TYPE...);
/* 800AC870 global */ extern UNK_TYPE OSGetWirelessID(UNK_TYPE...);
/* 800AC8F4 global */ extern UNK_TYPE OSSetWirelessID(UNK_TYPE...);
/* 800AC9A0 global */ extern UNK_TYPE OSGetGbsMode(UNK_TYPE...);
/* 800ACA10 global */ extern UNK_TYPE OSSetGbsMode(UNK_TYPE...);
// ======================= OSSync.c ===================================================
/* 800ACAC8 local  */ extern UNK_TYPE SystemCallVector(UNK_TYPE...);
/* 800ACAE8 global */ extern UNK_TYPE __OSInitSystemCall(UNK_TYPE...);
// ======================= OSThread.c =================================================
/* 800ACB4C local  */ extern UNK_TYPE DefaultSwitchThreadCallback(UNK_TYPE...);
/* 800ACB50 global */ extern UNK_TYPE __OSThreadInit(UNK_TYPE...);
/* 800ACCA8 global */ extern void OSInitThreadQueue(OSThreadQueue* queue);
/* 800ACCB8 global */ extern OSThread* OSGetCurrentThread(void);
/* 800ACCC4 global */ extern s32 OSDisableScheduler(void);
/* 800ACD04 global */ extern s32 OSEnableScheduler(void);
/* 800ACD44 local  */ extern UNK_TYPE UnsetRun(UNK_TYPE...);
/* 800ACDAC global */ extern UNK_TYPE __OSGetEffectivePriority(UNK_TYPE...);
/* 800ACDE8 local  */ extern UNK_TYPE SetEffectivePriority(UNK_TYPE...);
/* 800ACFA8 local  */ extern UNK_TYPE SelectThread(UNK_TYPE...);
/* 800AD1D0 global */ extern UNK_TYPE __OSReschedule(UNK_TYPE...);
/* 800AD200 global */ extern UNK_TYPE OSCreateThread(UNK_TYPE...);
/* 800AD3E8 global */ extern void OSExitThread(void* val);
/* 800AD4CC global */ extern void OSCancelThread(OSThread* thread);
/* 800AD688 global */ extern s32 OSResumeThread(OSThread* thread);
/* 800AD910 global */ extern s32 OSSuspendThread(OSThread* thread);
/* 800ADA80 global */ extern void OSSleepThread(OSThreadQueue* queue);
/* 800ADB6C global */ extern void OSWakeupThread(OSThreadQueue* queue);
/* 800ADC70 global */ extern void OSClearStack(u8 val);
// ======================= OSTime.c ===================================================
/* 800ADD1C global */ extern OSTime OSGetTime(void);
/* 800ADD34 global */ extern OSTick OSGetTick(void);
/* 800ADD3C global */ extern UNK_TYPE __OSGetSystemTime(UNK_TYPE...);
/* 800ADDA0 local  */ extern UNK_TYPE GetDates(UNK_TYPE...);
/* 800ADF3C global */ extern void OSTicksToCalendarTime(OSTime ticks, OSCalendarTime* td);
// ======================= __start.c ==================================================
/* 80003100 local  */ extern UNK_TYPE __check_pad3(UNK_TYPE...);
/* 80003140 local  */ extern UNK_TYPE __set_debug_bba(UNK_TYPE...);
/* 8000314C local  */ extern UNK_TYPE __get_debug_bba(UNK_TYPE...);
/* 80003154 weak   */ extern UNK_TYPE __start(UNK_TYPE...);
/* 800032B0 local  */ extern UNK_TYPE __init_registers(UNK_TYPE...);
/* 80003340 local  */ extern UNK_TYPE __init_data(UNK_TYPE...);
// ======================= __ppc_eabi_init.cpp ========================================
/* 80003400 global */ extern UNK_TYPE __init_hardware(UNK_TYPE...);
/* 80003424 global */ extern UNK_TYPE __flush_cache(UNK_TYPE...);
/* 800AE140 weak   */ extern UNK_TYPE InitMetroTRK_BBA(UNK_TYPE...);
/* 800AE144 global */ extern UNK_TYPE __init_user(UNK_TYPE...);
/* 800AE164 local  */ extern UNK_TYPE __init_cpp(UNK_TYPE...);
/* 800AE1B8 global */ extern UNK_TYPE _ExitProcess(UNK_TYPE...);
// ======================= EXIBios.c ==================================================
/* 800AE1D8 local  */ extern UNK_TYPE SetExiInterruptMask(UNK_TYPE...);
/* 800AE2CC global */ extern UNK_TYPE EXIImm(UNK_TYPE...);
/* 800AE528 global */ extern UNK_TYPE EXIImmEx(UNK_TYPE...);
/* 800AE5C8 global */ extern UNK_TYPE EXIDma(UNK_TYPE...);
/* 800AE6B4 global */ extern UNK_TYPE EXISync(UNK_TYPE...);
/* 800AE900 global */ extern UNK_TYPE EXIClearInterrupts(UNK_TYPE...);
/* 800AE948 global */ extern UNK_TYPE EXISetExiCallback(UNK_TYPE...);
/* 800AE9C4 local  */ extern UNK_TYPE __EXIProbe(UNK_TYPE...);
/* 800AEB38 global */ extern BOOL EXIProbe(s32 chan);
/* 800AEBB8 global */ extern s32 EXIProbeEx(s32 chan);
/* 800AEC6C global */ extern UNK_TYPE EXIAttach(UNK_TYPE...);
/* 800AED78 global */ extern UNK_TYPE EXIDetach(UNK_TYPE...);
/* 800AEE34 global */ extern UNK_TYPE EXISelect(UNK_TYPE...);
/* 800AEF60 global */ extern UNK_TYPE EXIDeselect(UNK_TYPE...);
/* 800AF070 local  */ extern UNK_TYPE EXIIntrruptHandler(UNK_TYPE...);
/* 800AF138 local  */ extern UNK_TYPE TCIntrruptHandler(UNK_TYPE...);
/* 800AF350 local  */ extern UNK_TYPE EXTIntrruptHandler(UNK_TYPE...);
/* 800AF420 global */ extern UNK_TYPE EXIInit(UNK_TYPE...);
/* 800AF5F4 global */ extern UNK_TYPE EXILock(UNK_TYPE...);
/* 800AF6E8 global */ extern UNK_TYPE EXIUnlock(UNK_TYPE...);
/* 800AF7C4 global */ extern UNK_TYPE EXIGetState(UNK_TYPE...);
/* 800AF7DC local  */ extern UNK_TYPE UnlockedHandler(UNK_TYPE...);
/* 800AF804 global */ extern UNK_TYPE EXIGetID(UNK_TYPE...);
// ======================= EXIUart.c ==================================================
/* 800AFBB4 local  */ extern UNK_TYPE ProbeBarnacle(UNK_TYPE...);
/* 800AFD40 global */ extern UNK_TYPE __OSEnableBarnacle(UNK_TYPE...);
/* 800AFEFC global */ extern UNK_TYPE InitializeUART(UNK_TYPE...);
/* 800AFF6C global */ extern UNK_TYPE ReadUARTN(UNK_TYPE...);
/* 800AFF74 global */ extern UNK_TYPE WriteUARTN(UNK_TYPE...);
// ======================= SIBios.c ===================================================
/* 800B0190 global */ extern UNK_TYPE SIBusy(UNK_TYPE...);
/* 800B01B0 global */ extern UNK_TYPE SIIsChanBusy(UNK_TYPE...);
/* 800B01EC local  */ extern UNK_TYPE CompleteTransfer(UNK_TYPE...);
/* 800B04E8 local  */ extern UNK_TYPE SIInterruptHandler(UNK_TYPE...);
/* 800B082C local  */ extern UNK_TYPE SIEnablePollingInterrupt(UNK_TYPE...);
/* 800B08C4 global */ extern UNK_TYPE SIRegisterPollingHandler(UNK_TYPE...);
/* 800B0990 global */ extern UNK_TYPE SIUnregisterPollingHandler(UNK_TYPE...);
/* 800B0A84 global */ extern UNK_TYPE SIInit(UNK_TYPE...);
/* 800B0B38 local  */ extern UNK_TYPE __SITransfer(UNK_TYPE...);
/* 800B0D44 global */ extern UNK_TYPE SIGetStatus(UNK_TYPE...);
/* 800B0DC0 global */ extern UNK_TYPE SISetCommand(UNK_TYPE...);
/* 800B0DD4 global */ extern UNK_TYPE SITransferCommands(UNK_TYPE...);
/* 800B0DE4 global */ extern UNK_TYPE SISetXY(UNK_TYPE...);
/* 800B0E50 global */ extern UNK_TYPE SIEnablePolling(UNK_TYPE...);
/* 800B0EEC global */ extern UNK_TYPE SIDisablePolling(UNK_TYPE...);
/* 800B0F58 local  */ extern UNK_TYPE SIGetResponseRaw(UNK_TYPE...);
/* 800B102C global */ extern UNK_TYPE SIGetResponse(UNK_TYPE...);
/* 800B10F0 local  */ extern UNK_TYPE AlarmHandler(UNK_TYPE...);
/* 800B117C global */ extern UNK_TYPE SITransfer(UNK_TYPE...);
/* 800B12E8 local  */ extern UNK_TYPE GetTypeCallback(UNK_TYPE...);
/* 800B1580 global */ extern UNK_TYPE SIGetType(UNK_TYPE...);
/* 800B1744 global */ extern UNK_TYPE SIGetTypeAsync(UNK_TYPE...);
// ======================= SISamplingRate.c ===========================================
/* 800B1880 global */ extern void SISetSamplingRate(u32 msec);
/* 800B1964 global */ extern void SIRefreshSamplingRate(void);
// ======================= vi.c =======================================================
/* 800B1988 local  */ extern UNK_TYPE __VIRetraceHandler(UNK_TYPE...);
/* 800B1BFC global */ extern VIRetraceCallback VISetPostRetraceCallback(VIRetraceCallback callback);
/* 800B1C40 local  */ extern UNK_TYPE getTiming(UNK_TYPE...);
/* 800B1CE0 global */ extern UNK_TYPE __VIInit(UNK_TYPE...);
/* 800B1EE0 global */ extern void VIInit(void);
/* 800B2390 global */ extern void VIWaitForRetrace(void);
/* 800B23E4 local  */ extern UNK_TYPE setFbbRegs(UNK_TYPE...);
/* 800B26B8 local  */ extern UNK_TYPE setVerticalRegs(UNK_TYPE...);
/* 800B2858 global */ extern void VIConfigure(const GXRenderModeObj* rm);
/* 800B3080 global */ extern void VIFlush(void);
/* 800B31B0 global */ extern void VISetNextFrameBuffer(void* fb);
/* 800B321C global */ extern void VISetBlack(BOOL black);
/* 800B3298 local  */ extern UNK_TYPE GetCurrentDisplayPosition(UNK_TYPE...);
/* 800B32D4 local  */ extern UNK_TYPE getCurrentFieldEvenOdd(UNK_TYPE...);
/* 800B333C global */ extern u32 VIGetNextField(void);
/* 800B33D8 global */ extern u32 VIGetCurrentLine(void);
/* 800B3470 global */ extern u32 VIGetTvFormat(void);
/* 800B34D8 global */ extern UNK_TYPE __VIDisplayPositionToXY(UNK_TYPE...);
/* 800B36F4 global */ extern UNK_TYPE __VIGetCurrentPosition(UNK_TYPE...);
// ======================= db.c =======================================================
/* 800B3754 global */ extern UNK_TYPE DBInit(UNK_TYPE...);
/* 800B377C global */ extern UNK_TYPE __DBExceptionDestinationAux(UNK_TYPE...);
/* 800B37C4 global */ extern void __DBExceptionDestination(void);
/* 800B37D4 global */ extern BOOL __DBIsExceptionMarked(__OSException exception);
/* 800B37F0 global */ extern void DBPrintf(char* str, ...);
// ======================= mtx.c ======================================================
/* 800B3840 global */ extern void PSMTXIdentity(Mtx m);
/* 800B386C global */ extern UNK_TYPE PSMTXConcat(UNK_TYPE...);
/* 800B3938 global */ extern void PSMTXTrans(Mtx m, f32 xT, f32 yT, f32 zT);
/* 800B396C global */ extern void PSMTXTransApply(const Mtx src, Mtx dst, f32 xT, f32 yT, f32 zT);
/* 800B39B8 global */ extern void PSMTXScale(Mtx m, f32 xS, f32 yS, f32 zS);
/* 800B39E0 global */ extern void PSMTXScaleApply(const Mtx src, Mtx dst, f32 xS, f32 yS, f32 zS);
// ======================= mtxvec.c ===================================================
/* 800B3A38 global */ extern void PSMTXMultVec(const Mtx m, const Vec* src, Vec* dst);
// ======================= mtx44.c ====================================================
/* 800B3A8C global */ extern void C_MTXPerspective(Mtx44 m, f32 fovY, f32 aspect, f32 n, f32 f);
/* 800B3B5C global */ extern void C_MTXOrtho(Mtx44 m, f32 t, f32 b, f32 l, f32 r, f32 n, f32 f);
/* 800B3BF4 global */ extern void PSMTX44Concat(const Mtx44 a, const Mtx44 b, Mtx44 ab);
// ======================= GXInit.c ===================================================
/* 800B3CF8 local  */ extern UNK_TYPE __GXDefaultTexRegionCallback(UNK_TYPE...);
/* 800B3DF4 local  */ extern UNK_TYPE __GXDefaultTlutRegionCallback(UNK_TYPE...);
/* 800B3E18 local  */ extern UNK_TYPE __GXShutdown(UNK_TYPE...);
/* 800B3FA8 global */ extern GXFifoObj* GXInit(void* base, u32 size);
/* 800B4740 global */ extern UNK_TYPE __GXInitGX(UNK_TYPE...);
// ======================= GXFifo.c ===================================================
/* 800B5078 local  */ extern UNK_TYPE GXCPInterruptHandler(UNK_TYPE...);
/* 800B51AC global */ extern void GXInitFifoBase(GXFifoObj* fifo, void* base, u32 size);
/* 800B5218 global */ extern void GXInitFifoPtrs(GXFifoObj* fifo, void* readPtr, void* writePtr);
/* 800B5288 global */ extern void GXInitFifoLimits(GXFifoObj* fifo, u32 hiWaterMark, u32 loWaterMark);
/* 800B5294 global */ extern void GXSetCPUFifo(const GXFifoObj* fifo);
/* 800B53BC global */ extern void GXSetGPFifo(const GXFifoObj* fifo);
/* 800B5534 global */ extern void GXGetGPStatus(GXBool* overhi, GXBool* underlow, GXBool* readIdle, GXBool* cmdIdle, GXBool* brkpt);
/* 800B5584 global */ extern void* GXGetFifoBase(const GXFifoObj* fifo);
/* 800B558C global */ extern u32 GXGetFifoSize(const GXFifoObj* fifo);
/* 800B5594 global */ extern GXBreakPtCallback GXSetBreakPtCallback(GXBreakPtCallback cb);
/* 800B55D8 global */ extern UNK_TYPE __GXFifoInit(UNK_TYPE...);
/* 800B5624 local  */ extern UNK_TYPE __GXFifoReadEnable(UNK_TYPE...);
/* 800B5648 local  */ extern UNK_TYPE __GXFifoReadDisable(UNK_TYPE...);
/* 800B566C local  */ extern UNK_TYPE __GXFifoLink(UNK_TYPE...);
/* 800B56A0 local  */ extern UNK_TYPE __GXWriteFifoIntEnable(UNK_TYPE...);
/* 800B56D0 local  */ extern UNK_TYPE __GXWriteFifoIntReset(UNK_TYPE...);
/* 800B5700 global */ extern UNK_TYPE __GXCleanGPFifo(UNK_TYPE...);
/* 800B5800 global */ extern GXBool GXGetCPUFifo(GXFifoObj* fifo);
/* 800B5808 global */ extern GXBool GXGetGPFifo(GXFifoObj* fifo);
// ======================= GXAttr.c ===================================================
/* 800B5810 global */ extern void GXSetVtxDesc(GXAttr attr, GXAttrType type);
/* 800B5A7C global */ extern UNK_TYPE __GXSetVCD(UNK_TYPE...);
/* 800B5B38 global */ extern UNK_TYPE __GXCalculateVLim(UNK_TYPE...);
/* 800B5C5C global */ extern void GXClearVtxDesc(void);
/* 800B5C94 global */ extern void GXSetVtxAttrFmt(GXVtxFmt vtxfmt, GXAttr attr, GXCompCnt cnt, GXCompType type, u8 frac);
/* 800B5EF0 global */ extern void GXSetVtxAttrFmtv(GXVtxFmt vtxfmt, const GXVtxAttrFmtList *list);
/* 800B6170 global */ extern UNK_TYPE __GXSetVAT(UNK_TYPE...);
/* 800B620C global */ extern void GXSetArray(GXAttr attr, const void* base_ptr, u8 stride);
/* 800B6298 global */ extern void GXInvalidateVtxCache(void);
/* 800B62A8 global */ extern void GXSetTexCoordGen2(GXTexCoordID dst_coord, GXTexGenType func, GXTexGenSrc src_param, u32 mtx, GXBool normalize, u32 postmtx);
/* 800B6528 global */ extern void GXSetNumTexGens(u8 nTexGens);
// ======================= GXMisc.c ===================================================
/* 800B6564 global */ extern void GXSetMisc(GXMiscToken token, u32 val);
/* 800B65F8 global */ extern void GXFlush(void);
/* 800B6654 global */ extern UNK_TYPE __GXAbort(UNK_TYPE...);
/* 800B67C0 global */ extern void GXAbortFrame(void);
/* 800B6930 global */ extern void GXSetDrawSync(u16 token);
/* 800B69E4 global */ extern u16 GXReadDrawSync(void);
/* 800B69F0 global */ extern void GXSetDrawDone(void);
/* 800B6A88 global */ extern void GXDrawDone(void);
/* 800B6B08 global */ extern void GXPixModeSync(void);
/* 800B6B2C global */ extern void GXPokeAlphaMode(GXCompare func, u8 threshold);
/* 800B6B40 global */ extern void GXPokeAlphaRead(GXAlphaReadMode mode);
/* 800B6B60 global */ extern void GXPokeAlphaUpdate(GXBool update_enable);
/* 800B6B78 global */ extern void GXPokeBlendMode(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
/* 800B6BDC global */ extern void GXPokeColorUpdate(GXBool update_enable);
/* 800B6BF4 global */ extern void GXPokeDstAlpha(GXBool enable, u8 alpha);
/* 800B6C18 global */ extern void GXPokeDither(GXBool dither);
/* 800B6C30 global */ extern void GXPokeZMode(GXBool compare_enable, GXCompare func, GXBool update_enable);
/* 800B6C50 global */ extern UNK_TYPE GXPeekZ(UNK_TYPE...);
/* 800B6C74 global */ extern GXDrawSyncCallback GXSetDrawSyncCallback(GXDrawSyncCallback cb);
/* 800B6CB8 local  */ extern UNK_TYPE GXTokenInterruptHandler(UNK_TYPE...);
/* 800B6D40 global */ extern GXDrawDoneCallback GXSetDrawDoneCallback(GXDrawDoneCallback cb);
/* 800B6D84 local  */ extern UNK_TYPE GXFinishInterruptHandler(UNK_TYPE...);
/* 800B6E04 global */ extern UNK_TYPE __GXPEInit(UNK_TYPE...);
// ======================= GXGeometry.c ===============================================
/* 800B6E78 global */ extern UNK_TYPE __GXSetDirtyState(UNK_TYPE...);
/* 800B6EF8 global */ extern void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts);
/* 800B6FC8 global */ extern UNK_TYPE __GXSendFlushPrim(UNK_TYPE...);
/* 800B7050 global */ extern void GXSetLineWidth(u8 width, GXTexOffset texOffsets);
/* 800B7090 global */ extern void GXSetPointSize(u8 pointSize, GXTexOffset texOffsets);
/* 800B70D0 global */ extern void GXEnableTexOffsets(GXTexCoordID coord, GXBool line_enable, GXBool point_enable);
/* 800B7118 global */ extern void GXSetCullMode(GXCullMode mode);
/* 800B715C global */ extern void GXSetCoPlanar(GXBool enable);
/* 800B7190 global */ extern UNK_TYPE __GXSetGenMode(UNK_TYPE...);
// ======================= GXFrameBuf.c ===============================================
/* 800B71B4 global */ extern void GXAdjustForOverscan(const GXRenderModeObj *rmin, GXRenderModeObj *rmout, u16 hor, u16 ver);
/* 800B72F8 global */ extern void GXSetDispCopySrc(u16 left, u16 top, u16 wd, u16 ht);
/* 800B7374 global */ extern void GXSetTexCopySrc(u16 left, u16 top, u16 wd, u16 ht);
/* 800B73F0 global */ extern void GXSetDispCopyDst( u16 wd, u16 ht);
/* 800B7424 global */ extern void GXSetTexCopyDst(u16 wd, u16 ht, GXTexFmt fmt, GXBool mipmap);
/* 800B7554 global */ extern void GXSetDispCopyFrame2Field(GXCopyMode mode);
/* 800B7578 global */ extern void GXSetCopyClamp(GXFBClamp clamp);
/* 800B75D0 global */ extern f32 GXGetYScaleFactor(u16 efbHeight, u16 xfbHeight);
/* 800B7808 global */ extern u32 GXSetDispCopyYScale(f32 vscale);
/* 800B78D4 global */ extern void GXSetCopyClear(GXColor clear_clr, u32 clear_z);
/* 800B794C global */ extern void GXSetCopyFilter(GXBool aa, const u8 sample_pattern[12][2], GXBool vf, const u8 vfilter[7]);
/* 800B7B54 global */ extern void GXSetDispCopyGamma(GXGamma gamma);
/* 800B7B68 global */ extern void GXCopyDisp(void* dest, GXBool clear);
/* 800B7CD0 global */ extern void GXCopyTex(void* dest, GXBool clear);
/* 800B7E5C global */ extern void GXClearBoundingBox(void);
// ======================= GXLight.c ==================================================
/* 800B7E94 global */ extern void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color);
/* 800B7F84 global */ extern void GXSetChanMatColor(GXChannelID chan, GXColor mat_color);
/* 800B8074 global */ extern void GXSetNumChans(u8 nChans);
/* 800B80B0 global */ extern void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src, GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn);
// ======================= GXTexture.c ================================================
/* 800B8168 global */ extern UNK_TYPE __GetImageTileCount(UNK_TYPE...);
/* 800B8230 global */ extern void GXInitTexObj(GXTexObj* obj, void* image_ptr, u16 width, u16 height, GXTexFmt format, GXTexWrapMode wrap_s, GXTexWrapMode wrap_t, GXBool mipmap);
/* 800B847C global */ extern void GXInitTexObjCI(GXTexObj* obj, void* image_ptr, u16 width, u16 height, GXCITexFmt format, GXTexWrapMode wrap_s, GXTexWrapMode wrap_t, GXBool mipmap, u32 tlut_name);
/* 800B84C4 global */ extern void GXInitTexObjLOD(GXTexObj* obj, GXTexFilter min_filt, GXTexFilter mag_filt, f32 min_lod, f32 max_lod, f32 lod_bias, GXBool bias_clamp, GXBool do_edge_lod, GXAnisotropy max_aniso);
/* 800B8628 global */ extern UNK_TYPE GXInitTexObjData(UNK_TYPE...);
/* 800B8638 global */ extern void* GXGetTexObjData(const GXTexObj* tex_obj);
/* 800B8644 global */ extern GXTexFmt GXGetTexObjFmt(const GXTexObj* tex_obj);
/* 800B864C global */ extern GXBool GXGetTexObjMipMap(const GXTexObj* tex_obj);
/* 800B8664 global */ extern void GXLoadTexObjPreLoaded(const GXTexObj* obj, const GXTexRegion* region, GXTexMapID id);
/* 800B87E0 global */ extern void GXLoadTexObj(const GXTexObj* obj, GXTexMapID id);
/* 800B8834 global */ extern void GXInitTlutObj(GXTlutObj* tlut_obj, void* lut, GXTlutFmt fmt, u16 n_entries);
/* 800B886C global */ extern void GXLoadTlut(const GXTlutObj* tlut_obj, u32 tlut_name);
/* 800B8904 global */ extern void GXInitTexCacheRegion(GXTexRegion* region, GXBool is_32b_mipmap, u32 tmem_even, GXTexCacheSize size_even, u32 tmem_odd, GXTexCacheSize size_odd);
/* 800B89F8 global */ extern void GXInitTlutRegion(GXTlutRegion* region, u32 tmem_addr, GXTlutSize tlut_size );
/* 800B8A30 global */ extern void GXInvalidateTexAll(void);
/* 800B8A78 global */ extern GXTexRegionCallback GXSetTexRegionCallback(GXTexRegionCallback f);
/* 800B8A8C global */ extern GXTlutRegionCallback GXSetTlutRegionCallback(GXTlutRegionCallback f);
/* 800B8AA0 local  */ extern UNK_TYPE __SetSURegs(UNK_TYPE...);
/* 800B8B40 global */ extern UNK_TYPE __GXSetSUTexRegs(UNK_TYPE...);
/* 800B8CBC global */ extern UNK_TYPE __GXSetTmemConfig(UNK_TYPE...);
// ======================= GXBump.c ===================================================
/* 800B9010 global */ extern void GXSetTevIndirect(GXTevStageID tev_stage, GXIndTexStageID ind_stage, GXIndTexFormat format, GXIndTexBiasSel bias_sel, GXIndTexMtxID matrix_sel, GXIndTexWrap wrap_s, GXIndTexWrap wrap_t, GXBool add_prev, GXBool ind_lod, GXIndTexAlphaSel alpha_sel);
/* 800B907C global */ extern void GXSetIndTexCoordScale(GXIndTexStageID ind_state, GXIndTexScale scale_s, GXIndTexScale scale_t);
/* 800B91C0 global */ extern void GXSetNumIndStages(u8 nIndStages);
/* 800B91E4 global */ extern void GXSetTevDirect(GXTevStageID tev_stage);
/* 800B922C global */ extern UNK_TYPE __GXUpdateBPMask(UNK_TYPE...);
/* 800B9230 global */ extern void __GXSetIndirectMask(u32 mask);
/* 800B9260 global */ extern UNK_TYPE __GXFlushTextureState(UNK_TYPE...);
// ======================= GXTev.c ====================================================
/* 800B9284 global */ extern void GXSetTevOp(GXTevStageID id, GXTevMode mode);
/* 800B9310 global */ extern void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d);
/* 800B9354 global */ extern void GXSetTevAlphaIn(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d);
/* 800B9398 global */ extern void GXSetTevColorOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
/* 800B9400 global */ extern void GXSetTevAlphaOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg);
/* 800B9468 global */ extern void GXSetTevColor(GXTevRegID id, GXColor color);
/* 800B94E4 global */ extern void GXSetTevColorS10(GXTevRegID id, GXColorS10 color);
/* 800B9560 global */ extern void GXSetTevKColor(GXTevKColorID id, GXColor color);
/* 800B95D4 global */ extern void GXSetTevKColorSel(GXTevStageID stage, GXTevKColorSel sel);
/* 800B9630 global */ extern void GXSetTevKAlphaSel(GXTevStageID stage, GXTevKAlphaSel sel);
/* 800B968C global */ extern void GXSetTevSwapMode(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel);
/* 800B96D4 global */ extern void GXSetTevSwapModeTable(GXTevSwapSel table, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha);
/* 800B9754 global */ extern void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1);
/* 800B9798 global */ extern void GXSetZTexture(GXZTexOp op, GXTexFmt fmt, u32 bias);
/* 800B9824 global */ extern void GXSetTevOrder(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color);
/* 800B99C0 global */ extern void GXSetNumTevStages(u8 nStages);
// ======================= GXPixel.c ==================================================
/* 800B99E8 global */ extern void GXSetFog(GXFogType type, f32 startz, f32 endz, f32 nearz, f32 farz, GXColor color);
/* 800B9C0C global */ extern void GXInitFogAdjTable(GXFogAdjTable* table, u16 width, const f32 projmtx[4][4]);
/* 800B9DBC global */ extern void GXSetFogRangeAdj(GXBool enable, u16 center, const GXFogAdjTable* table);
/* 800B9EE0 global */ extern void GXSetBlendMode(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
/* 800B9F34 global */ extern void GXSetColorUpdate(GXBool update_enable);
/* 800B9F60 global */ extern void GXSetAlphaUpdate(GXBool update_enable);
/* 800B9F8C global */ extern void GXSetZMode(GXBool compare_enable, GXCompare func, GXBool update_enable);
/* 800B9FC0 global */ extern void GXSetZCompLoc(GXBool before_tex);
/* 800B9FF4 global */ extern void GXSetPixelFmt(GXPixelFmt pix_fmt, GXZFmt16 z_fmt);
/* 800BA0C8 global */ extern void GXSetDither(GXBool dither);
/* 800BA0F4 global */ extern void GXSetDstAlpha(GXBool enable, u8 alpha);
/* 800BA130 global */ extern void GXSetFieldMask(GXBool odd_mask, GXBool even_mask);
/* 800BA168 global */ extern void GXSetFieldMode(GXBool field_mode, GXBool half_aspect_ratio);
// ======================= GXTransform.c ==============================================
/* 800BA1E0 global */ extern void GXSetProjection(const f32 mtx[4][4], GXProjectionType type);
/* 800BA284 global */ extern void GXSetProjectionv(const f32 *ptr);
/* 800BA310 global */ extern void GXLoadPosMtxImm(const f32 mtx[3][4], u32 id);
/* 800BA360 global */ extern void GXLoadNrmMtxImm(const f32 mtx[3][4], u32 id);
/* 800BA3B0 global */ extern void GXSetCurrentMtx(u32 id);
/* 800BA3E4 global */ extern void GXLoadTexMtxImm(const f32 mtx[][4], u32 id, GXTexMtxType type);
/* 800BA498 global */ extern UNK_TYPE __GXSetViewport(UNK_TYPE...);
/* 800BA528 global */ extern void GXSetViewportJitter(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz, u32 field);
/* 800BA580 global */ extern void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz);
/* 800BA5C8 global */ extern void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht);
/* 800BA640 global */ extern void GXGetScissor(u32* left, u32* top, u32* width, u32* height);
/* 800BA688 global */ extern void GXSetScissorBoxOffset(s32 x_off, s32 y_off);
/* 800BA6C8 global */ extern void GXSetClipMode(GXClipMode mode);
/* 800BA6F0 global */ extern UNK_TYPE __GXSetMatrixIndex(UNK_TYPE...);
// ======================= GXPerf.c ===================================================
/* 800BA774 global */ extern void GXSetGPMetric(GXPerf0 perf0, GXPerf1 perf1);
/* 800BAFBC global */ extern void GXReadGPMetric(u32* cnt0, u32* cnt1);
/* 800BB164 global */ extern void GXClearGPMetric(void);
/* 800BB174 global */ extern u32 GXReadGP0Metric(void);
/* 800BB1A0 global */ extern u32 GXReadGP1Metric(void);
/* 800BB1CC global */ extern void GXReadMemMetric(u32* cp_req, u32* tc_req, u32* cpu_rd_req, u32* cpu_wr_req, u32* dsp_req, u32* io_req, u32* vi_req, u32* pe_req, u32* rf_req, u32* fi_req);
/* 800BB3E0 global */ extern void GXClearMemMetric(void);
/* 800BB488 global */ extern void GXReadPixMetric(u32* top_pixels_in, u32* top_pixels_out, u32* bot_pixels_in, u32* bot_pixels_out, u32* clr_pixels_in, u32* copy_clks);
/* 800BB5C0 global */ extern void GXClearPixMetric(void);
/* 800BB5F0 global */ extern void GXSetVCacheMetric(GXVCachePerf attr);
/* 800BB634 global */ extern void GXReadVCacheMetric(u32* check, u32* miss, u32* stall);
/* 800BB6C8 global */ extern void GXClearVCacheMetric(void);
/* 800BB6E4 global */ extern void GXReadXfRasMetric(u32* xf_wait_in, u32* xf_wait_out, u32* ras_busy, u32* clocks );
// ======================= Padclamp.c =================================================
/* 800BB7A8 local  */ extern UNK_TYPE ClampStick(UNK_TYPE...);
/* 800BB8D8 global */ extern void PADClamp(PADStatus* status);
// ======================= Pad.c ======================================================
/* 800BB9EC local  */ extern UNK_TYPE UpdateOrigin(UNK_TYPE...);
/* 800BBB90 local  */ extern UNK_TYPE PADOriginCallback(UNK_TYPE...);
/* 800BBC54 local  */ extern UNK_TYPE PADOriginUpdateCallback(UNK_TYPE...);
/* 800BBD20 local  */ extern UNK_TYPE PADProbeCallback(UNK_TYPE...);
/* 800BBDF8 local  */ extern UNK_TYPE PADTypeAndStatusCallback(UNK_TYPE...);
/* 800BC124 local  */ extern UNK_TYPE PADReceiveCheckCallback(UNK_TYPE...);
/* 800BC264 global */ extern BOOL PADReset(u32 mask);
/* 800BC374 global */ extern BOOL PADRecalibrate(u32 mask);
/* 800BC488 global */ extern BOOL PADInit(void);
/* 800BC5D8 global */ extern u32 PADRead(PADStatus* status);
/* 800BC8D8 global */ extern void PADControlMotor(int chan, u32 command);
/* 800BC990 global */ extern void PADSetSpec(u32 model);
/* 800BC9F0 local  */ extern UNK_TYPE SPEC0_MakeStatus(UNK_TYPE...);
/* 800BCB64 local  */ extern UNK_TYPE SPEC1_MakeStatus(UNK_TYPE...);
/* 800BCCD8 local  */ extern UNK_TYPE SPEC2_MakeStatus(UNK_TYPE...);
/* 800BD148 local  */ extern UNK_TYPE OnReset(UNK_TYPE...);
/* 800BD204 local  */ extern UNK_TYPE SamplingHandler(UNK_TYPE...);
/* 800BD264 global */ extern PADSamplingCallback PADSetSamplingCallback(PADSamplingCallback callback);
/* 800BD2B8 global */ extern BOOL __PADDisableRecalibration(BOOL disable);
// ======================= dvdlow.c ===================================================
/* 800BD334 weak   */ extern UNK_TYPE __DVDInitWA(UNK_TYPE...);
/* 800BD374 weak   */ extern UNK_TYPE __DVDInterruptHandler(UNK_TYPE...);
/* 800BD654 local  */ extern UNK_TYPE AlarmHandler(UNK_TYPE...);
/* 800BD6D8 local  */ extern UNK_TYPE AlarmHandlerForTimeout(UNK_TYPE...);
/* 800BD748 local  */ extern UNK_TYPE Read(UNK_TYPE...);
/* 800BD858 local  */ extern UNK_TYPE SeekTwiceBeforeRead(UNK_TYPE...);
/* 800BD8D8 weak   */ extern UNK_TYPE DVDLowRead(UNK_TYPE...);
/* 800BDB70 weak   */ extern UNK_TYPE DVDLowSeek(UNK_TYPE...);
/* 800BDC04 weak   */ extern UNK_TYPE DVDLowWaitCoverClose(UNK_TYPE...);
/* 800BDC30 weak   */ extern UNK_TYPE DVDLowReadDiskID(UNK_TYPE...);
/* 800BDCD4 weak   */ extern UNK_TYPE DVDLowStopMotor(UNK_TYPE...);
/* 800BDD60 weak   */ extern UNK_TYPE DVDLowRequestError(UNK_TYPE...);
/* 800BDDEC weak   */ extern UNK_TYPE DVDLowInquiry(UNK_TYPE...);
/* 800BDE88 weak   */ extern UNK_TYPE DVDLowAudioStream(UNK_TYPE...);
/* 800BDF20 weak   */ extern UNK_TYPE DVDLowRequestAudioStatus(UNK_TYPE...);
/* 800BDFAC weak   */ extern UNK_TYPE DVDLowAudioBufferConfig(UNK_TYPE...);
/* 800BE048 weak   */ extern UNK_TYPE DVDLowReset(UNK_TYPE...);
/* 800BE104 weak   */ extern UNK_TYPE DVDLowBreak(UNK_TYPE...);
/* 800BE118 weak   */ extern UNK_TYPE DVDLowClearCallback(UNK_TYPE...);
/* 800BE134 weak   */ extern UNK_TYPE __DVDLowSetWAType(UNK_TYPE...);
/* 800BE178 global */ extern UNK_TYPE __DVDLowTestAlarm(UNK_TYPE...);
// ======================= dvdfs.c ====================================================
/* 800BE1B0 global */ extern UNK_TYPE __DVDFSInit(UNK_TYPE...);
/* 800BE1E8 global */ extern s32 DVDConvertPathToEntrynum(const char* pathPtr);
/* 800BE4DC global */ extern UNK_TYPE DVDFastOpen(UNK_TYPE...);
/* 800BE550 global */ extern BOOL DVDOpen(const char* fileName, DVDFileInfo* fileInfo);
/* 800BE618 global */ extern BOOL DVDClose(DVDFileInfo* fileInfo);
/* 800BE63C local  */ extern UNK_TYPE entryToPath(UNK_TYPE...);
/* 800BE79C global */ extern BOOL DVDGetCurrentDir(char* path, u32 maxlen);
/* 800BE860 global */ extern BOOL DVDReadAsyncPrio(DVDFileInfo* fileInfo, void* addr, s32 length, s32 offset, DVDCallback callback, s32 prio);
/* 800BE920 local  */ extern UNK_TYPE cbForReadAsync(UNK_TYPE...);
/* 800BE950 global */ extern s32  DVDReadPrio(DVDFileInfo* fileInfo, void* addr, s32 length, s32 offset, s32 prio);
/* 800BEA68 local  */ extern UNK_TYPE cbForReadSync(UNK_TYPE...);
/* 800BEA8C global */ extern UNK_TYPE DVDSeekAsyncPrio(UNK_TYPE...);
/* 800BEB24 local  */ // extern UNK_TYPE cbForSeekAsync(UNK_TYPE...);
/* 800BEB54 global */ extern UNK_TYPE DVDPrepareStreamAsync(UNK_TYPE...);
/* 800BEC40 local  */ // extern UNK_TYPE cbForPrepareStreamAsync(UNK_TYPE...);
// ======================= dvd.c ======================================================
/* 800BEC70 local  */ extern UNK_TYPE defaultOptionalCommandChecker(UNK_TYPE...);
/* 800BEC74 global */ extern void DVDInit(void);
/* 800BED40 local  */ extern UNK_TYPE stateReadingFST(UNK_TYPE...);
/* 800BEDD4 local  */ extern UNK_TYPE cbForStateReadingFST(UNK_TYPE...);
/* 800BEE60 local  */ extern UNK_TYPE cbForStateError(UNK_TYPE...);
/* 800BEF0C local  */ extern UNK_TYPE stateTimeout(UNK_TYPE...);
/* 800BEF40 local  */ extern UNK_TYPE stateGettingError(UNK_TYPE...);
/* 800BEF68 local  */ extern UNK_TYPE CategorizeError(UNK_TYPE...);
/* 800BF01C local  */ extern UNK_TYPE cbForStateGettingError(UNK_TYPE...);
/* 800BF2B0 local  */ extern UNK_TYPE cbForUnrecoveredError(UNK_TYPE...);
/* 800BF318 local  */ extern UNK_TYPE cbForUnrecoveredErrorRetry(UNK_TYPE...);
/* 800BF3B0 local  */ extern UNK_TYPE stateGoToRetry(UNK_TYPE...);
/* 800BF3D8 local  */ extern UNK_TYPE cbForStateGoToRetry(UNK_TYPE...);
/* 800BF530 local  */ extern UNK_TYPE stateCheckID(UNK_TYPE...);
/* 800BF610 local  */ extern UNK_TYPE stateCheckID3(UNK_TYPE...);
/* 800BF644 local  */ extern UNK_TYPE stateCheckID2a(UNK_TYPE...);
/* 800BF678 local  */ extern UNK_TYPE cbForStateCheckID2a(UNK_TYPE...);
/* 800BF6EC local  */ extern UNK_TYPE stateCheckID2(UNK_TYPE...);
/* 800BF724 local  */ extern UNK_TYPE cbForStateCheckID1(UNK_TYPE...);
/* 800BF838 local  */ extern UNK_TYPE cbForStateCheckID2(UNK_TYPE...);
/* 800BF91C local  */ extern UNK_TYPE cbForStateCheckID3(UNK_TYPE...);
/* 800BFA18 local  */ extern UNK_TYPE AlarmHandler(UNK_TYPE...);
/* 800BFA5C local  */ extern UNK_TYPE stateCoverClosed(UNK_TYPE...);
/* 800BFB28 local  */ extern UNK_TYPE stateCoverClosed_CMD(UNK_TYPE...);
/* 800BFB58 local  */ extern UNK_TYPE cbForStateCoverClosed(UNK_TYPE...);
/* 800BFBC8 local  */ extern UNK_TYPE stateMotorStopped(UNK_TYPE...);
/* 800BFBF0 local  */ extern UNK_TYPE cbForStateMotorStopped(UNK_TYPE...);
/* 800BFCD4 local  */ extern UNK_TYPE stateReady(UNK_TYPE...);
/* 800BFF04 local  */ extern UNK_TYPE stateBusy(UNK_TYPE...);
/* 800C0224 local  */ extern UNK_TYPE cbForStateBusy(UNK_TYPE...);
/* 800C085C local  */ // extern UNK_TYPE issueCommand(UNK_TYPE...);
/* 800C0918 global */ extern UNK_TYPE DVDReadAbsAsyncPrio(UNK_TYPE...);
/* 800C09F4 global */ extern UNK_TYPE DVDSeekAbsAsyncPrio(UNK_TYPE...);
/* 800C0AC0 global */ extern UNK_TYPE DVDReadAbsAsyncForBS(UNK_TYPE...);
/* 800C0B90 global */ extern UNK_TYPE DVDReadDiskID(UNK_TYPE...);
/* 800C0C64 global */ extern UNK_TYPE DVDPrepareStreamAbsAsync(UNK_TYPE...);
/* 800C0D28 global */ extern UNK_TYPE DVDCancelStreamAsync(UNK_TYPE...);
/* 800C0DE4 global */ extern UNK_TYPE DVDStopStreamAtEndAsync(UNK_TYPE...);
/* 800C0EA0 global */ extern UNK_TYPE DVDGetStreamErrorStatusAsync(UNK_TYPE...);
/* 800C0F5C global */ extern UNK_TYPE DVDGetStreamErrorStatus(UNK_TYPE...);
/* 800C0FFC local  */ // extern UNK_TYPE cbForGetStreamErrorStatusSync(UNK_TYPE...);
/* 800C1024 global */ extern UNK_TYPE DVDInquiryAsync(UNK_TYPE...);
/* 800C10F4 global */ extern UNK_TYPE DVDReset(UNK_TYPE...);
/* 800C1138 global */ extern s32 DVDGetCommandBlockStatus(const DVDCommandBlock* block);
/* 800C1184 global */ extern s32 DVDGetDriveStatus(void);
/* 800C1230 global */ extern BOOL DVDSetAutoInvalidation(BOOL autoInval);
/* 800C1240 global */ extern void DVDResume(void);
/* 800C1290 global */ extern BOOL DVDCancelAsync(DVDCommandBlock* block, DVDCBCallback callback);
/* 800C150C global */ extern s32 DVDCancel(DVDCommandBlock* block);
/* 800C15B8 local  */ extern UNK_TYPE cbForCancelSync(UNK_TYPE...);
/* 800C15DC global */ extern DVDDiskID* DVDGetCurrentDiskID(void);
/* 800C15E4 global */ extern UNK_TYPE DVDCheckDisk(UNK_TYPE...);
/* 800C16DC global */ extern UNK_TYPE __DVDPrepareResetAsync(UNK_TYPE...);
/* 800C17F8 global */ extern UNK_TYPE __DVDTestAlarm(UNK_TYPE...);
// ======================= dvdqueue.c =================================================
/* 800C1830 global */ extern UNK_TYPE __DVDClearWaitingQueue(UNK_TYPE...);
/* 800C1868 global */ extern UNK_TYPE __DVDPushWaitingQueue(UNK_TYPE...);
/* 800C18D0 global */ extern UNK_TYPE __DVDPopWaitingQueue(UNK_TYPE...);
/* 800C1970 global */ extern UNK_TYPE __DVDCheckWaitingQueue(UNK_TYPE...);
/* 800C19C8 global */ extern UNK_TYPE __DVDDequeueWaitingQueue(UNK_TYPE...);
// ======================= dvderror.c =================================================
/* 800C1A28 local  */ extern UNK_TYPE ErrorCode2Num(UNK_TYPE...);
/* 800C1B44 global */ extern UNK_TYPE __DVDStoreErrorCode(UNK_TYPE...);
// ======================= dvdidutils.c ===============================================
/* 800C1BC0 global */ extern BOOL DVDCompareDiskID(const DVDDiskID* id1, const DVDDiskID* id2);
// ======================= dvdFatal.c =================================================
/* 800C1CB8 global */ extern UNK_TYPE __DVDPrintFatalMessage(UNK_TYPE...);
// ======================= fstload.c ==================================================
/* 800C1CE8 local  */ extern UNK_TYPE cb(UNK_TYPE...);
/* 800C1DC0 global */ extern UNK_TYPE __fstLoad(UNK_TYPE...);
// ======================= DEMOInit.c =================================================
/* 800C1F28 global */ extern UNK_TYPE DEMOInit(UNK_TYPE...);
/* 800C1F9C local  */ extern UNK_TYPE __DEMOInitRenderMode(UNK_TYPE...);
/* 800C20F0 local  */ extern UNK_TYPE __DEMOInitMem(UNK_TYPE...);
/* 800C21C4 local  */ extern UNK_TYPE __DEMOInitGX(UNK_TYPE...);
/* 800C22E0 local  */ extern UNK_TYPE __DEMOInitVI(UNK_TYPE...);
/* 800C2328 global */ extern UNK_TYPE DEMOBeforeRender(UNK_TYPE...);
/* 800C2410 global */ extern UNK_TYPE DEMODoneRender(UNK_TYPE...);
/* 800C2494 global */ extern UNK_TYPE DEMOSwapBuffers(UNK_TYPE...);
/* 800C24FC global */ extern UNK_TYPE DEMOGetRenderModeObj(UNK_TYPE...);
/* 800C2504 local  */ extern UNK_TYPE __NoHangDoneRender(UNK_TYPE...);
/* 800C25F8 global */ extern UNK_TYPE DEMOSetGPHangMetric(UNK_TYPE...);
/* 800C26B4 local  */ extern UNK_TYPE __DEMODiagnoseHang(UNK_TYPE...);
/* 800C2870 global */ extern UNK_TYPE DEMOReInit(UNK_TYPE...);
// ======================= DEMOPuts.c =================================================
/* 800C2A50 global */ extern UNK_TYPE DEMOInitCaption(UNK_TYPE...);
/* 800C2CAC global */ extern UNK_TYPE DEMOPuts(UNK_TYPE...);
// ======================= DEMOFont.c =================================================
/* 800C2FBC global */ extern UNK_TYPE DEMOPrintf(UNK_TYPE...);
// ======================= DEMOPad.c ==================================================
/* 800C3080 local  */ extern UNK_TYPE DEMOPadCopy(UNK_TYPE...);
/* 800C3218 global */ extern UNK_TYPE DEMOPadRead(UNK_TYPE...);
/* 800C32E4 global */ extern UNK_TYPE DEMOPadInit(UNK_TYPE...);
// ======================= DEMOStats.c ================================================
/* 800C33B8 local  */ extern UNK_TYPE DEMOWriteStats(UNK_TYPE...);
/* 800C374C global */ extern UNK_TYPE DEMOUpdateStats(UNK_TYPE...);
/* 800C37A4 global */ extern UNK_TYPE DEMOPrintStats(UNK_TYPE...);
// ======================= ai.c =======================================================
/* 800C4110 global */ extern AIDCallback AIRegisterDMACallback(AIDCallback callback);
/* 800C4154 global */ extern void AIInitDMA(u32 start_addr, u32 length);
/* 800C41DC global */ extern BOOL AIGetDMAEnableFlag(void);
/* 800C41EC global */ extern void AIStartDMA(void);
/* 800C4204 global */ extern void AIStopDMA(void);
/* 800C421C global */ extern u32 AIGetDMABytesLeft(void);
/* 800C422C global */ extern u32 AIGetDMAStartAddr(void);
/* 800C4248 global */ extern UNK_TYPE AISetStreamPlayState(UNK_TYPE...);
/* 800C4320 global */ extern UNK_TYPE AIGetStreamPlayState(UNK_TYPE...);
/* 800C4330 global */ extern void AISetDSPSampleRate(u32 rate);
/* 800C4410 global */ extern u32 AIGetDSPSampleRate(void);
/* 800C4424 local  */ extern UNK_TYPE __AI_set_stream_sample_rate(UNK_TYPE...);
/* 800C44F8 global */ extern UNK_TYPE AIGetStreamSampleRate(UNK_TYPE...);
/* 800C4508 global */ extern UNK_TYPE AISetStreamVolLeft(UNK_TYPE...);
/* 800C4524 global */ extern UNK_TYPE AIGetStreamVolLeft(UNK_TYPE...);
/* 800C4534 global */ extern UNK_TYPE AISetStreamVolRight(UNK_TYPE...);
/* 800C4550 global */ extern UNK_TYPE AIGetStreamVolRight(UNK_TYPE...);
/* 800C4560 global */ extern void AIInit(u8* stack);
/* 800C46CC local  */ extern UNK_TYPE __AISHandler(UNK_TYPE...);
/* 800C4748 local  */ extern UNK_TYPE __AIDHandler(UNK_TYPE...);
/* 800C47F4 local  */ extern UNK_TYPE __AICallbackStackSwitch(UNK_TYPE...);
/* 800C484C local  */ extern UNK_TYPE __AI_SRC_INIT(UNK_TYPE...);
// ======================= ar.c =======================================================
/* 800C4A30 global */ extern UNK_TYPE ARGetDMAStatus(UNK_TYPE...);
/* 800C4A6C global */ extern UNK_TYPE ARStartDMA(UNK_TYPE...);
/* 800C4B5C global */ extern UNK_TYPE ARInit(UNK_TYPE...);
/* 800C4C20 global */ extern UNK_TYPE ARGetBaseAddress(UNK_TYPE...);
/* 800C4C28 local  */ extern UNK_TYPE __ARHandler(UNK_TYPE...);
/* 800C4CA0 local  */ extern UNK_TYPE __ARChecksize(UNK_TYPE...);
// ======================= dsp.c ======================================================
/* 800C6494 global */ extern u32 DSPCheckMailToDSP(void);
/* 800C64A4 global */ extern u32 DSPCheckMailFromDSP(void);
/* 800C64B4 global */ extern u32 DSPReadMailFromDSP(void);
/* 800C64CC global */ extern void DSPSendMailToDSP(u32 mail);
/* 800C64E0 global */ extern void DSPInit(void);
/* 800C65A4 global */ extern DSPTaskInfo* DSPAddTask(DSPTaskInfo* task);
// ======================= dsp_debug.c ================================================
/* 800C6614 global */ extern UNK_TYPE __DSP_debug_printf(UNK_TYPE...);
// ======================= dsp_task.c =================================================
/* 800C6664 global */ extern UNK_TYPE __DSPHandler(UNK_TYPE...);
/* 800C6A88 global */ extern UNK_TYPE __DSP_exec_task(UNK_TYPE...);
/* 800C6C28 global */ extern UNK_TYPE __DSP_boot_task(UNK_TYPE...);
/* 800C6DB4 global */ extern UNK_TYPE __DSP_insert_task(UNK_TYPE...);
/* 800C6E54 global */ extern UNK_TYPE __DSP_remove_task(UNK_TYPE...);
// ======================= CARDBios.c =================================================
/* 800C6EE8 global */ extern UNK_TYPE __CARDDefaultApiCallback(UNK_TYPE...);
/* 800C6EEC global */ extern UNK_TYPE __CARDSyncCallback(UNK_TYPE...);
/* 800C6F20 global */ extern UNK_TYPE __CARDExtHandler(UNK_TYPE...);
/* 800C6FF8 global */ extern UNK_TYPE __CARDExiHandler(UNK_TYPE...);
/* 800C7110 global */ extern UNK_TYPE __CARDTxHandler(UNK_TYPE...);
/* 800C71B8 global */ extern UNK_TYPE __CARDUnlockedHandler(UNK_TYPE...);
/* 800C723C global */ extern UNK_TYPE __CARDEnableInterrupt(UNK_TYPE...);
/* 800C72FC global */ extern UNK_TYPE __CARDReadStatus(UNK_TYPE...);
/* 800C73EC global */ extern UNK_TYPE __CARDClearStatus(UNK_TYPE...);
/* 800C7498 local  */ extern UNK_TYPE TimeoutHandler(UNK_TYPE...);
/* 800C753C local  */ extern UNK_TYPE Retry(UNK_TYPE...);
/* 800C7768 local  */ extern UNK_TYPE UnlockedCallback(UNK_TYPE...);
/* 800C7878 local  */ extern UNK_TYPE __CARDStart(UNK_TYPE...);
/* 800C7A2C global */ extern UNK_TYPE __CARDReadSegment(UNK_TYPE...);
/* 800C7B60 global */ extern UNK_TYPE __CARDWritePage(UNK_TYPE...);
/* 800C7C7C global */ extern UNK_TYPE __CARDEraseSector(UNK_TYPE...);
/* 800C7D5C global */ extern UNK_TYPE CARDInit(UNK_TYPE...);
/* 800C7E08 global */ extern UNK_TYPE __CARDGetFontEncode(UNK_TYPE...);
/* 800C7E10 global */ extern UNK_TYPE __CARDSetDiskID(UNK_TYPE...);
/* 800C7E48 global */ extern UNK_TYPE __CARDGetControlBlock(UNK_TYPE...);
/* 800C7F00 global */ extern UNK_TYPE __CARDPutControlBlock(UNK_TYPE...);
/* 800C7F64 global */ extern UNK_TYPE CARDGetResultCode(UNK_TYPE...);
/* 800C7F94 global */ extern UNK_TYPE CARDFreeBlocks(UNK_TYPE...);
/* 800C80E4 global */ extern UNK_TYPE __CARDSync(UNK_TYPE...);
/* 800C817C local  */ extern UNK_TYPE OnReset(UNK_TYPE...);
// ======================= CARDUnlock.c ===============================================
/* 800C81CC local  */ extern UNK_TYPE bitrev(UNK_TYPE...);
/* 800C8338 local  */ extern UNK_TYPE ReadArrayUnlock(UNK_TYPE...);
/* 800C847C local  */ extern UNK_TYPE DummyLen(UNK_TYPE...);
/* 800C8540 global */ extern UNK_TYPE __CARDUnlock(UNK_TYPE...);
/* 800C9098 local  */ extern UNK_TYPE InitCallback(UNK_TYPE...);
/* 800C9108 local  */ extern UNK_TYPE DoneCallback(UNK_TYPE...);
// ======================= CARDRdwr.c =================================================
/* 800C942C local  */ extern UNK_TYPE BlockReadCallback(UNK_TYPE...);
/* 800C9508 global */ extern UNK_TYPE __CARDRead(UNK_TYPE...);
/* 800C956C local  */ extern UNK_TYPE BlockWriteCallback(UNK_TYPE...);
/* 800C9648 global */ extern UNK_TYPE __CARDWrite(UNK_TYPE...);
/* 800C96AC global */ extern UNK_TYPE CARDGetXferredBytes(UNK_TYPE...);
// ======================= CARDBlock.c ================================================
/* 800C96C4 global */ extern UNK_TYPE __CARDGetFatBlock(UNK_TYPE...);
/* 800C96CC local  */ extern UNK_TYPE WriteCallback(UNK_TYPE...);
/* 800C97A0 local  */ extern UNK_TYPE EraseCallback(UNK_TYPE...);
/* 800C9868 global */ extern UNK_TYPE __CARDAllocBlock(UNK_TYPE...);
/* 800C9980 global */ extern UNK_TYPE __CARDFreeBlock(UNK_TYPE...);
/* 800C9A1C global */ extern UNK_TYPE __CARDUpdateFatBlock(UNK_TYPE...);
// ======================= CARDDir.c ==================================================
/* 800C9AC8 global */ extern UNK_TYPE __CARDGetDirBlock(UNK_TYPE...);
/* 800C9AD0 local  */ extern UNK_TYPE WriteCallback(UNK_TYPE...);
/* 800C9BA0 local  */ extern UNK_TYPE EraseCallback(UNK_TYPE...);
/* 800C9C68 global */ extern UNK_TYPE __CARDUpdateDir(UNK_TYPE...);
// ======================= CARDCheck.c ================================================
/* 800C9D2C global */ extern UNK_TYPE __CARDCheckSum(UNK_TYPE...);
/* 800C9EDC local  */ extern UNK_TYPE VerifyID(UNK_TYPE...);
/* 800CA160 local  */ extern UNK_TYPE VerifyDir(UNK_TYPE...);
/* 800CA3A0 local  */ extern UNK_TYPE VerifyFAT(UNK_TYPE...);
/* 800CA624 global */ extern UNK_TYPE __CARDVerify(UNK_TYPE...);
/* 800CA6B0 global */ extern UNK_TYPE CARDCheckExAsync(UNK_TYPE...);
/* 800CAC40 global */ extern UNK_TYPE CARDCheck(UNK_TYPE...);
// ======================= CARDMount.c ================================================
/* 800CAC94 local  */ extern UNK_TYPE IsCard(UNK_TYPE...);
/* 800CAD60 global */ extern UNK_TYPE CARDProbeEx(UNK_TYPE...);
/* 800CAEDC local  */ extern UNK_TYPE DoMount(UNK_TYPE...);
/* 800CB2EC global */ extern UNK_TYPE __CARDMountCallback(UNK_TYPE...);
/* 800CB424 global */ extern UNK_TYPE CARDMountAsync(UNK_TYPE...);
/* 800CB5C4 global */ extern UNK_TYPE CARDMount(UNK_TYPE...);
/* 800CB60C local  */ extern UNK_TYPE DoUnmount(UNK_TYPE...);
/* 800CB6A8 global */ extern UNK_TYPE CARDUnmount(UNK_TYPE...);
// ======================= CARDFormat.c ===============================================
/* 800CB754 local  */ extern UNK_TYPE FormatCallback(UNK_TYPE...);
/* 800CB898 global */ extern UNK_TYPE __CARDFormatRegionAsync(UNK_TYPE...);
/* 800CBEF0 global */ extern UNK_TYPE CARDFormatAsync(UNK_TYPE...);
// ======================= CARDOpen.c =================================================
/* 800CBF38 global */ extern UNK_TYPE __CARDCompareFileName(UNK_TYPE...);
/* 800CBFA0 global */ extern UNK_TYPE __CARDAccess(UNK_TYPE...);
/* 800CC034 global */ extern UNK_TYPE __CARDIsWritable(UNK_TYPE...);
/* 800CC168 global */ extern UNK_TYPE __CARDIsReadable(UNK_TYPE...);
/* 800CC25C global */ extern UNK_TYPE __CARDGetFileNo(UNK_TYPE...);
/* 800CC3AC global */ extern UNK_TYPE CARDOpen(UNK_TYPE...);
/* 800CC4C8 global */ extern UNK_TYPE CARDClose(UNK_TYPE...);
/* 800CC51C global */ extern UNK_TYPE __CARDIsOpened(UNK_TYPE...);
// ======================= CARDCreate.c ===============================================
/* 800CC524 local  */ extern UNK_TYPE CreateCallbackFat(UNK_TYPE...);
/* 800CC654 global */ extern UNK_TYPE CARDCreateAsync(UNK_TYPE...);
// ======================= CARDRead.c =================================================
/* 800CC874 global */ extern UNK_TYPE __CARDSeek(UNK_TYPE...);
/* 800CCA2C local  */ extern UNK_TYPE ReadCallback(UNK_TYPE...);
/* 800CCB5C global */ extern UNK_TYPE CARDReadAsync(UNK_TYPE...);
/* 800CCCA0 global */ extern UNK_TYPE CARDRead(UNK_TYPE...);
// ======================= CARDWrite.c ================================================
/* 800CCCE8 local  */ extern UNK_TYPE WriteCallback(UNK_TYPE...);
/* 800CCE58 local  */ extern UNK_TYPE EraseCallback(UNK_TYPE...);
/* 800CCF08 global */ extern UNK_TYPE CARDWriteAsync(UNK_TYPE...);
// ======================= CARDDelete.c ===============================================
/* 800CD01C local  */ extern UNK_TYPE DeleteCallback(UNK_TYPE...);
/* 800CD0C0 global */ extern UNK_TYPE CARDDeleteAsync(UNK_TYPE...);
// ======================= CARDStat.c =================================================
/* 800CD1D0 local  */ extern UNK_TYPE UpdateIconOffsets(UNK_TYPE...);
/* 800CD3C8 global */ extern UNK_TYPE CARDGetStatus(UNK_TYPE...);
/* 800CD4DC global */ extern UNK_TYPE CARDSetStatusAsync(UNK_TYPE...);
// ======================= CARDNet.c ==================================================
// ======================= THPDec.c ===================================================
/* 800CD650 global */ extern s32 THPVideoDecode(void *file, void *tileY, void *tileU, void *tileV, void *work);
/* 800CD894 local  */ extern UNK_TYPE __THPSetupBuffers(UNK_TYPE...);
/* 800CD8D8 local  */ extern UNK_TYPE __THPReadFrameHeader(UNK_TYPE...);
/* 800CDA14 local  */ extern UNK_TYPE __THPReadScaneHeader(UNK_TYPE...);
/* 800CDB30 local  */ extern UNK_TYPE __THPReadQuantizationTable(UNK_TYPE...);
/* 800CDEEC local  */ extern UNK_TYPE __THPReadHuffmanTableSpecification(UNK_TYPE...);
/* 800CE0CC local  */ extern UNK_TYPE __THPHuffGenerateSizeTable(UNK_TYPE...);
/* 800CE1BC local  */ extern UNK_TYPE __THPHuffGenerateCodeTable(UNK_TYPE...);
/* 800CE224 local  */ extern UNK_TYPE __THPHuffGenerateDecoderTables(UNK_TYPE...);
/* 800CE3E0 local  */ extern UNK_TYPE __THPRestartDefinition(UNK_TYPE...);
/* 800CE434 local  */ extern UNK_TYPE __THPPrepBitStream(UNK_TYPE...);
/* 800CE680 local  */ extern UNK_TYPE __THPDecompressYUV(UNK_TYPE...);
/* 800CE78C local  */ extern UNK_TYPE __THPDecompressiMCURow512x448(UNK_TYPE...);
/* 800D0214 local  */ extern UNK_TYPE __THPDecompressiMCURow640x480(UNK_TYPE...);
/* 800D1CA0 local  */ extern UNK_TYPE __THPDecompressiMCURowNxN(UNK_TYPE...);
/* 800D374C local  */ extern UNK_TYPE __THPHuffDecodeDCTCompY(UNK_TYPE...);
/* 800D3DC8 local  */ extern UNK_TYPE __THPHuffDecodeDCTCompU(UNK_TYPE...);
/* 800D4470 local  */ extern UNK_TYPE __THPHuffDecodeDCTCompV(UNK_TYPE...);
/* 800D4B18 global */ extern BOOL THPInit(void);
// ======================= THPAudio.c =================================================
/* 800D4BB8 global */ extern u32 THPAudioDecode(s16* buffer, u8* audioFrame, s32 flag);
/* 800D501C local  */ extern UNK_TYPE __THPAudioGetNewSample(UNK_TYPE...);
/* 800D50AC local  */ extern UNK_TYPE __THPAudioInitialize(UNK_TYPE...);
// ======================= texPalette.c ===============================================
/* 800D50E8 global */ extern UNK_TYPE TEXGet(UNK_TYPE...);
/* 800D50F8 global */ extern UNK_TYPE TEXGetGXTexObjFromPalette(UNK_TYPE...);
// ======================= mainloop.c =================================================
/* 800D51CC global */ extern UNK_TYPE TRKHandleRequestEvent(UNK_TYPE...);
/* 800D51F4 global */ extern UNK_TYPE TRKHandleSupportEvent(UNK_TYPE...);
/* 800D5214 global */ extern UNK_TYPE TRKIdle(UNK_TYPE...);
/* 800D5240 global */ extern UNK_TYPE TRKNubMainLoop(UNK_TYPE...);
// ======================= nubevent.c =================================================
/* 800D5334 global */ extern UNK_TYPE TRKInitializeEventQueue(UNK_TYPE...);
/* 800D5390 global */ extern UNK_TYPE TRKCopyEvent(UNK_TYPE...);
/* 800D53B4 global */ extern UNK_TYPE TRKGetNextEvent(UNK_TYPE...);
/* 800D5474 global */ extern UNK_TYPE TRKPostEvent(UNK_TYPE...);
/* 800D5554 global */ extern UNK_TYPE TRKConstructEvent(UNK_TYPE...);
/* 800D556C global */ extern UNK_TYPE TRKDestructEvent(UNK_TYPE...);
// ======================= nubinit.c ==================================================
/* 800D5590 global */ extern UNK_TYPE TRKInitializeNub(UNK_TYPE...);
/* 800D5664 global */ extern UNK_TYPE TRKTerminateNub(UNK_TYPE...);
/* 800D5688 global */ extern UNK_TYPE TRKNubWelcome(UNK_TYPE...);
/* 800D56B0 global */ extern UNK_TYPE TRKInitializeEndian(UNK_TYPE...);
// ======================= msg.c ======================================================
/* 800D5724 global */ extern UNK_TYPE TRKMessageSend(UNK_TYPE...);
// ======================= msgbuf.c ===================================================
/* 800D574C local  */ extern UNK_TYPE TRKSetBufferUsed(UNK_TYPE...);
/* 800D5754 global */ extern UNK_TYPE TRKInitializeMessageBuffers(UNK_TYPE...);
/* 800D57CC global */ extern UNK_TYPE TRKGetFreeBuffer(UNK_TYPE...);
/* 800D5868 global */ extern UNK_TYPE TRKGetBuffer(UNK_TYPE...);
/* 800D5894 global */ extern UNK_TYPE TRKReleaseBuffer(UNK_TYPE...);
/* 800D58FC global */ extern UNK_TYPE TRKResetBuffer(UNK_TYPE...);
/* 800D593C global */ extern UNK_TYPE TRKSetBufferPosition(UNK_TYPE...);
/* 800D596C global */ extern UNK_TYPE TRKAppendBuffer(UNK_TYPE...);
/* 800D5A10 global */ extern UNK_TYPE TRKReadBuffer(UNK_TYPE...);
/* 800D5A9C global */ extern UNK_TYPE TRKAppendBuffer1_ui16(UNK_TYPE...);
/* 800D5AF0 global */ extern UNK_TYPE TRKAppendBuffer1_ui32(UNK_TYPE...);
/* 800D5B54 global */ extern UNK_TYPE TRKAppendBuffer1_ui64(UNK_TYPE...);
/* 800D5BDC global */ extern UNK_TYPE TRKAppendBuffer_ui8(UNK_TYPE...);
/* 800D5C44 global */ extern UNK_TYPE TRKAppendBuffer_ui32(UNK_TYPE...);
/* 800D5CC0 global */ extern UNK_TYPE TRKReadBuffer1_ui8(UNK_TYPE...);
/* 800D5CE4 global */ extern UNK_TYPE TRKReadBuffer1_ui16(UNK_TYPE...);
/* 800D5D64 global */ extern UNK_TYPE TRKReadBuffer1_ui32(UNK_TYPE...);
/* 800D5DF4 global */ extern UNK_TYPE TRKReadBuffer1_ui64(UNK_TYPE...);
/* 800D5EA4 global */ extern UNK_TYPE TRKReadBuffer_ui8(UNK_TYPE...);
/* 800D5F18 global */ extern UNK_TYPE TRKReadBuffer_ui32(UNK_TYPE...);
// ======================= serpoll.c ==================================================
/* 800D5F94 global */ extern UNK_TYPE TRKTestForPacket(UNK_TYPE...);
/* 800D6064 global */ extern UNK_TYPE TRKGetInput(UNK_TYPE...);
/* 800D60E0 global */ extern UNK_TYPE TRKProcessInput(UNK_TYPE...);
/* 800D6130 global */ extern UNK_TYPE TRKInitializeSerialHandler(UNK_TYPE...);
/* 800D6154 global */ extern UNK_TYPE TRKTerminateSerialHandler(UNK_TYPE...);
// ======================= usr_put.c ==================================================
/* 800D615C global */ extern UNK_TYPE usr_put_initialize(UNK_TYPE...);
// ======================= dispatch.c =================================================
/* 800D6160 global */ extern UNK_TYPE TRKInitializeDispatcher(UNK_TYPE...);
/* 800D6174 global */ extern UNK_TYPE TRKDispatchMessage(UNK_TYPE...);
// ======================= msghndlr.c =================================================
/* 800D61F8 local  */ extern UNK_TYPE TRKMessageIntoReply(UNK_TYPE...);
/* 800D6290 global */ extern UNK_TYPE TRKSendACK(UNK_TYPE...);
/* 800D62E0 global */ extern UNK_TYPE TRKStandardACK(UNK_TYPE...);
/* 800D6314 global */ extern UNK_TYPE TRKDoUnsupported(UNK_TYPE...);
/* 800D633C global */ extern UNK_TYPE TRKDoConnect(UNK_TYPE...);
/* 800D6364 global */ extern UNK_TYPE TRKDoDisconnect(UNK_TYPE...);
/* 800D63B4 global */ extern UNK_TYPE TRKDoReset(UNK_TYPE...);
/* 800D63E4 global */ extern UNK_TYPE TRKDoVersions(UNK_TYPE...);
/* 800D6568 global */ extern UNK_TYPE TRKDoSupportMask(UNK_TYPE...);
/* 800D6644 global */ extern UNK_TYPE TRKDoCPUType(UNK_TYPE...);
/* 800D6888 global */ extern UNK_TYPE TRKDoReadMemory(UNK_TYPE...);
/* 800D6A54 global */ extern UNK_TYPE TRKDoWriteMemory(UNK_TYPE...);
/* 800D6C34 global */ extern UNK_TYPE TRKDoReadRegisters(UNK_TYPE...);
/* 800D6E40 global */ extern UNK_TYPE TRKDoWriteRegisters(UNK_TYPE...);
/* 800D703C global */ extern UNK_TYPE TRKDoFlushCache(UNK_TYPE...);
/* 800D7194 global */ extern UNK_TYPE TRKDoContinue(UNK_TYPE...);
/* 800D71F8 global */ extern UNK_TYPE TRKDoStep(UNK_TYPE...);
/* 800D740C global */ extern UNK_TYPE TRKDoStop(UNK_TYPE...);
// ======================= support.c ==================================================
/* 800D7464 global */ extern UNK_TYPE TRKSuppAccessFile(UNK_TYPE...);
/* 800D773C global */ extern UNK_TYPE TRKRequestSend(UNK_TYPE...);
// ======================= mutex_TRK.c ================================================
/* 800D78E0 global */ extern UNK_TYPE TRKInitializeMutex(UNK_TYPE...);
/* 800D78E8 global */ extern UNK_TYPE TRKAcquireMutex(UNK_TYPE...);
/* 800D78F0 global */ extern UNK_TYPE TRKReleaseMutex(UNK_TYPE...);
// ======================= notify.c ===================================================
/* 800D78F8 global */ extern UNK_TYPE TRKDoNotifyStopped(UNK_TYPE...);
// ======================= flush_cache.c ==============================================
/* 800D79D0 global */ extern UNK_TYPE TRK_flush_cache(UNK_TYPE...);
// ======================= mem_TRK.c ==================================================
/* 80003458 global */ extern UNK_TYPE TRK_memcpy(UNK_TYPE...);
// ======================= __exception.s ==============================================
/* 8000347C global */ extern UNK_TYPE gTRKInterruptVectorTable(UNK_TYPE...);
// ======================= targimpl.c =================================================
/* 800D7A08 global */ extern UNK_TYPE __TRK_get_MSR(UNK_TYPE...);
/* 800D7A10 global */ extern UNK_TYPE __TRK_set_MSR(UNK_TYPE...);
/* 800D7A18 global */ extern UNK_TYPE TRKValidMemory32(UNK_TYPE...);
/* 800D7B50 local  */ extern UNK_TYPE TRK_ppc_memcpy(UNK_TYPE...);
/* 800D7B8C global */ extern UNK_TYPE TRKTargetAccessMemory(UNK_TYPE...);
/* 800D7CF0 global */ extern UNK_TYPE TRKTargetReadInstruction(UNK_TYPE...);
/* 800D7D3C global */ extern UNK_TYPE TRKTargetAccessDefault(UNK_TYPE...);
/* 800D7E38 global */ extern UNK_TYPE TRKTargetAccessFP(UNK_TYPE...);
/* 800D7F80 global */ extern UNK_TYPE TRKTargetAccessExtended1(UNK_TYPE...);
/* 800D80F8 global */ extern UNK_TYPE TRKTargetAccessExtended2(UNK_TYPE...);
/* 800D8274 global */ extern UNK_TYPE TRKTargetVersions(UNK_TYPE...);
/* 800D829C global */ extern UNK_TYPE TRKTargetSupportMask(UNK_TYPE...);
/* 800D8340 global */ extern UNK_TYPE TRKTargetCPUType(UNK_TYPE...);
/* 800D83A8 global */ extern UNK_TYPE TRKInterruptHandler(UNK_TYPE...);
/* 800D853C global */ extern UNK_TYPE TRKExceptionHandler(UNK_TYPE...);
/* 800D85D8 global */ extern UNK_TYPE TRKPostInterruptEvent(UNK_TYPE...);
/* 800D8688 global */ extern UNK_TYPE TRKSwapAndGo(UNK_TYPE...);
/* 800D874C global */ extern UNK_TYPE TRKInterruptHandlerEnableInterrupts(UNK_TYPE...);
/* 800D87A0 global */ extern UNK_TYPE TRKTargetInterrupt(UNK_TYPE...);
/* 800D8804 global */ extern UNK_TYPE TRKTargetAddStopInfo(UNK_TYPE...);
/* 800D8894 global */ extern UNK_TYPE TRKTargetAddExceptionInfo(UNK_TYPE...);
/* 800D891C local  */ extern UNK_TYPE TRKTargetEnableTrace(UNK_TYPE...);
/* 800D8958 local  */ extern UNK_TYPE TRKTargetStepDone(UNK_TYPE...);
/* 800D89DC local  */ extern UNK_TYPE TRKTargetDoStep(UNK_TYPE...);
/* 800D8A4C local  */ extern UNK_TYPE TRKTargetCheckStep(UNK_TYPE...);
/* 800D8AB4 global */ extern UNK_TYPE TRKTargetSingleStep(UNK_TYPE...);
/* 800D8AF8 global */ extern UNK_TYPE TRKTargetStepOutOfRange(UNK_TYPE...);
/* 800D8B40 global */ extern UNK_TYPE TRKTargetGetPC(UNK_TYPE...);
/* 800D8B50 global */ extern UNK_TYPE TRKTargetSupportRequest(UNK_TYPE...);
/* 800D8C40 global */ extern UNK_TYPE TRKTargetFlushCache(UNK_TYPE...);
/* 800D8C7C global */ extern UNK_TYPE TRKTargetStopped(UNK_TYPE...);
/* 800D8C8C global */ extern UNK_TYPE TRKTargetSetStopped(UNK_TYPE...);
/* 800D8C9C global */ extern UNK_TYPE TRKTargetStop(UNK_TYPE...);
/* 800D8CC4 global */ extern UNK_TYPE TRKPPCAccessSPR(UNK_TYPE...);
/* 800D8D74 global */ extern UNK_TYPE TRKPPCAccessPairedSingleRegister(UNK_TYPE...);
/* 800D8DEC global */ extern UNK_TYPE TRKPPCAccessFPRegister(UNK_TYPE...);
/* 800D8F6C global */ extern UNK_TYPE TRKPPCAccessSpecialReg(UNK_TYPE...);
/* 800D8FD4 global */ extern UNK_TYPE TRKTargetSetInputPendingPtr(UNK_TYPE...);
// ======================= dolphin_trk.c ==============================================
/* 800053B0 global */ extern UNK_TYPE __TRK_reset(UNK_TYPE...);
/* 800D8FE4 global */ extern UNK_TYPE InitMetroTRK(UNK_TYPE...);
/* 800D9078 global */ extern UNK_TYPE EnableMetroTRKInterrupts(UNK_TYPE...);
/* 800D9098 global */ extern UNK_TYPE TRKTargetTranslate(UNK_TYPE...);
/* 800D90A4 global */ extern UNK_TYPE TRK_copy_vector(UNK_TYPE...);
/* 800D9104 global */ extern UNK_TYPE __TRK_copy_vectors(UNK_TYPE...);
/* 800D9198 global */ extern UNK_TYPE TRKInitializeTarget(UNK_TYPE...);
// ======================= mpc_7xx_603e.c =============================================
/* 800D91D8 global */ extern UNK_TYPE TRKSaveExtended1Block(UNK_TYPE...);
/* 800D9390 global */ extern UNK_TYPE TRKRestoreExtended1Block(UNK_TYPE...);
// ======================= main_TRK.c =================================================
/* 800D9548 global */ extern UNK_TYPE TRKTargetCPUMinorType(UNK_TYPE...);
/* 800D9550 global */ extern UNK_TYPE TRK_main(UNK_TYPE...);
// ======================= dolphin_trk_glue.c =========================================
/* 800D9598 global */ extern UNK_TYPE TRKLoadContext(UNK_TYPE...);
/* 800D9620 global */ extern UNK_TYPE TRKEXICallBack(UNK_TYPE...);
/* 800D9658 global */ extern UNK_TYPE InitMetroTRKCommTable(UNK_TYPE...);
/* 800D9740 global */ extern UNK_TYPE TRKUARTInterruptHandler(UNK_TYPE...);
/* 800D9744 global */ extern UNK_TYPE TRKInitializeIntDrivenUART(UNK_TYPE...);
/* 800D9784 global */ extern UNK_TYPE EnableEXI2Interrupts(UNK_TYPE...);
/* 800D97B4 global */ extern UNK_TYPE TRKPollUART(UNK_TYPE...);
/* 800D97E4 global */ extern UNK_TYPE TRK_ReadUARTN(UNK_TYPE...);
/* 800D9828 global */ extern UNK_TYPE TRK_WriteUARTN(UNK_TYPE...);
/* 800D986C global */ extern UNK_TYPE ReserveEXI2Port(UNK_TYPE...);
/* 800D989C global */ extern UNK_TYPE UnreserveEXI2Port(UNK_TYPE...);
/* 800D98CC global */ extern UNK_TYPE TRK_board_display(UNK_TYPE...);
// ======================= targcont.c =================================================
/* 800D98F0 global */ extern UNK_TYPE TRKTargetContinue(UNK_TYPE...);
// ======================= __mem.c ====================================================
/* 800053D0 global */ extern void* memset(void* dst, int val, size_t n);
/* 80005400 global */ extern void __fill_mem(void* dst, int val, unsigned long n);
/* 800054C4 global */ extern void* memcpy(void* dst, const void* src, size_t n);
// ======================= __va_arg.c =================================================
/* 800D9924 global */ extern void* __va_arg(va_list ap, _va_arg_type type);
// ======================= global_destructor_chain.c ==================================
/* 800D9A18 global */ extern void __destroy_global_chain(void);
// ======================= runtime.c ==================================================
/* 800D9A60 global */ extern unsigned long __cvt_fp2unsigned(register double d);
/* 800D9ABC global */ extern void __div2u(void);
/* 800D9BA8 global */ extern void __div2i(void);
/* 800D9CE0 global */ extern void __mod2u(void);
/* 800D9DC4 global */ extern void __mod2i(void);
/* 800D9ED0 global */ extern void __shl2i(void);
/* 800D9EF4 global */ extern void __shr2u(void);
/* 800D9F18 global */ extern void __shr2i(void);
/* 800D9F40 global */ extern void __cvt_sll_dbl(void);
/* 800D9FF0 global */ extern void __cvt_sll_flt(void);
/* 800DA0A4 global */ extern void __cvt_dbl_usll(void);
// ======================= abort_exit.c ===============================================
/* 800DA170 global */ extern UNK_TYPE exit(UNK_TYPE...);
// ======================= ansi_files.c ===============================================
// ======================= ansi_fp.c ==================================================
/* 800DA27C global */ extern void __num2dec(const decform* f, double x, decimal* d);
// ======================= buffer_io.c ================================================
/* 800DA630 global */ extern int __flush_buffer(FILE* file, size_t* bytes_flushed);
/* 800DA6FC global */ extern void __prep_buffer(FILE* file);
// ======================= critical_regions.ppc_eabi.c ================================
/* 800DA730 global */ extern void __kill_critical_regions(void);
// ======================= ctype.c ====================================================
/* 800DA734 global */ extern UNK_TYPE toupper(UNK_TYPE...);
/* 800DA75C global */ extern UNK_TYPE tolower(UNK_TYPE...);
// ======================= direct_io.c ================================================
/* 800DA784 global */ extern size_t fwrite(const void* ptr, size_t memb_size, size_t num_memb, FILE* file);
// ======================= errno.c ====================================================
// ======================= mbstring.c =================================================
/* 800DAA60 global */ extern size_t wcstombs(char* s, const wchar_t* pwcs, size_t n);
// ======================= mem.c ======================================================
/* 800DAA9C global */ extern int memcmp(const void* src1, const void* src2, size_t n);
/* 800DAAE0 global */ extern void* memchr(const void* src, int val, size_t n);
/* 800DAB0C global */ extern void* memmove(void* dst, const void* src, size_t n);
// ======================= mem_funcs.c ================================================
/* 800DABE8 global */ extern void __copy_longs_rev_unaligned(void* dst, const void* src, unsigned long n);
/* 800DAC98 global */ extern void __copy_longs_unaligned(void* dst, const void* src, unsigned long n);
/* 800DAD5C global */ extern void __copy_longs_rev_aligned(void* dst, const void* src, unsigned long n);
/* 800DAE08 global */ extern void __copy_longs_aligned(void* dst, const void* src, unsigned long n);
// ======================= misc_io.c ==================================================
/* 800DAEC4 global */ extern void __stdio_atexit(void);
// ======================= printf.c ===================================================
/* 800DAEC8 global */ extern int sprintf(char* s, const char* format, ...);
/* 800DAF9C global */ extern int vsprintf(char* s, const char* format, va_list arg);
/* 800DB014 global */ extern int vprintf(const char* format, va_list arg);
/* 800DB090 global */ extern void* __StringWrite(void* osc, const char* Buffer, size_t NumChars);
/* 800DB0FC global */ extern void* __FileWrite(void* File, const char* Buffer, size_t NumChars);
/* 800DB154 local  */ // extern UNK_TYPE __pformatter(UNK_TYPE...);
/* 800DB784 local  */ extern char* float2str(long double num, char* buff, print_format format);
/* 800DBDBC local  */ extern void round_decimal(decimal* dec, int new_length);
/* 800DBEF0 local  */ extern char* longlong2str(long long num, char* buff, print_format format);
/* 800DC1D0 local  */ extern char* long2str(long num, char* buff, print_format format);
/* 800DC3F4 local  */ extern const char* parse_format(const char* format_string, va_list* arg, print_format* format);
// ======================= scanf.c ====================================================
/* 800DC8CC global */ extern int __StringRead(void* isc, int ch, int Action);
// ======================= string.c ===================================================
/* 800DC95C global */ extern char* strchr(const char* str, int chr);
/* 800DC98C global */ extern int strncmp(const char* str1, const char* str2, size_t n);
/* 800DC9CC global */ extern int strcmp(const char* str1, const char* str2);
/* 800DCAF0 global */ extern UNK_TYPE strcat(UNK_TYPE...);
/* 800DCB1C global */ extern char* strncpy(char* dst, const char* src, size_t n);
/* 800DCB60 global */ extern char* strcpy(char* dst, const char* src);
/* 800DCC14 global */ extern size_t strlen(const char* str);
// ======================= strtoul.c ==================================================
/* 800DCC34 global */ extern int atoi(const char * str);
/* 800DCCF8 global */ extern UNK_TYPE __strtoul(UNK_TYPE...);
// ======================= uart_console_io.c ==========================================
/* 800DD040 global */ extern int __close_console(__file_handle handle);
/* 800DD048 global */ extern int __write_console(__file_handle handle, unsigned char* buffer, size_t* count, __ref_con ref_con);
/* 800DD0E0 global */ extern int __read_console(__file_handle handle, unsigned char* buffer, size_t* count, __ref_con ref_con);
// ======================= float.c ====================================================
// ======================= wchar_io.c =================================================
/* 800DD1C0 global */ extern int fwide(FILE* stream, int mode);
// ======================= e_asin.c ===================================================
/* 800DD240 weak   */ extern UNK_TYPE fabs__Fd(UNK_TYPE...);
// ======================= e_pow.c ====================================================
/* 800DD248 global */ extern f64 __ieee754_pow(f64 x, f64 y);
/* 800DDA60 weak   */ extern UNK_TYPE scalbn(UNK_TYPE...);
// ======================= fminmaxdim.c ===============================================
/* 800DDA80 weak   */ extern UNK_TYPE __fpclassifyd__Fd(UNK_TYPE...);
// ======================= s_ceil.c ===================================================
/* 800DDB00 global */ extern f64 ceil(f64 x);
// ======================= s_copysign.c ===============================================
/* 800DDC68 global */ extern f64 copysign(f64 x, f64 y);
// ======================= s_floor.c ==================================================
/* 800DDC94 global */ extern f64 floor(f64 x);
// ======================= s_frexp.c ==================================================
/* 800DDE00 global */ extern f64 frexp(f64 x, int* eptr);
// ======================= s_ldexp.c ==================================================
/* 800DDE9C global */ extern f64 ldexp(f64 x, int n);
// ======================= w_pow.c ====================================================
/* 800DE014 global */ extern f64 pow(f64 x, f64 y);
// ======================= hyperbolicsf.c =============================================
/* 800DE034 weak   */ extern UNK_TYPE fabsf__Ff(UNK_TYPE...);
// ======================= log10f.c ===================================================
/* 800DE03C global */ extern f32 log10f(f32 x);
// ======================= trigf.c ====================================================
/* 800DE210 global */ extern f32 tanf(f32 x);
/* 800DE254 weak   */ extern UNK_TYPE cos__Ff(UNK_TYPE...);
/* 800DE274 weak   */ extern UNK_TYPE sin__Ff(UNK_TYPE...);
/* 800DE294 global */ extern f32 cosf(f32 x);
/* 800DE428 global */ extern f32 sinf(f32 x);
/* 800DE5CC local  */ extern UNK_TYPE __sinit_trigf_c(UNK_TYPE...);
// ======================= math_inlines.c =============================================
/* 800DE5FC global */ extern f64 sqrt(f64 x);
// ======================= common_float_tables.c ======================================
// ======================= AmcExi2Stubs.c =============================================
/* 800DE68C global */ extern UNK_TYPE EXI2_Init(UNK_TYPE...);
/* 800DE690 global */ extern UNK_TYPE EXI2_EnableInterrupts(UNK_TYPE...);
/* 800DE694 global */ extern UNK_TYPE EXI2_Poll(UNK_TYPE...);
/* 800DE69C global */ extern UNK_TYPE EXI2_ReadN(UNK_TYPE...);
/* 800DE6A4 global */ extern UNK_TYPE EXI2_WriteN(UNK_TYPE...);
/* 800DE6AC global */ extern UNK_TYPE EXI2_Reserve(UNK_TYPE...);
/* 800DE6B0 global */ extern UNK_TYPE EXI2_Unreserve(UNK_TYPE...);
/* 800DE6B4 global */ extern UNK_TYPE AMC_IsStub(UNK_TYPE...);
// ======================= DebuggerDriver.c ===========================================
/* 800DE6BC global */ extern UNK_TYPE DBClose(UNK_TYPE...);
/* 800DE6C0 global */ extern UNK_TYPE DBOpen(UNK_TYPE...);
/* 800DE6C4 global */ extern UNK_TYPE DBWrite(UNK_TYPE...);
/* 800DE924 global */ extern UNK_TYPE DBRead(UNK_TYPE...);
/* 800DE9B0 global */ extern UNK_TYPE DBQueryData(UNK_TYPE...);
/* 800DEA4C global */ extern UNK_TYPE DBInitInterrupts(UNK_TYPE...);
/* 800DEAA0 global */ extern UNK_TYPE DBInitComm(UNK_TYPE...);
/* 800DEB18 local  */ extern UNK_TYPE DBGHandler(UNK_TYPE...);
/* 800DEB58 local  */ extern UNK_TYPE MWCallback(UNK_TYPE...);
/* 800DEB94 local  */ extern UNK_TYPE DBGReadStatus(UNK_TYPE...);
/* 800DEC40 local  */ extern UNK_TYPE DBGWrite(UNK_TYPE...);
/* 800DED1C local  */ extern UNK_TYPE DBGRead(UNK_TYPE...);
/* 800DEDF8 local  */ extern UNK_TYPE DBGReadMailbox(UNK_TYPE...);
/* 800DEEA4 local  */ extern UNK_TYPE DBGEXIImm(UNK_TYPE...);
// ======================= odenotstub.c ===============================================
/* 800DF13C weak   */ extern UNK_TYPE Hu_IsStub(UNK_TYPE...);

#endif
