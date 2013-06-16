; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;Testt

; Wort markieren und Wikipedia aufrufen
^!w::
 alteZwischenablage := Clipboard
 Send, ^c
 InternetAnfrage := "http://de.wikipedia.org/wiki"
                  . "/Spezial:Suche?search=" . Clipboard
                  . "&amp;go=Artikel"
 Clipboard := alteZwischenablage
 Run, % InternetAnfrage
return


; Internetexplorer aufrufen und in Adresszeile springen
#i::
Run iexplore.exe
WinWaitActive, ahk_class IEFrame
sleep 700
WinMaximize, ahk_class IEFrame
send {F6}
send {F6}
sleep 100
send {F6}
send {F6}
send +{end}
return

#f::
Run C:\Program Files (x86)\Mozilla Firefox\firefox.exe
WinWaitActive, ahk_class MozillaWindowClass
sleep 500
WinWaitActive, ahk_class MozillaWindowClass
send {^L}
send ^a
send +{end}
return

#g::
Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

return




; Reload File für Autohotkey
^!r::
DetectHiddenWindows, On
WinActivate, ahk_class AutoHotkey
WinWaitActive, ahk_class AutoHotkey 
send ^r
DetectHiddenWindows, Off
WinClose,  ahk_class AutoHotkey  
return

; Run Autohotkey Spy-Mode
^!s:: Run AU3_Spy.exe

;Auswahl verschiedener Neu-Anlegen Menüs
;#n::
;Gui, Font, s10, Verdana
;Gui, add, button, Default gMail, &Mail
;Gui, add, button, gKalender, &Kalender
;Gui, add, button, gAufgabe, &Aufgabe
;Gui, add, button, gNotiz, &Notiz
;Gui, add, button, gHOSS, &Hoss
;Gui, add, button, gHITS, H&its
;Gui, add, button, gExit, B&eenden
;Gui, Show
;return
;Mail:
;run mailto:
;return
;Kalender:
;run notes.exe
;WinWaitActive, ahk_class SWT_Window0
;click 254, 392
;return
;Aufgabe:
;run notes.exe
;WinWaitActive, ahk_class SWT_Window0
;click 20, 233
;return
;Notiz:
;send !5
;IfWinExist, IBM Lotus Notes Notizzettel
;{
;	WinActivate, IBM Lotus Notes Notizzettel
;}
;else 
;{ 
;	send !1
;	winactivate, ahk_class SWT_Window0
;	WinActivate, IBM Lotus Notes Mail - Eingang
;	click 445, 352
;	WinWaitActive, IBM Lotus Notes Mail - Eingang
;	click 76, 337
;	WinActivate, IBM Lotus Notes Notizzettel
;	WinWaitActive, IBM Lotus Notes Notizzettel
;	send +!5
;	send !5
;	WinActivate, IBM Lotus Notes Notizzettel
;}
;return
;HOSS:
;send !3
;WinActivate, IBM Lotus
;WinWaitActive, IBM Lotus
;click 19, 379
;send +!l
;return
;Hits:
;return
;Exit:
;WinClose
;return

;Arbeitsumgebung Initialisieren
#0::
send !3
run notes.exe
WinActivate, IBM Lotus Notes
WinWaitActive, IBM Lotus Notes
WinMaximize
click 18, 185
WinWaitActive, IBM Lotus Notes Kalender - Ein Monat
WinMaximize
send +!6
WinActivate, IBM Lotus Notes
WinWaitActive, IBM Lotus Notes
WinMaximize
click 18, 230
WinWaitActive, IBM Lotus Notes Aufgabe - Nicht abgeschlossen
WinMaximize
send +!5
send !2
run saplogon.exe
WinWaitActive, SAP Logon 720
send !4 
run iexplore.exe
WinWaitActive, ahk_class IEFrame
WinMaximize
send !3
WinWaitActive, IBM Lotus
click 18, 168
WinWaitActive, IBM Lotus Notes Mail - Eingang
WinMaximize
send +!1
send !1
WinActivate, IBM Lotus Notes Mail - Eingang
WinWaitActive, IBM Lotus Notes Mail - Eingang
click 76, 337
WinActivate, IBM Lotus Notes Notizzettel
WinWaitActive, IBM Lotus Notes Notizzettel
WinMaximize
send +!5
RUN EVERNOTE.exe
send +!5
send !3
return

