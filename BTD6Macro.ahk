;Arrays of points for autofarming
points := []

;Right is miscellaneous options
Right & NumpadIns:: SendInput {Space} ;Start round
Right & NumpadDel:: Send "+{Space}" ;start round for races

;Up is used for activating abilites
Up & NumpadEnd:: SendInput {1}
Up & NumpadDown:: SendInput {2}
Up & NumpadPgDn:: SendInput {3}
Up & NumpadLeft:: SendInput {4}
Up & NumpadClear:: SendInput {5}
Up & NumpadRight:: SendInput {6}
Up & NumpadHome:: SendInput {7}
Up & NumpadUp:: SendInput {8}
Up & NumpadPgUp:: SendInput {9}
Up & NumpadIns:: SendInput {0}
Up & NumpadSub:: SendInput {-}
Up & NumpadEnter:: SendInput {=}

NumPadEnter:: SendInput {Click Left} ;Perform a click

;Upgrade path hotkeys
NumpadEnd:: SendInput {,}
NumpadDown:: SendInput {.}
NumPadPgDn:: SendInput {/}

;Mouse movement
Right:: MouseMove 1, 0,,R
Up:: MouseMove 0, -1,,R
Left:: MouseMove -1, 0,,R
Down:: MouseMove 0, 1,,R
;Big mouse movement
RCtrl & Right:: MouseMove 10, 0,,R
RCtrl & Up:: MouseMove 0, -10,,R
RCtrl & Left:: MouseMove -10, 0,,R
Rctrl & Down:: MouseMove 0, 10,,R

;Suspend hotkeys
Shift & Esc:: Suspend

; /!\ AUTO-FARM GOODIES /!\

;Add a point to the list
RCtrl & NumpadAdd::
MouseGetPos, CurrentXPos, CurrentYPos ;Grab the current position and store it in temp vars
points.Push({x: CurrentXPos, y: CurrentYPos})
SoundPlay *-1
return

;Clear out the list
RCtrl & NumpadDel::
; Maybe points := [] would work here too but I dunno how the
; heck variable scoping works in AHK, so just pop 'em.
while (points.Length() > 0)
{
    points.Pop()
}
SoundPlay *16
return

;Drag the mouse to each position in the list
RCtrl & NumpadEnter::
for i, point in points
{
    MouseMove, point.x, point.y, 10
}
return