#include <MsgBoxConstants.au3>
#include <Color.au3>
#include <FileConstants.au3>


OnAutoItExitRegister("OnAutoItExit")

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

Local $aColor[3]
$aColor[0] = Random(0, 255, 1)
$aColor[1] = Random(0, 255, 1)
$aColor[2] = Random(0, 255, 1)
$rColor1 = _ColorSetRGB($aColor)

$aColor[0] = Random(0, 255, 1)
$aColor[1] = Random(0, 255, 1)
$aColor[2] = Random(0, 255, 1)
$rColor2 = _ColorSetRGB($aColor)
$userName1 = "anonymous@" & String(Random(0, 69, 1))
$userName2 = "anonymous@" & String(Random(0, 69, 1))

$sContent = "{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1033{\fonttbl{\f0\fnil\fcharset0 MS Shell Dlg;}}" &@CRLF & "{\colortbl ;\red" & _ColorGetRed($rColor1) &"\green" & _ColorGetGreen($rColor1) &"\blue" & _ColorGetBlue($rColor1) &";\red" & _ColorGetRed($rColor2) &"\green" & _ColorGetGreen($rColor2) &"\blue" & _ColorGetBlue($rColor2) &";}" &@CRLF & "{\*\generator Riched20 10.0.17763}\viewkind4\uc1 " &@CRLF & "\pard\cf1\b\f0\fs15 Connected \par"
$eContent = @CRLF & "}"

