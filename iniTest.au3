#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
    ; Create a constant variable in Local scope of the filepath that will be read/written to.
    Local Const $sFilePath = "asd"

    ; Create an INI section structure as a string.

    ; Write the string to the section labelled 'General'.

    ; Read the INI section labelled 'General'. This will return a 2 dimensional array.
    Local $aArray = IniReadSection($sFilePath, "Asd")

    ; Check if an error occurred.
    If Not @error Then
        ; Enumerate through the array displaying the keys and their respective values.
        For $i = 1 To $aArray[0][0]
            MsgBox($MB_SYSTEMMODAL, "", "Key: " & $aArray[$i][0] & @CRLF & "Value: " & $aArray[$i][1])
        Next
    EndIf

    ; Delete the INI file.
EndFunc   ;==>Example