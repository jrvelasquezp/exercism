@echo off
setlocal EnableDelayedExpansion

set "input=%~1"
set "result="

@echo off 

if !input!==1 (
    set /a result=1
    ) else (
    set /A counter=1
    set /A xn1=!input!/2
    :loop 
        if !counter!==10 goto :END 
        set /a xn=!xn1!
        set /a xn1=!xn!+!input!/!xn!
        set /a xn1=!xn1!/2
        set /a counter=!counter!+1 
        goto :LOOP 
    :END
    set /A result=!xn1!
    )
echo !result!

