@echo off
SETLOCAL EnableDelayedExpansion

set "input=%~1"
set "result="

set /a divby3 = %input% %% 3
set /a divby5 = %input% %% 5
set /a divby7 = %input% %% 7
set s1=Pling
set s2=Plang
set s3=Plong
set message=
if %divby3%==0 (set message=%message%%s1%)
if %divby5%==0 (set message=%message%%s2%)
if %divby7%==0 (set message=%message%%s3%)
if [%message%]==[] (set /a result=%input%) else (set result=%message%)
echo !result!

