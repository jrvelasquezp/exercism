@echo off
setlocal enabledelayedexpansion

set "year=%~1"
set "result="

set /A div1=4
set /A div2=100
set /A div3=400
set /A ir1 = %year% %% 4
set /a ir2 = %year% %% 100
set /a ir3 = %year% %% 400

if %ir1%==0 (if %ir3%==0 (set /a result=1) else (if %ir2%==0 (set /a result=0) else (set /a result=1))) else (set /a result=0)

echo %result%
