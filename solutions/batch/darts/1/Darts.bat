@echo off
setlocal enabledelayedexpansion

set "x=%~1"
set "y=%~2"
set "result="

set /a radius=%x%*%x%+%y%*%y%
if !radius! leq 1 (echo 10) else (if !radius! leq 25 (echo 5) else (if !radius! lss 100 (echo 1) else (echo 0)))


