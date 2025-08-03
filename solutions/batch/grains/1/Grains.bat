@echo off
setlocal EnableDelayedExpansion

set "input=%~1"
set "grains="

if !input! lss 1 (
    set "grains=square must be between 1 and 31"
    goto :answer
    )
if !input! geq 65 (
    set "grains=square must be between 1 and 31"
    goto :answer
    )

set "i=2"
if !input! equ 1 (
    set "grains=1"
    goto :answer
)
set "grains=2"
if !input! equ 2 goto :answer
:while
if !i! equ !input! goto :answer
set /a "i=%i%+1"
set /a "grains=grains*2"
goto :while
:answer
echo %grains%
