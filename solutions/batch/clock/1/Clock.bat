@echo off
setlocal enabledelayedexpansion

set "hours=%~1"
set "minutes=%~2"

set /a minutesDivisor=60
set /a HoursDivisor=24
set /a hours = %hours%
set /a minutes = %minutes%

set /a negMD = -1*!minutesDivisor!
set /a negHD = -1*!HoursDivisor!

rem echo %minutes%

::Check minutes
if !minutes! geq !minutesDivisor! (
    set /a hr=!minutes! / !minutesDivisor!
    set /a minutes=!minutes! %% !minutesDivisor!
    set /a hours=!hr!+!hours!
    ) else if !minutes! geq 0 (
        rem echo Positivo
    ) else if !minutes! leq !negMD! (
        set /a hr=!minutes! / !minutesDivisor!
        set /a minutes=!minutes! %% !minutesDivisor!
        if !minutes! lss 0 (
            set /a minutes=60+!minutes!
            set /a hr=!hr!-1
        )
        set /a hours=!hr!+!hours!
    ) else if !minutes! lss 0 (
        set /a hr=-1
        set /a minutes=60+!minutes!
        set /a hours=!hr!+!hours!
    )
::Check hours
if !hours! geq !HoursDivisor! (
    set /a hours=!hours! %% !HoursDivisor!
    ) else if !hours! geq 0 (
        rem echo Positivo
    ) else if !hours! leq !negHD! (
        set /a hours=!hours! %% !HoursDivisor!
        set /a hours=24+!hours!
    ) else if !hours! lss 0 (
        set /a hours=24+!hours!
    )

if !hours! lss 10 set hours=0!hours!
if !minutes! lss 10 set minutes=0!minutes!

echo !hours!:!minutes!
