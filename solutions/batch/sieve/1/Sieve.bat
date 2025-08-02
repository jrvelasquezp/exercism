@echo off 
setlocal enabledelayedexpansion

set "limit=%~1"
set "result="

set /a a=2
set sieve[0]=0

REM Generate all numbers from 2 to limit
set /a i=%a%
:loop1
if !i! GTR !limit! goto :endl1
set result=!result!!i! 
set /a j=!i!-2
set sieve[%j%]=!i! 
set /a i=!i!+1
goto :loop1
:endl1

if !limit! lss 2 (
    set "result="
    goto :final_result
)

REM Check the first number and remove all multiples
set /a r=0
if !j! lss 30 (
    set /a plimit=!j!
    ) else (
    set plimit=30
    )

:main_loop
if !r! geq !plimit! goto :end_main_loop
set prime=!sieve[%r%]!
if !prime! == * (
    set /a r=!r!+1
    goto :main_loop
) else (
    for /l %%n in (%r%,1,%j%) do ( 
        set number=!sieve[%%n]!
        if not !number! == * (
            if !number! equ !prime! (
                set sieve[%%n]=!sieve[%%n]!
            ) else (
                set /a residual=!number!%%!prime!
                if !residual! neq 0 (
                    set sieve[%%n]=!sieve[%%n]!
                ) else (
                    set sieve[%%n]=*
                )
            )
        )
    )
    set /a r=!r!+1
    goto :main_loop
)
:end_main_loop

rem print the sieve
set "result="
for /l %%n in (0,1,%j%) do (
    if not !sieve[%%n]! == * (
        set result=!result!!sieve[%%n]!
    )
)
set result=%result:~0,-1%
:final_result
echo.%result%