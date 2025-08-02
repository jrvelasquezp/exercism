@echo off
setlocal enabledelayedexpansion

set "str=%~1"
set "rev="

set /a len=0
if "%~1"=="" (
    goto :setzero
    )
REM get the string length
:while
set "char=!str:~%len%,1!"
if "!char!"=="" goto :length
set /a len+=1
goto :while
:length
rem echo %len%
REM get each character
set /a i=0
:loop
if !i! == !len! goto :end
set /a b=!len!-!i!-1
set "rev=!rev!!str:~%b%,1!"
set /a i=!i!+1
rem echo !rev! !i!
goto :loop
:setzero
set "rev="  
:end
echo(%rev%
endlocal