;$icon = ReadBmpToRtf("C:\Users\hkab\Desktop\PACMAN.bmp")
Local $icon = "{\pict{\*\picprop}\wmetafile8\picw508\pich508\picwgoal288\pichgoal288 " & @CRLF & "010009000003990500000200420300000000050000000b0200000000050000000c02fc01fc0105" & @CRLF & "020000f7000003000100000000800000000080000080800000000080008000800000808000c0c0" & @CRLF & "c000c0dcc000a6caf000402000006020000080200000a0200000c0200000e02000000040000020" & @CRLF & "400000404000006040000080400000a0400000c0400000e0400000006000002060000040600000" & @CRLF & "6060000080600000a0600000c0600000e060000000800000208000004080000060800000808000" & @CRLF & "00a0800000c0800000e080000000a0000020a0000040a0000060a0000080a00000a0a00000c0a0" & @CRLF & "0000e0a0000000c0000020c0000040c0000060c0000080c00000a0c00000c0c00000e0c0000000" & @CRLF & "e0000020e0000040e0000060e0000080e00000a0e00000c0e00000e0e000000000400020004000" & @CRLF & "400040006000400080004000a0004000c0004000e0004000002040002020400040204000602040" & @CRLF & "0080204000a0204000c0204000e02040000040400020404000404040006040400080404000a040" & @CRLF & "4000c0404000e04040000060400020604000406040006060400080604000a0604000c0604000e0" & @CRLF & "6040000080400020804000408040006080400080804000a0804000c0804000e080400000a04000" & @CRLF & "20a0400040a0400060a0400080a04000a0a04000c0a04000e0a0400000c0400020c0400040c040" & @CRLF & "0060c0400080c04000a0c04000c0c04000e0c0400000e0400020e0400040e0400060e0400080e0" & @CRLF & "4000a0e04000c0e04000e0e040000000800020008000400080006000800080008000a0008000c0" & @CRLF & "008000e00080000020800020208000402080006020800080208000a0208000c0208000e0208000" & @CRLF & "0040800020408000404080006040800080408000a0408000c0408000e040800000608000206080" & @CRLF & "00406080006060800080608000a0608000c0608000e06080000080800020808000408080006080" & @CRLF & "800080808000a0808000c0808000e080800000a0800020a0800040a0800060a0800080a08000a0" & @CRLF & "a08000c0a08000e0a0800000c0800020c0800040c0800060c0800080c08000a0c08000c0c08000" & @CRLF & "e0c0800000e0800020e0800040e0800060e0800080e08000a0e08000c0e08000e0e080000000c0" & @CRLF & "002000c0004000c0006000c0008000c000a000c000c000c000e000c0000020c0002020c0004020" & @CRLF & "c0006020c0008020c000a020c000c020c000e020c0000040c0002040c0004040c0006040c00080" & @CRLF & "40c000a040c000c040c000e040c0000060c0002060c0004060c0006060c0008060c000a060c000" & @CRLF & "c060c000e060c0000080c0002080c0004080c0006080c0008080c000a080c000c080c000e080c0" & @CRLF & "0000a0c00020a0c00040a0c00060a0c00080a0c000a0a0c000c0a0c000e0a0c00000c0c00020c0" & @CRLF & "c00040c0c00060c0c00080c0c000a0c0c000fffbf000a0a0a40080808000ff00000000ff0000ff" & @CRLF & "ff00000000ff00ff00ff0000ffff00ffffff00040000003402000003000000350042030000430f" & @CRLF & "2000cc0000001800180000000000fc01fc01000000002800000018000000180000000100080000" & @CRLF & "000000400200007412000074120000000000000000000000000000000080000080000000808000" & @CRLF & "800000008000800080800000c0c0c000c0dcc000f0caa6000020400000206000002080000020a0" & @CRLF & "000020c0000020e00000400000004020000040400000406000004080000040a0000040c0000040" & @CRLF & "e00000600000006020000060400000606000006080000060a0000060c0000060e0000080000000" & @CRLF & "8020000080400000806000008080000080a0000080c0000080e00000a0000000a0200000a04000" & @CRLF & "00a0600000a0800000a0a00000a0c00000a0e00000c0000000c0200000c0400000c0600000c080" & @CRLF & "0000c0a00000c0c00000c0e00000e0000000e0200000e0400000e0600000e0800000e0a00000e0" & @CRLF & "c00000e0e00040000000400020004000400040006000400080004000a0004000c0004000e00040" & @CRLF & "200000402020004020400040206000402080004020a0004020c0004020e0004040000040402000" & @CRLF
$icon &= "4040400040406000404080004040a0004040c0004040e000406000004060200040604000406060" & @CRLF & "00406080004060a0004060c0004060e00040800000408020004080400040806000408080004080" & @CRLF & "a0004080c0004080e00040a0000040a0200040a0400040a0600040a0800040a0a00040a0c00040" & @CRLF & "a0e00040c0000040c0200040c0400040c0600040c0800040c0a00040c0c00040c0e00040e00000" & @CRLF & "40e0200040e0400040e0600040e0800040e0a00040e0c00040e0e0008000000080002000800040" & @CRLF & "0080006000800080008000a0008000c0008000e000802000008020200080204000802060008020" & @CRLF & "80008020a0008020c0008020e00080400000804020008040400080406000804080008040a00080" & @CRLF & "40c0008040e00080600000806020008060400080606000806080008060a0008060c0008060e000" & @CRLF & "80800000808020008080400080806000808080008080a0008080c0008080e00080a0000080a020" & @CRLF & "0080a0400080a0600080a0800080a0a00080a0c00080a0e00080c0000080c0200080c0400080c0" & @CRLF & "600080c0800080c0a00080c0c00080c0e00080e0000080e0200080e0400080e0600080e0800080" & @CRLF & "e0a00080e0c00080e0e000c0000000c0002000c0004000c0006000c0008000c000a000c000c000" & @CRLF & "c000e000c0200000c0202000c0204000c0206000c0208000c020a000c020c000c020e000c04000" & @CRLF & "00c0402000c0404000c0406000c0408000c040a000c040c000c040e000c0600000c0602000c060" & @CRLF & "4000c0606000c0608000c060a000c060c000c060e000c0800000c0802000c0804000c0806000c0" & @CRLF & "808000c080a000c080c000c080e000c0a00000c0a02000c0a04000c0a06000c0a08000c0a0a000" & @CRLF & "c0a0c000c0a0e000c0c00000c0c02000c0c04000c0c06000c0c08000c0c0a000f0fbff00a4a0a0" & @CRLF & "00808080000000ff0000ff000000ffff00ff000000ff00ff00ffff0000ffffff00ffffffffffff" & @CRLF & "fffff6bfbf77777777b7bff6f6fffffffffffffffffffffff6bf77777777777777777777bff6ff" & @CRLF & "fffffffffffffffff67777777777777777777777777777bff6fffffffffffff6777777777777bf" & @CRLF & "bfbfbfbf7777777777bffffffffffff677777777bfbfbfbfbfbfbfbfbfbf7777bff6fffffffff6" & @CRLF & "bf77777fbfbfbfbfbfbfbfbfbfbfbfbff6ffffffffffffbf7777bfbfbfbfbfbfbfbfbfbfbfbff6" & @CRLF & "fffffffffffffff6777777bfbfbfbfbfbfbfbfbfbff6fffffffffffffffffff67777bfbfbfbfbf" & @CRLF & "bfbfbfbff6ffffffffffffffffffffffbf77bfbfbfbfbfbfbfbff6ffffffffffffffffffffffff" & @CRLF & "f6bf77bfbfbfbfbfbfbf77bff6fffffffffffffffffffffff6bf77bfbfb76464b7bfbf7777bff6" & @CRLF & "fffffffffffffffffff6bf77bfbf64515164bfbfbfbf77bff6fffffffffffffffff6bf77bfb764" & @CRLF & "52515cbfbfbfbfbf77bff6ffffffffffffffffbf77bfbfb65c5baebfbfbfbfbfbf7777bff6ffff" & @CRLF & "fffffffff677bfbfbfb7b7bfbfbfb7aeaeb7bf7f77bff6fffffffffff6bfbfbfbfbfbfbfbfbf65" & @CRLF & "525265bfbfbf77bff6ffffffffffbf77bfbfbfbfbfbfb75b52515bbfbfbfbf7777bff6fffffff6" & @CRLF & "bfbfbfbfbfbfbfbfad5b52adbfbfbfbfbf7777bff6fffffff6bfbfbfbfbfbfbfbfb7b7bfbfbfbf" & @CRLF & "bfbfbf77bff6fffffffff6bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbff6fffffffffffff6bfbfbf" & @CRLF & "bfbfbfbfbfbfbfbfbfbfbfbff6fffffffffffffffff6bfbfbfbfbfbfbfbfbfbfbfbff6ffffffff" & @CRLF & "fffffffffffffffff6bfbfbf777777bfbff6f6ffffffffff2d000000f700000314000000000080" & @CRLF & "0000000080000080800000000080008000800000808000c0c0c000c0dcc000a6caf000fffbf000" & @CRLF & "a0a0a40080808000ff00000000ff0000ffff00000000ff00ff00ff0000ffff00ffffff00040000" & @CRLF & "003402010004000000f0010000030000000000" & @CRLF & "}\par "
;ClipPut($icon)

