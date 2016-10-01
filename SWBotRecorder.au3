#include <MsgBoxConstants.au3>

AutoItSetOption("MouseCoordMode", 0)
AutoItSetOption("PixelCoordMode", 0)

HotKeySet("{F1}", "ReInit")
HotKeySet("{F4}", "EnterPixel")
HotKeySet("{F5}", "WriteChanges")

Func Close()
	$request = MsgBox($MB_OKCANCEL, "Exit", "Do you want to exit?")
	If $request == $IDOK  Then
		Exit 0
	EndIf
EndFunc

$appName = "SWBot:Recorder"

#include <GUIConstantsEx.au3>

$windowWidth = 200
$windowHeight = 400

Opt("GUIOnEventMode", 1)  ; Включает режим OnEvent
$mainwindow = GUICreate("SWBotRecorder", $windowWidth, $windowHeight)
GUISetOnEvent($GUI_EVENT_CLOSE, "Close")

GUICtrlCreateLabel("File:", 0, 0, $windowWidth)
$fileNameInput = GUICtrlCreateInput("", 0, 12, $windowWidth)


GUICtrlCreateLabel("Section:", 0, 34, $windowWidth)
$sectionInput = GUICtrlCreateInput("", 0, 48, $windowWidth)

GUICtrlCreateLabel("Pixles: ", 0, 70, 70)
$pixelsCountLabel = GUICtrlCreateLabel("0", 32, 70, 70)

$statusLabel = GUICtrlCreateLabel("Status", 0, $windowHeight - 12, $windowWidth)
;~ GUICtrlSetOnEvent($okbutton, "OKButton")
GUISetState(@SW_SHOW)

Global $fileName = ""
Global $sectionName = ""
Global $pixels[1000][3]
Global $pixelsCount = 0

While True
WEnd

Func PixelsCountSet($count)
	GUICtrlSetData($pixelsCountLabel, $count)
EndFunc

Func SetPixelCount($count)
	$pixelsCount = $count
	PixelsCountSet($count)
EndFunc

Func EnterPixel()
	$coords = MouseGetPos()
	$color = PixelGetColor ($coords[0] , $coords[1])
	$pixels[$pixelsCount][0] = $coords[0]
	$pixels[$pixelsCount][1] = $coords[1]
	$pixels[$pixelsCount][2] = $color
	SetPixelCount($pixelsCount + 1)
	GUICtrlSetData($statusLabel, $coords[0] & "x" & $coords[1])
EndFunc

Func ReInit()
	SetPixelCount(0)
	GUICtrlSetData($sectionInput, "")
EndFunc

Func WriteChanges()
	$fileName = GUICtrlRead($fileNameInput)
	If $fileName == "" Then
		MsgBox("", $appName, "Please enter filename.")
		Return
	Else
		$fileName = $fileName
	EndIf
	$sectionName = GUICtrlRead($sectionInput)
	If $sectionName == "" Then
		MsgBox("", $appName, "Please enter section.")
		Return
	EndIf
	Local $result[$pixelsCount][2]
	For $i = 0 To $pixelsCount-1
		$result[$i][0] = $pixels[$i][0]&"x"&$pixels[$i][1]
		$result[$i][1] = $pixels[$i][2]
	Next
	IniWriteSection ("Locations\" & $fileName & ".ini", $sectionName, $result, 0)
	ReInit()
EndFunc
