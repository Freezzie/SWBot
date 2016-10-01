;~ #include <MsgBoxConstants.au3>
;~ #include <AutoItConstants.au3>
;~ AutoItSetOption("MouseCoordMode", 0)
;~ AutoItSetOption("PixelCoordMode", 0)

;~ $BotName = "Summoner Wars::BOT"
;~ $BotOn = False
;~ Loop()

;~ Func ShowToolTip($msg, $deplay=1000)
;~ 	ToolTip($msg, 0, 0)
;~ 	Sleep($deplay)
;~ EndFunc



;~ Func ExitBot()
;~ 	$request = MsgBox(1, "Exit", "Do you want to exit?")
;~ 	If $request == $IDOK Then
;~ 		Exit 0
;~ 	EndIf
;~ EndFunc

;~ Func Loop()
;~ 	MsgBox($MB_OK, "Summoner Wars BOT", "Set focus on Nox to start farm bot.")
;~ 	WinWaitActive("Nox")
;~ 	CountDown("Bot started in: ")
;~ 	While 1
;~ 		$i = 0
;~ 		While $BotOn == True
;~ 			If WinActive("Nox") <> 0 Then
;~ 				StartBattle()
;~ 				ApproveVictory()
;~ 				OpenReward()
;~ 				ReceiveReward()
;~ 				BattleAgain()
;~ 			Else
;~ 				MsgBox($MB_OK, $BotName, "Activate Nox window for run bot")
;~ 			EndIf
;~ 		Wend
;~ 		ShowToolTip("OFF")
;~ 	WEnd
;~ 	;$i = 0
;~ 	;While 1
;~ 	;	ShowToolTip($i)
;~ 	;	$i = $i+1
;~ 	;WEnd
;~ EndFunc

;~ Func OnOff()
;~ 	If $BotOn Then
;~ 		$BotOn = False
;~ 		ShowToolTip("Bot paused.")
;~ 	Else
;~ 		$BotOn = True
;~ 		ShowToolTip("Bot started.")
;~ 	EndIf
;~ EndFunc

;~ Func CountDown($msg="CountDown", $times=3)
;~ 	While $times>0
;~ 		ShowToolTip($msg&": "&$times)
;~ 		$times=$times-1
;~ 	WEnd
;~ EndFunc

;~ Func StartBattle()
;~ 	$random = Random(-20, 20, 1)
;~ 	$BattleButtonX=1080
;~ 	$BattleButtonY=540
;~ 	Return MouseClick("", $BattleButtonX+$random, $BattleButtonY+$random,1)
;~ EndFunc

;~ Func CheckVictory()
;~ 	$checksCount = 5
;~ 	$checksPassed = 0
;~ 	$checksPassed = 0
;~ 	;Check last "Y"
;~ 	$iColor=PixelGetColor(801, 155)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xFFDF20" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;Check "V"
;~ 	$iColor=PixelGetColor(465, 171)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xFFBE0A" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;Check mana
;~ 	$iColor=PixelGetColor(333, 398)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0x49AFF3" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;Check energy
;~ 	$iColor=PixelGetColor(661, 393)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xF7CD66" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;Check crystals
;~ 	$iColor=PixelGetColor(995, 402)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xF13A6B" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	If $checksCount == $checksPassed Then
;~ 		Return True
;~ 	Else
;~ 		Return False
;~ 	EndIf
;~ EndFunc

;~ Func OpenReward()
;~ 	$randomSundukX = Random(200, 1150, 1)
;~ 	$randomSundukY = Random(200, 660, 1)
;~ 	Return MouseClick("", $randomSundukX, $randomSundukY,1)
;~ EndFunc

;~ Func ReceiveReward()
;~ 	Return Send("{ESC}")
;~ EndFunc

;~ Func BattleAgain()
;~ 	$waitBattle = True
;~ 	While $waitBattle
;~ 		Sleep(700)
;~ 		$random = Random(-20, 20, 1)
;~ 		MouseClick("", 412+$random, 426+$random) ;click again
;~ 		$random = Random(1000, 2000)
;~ 		Sleep($random)
;~ 		If CheckThatBattleLobbie() Then
;~ 			ShowToolTip("Battle lobbie is opened.")
;~ 			$waitBattle = False
;~ 		ElseIf CheckFewEnergyDialog() Then
;~ 			$random = Random(-20, 20, 1)
;~ 			MouseClick("", 756+$random, 469+$random)
;~ 			Sleep(60000)
;~ 		Else
;~ 			ShowToolTip("I can not continue!")
;~ 		;if opened lobbie
;~ 			;start again
;~ 		;elseif opened few energy dialog
;~ 			;click NO
;~ 		;wait
;~ 		EndIf
;~ 		Sleep(700)
;~ 	WEnd
;~ EndFunc

