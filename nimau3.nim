## Little wrapper for AutoItX3 in nim-lang
## testet with autoit-v3.3.14.2
## more infos:
##  https://www.autoitscript.com/site/autoit/
## docs:
##  https://www.autoitscript.com/autoit3/docs/
##
## Place the AutoItX3.dll next to this file.
##
## use the proc `L` to fill the functions like so:
##  L"my nice string"

#/////////////////////////////////////////////////////////////////////////////
#
# AutoItX v3
#
# Copyright (C)1999-2013:
#		- Jonathan Bennett <jon at autoitscript dot com>
#		- See "AUTHORS.txt" for contributors.
#
# This file is part of AutoItX.  Use of this file and the AutoItX DLL is subject
# to the terms of the AutoItX license details of which can be found in the helpfile.
#
# When using the AutoItX3.dll as a standard DLL this file contains the definitions,
# and function declarations required to use the DLL and AutoItX3_DLL.lib file.
#
#/////////////////////////////////////////////////////////////////////////////

# Definitions
const
  AU3_INTDEFAULT* = (- 2147483647) # "Default" value for _some_ int parameters (largest negative number)

#
# nBufSize
# When used for specifying the size of a resulting string buffer this is the number of CHARACTERS
# in that buffer, including the null terminator.  For example:
#
# WCHAR szBuffer[10];
# AU3_ClipGet(szBuffer, 10);
#
# The resulting string will be truncated at 9 characters with the the terminating null in the 10th.
#
#/////////////////////////////////////////////////////////////////////////////
# Exported functions
#/////////////////////////////////////////////////////////////////////////////

import windows
const dllname = "AutoItX3.dll"

proc AU3_Init*() {.cdecl, importc: "AU3_Init", dynlib: dllname.}
proc AU3_error*(): cint {.cdecl, importc: "AU3_error", dynlib: dllname.}
proc AU3_AutoItSetOption*(szOption: LPCWSTR; nValue: cint): cint {.cdecl,
    importc: "AU3_AutoItSetOption", dynlib: dllname.}
proc AU3_ClipGet*(szClip: LPWSTR; nBufSize: cint) {.cdecl, importc: "AU3_ClipGet",
    dynlib: dllname.}
proc AU3_ClipPut*(szClip: LPCWSTR) {.cdecl, importc: "AU3_ClipPut", dynlib: dllname.}
proc AU3_ControlClick*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                      szButton: LPCWSTR; nNumClicks: cint;
                      nX: cint = AU3_INTDEFAULT; nY: cint = AU3_INTDEFAULT): cint {.
    cdecl, importc: "AU3_ControlClick", dynlib: dllname.}
proc AU3_ControlClickByHandle*(hWnd: HWND; hCtrl: HWND; szButton: LPCWSTR;
                              nNumClicks: cint; nX: cint = AU3_INTDEFAULT;
                              nY: cint = AU3_INTDEFAULT): cint {.cdecl,
    importc: "AU3_ControlClickByHandle", dynlib: dllname.}
proc AU3_ControlCommand*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                        szCommand: LPCWSTR; szExtra: LPCWSTR; szResult: LPWSTR;
                        nBufSize: cint) {.cdecl, importc: "AU3_ControlCommand",
                                        dynlib: dllname.}
proc AU3_ControlCommandByHandle*(hWnd: HWND; hCtrl: HWND; szCommand: LPCWSTR;
                                szExtra: LPCWSTR; szResult: LPWSTR; nBufSize: cint) {.
    cdecl, importc: "AU3_ControlCommandByHandle", dynlib: dllname.}
proc AU3_ControlListView*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                         szCommand: LPCWSTR; szExtra1: LPCWSTR; szExtra2: LPCWSTR;
                         szResult: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_ControlListView", dynlib: dllname.}
proc AU3_ControlListViewByHandle*(hWnd: HWND; hCtrl: HWND; szCommand: LPCWSTR;
                                 szExtra1: LPCWSTR; szExtra2: LPCWSTR;
                                 szResult: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_ControlListViewByHandle", dynlib: dllname.}
proc AU3_ControlDisable*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR): cint {.
    cdecl, importc: "AU3_ControlDisable", dynlib: dllname.}
proc AU3_ControlDisableByHandle*(hWnd: HWND; hCtrl: HWND): cint {.cdecl,
    importc: "AU3_ControlDisableByHandle", dynlib: dllname.}
