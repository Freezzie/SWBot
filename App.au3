#include <AppConstants.au3>
#include<Bot.au3>
#include<TrayConstants.au3>

AutoItSetOption("MouseCoordMode", 0)
AutoItSetOption("PixelCoordMode", 0)

HotKeySet("{F5}", "ToggleState")
HotKeySet("{F6}", "Close")
HotKeySet("{F4}", "Test")

Global Const $APP_NAME = "SWBot"

$trayAppName = TrayCreateItem($APP_NAME)
$startCounts = 0

#include <GUIConstantsEx.au3>

$windowWidth = 200
$windowHeight = 100

Opt("GUIOnEventMode", 1)  ; Включает режим OnEvent
$mainwindow = GUICreate("SWBot", $windowWidth, $windowHeight)
GUISetOnEvent($GUI_EVENT_CLOSE, "Close")

Global $statusLabel = GUICtrlCreateLabel("Running", 0, $windowHeight - 12, $windowWidth)
;~ GUICtrlSetOnEvent($okbutton, "OKButton")
GUISetState(@SW_SHOW)

MainLoop()

Func SetAppStatus($status)
	$appStatus = $status
	GUICtrlSetData($statusLabel, AppTextStatus())
EndFunc

Func SetStatusLabel($status)
	GUICtrlSetData($statusLabel, $status)
EndFunc

Func MainLoop()
	Sleep(5000)
	Send("{SPACE}")
	While True
		If WinActive("Nox") <> 0 Then
			WaitRandom()
			SetStatusLabel("Wait BattleStart")
			ClickTo("All", "BattleStart")
			SetStatusLabel("Wait Victory")
			WaitForPixlesCheck("All", "Victory")
			SetStatusLabel("Wait Victory Approve")
			WaitRandom()
			RandomClick() ; Victory approve
			SetStatusLabel("Wait For Chest")
			WaitForPixlesNotCheck("All", "Victory") ;wait for chest - not Victory SCreen
			SetStatusLabel("Wait For Open Chest")
			WaitRandom(2000,3000)
			RandomClick() ; Open reward
			WaitRandom(2500,3500)
			SendESC() ; Send reward to inv
			BattleAgain()
		EndIf
	WEnd
EndFunc

Func ToggleState()
	If $appStatus == $APP_RUNNING Then
		SetAppStatus($APP_PAUSED)
		Pause()
	Else
		SetAppStatus($APP_RUNNING)
	EndIf
EndFunc

Func Start()
		SetAppStatus($APP_RUNNING)
EndFunc

Func Close()
	$request = MsgBox($MB_OKCANCEL, "Exit", "Do you want to exit?")
	If $request == $IDOK  Then
		Exit 0
	EndIf
EndFunc

Func Pause()
	While $appStatus == $APP_PAUSED
	WEnd
EndFunc

Func Test()
	SetStatusLabel("" & CheckPixels("All", "AgainScreen"))
EndFunc
