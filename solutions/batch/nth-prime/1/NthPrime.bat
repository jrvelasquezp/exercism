@echo off
setlocal enabledelayedexpansion

set targetNTH=%~1
set limit=500
set "result="

if !targetNTH! equ 0 goto :err_zero 

goto :cnt

:err_zero
set obj=there is no zeroth prime
goto :final_result

:cnt
set obj=0
set /a a=2
set sieve[0]=0
set primeArr[0]=0

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
set k=0
for /l %%n in (0,1,%j%) do (
    if not !sieve[%%n]! == * (
        set result=!result!!sieve[%%n]!
        set /a k=!k!+1
        if !k! equ !targetNTH! set /a obj=!sieve[%%n]!
    )
)
:final_result
<nul SET /P="%obj%"


