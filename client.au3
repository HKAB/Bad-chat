#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiRichEdit.au3>
#include <Color.au3>

TCPStartup()

Func ReadBmpToRtf($sBmpFilspc)
	Local $hFile, $sRtf
	$hFile = FileOpen($sBmpFilspc, $FO_BINARY)
	If FileRead($hFile, 2) <> "0x424D" Then Return SetError(1, 0, "")
	FileRead($hFile, 12)
	$sRtf = '{\rtf1{\pict\dibitmap ' & Hex(FileRead($hFile)) & '}}'
	FileClose($hFile)
	Return $sRtf
EndFunc   ;==>ReadBmpToRtf

#Region ### START Koda GUI section ### Form=
$hGui = GUICreate("Bad chat", 450, 431, 665, 173)
$hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 24, 8, 401, 369, BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL,  $ES_READONLY))
$ipn_msg = GUICtrlCreateInput("", 24, 384, 361, 21)
$btn_send = GUICtrlCreateButton(">", 400, 384, 27, 25)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$isConnected = True
$sIPAdress = "127.0.0.1"
$sPort = 65432

Local $iSocket = TCPConnect($sIPAdress, $sPort)
if @error Then
	Local $iError = @error
	MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Could not connect, Error code: " & $iError)
	$isConnected = False
EndIf

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btn_send
			$data = GUICtrlRead($ipn_msg)
			TCPSend($iSocket, $data)
			if @error Then
				Local $iError = @error
				MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Could not send the message, Error code: " & $iError)
				$isConnected = False
			EndIf
	EndSwitch
	$recv = TCPRecv($iSocket, 100000)
	If ($recv <> "") Then
		_GUICtrlRichEdit_SetText($hRichEdit, $recv)
		_ClipBoard_SetData($recv)
	EndIf
WEnd