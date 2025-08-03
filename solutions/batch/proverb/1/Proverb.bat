@echo off
setlocal enabledelayedexpansion

set "inputs=%~1"
set result=
if [!inputs!]==[] goto :display_proverb


set i=0
set wordcounter=0
set word=
set words[0]=
:loop_wordcounter
set word=
:loop
set char=!inputs:~%i%,1!
if [!char!]==[] goto :final
if "!char!"==" " (
    goto :final_wordcounter
    )
set word=!word!!char!
set /a i=!i!+1
goto :loop
:final_wordcounter
set words[%wordcounter%]=!word!
set /a wordcounter=!wordcounter!+1
set /a i=!i!+1
goto :loop_wordcounter
:final
set words[%wordcounter%]=!word!
set /a wordcounter=!wordcounter!+1

:: Echo word pairs
set i=0
set j=1
:loop2
if !j! equ !wordcounter! goto :end_loop2
set result=!result!For want of a !words[%i%]! the !words[%j%]! was lost.\n
set /a i=!i!+1
set /a j=!j!+1
goto :loop2


:end_loop2
::Add the single string at the end
set result=!result!And all for the want of a !words[0]!.
::Return here if string is empty
:display_proverb
echo(!result!