@echo off
setlocal enabledelayedexpansion

set "N=%~1"
set "difference="

set /A i=0
set /a sum=0
set /a sqsum=0

:loop 

if !i! == !N! goto END 
set /a i=!i!+1
set /a sum=!sum!+!i!
set /a sqsum=!sqsum!+!i!*!i!
goto :LOOP 
:END
set /a difference=!sum!*!sum!-!sqsum!

echo %difference%