@echo off
setlocal EnableDelayedExpansion

set "series=%~1"
set "sliceLength=%~2"
set "result="
set ch[0]=

if !sliceLength! lss 0 goto :err_negative
if !sliceLength! equ 0 goto :err_zero
set i=0
:loop1
set char=!series:~%i%,1!
if [!char!]==[] goto :end_loop1
set ch[!i!]=!char!
set /a i=!i!+1
goto :loop1

:end_loop1
if !i! lss !sliceLength! goto :err_toobig
set j=0
set k=0
set n=0
:loop2
if !j! equ !i! goto :display
if !k! equ !sliceLength! (
    set k=0
    set /a n=!n!+1
    set j=!n!
    set result=!result! 
)
set result=!result!!ch[%j%]!
set /a k=!k!+1
set /a j=!j!+1
goto :loop2

goto :display

:err_zero
set result=slice length cannot be zero
goto :display

:err_negative
set result=slice length cannot be negative
goto :display

:err_toobig
set result=slice length cannot be greater than series length
goto :display

:display
echo %result%
