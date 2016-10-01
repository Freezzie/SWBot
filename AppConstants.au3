#include <Array.au3>
Global Const $APP_RUNNING = 0
Global Const $APP_PAUSED = 1

Global $APP_STATUSES[] = ["Run", "Pause"]

Global $appStatus = 0
Func AppTextStatus()
	Return $APP_STATUSES[$appStatus]
EndFunc


