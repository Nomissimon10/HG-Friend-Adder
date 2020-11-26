F1::
  if WinExist("Heroes & Generals") {
    WinActivate
  }

  ; Locate search button on screen
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *40 plus.png
  if (ErrorLevel = 2 OR ErrorLevel = 1) {
    Tooltip Make sure you are on the search for friends list
    Sleep, 3000
    Tooltip
    return
  }
  if (ErrorLevel = 0) {
    Tooltip On correct page
  }

  ; Read in names from file
  FileRead, Text, Friends.txt
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
    Sleep, 500
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

    time := length - i
    Tooltip Added %i% / %length% | Approx %time%s remaining
  }

  ; Exit the script as the task is done
  ExitApp