proc AU3_ControlEnable*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR): cint {.
    cdecl, importc: "AU3_ControlEnable", dynlib: dllname.}
proc AU3_ControlEnableByHandle*(hWnd: HWND; hCtrl: HWND): cint {.cdecl,
    importc: "AU3_ControlEnableByHandle", dynlib: dllname.}
proc AU3_ControlFocus*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR): cint {.
    cdecl, importc: "AU3_ControlFocus", dynlib: dllname.}
proc AU3_ControlFocusByHandle*(hWnd: HWND; hCtrl: HWND): cint {.cdecl,
    importc: "AU3_ControlFocusByHandle", dynlib: dllname.}
proc AU3_ControlGetFocus*(szTitle: LPCWSTR; szText: LPCWSTR;
                         szControlWithFocus: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_ControlGetFocus", dynlib: dllname.}
proc AU3_ControlGetFocusByHandle*(hWnd: HWND; szControlWithFocus: LPWSTR;
                                 nBufSize: cint) {.cdecl,
    importc: "AU3_ControlGetFocusByHandle", dynlib: dllname.}
proc AU3_ControlGetHandle*(hWnd: HWND; szControl: LPCWSTR): HWND {.cdecl,
    importc: "AU3_ControlGetHandle", dynlib: dllname.}
proc AU3_ControlGetHandleAsText*(szTitle: LPCWSTR; szText: LPCWSTR;
                                szControl: LPCWSTR; szRetText: LPWSTR;
                                nBufSize: cint) {.cdecl,
    importc: "AU3_ControlGetHandleAsText", dynlib: dllname.}
proc AU3_ControlGetPos*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                       lpRect: LPRECT): cint {.cdecl, importc: "AU3_ControlGetPos",
    dynlib: dllname.}
proc AU3_ControlGetPosByHandle*(hWnd: HWND; hCtrl: HWND; lpRect: LPRECT): cint {.cdecl,
    importc: "AU3_ControlGetPosByHandle", dynlib: dllname.}
proc AU3_ControlGetText*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                        szControlText: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_ControlGetText", dynlib: dllname.}
proc AU3_ControlGetTextByHandle*(hWnd: HWND; hCtrl: HWND; szControlText: LPWSTR;
                                nBufSize: cint) {.cdecl,
    importc: "AU3_ControlGetTextByHandle", dynlib: dllname.}
proc AU3_ControlHide*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR): cint {.
    cdecl, importc: "AU3_ControlHide", dynlib: dllname.}
proc AU3_ControlHideByHandle*(hWnd: HWND; hCtrl: HWND): cint {.cdecl,
    importc: "AU3_ControlHideByHandle", dynlib: dllname.}
proc AU3_ControlMove*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR; nX: cint;
                     nY: cint; nWidth: cint = - 1; nHeight: cint = - 1): cint {.cdecl,
    importc: "AU3_ControlMove", dynlib: dllname.}
proc AU3_ControlMoveByHandle*(hWnd: HWND; hCtrl: HWND; nX: cint; nY: cint;
                             nWidth: cint = - 1; nHeight: cint = - 1): cint {.cdecl,
    importc: "AU3_ControlMoveByHandle", dynlib: dllname.}
proc AU3_ControlSend*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                     szSendText: LPCWSTR; nMode: cint = 0): cint {.cdecl,
    importc: "AU3_ControlSend", dynlib: dllname.}
proc AU3_ControlSendByHandle*(hWnd: HWND; hCtrl: HWND; szSendText: LPCWSTR;
                             nMode: cint = 0): cint {.cdecl,
    importc: "AU3_ControlSendByHandle", dynlib: dllname.}
proc AU3_ControlSetText*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                        szControlText: LPCWSTR): cint {.cdecl,
    importc: "AU3_ControlSetText", dynlib: dllname.}
proc AU3_ControlSetTextByHandle*(hWnd: HWND; hCtrl: HWND; szControlText: LPCWSTR): cint {.
    cdecl, importc: "AU3_ControlSetTextByHandle", dynlib: dllname.}
proc AU3_ControlShow*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR): cint {.
    cdecl, importc: "AU3_ControlShow", dynlib: dllname.}
proc AU3_ControlShowByHandle*(hWnd: HWND; hCtrl: HWND): cint {.cdecl,
    importc: "AU3_ControlShowByHandle", dynlib: dllname.}
