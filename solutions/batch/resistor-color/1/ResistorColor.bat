@echo off
setlocal enabledelayedexpansion

set colorCode=%~1
set "result="

set "colorList=black brown red orange yellow green blue purple gray white"
set "count=0"

if [!colorCode!]==[] (
    echo black\nbrown\nred\norange\nyellow\ngreen\nblue\nviolet\ngray\nwhite
    )
) else (
    for %%i in (%colorList%) do (
        rem set /A count+=1
        rem echo %%i
        rem echo !count! !colorCode!
        if %%i EQU !colorCode! (echo !count!)
        set /A count+=1
    )
)

