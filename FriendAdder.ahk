F1::
  ; Locate search button on screen
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\plus.png
  if (ErrorLevel = 2 OR ErrorLevel = 1) {
    Tooltip "Make sure you are on the search for friends list"
  }

  if (ErrorLevel = 0) {
    Tooltip On correct page
  }

  ; Read in names from file
  FileRead, Text, %A_ScriptDir%\Friends.txt
  Array := []
  length = 0
  loop, parse, Text, `n
    if (A_LoopField != "") {
      Array.push(A_LoopField)
      length++
    }

  ; Loop through names and add
  i = 0
  for index, element in Array {
    MouseMove, FoundX - 25, FoundY + 20
    Click
    Send %element%
    Click
    Send {Return}
    Sleep, 1000
    i++

    MouseMove, FoundX + 10, FoundY + 70
    Click

    Sleep, 500

    x = 0
    while (x <= StrLen(element)) {
      MouseMove, FoundX - 25, FoundY + 20
      Click
      Send {BackSpace}
      x++
    }
    Tooltip Added %i% / %length%
  }
  ; Exit the script as the task is done
  ExitApp