proc AU3_ControlTreeView*(szTitle: LPCWSTR; szText: LPCWSTR; szControl: LPCWSTR;
                         szCommand: LPCWSTR; szExtra1: LPCWSTR; szExtra2: LPCWSTR;
                         szResult: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_ControlTreeView", dynlib: dllname.}
proc AU3_ControlTreeViewByHandle*(hWnd: HWND; hCtrl: HWND; szCommand: LPCWSTR;
                                 szExtra1: LPCWSTR; szExtra2: LPCWSTR;
                                 szResult: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_ControlTreeViewByHandle", dynlib: dllname.}
proc AU3_DriveMapAdd*(szDevice: LPCWSTR; szShare: LPCWSTR; nFlags: cint;
                     szUser: LPCWSTR; szPwd: LPCWSTR; szResult: LPWSTR; nBufSize: cint) {.
    cdecl, importc: "AU3_DriveMapAdd", dynlib: dllname.}
proc AU3_DriveMapDel*(szDevice: LPCWSTR): cint {.cdecl, importc: "AU3_DriveMapDel",
    dynlib: dllname.}
proc AU3_DriveMapGet*(szDevice: LPCWSTR; szMapping: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_DriveMapGet", dynlib: dllname.}
proc AU3_IsAdmin*(): cint {.cdecl, importc: "AU3_IsAdmin", dynlib: dllname.}
proc AU3_MouseClick*(szButton: LPCWSTR; nX: cint = AU3_INTDEFAULT;
                    nY: cint = AU3_INTDEFAULT; nClicks: cint = 1; nSpeed: cint = - 1): cint {.
    cdecl, importc: "AU3_MouseClick", dynlib: dllname.}
proc AU3_MouseClickDrag*(szButton: LPCWSTR; nX1: cint; nY1: cint; nX2: cint; nY2: cint;
                        nSpeed: cint = - 1): cint {.cdecl,
    importc: "AU3_MouseClickDrag", dynlib: dllname.}
proc AU3_MouseDown*(szButton: LPCWSTR) {.cdecl, importc: "AU3_MouseDown",
                                      dynlib: dllname.}
proc AU3_MouseGetCursor*(): cint {.cdecl, importc: "AU3_MouseGetCursor",
                                dynlib: dllname.}
proc AU3_MouseGetPos*(lpPoint: LPPOINT) {.cdecl, importc: "AU3_MouseGetPos",
                                       dynlib: dllname.}
proc AU3_MouseMove*(nX: cint; nY: cint; nSpeed: cint = - 1): cint {.cdecl,
    importc: "AU3_MouseMove", dynlib: dllname.}
proc AU3_MouseUp*(szButton: LPCWSTR) {.cdecl, importc: "AU3_MouseUp", dynlib: dllname.}
proc AU3_MouseWheel*(szDirection: LPCWSTR; nClicks: cint) {.cdecl,
    importc: "AU3_MouseWheel", dynlib: dllname.}
proc AU3_Opt*(szOption: LPCWSTR; nValue: cint): cint {.cdecl, importc: "AU3_Opt",
    dynlib: dllname.}
proc AU3_PixelChecksum*(lpRect: LPRECT; nStep: cint = 1): cuint {.cdecl,
    importc: "AU3_PixelChecksum", dynlib: dllname.}
proc AU3_PixelGetColor*(nX: cint; nY: cint): cint {.cdecl,
    importc: "AU3_PixelGetColor", dynlib: dllname.}
proc AU3_PixelSearch*(lpRect: LPRECT; nCol: cint; nVar: cint; nStep: cint;
                     pPointResult: LPPOINT) {.cdecl, importc: "AU3_PixelSearch",
    dynlib: dllname.}
  #default 1
proc AU3_ProcessClose*(szProcess: LPCWSTR): cint {.cdecl,
    importc: "AU3_ProcessClose", dynlib: dllname.}
proc AU3_ProcessExists*(szProcess: LPCWSTR): cint {.cdecl,
    importc: "AU3_ProcessExists", dynlib: dllname.}
proc AU3_ProcessSetPriority*(szProcess: LPCWSTR; nPriority: cint): cint {.cdecl,
    importc: "AU3_ProcessSetPriority", dynlib: dllname.}
proc AU3_ProcessWait*(szProcess: LPCWSTR; nTimeout: cint = 0): cint {.cdecl,
    importc: "AU3_ProcessWait", dynlib: dllname.}
proc AU3_ProcessWaitClose*(szProcess: LPCWSTR; nTimeout: cint = 0): cint {.cdecl,
    importc: "AU3_ProcessWaitClose", dynlib: dllname.}
proc AU3_Run*(szProgram: LPCWSTR; szDir: LPCWSTR; nShowFlag: cint = SW_SHOWNORMAL): cint {.
    cdecl, importc: "AU3_Run", dynlib: dllname.}
proc AU3_RunWait*(szProgram: LPCWSTR; szDir: LPCWSTR; nShowFlag: cint = SW_SHOWNORMAL): cint {.
    cdecl, importc: "AU3_RunWait", dynlib: dllname.}
proc AU3_RunAs*(szUser: LPCWSTR; szDomain: LPCWSTR; szPassword: LPCWSTR;
               nLogonFlag: cint; szProgram: LPCWSTR; szDir: LPCWSTR;
               nShowFlag: cint = SW_SHOWNORMAL): cint {.cdecl, importc: "AU3_RunAs",
    dynlib: dllname.}
proc AU3_RunAsWait*(szUser: LPCWSTR; szDomain: LPCWSTR; szPassword: LPCWSTR;
                   nLogonFlag: cint; szProgram: LPCWSTR; szDir: LPCWSTR;
                   nShowFlag: cint = SW_SHOWNORMAL): cint {.cdecl,
    importc: "AU3_RunAsWait", dynlib: dllname.}
proc AU3_Send*(szSendText: LPCWSTR; nMode: cint = 0) {.cdecl, importc: "AU3_Send",
    dynlib: dllname.}
proc AU3_Shutdown*(nFlags: cint): cint {.cdecl, importc: "AU3_Shutdown",
                                     dynlib: dllname.}
proc AU3_Sleep*(nMilliseconds: cint) {.cdecl, importc: "AU3_Sleep", dynlib: dllname.}
proc AU3_StatusbarGetText*(szTitle: LPCWSTR; szText: LPCWSTR; nPart: cint;
                          szStatusText: LPWSTR; nBufSize: cint): cint {.cdecl,
    importc: "AU3_StatusbarGetText", dynlib: dllname.}
proc AU3_StatusbarGetTextByHandle*(hWnd: HWND; nPart: cint; szStatusText: LPWSTR;
                                  nBufSize: cint): cint {.cdecl,
    importc: "AU3_StatusbarGetTextByHandle", dynlib: dllname.}
proc AU3_ToolTip*(szTip: LPCWSTR; nX: cint = AU3_INTDEFAULT; nY: cint = AU3_INTDEFAULT) {.
    cdecl, importc: "AU3_ToolTip", dynlib: dllname.}
proc AU3_WinActivate*(szTitle: LPCWSTR; szText: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinActivate", dynlib: dllname.}
proc AU3_WinActivateByHandle*(hWnd: HWND): cint {.cdecl,
    importc: "AU3_WinActivateByHandle", dynlib: dllname.}
proc AU3_WinActive*(szTitle: LPCWSTR; szText: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinActive", dynlib: dllname.}
proc AU3_WinActiveByHandle*(hWnd: HWND): cint {.cdecl,
    importc: "AU3_WinActiveByHandle", dynlib: dllname.}
proc AU3_WinClose*(szTitle: LPCWSTR; szText: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinClose", dynlib: dllname.}
proc AU3_WinCloseByHandle*(hWnd: HWND): cint {.cdecl,
    importc: "AU3_WinCloseByHandle", dynlib: dllname.}
proc AU3_WinExists*(szTitle: LPCWSTR; szText: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinExists", dynlib: dllname.}
proc AU3_WinExistsByHandle*(hWnd: HWND): cint {.cdecl,
    importc: "AU3_WinExistsByHandle", dynlib: dllname.}
proc AU3_WinGetCaretPos*(lpPoint: LPPOINT): cint {.cdecl,
    importc: "AU3_WinGetCaretPos", dynlib: dllname.}
proc AU3_WinGetClassList*(szTitle: LPCWSTR; szText: LPCWSTR; szRetText: LPWSTR;
                         nBufSize: cint) {.cdecl, importc: "AU3_WinGetClassList",
    dynlib: dllname.}
proc AU3_WinGetClassListByHandle*(hWnd: HWND; szRetText: LPWSTR; nBufSize: cint) {.
    cdecl, importc: "AU3_WinGetClassListByHandle", dynlib: dllname.}
proc AU3_WinGetClientSize*(szTitle: LPCWSTR; szText: LPCWSTR; lpRect: LPRECT): cint {.
    cdecl, importc: "AU3_WinGetClientSize", dynlib: dllname.}
proc AU3_WinGetClientSizeByHandle*(hWnd: HWND; lpRect: LPRECT): cint {.cdecl,
    importc: "AU3_WinGetClientSizeByHandle", dynlib: dllname.}
proc AU3_WinGetHandle*(szTitle: LPCWSTR; szText: LPCWSTR): HWND {.cdecl,
    importc: "AU3_WinGetHandle", dynlib: dllname.}
proc AU3_WinGetHandleAsText*(szTitle: LPCWSTR; szText: LPCWSTR; szRetText: LPWSTR;
                            nBufSize: cint) {.cdecl,
    importc: "AU3_WinGetHandleAsText", dynlib: dllname.}
proc AU3_WinGetPos*(szTitle: LPCWSTR; szText: LPCWSTR; lpRect: LPRECT): cint {.cdecl,
    importc: "AU3_WinGetPos", dynlib: dllname.}
proc AU3_WinGetPosByHandle*(hWnd: HWND; lpRect: LPRECT): cint {.cdecl,
    importc: "AU3_WinGetPosByHandle", dynlib: dllname.}
proc AU3_WinGetProcess*(szTitle: LPCWSTR; szText: LPCWSTR): DWORD {.cdecl,
    importc: "AU3_WinGetProcess", dynlib: dllname.}
proc AU3_WinGetProcessByHandle*(hWnd: HWND): DWORD {.cdecl,
    importc: "AU3_WinGetProcessByHandle", dynlib: dllname.}
proc AU3_WinGetState*(szTitle: LPCWSTR; szText: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinGetState", dynlib: dllname.}
proc AU3_WinGetStateByHandle*(hWnd: HWND): cint {.cdecl,
    importc: "AU3_WinGetStateByHandle", dynlib: dllname.}
proc AU3_WinGetText*(szTitle: LPCWSTR; szText: LPCWSTR; szRetText: LPWSTR;
                    nBufSize: cint) {.cdecl, importc: "AU3_WinGetText",
                                    dynlib: dllname.}
proc AU3_WinGetTextByHandle*(hWnd: HWND; szRetText: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_WinGetTextByHandle", dynlib: dllname.}
proc AU3_WinGetTitle*(szTitle: LPCWSTR; szText: LPCWSTR; szRetText: LPWSTR;
                     nBufSize: cint) {.cdecl, importc: "AU3_WinGetTitle",
                                     dynlib: dllname.}
proc AU3_WinGetTitleByHandle*(hWnd: HWND; szRetText: LPWSTR; nBufSize: cint) {.cdecl,
    importc: "AU3_WinGetTitleByHandle", dynlib: dllname.}
proc AU3_WinKill*(szTitle: LPCWSTR; szText: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinKill", dynlib: dllname.}
proc AU3_WinKillByHandle*(hWnd: HWND): cint {.cdecl, importc: "AU3_WinKillByHandle",
    dynlib: dllname.}
proc AU3_WinMenuSelectItem*(szTitle: LPCWSTR; szText: LPCWSTR; szItem1: LPCWSTR;
                           szItem2: LPCWSTR; szItem3: LPCWSTR; szItem4: LPCWSTR;
                           szItem5: LPCWSTR; szItem6: LPCWSTR; szItem7: LPCWSTR;
                           szItem8: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinMenuSelectItem", dynlib: dllname.}
proc AU3_WinMenuSelectItemByHandle*(hWnd: HWND; szItem1: LPCWSTR; szItem2: LPCWSTR;
                                   szItem3: LPCWSTR; szItem4: LPCWSTR;
                                   szItem5: LPCWSTR; szItem6: LPCWSTR;
                                   szItem7: LPCWSTR; szItem8: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinMenuSelectItemByHandle", dynlib: dllname.}
proc AU3_WinMinimizeAll*() {.cdecl, importc: "AU3_WinMinimizeAll", dynlib: dllname.}
proc AU3_WinMinimizeAllUndo*() {.cdecl, importc: "AU3_WinMinimizeAllUndo",
                               dynlib: dllname.}
proc AU3_WinMove*(szTitle: LPCWSTR; szText: LPCWSTR; nX: cint; nY: cint;
                 nWidth: cint = - 1; nHeight: cint = - 1): cint {.cdecl,
    importc: "AU3_WinMove", dynlib: dllname.}
proc AU3_WinMoveByHandle*(hWnd: HWND; nX: cint; nY: cint; nWidth: cint = - 1;
                         nHeight: cint = - 1): cint {.cdecl,
    importc: "AU3_WinMoveByHandle", dynlib: dllname.}
proc AU3_WinSetOnTop*(szTitle: LPCWSTR; szText: LPCWSTR; nFlag: cint): cint {.cdecl,
    importc: "AU3_WinSetOnTop", dynlib: dllname.}
proc AU3_WinSetOnTopByHandle*(hWnd: HWND; nFlag: cint): cint {.cdecl,
    importc: "AU3_WinSetOnTopByHandle", dynlib: dllname.}
proc AU3_WinSetState*(szTitle: LPCWSTR; szText: LPCWSTR; nFlags: cint): cint {.cdecl,
    importc: "AU3_WinSetState", dynlib: dllname.}
proc AU3_WinSetStateByHandle*(hWnd: HWND; nFlags: cint): cint {.cdecl,
    importc: "AU3_WinSetStateByHandle", dynlib: dllname.}
proc AU3_WinSetTitle*(szTitle: LPCWSTR; szText: LPCWSTR; szNewTitle: LPCWSTR): cint {.
    cdecl, importc: "AU3_WinSetTitle", dynlib: dllname.}
proc AU3_WinSetTitleByHandle*(hWnd: HWND; szNewTitle: LPCWSTR): cint {.cdecl,
    importc: "AU3_WinSetTitleByHandle", dynlib: dllname.}
proc AU3_WinSetTrans*(szTitle: LPCWSTR; szText: LPCWSTR; nTrans: cint): cint {.cdecl,
    importc: "AU3_WinSetTrans", dynlib: dllname.}
proc AU3_WinSetTransByHandle*(hWnd: HWND; nTrans: cint): cint {.cdecl,
    importc: "AU3_WinSetTransByHandle", dynlib: dllname.}
proc AU3_WinWait*(szTitle: LPCWSTR; szText: LPCWSTR; nTimeout: cint = 0): cint {.cdecl,
    importc: "AU3_WinWait", dynlib: dllname.}
proc AU3_WinWaitByHandle*(hWnd: HWND; nTimeout: cint): cint {.cdecl,
    importc: "AU3_WinWaitByHandle", dynlib: dllname.}
proc AU3_WinWaitActive*(szTitle: LPCWSTR; szText: LPCWSTR; nTimeout: cint = 0): cint {.
    cdecl, importc: "AU3_WinWaitActive", dynlib: dllname.}
proc AU3_WinWaitActiveByHandle*(hWnd: HWND; nTimeout: cint): cint {.cdecl,
    importc: "AU3_WinWaitActiveByHandle", dynlib: dllname.}
proc AU3_WinWaitClose*(szTitle: LPCWSTR; szText: LPCWSTR; nTimeout: cint = 0): cint {.
    cdecl, importc: "AU3_WinWaitClose", dynlib: dllname.}
proc AU3_WinWaitCloseByHandle*(hWnd: HWND; nTimeout: cint): cint {.cdecl,
    importc: "AU3_WinWaitCloseByHandle", dynlib: dllname.}
proc AU3_WinWaitNotActive*(szTitle: LPCWSTR; szText: LPCWSTR; nTimeout: cint): cint {.
    cdecl, importc: "AU3_WinWaitNotActive", dynlib: dllname.}
proc AU3_WinWaitNotActiveByHandle*(hWnd: HWND; nTimeout: cint = 0): cint {.cdecl,
    importc: "AU3_WinWaitNotActiveByHandle", dynlib: dllname.}
#/////////////////////////////////////////////////////////////////////////////

proc `L`* (str:string): LPCWSTR =
  ## use this to fill the wrapped functions
  ## like so:
  ##  `AU3_ClipPut( L"huhu" )`
  return cast[LPCWSTR]( newWideCString(str) )


when isMainModule:
  AU3_Init()
  AU3_ClipPut( L"huhu" )

  # we tell autoit to match anywhere in the title
  discard AU3_AutoItSetOption(L"WinTitleMatchMode" , cint(2) )
  echo AU3_WinSetTitle(szTitle = L"Editor" ,
                  szText = L"",
                  szNewTitle = L"Hello my friend :)")

  echo AU3_WinKill(L"Rechner",L"")
