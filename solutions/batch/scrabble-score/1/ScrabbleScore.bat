@echo off
setlocal enabledelayedexpansion

set "word=%~1"
set "result=0"

set i=0
if [!word!]==[] goto :display
:loop
set char=!word:~%i%,1!
if [!char!]==[] goto :display

::Calculation scrabble
if !char!==Q set /a result=!result!+10
if !char!==q set /a result=!result!+10
if !char!==Z set /a result=!result!+10
if !char!==z set /a result=!result!+10
if !char!==J set /a result=!result!+8
if !char!==j set /a result=!result!+8
if !char!==X set /a result=!result!+8
if !char!==x set /a result=!result!+8
if !char!==K set /a result=!result!+5
if !char!==k set /a result=!result!+5
if !char!==D set /a result=!result!+2
if !char!==d set /a result=!result!+2
if !char!==G set /a result=!result!+2
if !char!==g set /a result=!result!+2
if !char!==B set /a result=!result!+3
if !char!==b set /a result=!result!+3
if !char!==C set /a result=!result!+3
if !char!==c set /a result=!result!+3
if !char!==M set /a result=!result!+3
if !char!==m set /a result=!result!+3
if !char!==P set /a result=!result!+3
if !char!==p set /a result=!result!+3

if !char!==F set /a result=!result!+4
if !char!==f set /a result=!result!+4
if !char!==H set /a result=!result!+4
if !char!==h set /a result=!result!+4
if !char!==W set /a result=!result!+4
if !char!==w set /a result=!result!+4
if !char!==v set /a result=!result!+4
if !char!==V set /a result=!result!+4
if !char!==y set /a result=!result!+4
if !char!==Y set /a result=!result!+4

if !char!==A set /a result=!result!+1
if !char!==a set /a result=!result!+1
if !char!==E set /a result=!result!+1
if !char!==e set /a result=!result!+1
if !char!==I set /a result=!result!+1
if !char!==i set /a result=!result!+1
if !char!==o set /a result=!result!+1
if !char!==O set /a result=!result!+1
if !char!==u set /a result=!result!+1
if !char!==U set /a result=!result!+1
if !char!==L set /a result=!result!+1
if !char!==l set /a result=!result!+1
if !char!==N set /a result=!result!+1
if !char!==n set /a result=!result!+1
if !char!==R set /a result=!result!+1
if !char!==r set /a result=!result!+1
if !char!==S set /a result=!result!+1
if !char!==s set /a result=!result!+1
if !char!==T set /a result=!result!+1
if !char!==t set /a result=!result!+1

set /a i=!i!+1
goto :loop

:display
echo %result%
