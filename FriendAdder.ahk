F1::
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\plus.png
  if (ErrorLevel = 2 OR ErrorLevel = 1) {
    Tooltip Something went wrong
  }
  if (ErrorLevel = 0) {
    Tooltip %FoundX%`, %FoundY%
  }

  ; i = 0
  ; Array := ["Nomissimon10", "MalNeighbour", "slampie"]
  ; for index, element in Array {
  ;   Send %element%
  ;   Send {Return}
  ;   Sleep, 1000
  ;   CoordMode, Mouse, Screen
  ;   Click, 1813, 1049
  ;   i++
  ;
  ;   x = 0
  ;   while (x < StrLen(element)) {
  ;     Send {BackSpace}
  ;     x++
  ;   }
  ; }
