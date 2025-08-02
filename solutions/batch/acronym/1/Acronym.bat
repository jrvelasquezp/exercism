@echo off
setlocal enabledelayedexpansion

set "phrase=%~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9"
set "acronym="
shift
shift
shift
shift
shift
shift
set "phrase=%phrase% %~4 %~5 %~6 %~7 %~8 %~9"

REM Text preprocessing
REM TODO: Remove extra spaces

set "phrase=%phrase:-= %" 
set "phrase=%phrase:_= %"
set "phrase=%phrase:'=%"
set "phrase=%phrase:,= %"

REM Make the Acronym

set i=0
set limit=100
set word_begin=1
set "ans="

:loop
if !i! equ !limit! goto :result
set "char=!phrase:~%i%,1!"
if %word_begin% equ 1 (
    if not "!char!"==" " (
        set "word_begin=0"
        :: Replace lowercase for uppercase -- Not efficient
        if "!char!"=="a" set "char=A"
        if "!char!"=="f" set "char=F"
        if "!char!"=="m" set "char=M"
        if "!char!"=="o" set "char=O"
        if "!char!"=="s" set "char=S"
        if "!char!"=="t" set "char=T"
        if "!char!"=="u" set "char=U"
        :: End lowercase replacement
        set ans=!ans!!char!
        goto :plus_one
        )
    )
if "!char!"==" " (
    set "word_begin=1"
    goto :plus_one
)
:plus_one
set /a i=!i!+1
goto :loop
:result

echo !ans!