;Automatischer SAPLOGON
;#s::
;send !2
;return


;Mouse zu Cursor Position und doppelklick
^,::
Mousemove A_CaretX + 5, A_CaretY + 5
click 2
return

!,::
Mousemove A_CaretX + 5, A_CaretY + 5
click 2
return

^-::
click 2
return

!-::
click 2
return

^NUMPAD0::
send +^7
return

^.::
click right 1
return

!.::
Mousemove A_CaretX + 5, A_CaretY + 5
click right 1
return 

^K::
_SE16N_Tabelle()
return

!K::
_SE16N_Tabelle()
return

_SE16N_Tabelle()
{
WinGetTitle, Title, A
;MsgBox, The active window is "%Title%".
if ( Title = "Allgemeine Tabellenanzeige" )
{
send +^!t
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("^k")
}
return
}

^L::
_in_adresszeile_springen()
return

!L::
_in_adresszeile_springen()
return

_in_adresszeile_springen()
{
if WinActive("ahk_class #32770")
{
send ^o
return
}
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
send +^7
send /
return
}
if WinActive("ahk_class OperaWindowClass")
{
send {F8}
return
}
if Winactive("ahk_class CabinetWClass")
{
send {F4}
send ^a
return
}
send {F6}
return
}

; Mauszeiger mit der Tastatur bewegen
RAlt & f::
MouseGetPos, x, y
;x := x + 75
y := y + 75
MouseMove, x, y
return

RAlt & d::
MouseGetPos, x, y
;x := x + 75
y := y - 75
MouseMove, x, y
return

RAlt & g::
MouseGetPos, x, y
x := x + 75
;y := y + 75
MouseMove, x, y
return

RAlt & s::
MouseGetPos, x, y
x := x - 75
;y := y + 75
MouseMove, x, y
return

; Use Right alt for Numkeys
RAlt & q::
send 1
return

RAlt & w::
send 2
return

RAlt & e::
send 3
return

RAlt & r::
send 4
return

RAlt & t::
send 5
return 

RAlt & z::
send 6
return 

RAlt & u::
send 7
return

RAlt & i::
send 8
return 

RAlt & o::
send 9
return

RAlt & p::
send 0
return

RAlt & ü::
send ß
return 

; Use Right STR for extra keys
RCtrl & q::
send {!}
return

RCtrl & w::
send "
return

RCtrl & e::
send §
return

RCtrl & r::
send $
return

RCtrl & t::
send `%
return 

RCtrl & z::
send &
return 

RCtrl & u::
send /
return

RCtrl & i::
send (
return 

RCtrl & o::
send )
return

RCtrl & p::
send `=
return

RCtrl & ü::
send ?
return

; Use right STR for navigate slow with mouse

RCtrl & f::
MouseGetPos, x, y
y := y + 5
MouseMove, x, y
return

RCtrl & d::
MouseGetPos, x, y
y := y - 5
MouseMove, x, y
return

RCtrl & g::
MouseGetPos, x, y
x := x + 5
MouseMove, x, y
return

RCtrl & s::
MouseGetPos, x, y
x := x - 5
MouseMove, x, y
return