$sIPAddress = "127.0.0.1"
$iPort = 65432

$chatContent = ""

; Assign a Local variable the socket and bind to the IP Address and Port specified with a maximum of 100 pending connexions.
Local $iListenSocket = TCPListen($sIPAddress, $iPort, 100)
Local $iError = 0

If @error Then
	; Someone is probably already listening on this IP Address and Port (script already running?).
	$iError = @error
	MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Server:" & @CRLF & "Could not listen, Error code: " & $iError)
EndIf

; Assign a Local variable to be used by the Client socket.
Local $iSocket[2]
$iSocket[0] = 0
$iSocket[1] = 0
$index = 0
Do ; Wait for someone to connect (Unlimited).
	; Accept incomming connexions if present (Socket to close when finished; one socket per client).
	$iSocketT = TCPAccept($iListenSocket)

	; If an error occurred display the error code and return False.
	If @error Then
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Server:" & @CRLF & "Could not accept the incoming connection, Error code: " & $iError)
	EndIf

	If ($iSocketT <> -1) Then
		$iSocket[$index] = $iSocketT
		TCPSend($iSocket[$index], $sContent & $eContent)
		$index += 1
		$iSocketT = 0
	EndIf
Until $index == 2

; Close the Listening socket to allow afterward binds.
TCPCloseSocket($iListenSocket)

TCPSend($iSocket[0], $sContent & $eContent)
TCPSend($iSocket[1], $sContent & $eContent)

While 1
	; Assign a Local variable the data received.
	Local $sReceived1 = TCPRecv($iSocket[0], 100000)

	If (@error) Then
		ConsoleWrite("Socket Closed!")
		ExitLoop
	EndIf

	Local $sReceived2 = TCPRecv($iSocket[1], 100000)

	If (@error) Then
		ConsoleWrite("Socket Closed!")
		ExitLoop
	EndIf


	If ($sReceived1 <> "") Then
		$sContent &= "\cf1\b "& $userName1 &"\cf0\b0 :"& $sReceived1 &"\par"
		$sContent = StringReplace($sContent, " :v", $icon)
		TCPSend($iSocket[0], $sContent & $eContent)
		TCPSend($iSocket[1], $sContent & $eContent)
	EndIf

	If ($sReceived2 <> "") Then
		$sContent &= "\cf2\b "& $userName2 &"\cf0\b0 :"& $sReceived2 &"\par"
		$sContent = StringReplace($sContent, " :v", $icon)
		TCPSend($iSocket[0], $sContent & $eContent)
		TCPSend($iSocket[1], $sContent & $eContent)
		ConsoleWrite($sContent & $eContent)
	EndIf
WEnd

Func OnAutoItExit()
	TCPCloseSocket($iSocket[0])
	TCPCloseSocket($iSocket[1])
	TCPShutdown() ; Close the TCP service.
EndFunc   ;==>OnAutoItExit