;~ Func CheckThatBattleLobbie()
;~ 	$checksCount = 7
;~ 	$checksPassed = 0;
;~ 	;1 Check "Vs"
;~ 	$iColor=PixelGetColor(629, 274)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xEADB8A" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;2 Check "Title left"
;~ 	$iColor=PixelGetColor(54, 61)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xC39657" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;3 Check "Title right"
;~ 	$iColor=PixelGetColor(615, 61)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xC39757" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;4 Check "Title close"
;~ 	$iColor=PixelGetColor(1246, 66)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xE6D8B6" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;5 Check "Отмена"
;~ 	$iColor=PixelGetColor(997, 655)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xD4AF4F" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;6 Check "в бой"
;~ 	$iColor=PixelGetColor(1087, 543)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xCFA64B" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;7 Check "в бой" energy
;~ 	$iColor=PixelGetColor(1065, 521)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xF7CD66" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	If $checksCount == $checksPassed Then
;~ 		$result = True
;~ 	Else
;~ 		$result = False
;~ 	EndIf
;~ 	Return $result
;~ EndFunc

;~ Func CheckFewEnergyDialog()
;~ 	$checksCount = 2
;~ 	$checksPassed = 0
;~ 	;1 Check "ДА"
;~ 	$iColor=PixelGetColor(513, 478)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xF8E9AD" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	;2 Check "Нет"
;~ 	$iColor=PixelGetColor(703, 471)
;~ 	$color = "0x"&Hex($iColor, 6)
;~ 	If $color == "0xCEA348" Then
;~ 		$checksPassed = $checksPassed + 1
;~ 	EndIf
;~ 	If $checksPassed == $checksCount Then
;~ 		$result = True
;~ 	Else
;~ 		$result = False
;~ 	EndIf
;~ 	Return $result
;~ EndFunc

Func RandomClick($minX = 150, $maxX = 900, $minY = 150, $maxY = 550)
	$randomVictoryX = Random($minX, $maxX, 1)
	$randomVictoryY = Random($minY, $maxY, 1)
	Return MouseClick("", $randomVictoryX, $randomVictoryY )
EndFunc

Func CheckPixels($fileName, $section)
	Local $pixels = IniReadSection("Locations\" & $fileName & ".ini", $section)
	If Not @error Then
		Local $pixelsCount = $pixels[0][0]
		Local $pixelsChecked = 0
		For $i = 1 To $pixelsCount
			Local $coords = StringSplit($pixels[$i][0], "x");
			$color = PixelGetColor($coords[1], $coords[2])
			If $color == $pixels[$i][1] Then
				$pixelsChecked += 1
			EndIf
		Next
		If $pixelsChecked == $pixelsCount Then
			Return True
		Else
			Return False
		EndIf
	Else
		Return False
	EndIf
EndFunc

Func ClickTo($fileName, $section, $timeOutMin=500, $timeOutMax=1500, $offsetX=10, $offsetY=10)
	Local $pixels = IniReadSection("Locations\" & $fileName & ".ini", $section)
	If Not @error Then
		Local $clicksCount = $pixels[0][0]
		Local $clicksPressed = 0
		For $i = 1 To $clicksCount
			Local $coords = StringSplit($pixels[$i][0], "x");
			Sleep(Random($timeOutMin, $timeOutMax))
			If MouseClick("", $coords[1] + Random(0-$offsetX, $offsetX), $coords[2] + Random(0-$offsetY, $offsetY)) Then
				$clicksPressed += 1
			EndIf
		Next
		If $clicksPressed == $clicksCount Then
			Return True
		Else
			Return False
		EndIf
	Else
		Return False
	EndIf
EndFunc

Func WaitRandom($min=500, $max=1500)
	Sleep(Random($min,$max,1))
EndFunc

Func WaitForPixlesCheck($file, $section)
	While Not CheckPixels($file, $section)
	WEnd
EndFunc

Func WaitForPixlesNotCheck($file, $section)
	While CheckPixels($file, $section)
	WEnd
EndFunc

Func SendESC()
	Return Send("{ESC}")
EndFunc

Func BattleAgain()
	$waitBallte = True
	While $waitBallte
		SetStatusLabel("Wait for again screen")
		WaitForPixlesCheck("All", "AgainScreen")
		ClickTo("All", "AgainButton")
		WaitRandom()
		SetStatusLabel("Check FewEnergyDialog")
		if CheckPixels("All", "FewEnergyDialog") Then
			SetStatusLabel("Cancel few energy dialog")
			WaitRandom()
			ClickTo("All", "FillManaNo")
			SetStatusLabel("Wait 30-60 sec.")
			WaitRandom(30000, 60000)
		ElseIf CheckPixels("All", "BattleLobbie") Then
			SetStatusLabel("Wait to try again")
			$waitBallte = False
		EndIf
	WEnd
EndFunc