; RAlt für Sonder(zeichen
RAlt & x::
send (
return

RAlt & c::
send )
return

RAlt & v::
send [
return

RAlt & b::
send ]
return

RAlt & n::
send {{}
return

RAlt & m::
send {}}
return

; SAPGui move to first icon in menu bar
RAlt & ^::
_move_to_menu_bar()
return

Alt & ^::
_move_to_menu_bar()
return

_move_to_menu_bar()
{
MouseGetPos, x, y
mouseclickdrag, left, 40, 130, 41, 150
mousemove x, y
return
}

; SAPGui move to Dialogstruktur
RAlt & 1::
MouseGetPos, x, y
click, 62, 184
mousemove x, y
return

; Use Capslock and keys for vimlike navigation
Capslock & g::
send {right 4}
send {Capslock}
return

Capslock & s::
send {left 4}
send {f}f
return

Capslock & f::
send {down 4}
send {Capslock}
return

Capslock & d::
send {up 4}
send {Capslock}
return

; Abap Workbench in Objektliste springen
RAlt & y::
click 200, 600
return

; Portal in obere Leiste
RAlt & a::
click 300, 100
return

; alt + strg + shift im SAP
; um an beliebige Felder zu springen
-::
input, SingleKey, L1 T0.2
if ErrorLevel = Timeout
{
_SEND_HOTKEY_WITHOUT_AHK("-")
return 
}
send !^+%SingleKey%
return

Capslock & -::
click
send {Capslock}
return 

Capslock & .::
send ^.
send {Capslock}
return

; Im Hoss 3 fach Tab
^Tab::
IfWinActive,, HOSS
{
send {tab}
send {tab}
send {tab}
}
else
{
hotkey ^Tab, , Off
sleep 50
send ^{Tab}
sleep 50
hotkey ^Tab, , On
return
}
return

^!D::
send ^+7
send /h
send {enter}
return

;!+F1::
;if WinActive("ahk_class SAP_FRONTEND_SESSION")
;{
;send ^+7
;send GOED
;send {enter}
;}
;return

;!{^}::
;if WinActive("ahk_class SAP_FRONTEND_SESSION")
;{
;send ^+7
;send GOED
;send {enter}
;}
;return



^!E::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
	Send, {CTRLDOWN}{SHIFTDOWN}7{SHIFTUP}{CTRLUP}{SHIFTDOWN}7{SHIFTUP}{CTRLDOWN}{CTRLUP}h{ENTER}{F8}
WinWait, (1) - ABAP Debugger kontrolliert Session 1 (exklusiv), Control  Container
IfWinNotActive, (1) - ABAP Debugger kontrolliert Session 1 (exklusiv), Control  Container, WinActivate, (1) - ABAP Debugger kontrolliert Session 1 (exklusiv), Control  Container
WinWaitActive, (1) - ABAP Debugger kontrolliert Session 1 (exklusiv), Control  Container
Send, {CTRLDOWN}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{CTRLUP}{TAB}gd-edit{DOWN}gd{ALTDOWN}{CTRLDOWN}{SHIFTDOWN}s{ALTUP}{CTRLUP}{SHIFTUP}ap{BACKSPACE}{BACKSPACE}-sapedit{ENTER}
MouseClick, left,  1279,  371
MouseClick, left,  1279,  371
Sleep, 100
MouseClick, left,  1235,  366
Sleep, 100
Send, {SHIFTDOWN}x{SHIFTUP}{ENTER}
MouseClick, left,  1279,  390
MouseClick, left,  1279,  390
Sleep, 100
MouseClick, left,  1180,  392
Sleep, 100
Send, {SHIFTDOWN}x{SHIFTUP}{ENTER}{F8}
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("^!E")
}
return


^o::
{

X = %A_CaretX%
Y = %A_CaretY%
inputbox, ok_code, Ok-Code, , , 200, 100,
if ErrorLevel
return
temp_file = c:\temp\temp_new\temp_new.sap
;file := FileOpen( temp_file, "rw") 
;string = [System] `rName=DV1 `rDescription=02. DV1  ***  R/3 Development System`rClient=010 `r[User] `rName=GUENTERC `rLanguage=DE `r[Function] `rTitle=SAP Easy Access `rCommand=%ok_code% `rType=SystemCommand`r[Configuration]`rWorkDir=C:\Users\guenterc\Documents\SAP`r[Options]`rReuse=1
;file.write(string)
;file.close()
run explorer.exe c:\temp\temp_new\
sleep 1250
Winwaitactive ahk_class CabinetWClass 
send #{Right}
sleep 250
coordmode Mouse, screen
mouseclick L, 1265, 140
sleep 100
mouseclickdrag L, 1265, 140, 288, 388
Winclose temp_new
}
return

!q::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
mousemove, 25 ,24
mouseclick
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("!q")
}
return

;#t::
;{
;run C:\totalcmd\TOTALCMD.EXE
;}
;return

!w::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
mousemove, 67 ,102
mouseclick
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("!q")
}
return

!e::
{
run "C:\Program Files (x86)\QuickDic\QuickDic.exe"
}
return

