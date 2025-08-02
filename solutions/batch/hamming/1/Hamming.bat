@echo off
setlocal enabledelayedexpansion

set "row1=%~1"
set "row2=%~2"
set result=0

set i=0
if [!row1!]==[] if [!row2!]==[] goto :final
:loop
set char_1=!row1:~%i%,1!
set char_2=!row2:~%i%,1!
if [!char_1!]==[] if [!char_2!]==[] goto :final
if [!char_1!]==[] goto :errormsg
if [!char_2!]==[] goto :errormsg
rem echo !char_1! !char_2!
if !char_1! neq !char_2! set /a result=!result!+1
set /a i=!i!+1
goto :loop

:final
rem echo here we go
if !i! equ 0 set result=0
goto :display

:errormsg
set result=left and right strands must be of equal length

:display
echo %result%
