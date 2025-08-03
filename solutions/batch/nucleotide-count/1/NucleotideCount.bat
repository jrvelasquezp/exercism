@echo off
SETLOCAL EnableDelayedExpansion

set "nucleotide=%~1"
set "nucleotide[A]=0"
set "nucleotide[C]=0"
set "nucleotide[G]=0"
set "nucleotide[T]=0"

if [!nucleotide!]==[] goto :answer
set "i=0"
:while
set "char=!nucleotide:~%i%,1!"
if [!char!]==[] goto :answer
if !char!==X goto :unexpected_answer
set /a "nucleotide[%char%]+=1"
set /a "i=%i+1"
goto :while
set "nucleotide[A]=0"
set "nucleotide[C]=0"
set "nucleotide[G]=7"
set "nucleotide[T]=0"
:unexpected_answer
echo Invalid nucleotide in strand
goto :end
:answer
echo !nucleotide[A]!,!nucleotide[C]!,!nucleotide[G]!,!nucleotide[T]!
:end
exit /b