^f::
if WinActive("ahk_class SWT_Window0")
{
_SEND_HOTKEY_WITHOUT_AHK("^f")
send ^e
}
else
{
;hotkey ^f, , Off
;send ^f
;hotkey ^f, , On
_SEND_HOTKEY_WITHOUT_AHK("^f")
}
return

^+::
{
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
coordmode Mouse, screen
mouseclick L, 1473, 888
send ^{pos1}
send {up}
send ^{pos1}
send {enter}
send ^{pos1}
send {enter}
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("^+")
}
}
return

^!c::
{
run notes.exe
sleep 750
click left 1661, 122
sleep 250
click right 1661, 122
sleep 250
click left 1649, 152
sleep 250
send !3	
sleep 350
send !+l
sleep 350
send {tab 2}		
}
return


^!p::
{
send ^+p
sleep 100
send ^n
sleep 50
send {enter}
sleep 50
send ^v
sleep 50
click 354,5
sleep 50
click 645, 100
sleep 50
mousemove 200,400
}


^n::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
;send ^l
;sleep 100
;send /o
;send {enter}
;send {tab}
;send {tab}
;send {enter}
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("^n")
}
return

; SAP Erweiterte Programmprüfung aufrufen
^F4::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
send !S
send {down}
send {enter}
sleep 600
send !K
send {down 5} 
send {right}
send {down 2}  
send {enter}
sleep 500
send {F6}
sleep 200
send {F8}
}
else
{
_SEND_HOTKEY_WITHOUT_AHK("^F4")
}
return

; Sap String Template automatisch einfügen
#t::
if WinActive("ahk_class SAP_FRONTEND_SESSION")
{
Mousemove A_CaretX - 10, A_CaretY  + 5 
click right
sleep 300
send f
sleep 200
send m
sleep 200
send s
return
}


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

_SEND_HOTKEY_WITHOUT_AHK(_hotkey)
{
hotkey %_hotkey%, , Off
sleep 50
send %_hotkey%
sleep 50
hotkey %_hotkey%, , On
return
}

OSD(text)
{
#Persistent
Progress, hide x1050 Y900 b1 w150 h27 zh0 FM10 cwEEEEEE ct111111,, %text%, AutoHotKeyProgressBar, Verdana BRK
WinSet, TransColor, 000000 120, AutoHotKeyProgressBar
Progress, show
SetTimer, RemoveToolTip, 1000
Return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
Progress, Off
return
}

^!m::

Run mailto:,

return


;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Written by Philipp Otto, Germany
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;SetCapsLockState, AlwaysOff

;CapsLock & i::
;       if getkeystate("alt") = 0
;               Send,{Up}
;       else
;               Send,+{Up}
;return

;CapsLock & l::
;       if getkeystate("alt") = 0
;               Send,{Right}
;       else
;               Send,+{Right}
;return

;CapsLock & j::
;       if getkeystate("alt") = 0
;               Send,{Left}
;       else
;               Send,+{Left}
;return

;CapsLock & k::
;       if getkeystate("alt") = 0
;               Send,{Down}
;       else
;               Send,+{Down}
;return

;CapsLock & ,::
;       if getkeystate("alt") = 0
;               Send,^{Down}
;       else
;               Send,+^{Down}
;return

;CapsLock & 8::
;       if getkeystate("alt") = 0
;               Send,^{Up}
;       else
;               Send,+^{Up}
;return

;CapsLock & u::
;       if getkeystate("alt") = 0
;               Send,{Home}
;       else
;               Send,+{Home}
;return

;CapsLock & o::
;       if getkeystate("alt") = 0
;               Send,{End}
;       else
;               Send,+{End}
;return

;CapsLock & H::
;       if getkeystate("alt") = 0
;               Send,^{Left}
;       else
;               Send,+^{Left}
;return

;CapsLock & ö:                                  ;has to be changed (depending on the keyboard-layout)
;	   if getkeystate("alt") = 0
;			   Send,^{Right}
;	   else
;			   Send,+^{Right}
;return

;CapsLock & BS::Send,{Del}
;CapsLock & b::Send ^x
;CapsLock & n::Send ^c
;CapsLock & m::Send ^v

;Prevents CapsState-Shifting
;CapsLock & Space::Send,{Space}

;*Capslock::SetCapsLockState, AlwaysOff
;+Capslock::SetCapsLockState, On