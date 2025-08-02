@echo off
setlocal enabledelayedexpansion

set "numbers=%1"
set "result="

REM Get the length of each string
set /a len=0
:while
set "char=!numbers:~%len%,1!"
if "!char!"=="" goto :length
set /a len+=1
goto :while
:length


REM Print each number
set /a i=0
set /a armstrong_sum=0
:loop
if !i! == !len! goto :end
set rev=!numbers:~%i%,1!
set /a i=!i!+1
set res=0
CALL :power !rev!, !len!, res
set /a armstrong_sum=!armstrong_sum!+!res!
goto :loop
:end

REM Test if number is equal to the calculated sum
if !numbers! EQU !armstrong_sum! (
    echo true
    ) else (
    echo false
    )
exit /b

:power
setlocal
if %2 EQU 0 (
    set "result=1"
) else (
    set "i=1"
    set "result=%1"
    :inner_loop
    if !i! EQU %2 goto :end_loop
    set /a result*=%1
    set /a i=!i!+1
    goto :inner_loop
    :end_loop
    rem echo result
)
endlocal & set "%~3=%result%"
exit /b

